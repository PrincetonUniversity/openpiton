// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsotool_diag2_042103.s
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
! TSOTOOL.BATCH Y
! TSOTOOL.VERBOSE Y
! TSOTOOL.TEST_NAME diag
! TSOTOOL.N_PROCS 8
! GEN.N_INSTR_PER_PROC 1000
! GEN.AVG_LOOP_SIZE 512
! GEN.AVG_LOOP_ITER 10
! GEN.SEED 12
! ADMAP.REGION_SIZE 64
! ADMAP.REGION_OFFSETS 0-4-12-32-64,76-80-84-256-512,32-64,0-64-128-192
! ADMAP.ATTRIBUTES CV=0111,CP=1111 
! ADMAP.N_ALIASES 0
! ADMAP.ALIAS_FREQUENCY 64
! ADMAP.ALIAS_OFFSET 8388608
! WT.PCT_FP_INSTR 10
! WT.PCT_LOADS_NF 0
! WT.PCT_NFS_FAULT 0
! WT.PCT_PREFETCH_FAULT 0
! WT.PCT_PREFETCH_UNIMP 0
! WT.REPLACEMENT 10
! WT.LD 10
! WT.BLD 0
! WT.DWLD 10
! WT.QWLD 0
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
! DBG.GRAPH_TRAVERSAL_DEPTH 25
! DBG.WRITE_RESULTS_FILE Y
! ADV.L2_WAYS 4
! ADV.TEST_ITERATIONS 1
! ADV.RESULTS_TO_MEM N
! ADV.BST_MEMBARS Y
! ADV.BLD_MEMBARS Y
! ADV.PREFETCH_FCNS fcn_1=5 


#define ENABLE_T0_Fp_exception_ieee_754_0x21
#define ENABLE_T0_Fp_exception_other_0x22
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Illegal_instruction_0x10
#define ENABLE_T0_Clean_Window_0x24
#include "custom_page1.h"

#define N_CPUS  8
#define REGION_SIZE_RTL (64 * 1024)
!====#define RESULTS_BUF_SIZE_PER_CPU_RTL 1048576
#define RESULTS_BUF_SIZE_PER_CPU_RTL 1024
#define FUNC_TABLE_BUF_SIZE_RTL 1024
#define SYNC_BUF_SIZE_RTL 1024
#define PRIVATE_DATA_AREA_PER_CPU_RTL 64

#define ALIGN_PAGE_8K .align 8192


.seg "data"
ALIGN_PAGE_8K
user_data_start:
	.word 0x0
user_data_end:



.seg "data"
ALIGN_PAGE_8K
SHARED_DATA_START:
function_table:
	.word func0
	.word func1
	.word func2
	.word func3
	.word func4
	.word func5
	.word func6
	.word func7
	.skip FUNC_TABLE_BUF_SIZE_RTL
res_buf_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL
res_buf_p_1:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL
res_buf_p_2:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL
res_buf_p_3:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL
res_buf_p_4:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL
res_buf_p_5:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL
res_buf_p_6:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL
res_buf_p_7:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL
sync_buf:
	.skip SYNC_BUF_SIZE_RTL
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

SHARED_DATA_END:


!4 shared memory regions
.seg"data"
ALIGN_PAGE_8K
REGION0_START_ALIAS0:
	.skip REGION_SIZE_RTL
REGION0_END_ALIAS0:
REGION1_START_ALIAS0:
	.skip REGION_SIZE_RTL
REGION1_END_ALIAS0:
REGION2_START_ALIAS0:
	.skip REGION_SIZE_RTL
REGION2_END_ALIAS0:
REGION3_START_ALIAS0:
	.skip REGION_SIZE_RTL
	.skip 4 * REGION_SIZE_RTL	 ! replacement area
REGION3_END_ALIAS0:


.seg "data"
ALIGN_PAGE_8K
stackarea_data_start:
	.skip 16
stack_start0:
	.skip 2048
stack_start1:
	.skip 2048
stack_start2:
	.skip 2048
stack_start3:
	.skip 2048
stack_start4:
	.skip 2048
stack_start5:
	.skip 2048
stack_start6:
	.skip 2048
stack_start7:
	.skip 2048

stackarea_data_end:



.seg "data"
ALIGN_PAGE_8K
sync_results_buf:
	.skip 64
sync_results_buf_end:


.seg "text"
ALIGN_PAGE_8K
user_text_start:
	ba main
nop
user_text_end:



.seg "text"
ALIGN_PAGE_8K
mymod_text_start:
.global main


main:

	set     SHARED_DATA_START, %o0
	mov     0, %o1
#define B_TRAP T_BAD_TRAP
#define G_TRAP T_GOOD_TRAP

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
	
	add     %g1, 0, %o2
	mov     N_CPUS, %o3
	cmp     %g1, 0x7
	be      stack_setup7
	nop
	cmp     %g1, 0x6
	be      stack_setup6
	nop
	cmp     %g1, 0x5
	be      stack_setup5
	nop
	cmp     %g1, 0x4
	be      stack_setup4
	nop
	cmp     %g1, 0x3
	be      stack_setup3
	nop
	cmp     %g1, 0x2
	be      stack_setup2
	nop
	cmp     %g1, 0x1
	be      stack_setup1
	nop
	cmp     %g1, 0x0
	be      stack_setup0
	nop
	ta      B_TRAP

stack_setup0:
	set     stack_start0, %l1
	mulx    %g1, 1024, %g2
	add     %g2, 512, %g2
	add     %l1, %g2, %sp
	set     func0, %o4
	ba      common_code
	nop

stack_setup1:
	set     stack_start1, %l1
	mulx    %g1, 1024, %g2
	add     %g2, 512, %g2
	add     %l1, %g2, %sp
	set     func1, %o4
	ba      common_code
	nop

stack_setup2:
	set     stack_start2, %l1
	mulx    %g1, 1024, %g2
	add     %g2, 512, %g2
	add     %l1, %g2, %sp
	set     func2, %o4
	ba      common_code
	nop

stack_setup3:
	set     stack_start3, %l1
	mulx    %g1, 1024, %g2
	add     %g2, 512, %g2
	add     %l1, %g2, %sp
	set     func3, %o4
	ba      common_code
	nop

stack_setup4:
	set     stack_start4, %l1
	mulx    %g1, 1024, %g2
	add     %g2, 512, %g2
	add     %l1, %g2, %sp
	set     func4, %o4
	ba      common_code
	nop

stack_setup5:
	set     stack_start5, %l1
	mulx    %g1, 1024, %g2
	add     %g2, 512, %g2
	add     %l1, %g2, %sp
	set     func5, %o4
	ba      common_code
	nop

stack_setup6:
	set     stack_start6, %l1
	mulx    %g1, 1024, %g2
	add     %g2, 512, %g2
	add     %l1, %g2, %sp
	set     func6, %o4
	ba      common_code
	nop

stack_setup7:
	set     stack_start7, %l1
	mulx    %g1, 1024, %g2
	add     %g2, 512, %g2
	add     %l1, %g2, %sp
	set     func7, %o4
	ba      common_code
	nop
common_code:
	call dispatch_asm
	nop
	ta   G_TRAP



.align 32
dispatch_asm:
dispatch:

	save    %sp,-104,%sp
	st      %i4,[%fp+84]
	st      %i3,[%fp+80]
	st      %i2,[%fp+76]
	st      %i1,[%fp+72]
	st      %i0,[%fp+68]

	ld      [%fp+68],%l3		! shared_area_begin
	ld      [%fp+76], %l2		! cpuid
	sll     %l2, 2, %l1
	add     %l3, %l1, %l0
	ld      [%l0-4], %l4
	set     REGION0_START_ALIAS0, %o0	! shared address 0
	set     REGION1_START_ALIAS0, %o1	! shared address 1
	set     REGION2_START_ALIAS0, %o2	! shared address 2
	set     REGION3_START_ALIAS0, %o3	! shared address 3
	add     %l3,FUNC_TABLE_BUF_SIZE_RTL,%l3
	sethi   %hi(RESULTS_BUF_SIZE_PER_CPU_RTL),%l6
	or      %l6,%lo(RESULTS_BUF_SIZE_PER_CPU_RTL),%l6
	mulx    %l2,%l6,%l5
	add     %l3,%l5,%o4		! o4 = res_area for cpu
	mov     1,%l5
	mulx    %l5,N_CPUS,%l5
	mulx    %l5,%l6,%l5
	add     %l5,%l3,%o5
	add     %o5,SYNC_BUF_SIZE_RTL,%o6	! o6 = o5 + sync_buf_area
	jmpl    %i4,%o7
	nop
	jmp     %i7+8
	restore


! register allocation - 
! %i0-%i3 for the read/write addresses, 
! %i4 for pointer to results area (NOT USED for RTL) 
! %i5 pointer to temp mem location (used by swaps, alignment) 
! %i6 Not used by RTL
! %l0-%l7 for the results, 
! %l4- pointer to temp storage for value read by atomic before being xferred to fp regs


!-----------------



func0:

! 1000 instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
srlx %i0, 6, %i0
sllx %i0, 6, %i0

add %i1, 63, %i1
srlx %i1, 6, %i1
sllx %i1, 6, %i1

add %i2, 63, %i2
srlx %i2, 6, %i2
sllx %i2, 6, %i2

add %i3, 63, %i3
srlx %i3, 6, %i3
sllx %i3, 6, %i3

add %i4, 63, %i4
srlx %i4, 6, %i4
sllx %i4, 6, %i4

add %i5, 63, %i5
srlx %i5, 6, %i5
sllx %i5, 6, %i5

mov   %i4, %l1
add   %i5, 1024, %l5

! Initialize %o7, the pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
addx  %o7, %l1, %o7 

! Initializing %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%l5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%l5+4]
ldd [%l5], %f0
ldd [%l5], %f2
ldd [%l5], %f4
ldd [%l5], %f6
ldd [%l5], %f8
ldd [%l5], %f10
ldd [%l5], %f12
ldd [%l5], %f14
ldd [%l5], %f16
ldd [%l5], %f18
ldd [%l5], %f20
ldd [%l5], %f22
ldd [%l5], %f24
ldd [%l5], %f26
ldd [%l5], %f28
ldd [%l5], %f30
ldd [%l5], %f32
ldd [%l5], %f34
ldd [%l5], %f36
ldd [%l5], %f38
ldd [%l5], %f40
ldd [%l5], %f42
ldd [%l5], %f44
ldd [%l5], %f46
ldd [%l5], %f48
ldd [%l5], %f50
ldd [%l5], %f52
ldd [%l5], %f54
ldd [%l5], %f56
ldd [%l5], %f58
ldd [%l5], %f60
ldd [%l5], %f62

! Initializing int results buffer registers: %o0 %o1 %o2 %o3 %o4 
mov %g0, %o0
mov %g0, %o1
mov %g0, %o2
mov %g0, %o3
mov %g0, %o4

! Signature for extract_loads
sethi %hi(0x00deade1), %l7
or    %l7, %lo(0x00deade1), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize integer counter 
sethi %hi(0x800001), %l4
or    %l4, %lo(0x800001), %l4

! Initialize FP counter 
sethi %hi(0x3f800000), %l7
or    %l7, %lo(0x3f800000), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize FP counter increment value 
sethi %hi(0x3f800000), %l7
or    %l7, %lo(0x3f800000), %l7
stw %l7, [%l5] 
ld [%l5], %f17 

P1: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P3: !CAS [4] (maybe <- 0x800001) (Int)
add %i0, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P5: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P6: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P7: !MEMBAR (Int)
membar #StoreLoad

P8: !CAS [11] (maybe <- 0x800002) (Int)
add %i2, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P9: !DWLD [2] (Int)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P10: !CAS [0] (maybe <- 0x800003) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P11: !ST [8] (maybe <- 0x800004) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P12: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P13: !DWLD [8] (Int)
ldx [%i1 + 256], %o1
! move %o1(upper) -> %o1(upper)

P14: !CASX [11] (maybe <- 0x800005) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P15: !NOP (Int)
nop

P16: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P17: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P18: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P19: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P20: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P21: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P22: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P23: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P24: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P25: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P26: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P27: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P28: !ST [1] (maybe <- 0x800006) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P29: !CASX [1] (maybe <- 0x800007) (Int)
add %i0, 0, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P30: !DWST [4] (maybe <- 0x800009) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P31: !DWLD [10] (FP)
! case fp 
ldd  [%i2 + 32], %f0
! 1 addresses covered

P32: !SWAP [15] (maybe <- 0x80000a) (Int)
mov %l4, %o4
swap  [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P33: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P34: !DWST [3] (maybe <- 0x80000b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P35: !CAS [4] (maybe <- 0x80000c) (Int)
add %i0, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P36: !LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P37: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P38: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P39: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P40: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P41: !ST [1] (maybe <- 0x80000d) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P42: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P43: !CASX [5] (maybe <- 0x80000e) (Int)
add %i1, 72, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %l4, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P44: !CASX [14] (maybe <- 0x80000f) (Int)
add %i3, 128, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P45: !SWAP [2] (maybe <- 0x800010) (Int)
mov %l4, %o1
swap  [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P46: !DWST [1] (maybe <- 0x3f800000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P47: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P48: !CASX [8] (maybe <- 0x800011) (Int)
add %i1, 256, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P49: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P50: !MEMBAR (Int)
membar #StoreLoad

P51: !ST [10] (maybe <- 0x40400000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P52: !CASX [13] (maybe <- 0x800012) (Int)
add %i3, 64, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P53: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P54: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P55: !ST [2] (maybe <- 0x800013) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P56: !SWAP [6] (maybe <- 0x800014) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P57: !ST [10] (maybe <- 0x800015) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P58: !MEMBAR (Int)
membar #StoreLoad

P59: !MEMBAR (Int)
membar #StoreLoad

P60: !ST [13] (maybe <- 0x800016) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P61: !LD [12] (FP)
ld [%i3 + 0], %f1
! 1 addresses covered

P62: !LD [11] (FP)
ld [%i2 + 64], %f2
! 1 addresses covered

P63: !MEMBAR (Int)
membar #StoreLoad

P64: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P65: !MEMBAR (Int)
membar #StoreLoad

P66: !DWST [10] (maybe <- 0x800017) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P67: !DWLD [15] (FP)
! case fp 
ldd  [%i3 + 192], %f18
! 1 addresses covered
fmovs %f18, %f3

P68: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P69: !MEMBAR (Int)
membar #StoreLoad

P70: !NOP (Int)
nop

P71: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P72: !DWLD [5] (Int)
ldx [%i1 + 72], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P73: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P74: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P75: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P76: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P77: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P78: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P79: !ST [11] (maybe <- 0x800018) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P80: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P81: !ST [8] (maybe <- 0x800019) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P82: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P83: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P84: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P85: !SWAP [15] (maybe <- 0x80001a) (Int)
mov %l4, %o0
swap  [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P86: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P87: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P88: !MEMBAR (Int)
membar #StoreLoad

P89: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P90: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P91: !ST [0] (maybe <- 0x80001b) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P92: !LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P93: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P94: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P95: !CASX [10] (maybe <- 0x80001c) (Int)
add %i2, 32, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P96: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P97: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P98: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P99: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P100: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P101: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P102: !ST [4] (maybe <- 0x80001d) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P103: !DWST [1] (maybe <- 0x80001e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P104: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P105: !CASX [5] (maybe <- 0x800020) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P106: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3

P107: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P108: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P109: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P110: !CAS [14] (maybe <- 0x800021) (Int)
add %i3, 128, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P111: !DWST [12] (maybe <- 0x800022) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P112: !DWLD [14] (Int)
ldx [%i3 + 128], %o0
! move %o0(upper) -> %o0(upper)

P113: !ST [5] (maybe <- 0x800023) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P114: !DWST [1] (maybe <- 0x40800000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P115: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P116: !DWST [0] (maybe <- 0x40c00000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P117: !ST [0] (maybe <- 0x800024) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P118: !CASX [13] (maybe <- 0x800025) (Int)
add %i3, 64, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P119: !DWLD [3] (Int)
ldx [%i0 + 32], %o3
! move %o3(upper) -> %o3(upper)

P120: !CASX [10] (maybe <- 0x800026) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P121: !ST [10] (maybe <- 0x41000000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P122: !MEMBAR (Int)
membar #StoreLoad

P123: !MEMBAR (Int)
membar #StoreLoad

P124: !ST [8] (maybe <- 0x800027) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P125: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P126: !CAS [1] (maybe <- 0x800028) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P127: !MEMBAR (Int)
membar #StoreLoad

P128: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P129: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P130: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P131: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P132: !CAS [7] (maybe <- 0x800029) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P133: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P134: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P135: !DWST [3] (maybe <- 0x80002a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P136: !SWAP [3] (maybe <- 0x80002b) (Int)
mov %l4, %o0
swap  [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P137: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P138: !ST [3] (maybe <- 0x80002c) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P139: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P140: !CASX [15] (maybe <- 0x80002d) (Int)
add %i3, 192, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P141: !DWST [2] (maybe <- 0x80002e) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P142: !MEMBAR (Int)
membar #StoreLoad

P143: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P144: !DWLD [3] (Int)
ldx [%i0 + 32], %o3
! move %o3(upper) -> %o3(upper)

P145: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P146: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P147: !ST [10] (maybe <- 0x80002f) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P148: !CASX [1] (maybe <- 0x800030) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P149: !ST [7] (maybe <- 0x41100000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 84 ]

P150: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P151: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P152: !DWST [2] (maybe <- 0x800032) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P153: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P154: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P155: !SWAP [8] (maybe <- 0x800033) (Int)
mov %l4, %o2
swap  [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P156: !CASX [11] (maybe <- 0x800034) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P157: !ST [11] (maybe <- 0x800035) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P158: !CAS [2] (maybe <- 0x800036) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P159: !CASX [9] (maybe <- 0x800037) (Int)
add %i1, 512, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P160: !DWST [9] (maybe <- 0x800038) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P161: !ST [2] (maybe <- 0x800039) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P162: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P163: !CAS [3] (maybe <- 0x80003a) (Int)
add %i0, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P164: !ST [0] (maybe <- 0x80003b) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P165: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P166: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P167: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P168: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P169: !ST [6] (maybe <- 0x80003c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P170: !CASX [0] (maybe <- 0x80003d) (Int)
add %i0, 0, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P171: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P172: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P173: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P174: !CAS [7] (maybe <- 0x80003f) (Int)
add %i1, 84, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P175: !DWST [9] (maybe <- 0x800040) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P176: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P177: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P178: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P179: !ST [2] (maybe <- 0x800041) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P180: !DWST [4] (maybe <- 0x800042) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P181: !DWLD [6] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P182: !NOP (Int)
nop

P183: !DWST [2] (maybe <- 0x41200000) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 8]

P184: !DWST [2] (maybe <- 0x800043) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P185: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P186: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P187: !MEMBAR (Int)
membar #StoreLoad

P188: !CAS [10] (maybe <- 0x800044) (Int)
add %i2, 32, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P189: !CAS [14] (maybe <- 0x800045) (Int)
add %i3, 128, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P190: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P191: !ST [2] (maybe <- 0x800046) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P192: !CASX [4] (maybe <- 0x800047) (Int)
add %i0, 64, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P193: !DWST [9] (maybe <- 0x800048) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P194: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P195: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P196: !DWLD [3] (FP)
! case fp 
ldd  [%i0 + 32], %f4
! 1 addresses covered

P197: !DWLD [6] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P198: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P199: !NOP (Int)
nop

P200: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P201: !MEMBAR (Int)
membar #StoreLoad

P202: !DWLD [10] (FP)
! case fp 
ldd  [%i2 + 32], %f18
! 1 addresses covered
fmovs %f18, %f5

P203: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P204: !MEMBAR (Int)
membar #StoreLoad

P205: !DWST [13] (maybe <- 0x800049) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P206: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P207: !ST [6] (maybe <- 0x80004a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P208: !CASX [3] (maybe <- 0x80004b) (Int)
add %i0, 32, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P209: !DWST [3] (maybe <- 0x80004c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P210: !CAS [1] (maybe <- 0x80004d) (Int)
add %i0, 4, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P211: !ST [15] (maybe <- 0x80004e) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P212: !CAS [10] (maybe <- 0x80004f) (Int)
add %i2, 32, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P213: !SWAP [1] (maybe <- 0x800050) (Int)
mov %l4, %o1
swap  [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P214: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P215: !MEMBAR (Int)
membar #StoreLoad

P216: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P217: !SWAP [12] (maybe <- 0x800051) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P218: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P219: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P220: !CAS [2] (maybe <- 0x800052) (Int)
add %i0, 12, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P221: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P222: !MEMBAR (Int)
membar #StoreLoad

P223: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P224: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P225: !CASX [15] (maybe <- 0x800053) (Int)
add %i3, 192, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P226: !ST [2] (maybe <- 0x800054) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P227: !DWST [8] (maybe <- 0x800055) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P228: !CAS [11] (maybe <- 0x800056) (Int)
add %i2, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P229: !DWLD [10] (FP)
! case fp 
ldd  [%i2 + 32], %f6
! 1 addresses covered

P230: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P231: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P232: !DWLD [13] (Int)
ldx [%i3 + 64], %o2
! move %o2(upper) -> %o2(upper)

P233: !MEMBAR (Int)
membar #StoreLoad

P234: !ST [11] (maybe <- 0x800057) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P235: !CASX [7] (maybe <- 0x800058) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P236: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P237: !ST [11] (maybe <- 0x80005a) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P238: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P239: !DWST [15] (maybe <- 0x80005b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P240: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P241: !CASX [13] (maybe <- 0x80005c) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P242: !DWST [2] (maybe <- 0x80005d) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P243: !DWLD [10] (FP)
! case fp 
ldd  [%i2 + 32], %f18
! 1 addresses covered
fmovs %f18, %f7

P244: !SWAP [1] (maybe <- 0x80005e) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P245: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P246: !CAS [9] (maybe <- 0x80005f) (Int)
add %i1, 512, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P247: !ST [0] (maybe <- 0x800060) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P248: !DWST [9] (maybe <- 0x41300000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P249: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P250: !DWST [2] (maybe <- 0x800061) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P251: !DWST [3] (maybe <- 0x800062) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P252: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P253: !ST [2] (maybe <- 0x800063) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P254: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P255: !ST [0] (maybe <- 0x800064) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P256: !DWLD [13] (Int)
ldx [%i3 + 64], %o4
! move %o4(upper) -> %o4(upper)

P257: !LD [11] (FP)
ld [%i2 + 64], %f8
! 1 addresses covered

P258: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P259: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P260: !CAS [9] (maybe <- 0x800065) (Int)
add %i1, 512, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P261: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P262: !CASX [10] (maybe <- 0x800066) (Int)
add %i2, 32, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P263: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P264: !DWLD [9] (Int)
ldx [%i1 + 512], %o3
! move %o3(upper) -> %o3(upper)

P265: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P266: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P267: !DWST [9] (maybe <- 0x800067) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P268: !ST [3] (maybe <- 0x800068) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P269: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P270: !DWST [15] (maybe <- 0x800069) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P271: !LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P272: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P273: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P274: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P275: !NOP (Int)
nop

P276: !ST [11] (maybe <- 0x80006a) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P277: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P278: !ST [3] (maybe <- 0x80006b) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P279: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P280: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P281: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P282: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P283: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P284: !NOP (Int)
nop

P285: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P286: !MEMBAR (Int)
membar #StoreLoad

P287: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P288: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P289: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P290: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P291: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P292: !DWST [14] (maybe <- 0x80006c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P293: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P294: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P295: !CASX [9] (maybe <- 0x80006d) (Int)
add %i1, 512, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P296: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P297: !CASX [0] (maybe <- 0x80006e) (Int)
add %i0, 0, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P298: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P299: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P300: !CAS [5] (maybe <- 0x800070) (Int)
add %i1, 76, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P301: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P302: !ST [0] (maybe <- 0x800071) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P303: !MEMBAR (Int)
membar #StoreLoad

P304: !CAS [8] (maybe <- 0x800072) (Int)
add %i1, 256, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P305: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P306: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P307: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P308: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P309: !SWAP [9] (maybe <- 0x800073) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P310: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P311: !CASX [7] (maybe <- 0x800074) (Int)
add %i1, 80, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P312: !LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P313: !CAS [14] (maybe <- 0x800076) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P314: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P315: !ST [3] (maybe <- 0x800077) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P316: !MEMBAR (Int)
membar #StoreLoad

P317: !DWST [15] (maybe <- 0x800078) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P318: !MEMBAR (Int)
membar #StoreLoad

P319: !DWLD [4] (Int)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

P320: !NOP (Int)
nop

P321: !DWLD [3] (FP)
! case fp 
ldd  [%i0 + 32], %f18
! 1 addresses covered
fmovs %f18, %f9

P322: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P323: !ST [10] (maybe <- 0x800079) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P324: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P325: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P326: !CASX [5] (maybe <- 0x80007a) (Int)
add %i1, 72, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %l4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P327: !LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P328: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P329: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P330: !CAS [2] (maybe <- 0x80007b) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P331: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P332: !SWAP [2] (maybe <- 0x80007c) (Int)
mov %l4, %l6
swap  [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P333: !DWST [9] (maybe <- 0x80007d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P334: !CAS [4] (maybe <- 0x80007e) (Int)
add %i0, 64, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P335: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P336: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P337: !DWLD [12] (Int)
ldx [%i3 + 0], %o4
! move %o4(upper) -> %o4(upper)

P338: !DWLD [4] (FP)
! case fp 
ldd  [%i0 + 64], %f10
! 1 addresses covered

P339: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P340: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P341: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P342: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P343: !ST [11] (maybe <- 0x80007f) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P344: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P345: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P346: !DWST [1] (maybe <- 0x800080) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P347: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P348: !DWLD [4] (Int)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

P349: !DWST [8] (maybe <- 0x800082) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P350: !DWST [9] (maybe <- 0x800083) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P351: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P352: !SWAP [5] (maybe <- 0x800084) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P353: !NOP (Int)
nop

P354: !DWST [10] (maybe <- 0x800085) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P355: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P356: !ST [2] (maybe <- 0x800086) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P357: !ST [11] (maybe <- 0x800087) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P358: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P359: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P360: !CASX [2] (maybe <- 0x800088) (Int)
add %i0, 8, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P361: !ST [0] (maybe <- 0x800089) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P362: !ST [6] (maybe <- 0x80008a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P363: !SWAP [4] (maybe <- 0x80008b) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P364: !MEMBAR (Int)
membar #StoreLoad

P365: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P366: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P367: !CASX [4] (maybe <- 0x80008c) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P368: !CAS [11] (maybe <- 0x80008d) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P369: !MEMBAR (Int)
membar #StoreLoad

P370: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P371: !CAS [3] (maybe <- 0x80008e) (Int)
add %i0, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P372: !ST [7] (maybe <- 0x80008f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P373: !CAS [6] (maybe <- 0x800090) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P374: !ST [1] (maybe <- 0x800091) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P375: !SWAP [5] (maybe <- 0x800092) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P376: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P377: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P378: !CASX [1] (maybe <- 0x800093) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P379: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P380: !ST [9] (maybe <- 0x800095) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P381: !ST [0] (maybe <- 0x41400000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P382: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P383: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P384: !DWST [8] (maybe <- 0x800096) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P385: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P386: !SWAP [8] (maybe <- 0x800097) (Int)
mov %l4, %l6
swap  [%i1 + 256], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P387: !CASX [7] (maybe <- 0x800098) (Int)
add %i1, 80, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P388: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P389: !LD [13] (FP)
ld [%i3 + 64], %f11
! 1 addresses covered

P390: !DWLD [5] (FP)
! case fp 
ldd  [%i1 + 72], %f12
! 1 addresses covered
fmovs %f13, %f12

P391: !DWST [9] (maybe <- 0x80009a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P392: !DWLD [13] (Int)
ldx [%i3 + 64], %o3
! move %o3(upper) -> %o3(upper)

P393: !DWST [14] (maybe <- 0x80009b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P394: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P395: !DWST [10] (maybe <- 0x80009c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P396: !CASX [0] (maybe <- 0x80009d) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P397: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P398: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P399: !CAS [2] (maybe <- 0x80009f) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P400: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P401: !NOP (Int)
nop

P402: !ST [13] (maybe <- 0x8000a0) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P403: !DWST [8] (maybe <- 0x8000a1) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P404: !DWST [6] (maybe <- 0x8000a2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P405: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P406: !ST [3] (maybe <- 0x8000a4) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P407: !ST [5] (maybe <- 0x8000a5) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P408: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P409: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P410: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P411: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P412: !SWAP [2] (maybe <- 0x8000a6) (Int)
mov %l4, %o2
swap  [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P413: !CASX [0] (maybe <- 0x8000a7) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P414: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P415: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P416: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P417: !DWST [13] (maybe <- 0x8000a9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P418: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P419: !SWAP [10] (maybe <- 0x8000aa) (Int)
mov %l4, %o0
swap  [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P420: !DWST [8] (maybe <- 0x8000ab) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P421: !DWST [11] (maybe <- 0x8000ac) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P422: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P423: !CASX [2] (maybe <- 0x8000ad) (Int)
add %i0, 8, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P424: !CAS [1] (maybe <- 0x8000ae) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P425: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P426: !DWST [12] (maybe <- 0x8000af) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P427: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P428: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P429: !DWST [4] (maybe <- 0x8000b0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P430: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P431: !ST [2] (maybe <- 0x8000b1) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P432: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P433: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P434: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P435: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P436: !CAS [2] (maybe <- 0x8000b2) (Int)
add %i0, 12, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P437: !DWST [3] (maybe <- 0x8000b3) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P438: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P439: !ST [0] (maybe <- 0x8000b4) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P440: !MEMBAR (Int)
membar #StoreLoad

P441: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P442: !ST [8] (maybe <- 0x8000b5) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P443: !DWLD [7] (FP)
! case fp 
ldd  [%i1 + 80], %f18
! 2 addresses covered
fmovs %f18, %f13
fmovs %f19, %f14

P444: !DWST [5] (maybe <- 0x41500000) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 72]

P445: !DWST [11] (maybe <- 0x8000b6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P446: !DWST [12] (maybe <- 0x8000b7) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P447: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P448: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P449: !CAS [13] (maybe <- 0x8000b8) (Int)
add %i3, 64, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P450: !DWST [3] (maybe <- 0x8000b9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P451: !ST [4] (maybe <- 0x8000ba) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P452: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P453: !CASX [0] (maybe <- 0x8000bb) (Int)
add %i0, 0, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P454: !ST [10] (maybe <- 0x41600000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P455: !MEMBAR (Int)
membar #StoreLoad

P456: !LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P457: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P458: !ST [14] (maybe <- 0x8000bd) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P459: !CAS [12] (maybe <- 0x8000be) (Int)
add %i3, 0, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P460: !CASX [10] (maybe <- 0x8000bf) (Int)
add %i2, 32, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P461: !LD [5] (Int)
lduw [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P462: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P463: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P464: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P465: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P466: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P467: !MEMBAR (Int)
membar #StoreLoad

P468: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P469: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P470: !LD [3] (FP)
ld [%i0 + 32], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P471: !DWST [8] (maybe <- 0x8000c0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P472: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P473: !DWST [13] (maybe <- 0x8000c1) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P474: !DWST [10] (maybe <- 0x41700000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 32]

P475: !CAS [9] (maybe <- 0x8000c2) (Int)
add %i1, 512, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P476: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P477: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P478: !ST [12] (maybe <- 0x8000c3) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P479: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P480: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P481: !DWLD [5] (Int)
ldx [%i1 + 72], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P482: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P483: !SWAP [7] (maybe <- 0x8000c4) (Int)
mov %l4, %o0
swap  [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P484: !MEMBAR (Int)
membar #StoreLoad

P485: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P486: !MEMBAR (Int)
membar #StoreLoad

P487: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P488: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P489: !DWST [14] (maybe <- 0x8000c5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P490: !DWST [4] (maybe <- 0x8000c6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P491: !SWAP [4] (maybe <- 0x8000c7) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P492: !ST [15] (maybe <- 0x8000c8) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P493: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P494: !DWST [7] (maybe <- 0x8000c9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P495: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P496: !DWST [6] (maybe <- 0x8000cb) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P497: !DWLD [0] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P498: !LD [11] (Int)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P499: !DWST [5] (maybe <- 0x8000cd) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P500: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P501: !DWST [10] (maybe <- 0x8000ce) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P502: !CASX [3] (maybe <- 0x8000cf) (Int)
add %i0, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P503: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P504: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P505: !ST [1] (maybe <- 0x8000d0) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P506: !DWST [15] (maybe <- 0x41800000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P507: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P508: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P509: !ST [1] (maybe <- 0x41880000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P510: !SWAP [2] (maybe <- 0x8000d1) (Int)
mov %l4, %o3
swap  [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P511: !CAS [9] (maybe <- 0x8000d2) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P512: !SWAP [5] (maybe <- 0x8000d3) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P513: !ST [11] (maybe <- 0x8000d4) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P514: !DWLD [9] (Int)
ldx [%i1 + 512], %o0
! move %o0(upper) -> %o0(upper)

P515: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P516: !ST [6] (maybe <- 0x8000d5) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P517: !SWAP [9] (maybe <- 0x8000d6) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P518: !NOP (Int)
nop

P519: !ST [11] (maybe <- 0x8000d7) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P520: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P521: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P522: !MEMBAR (Int)
membar #StoreLoad

P523: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P524: !CASX [2] (maybe <- 0x8000d8) (Int)
add %i0, 8, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P525: !NOP (Int)
nop

P526: !DWST [9] (maybe <- 0x8000d9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P527: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P528: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P529: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P530: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P531: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P532: !CAS [5] (maybe <- 0x8000da) (Int)
add %i1, 76, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P533: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P534: !CAS [12] (maybe <- 0x8000db) (Int)
add %i3, 0, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P535: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P536: !SWAP [3] (maybe <- 0x8000dc) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P537: !CAS [8] (maybe <- 0x8000dd) (Int)
add %i1, 256, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P538: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P539: !MEMBAR (Int)
membar #StoreLoad

P540: !DWST [15] (maybe <- 0x8000de) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P541: !ST [5] (maybe <- 0x41900000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P542: !ST [6] (maybe <- 0x8000df) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P543: !ST [13] (maybe <- 0x8000e0) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P544: !MEMBAR (Int)
membar #StoreLoad

P545: !DWST [1] (maybe <- 0x8000e1) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P546: !DWLD [6] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P547: !DWST [14] (maybe <- 0x8000e3) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P548: !ST [12] (maybe <- 0x8000e4) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P549: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P550: !ST [8] (maybe <- 0x8000e5) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P551: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P552: !MEMBAR (Int)
membar #StoreLoad

P553: !MEMBAR (Int)
membar #StoreLoad

P554: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P555: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P556: !CASX [11] (maybe <- 0x8000e6) (Int)
add %i2, 64, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P557: !CASX [12] (maybe <- 0x8000e7) (Int)
add %i3, 0, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P558: !DWLD [0] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P559: !ST [13] (maybe <- 0x8000e8) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P560: !ST [2] (maybe <- 0x8000e9) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P561: !DWST [2] (maybe <- 0x8000ea) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P562: !LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P563: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P564: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P565: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P566: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P567: !ST [3] (maybe <- 0x8000eb) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P568: !CASX [5] (maybe <- 0x8000ec) (Int)
add %i1, 72, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %l4, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P569: !DWLD [6] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P570: !SWAP [14] (maybe <- 0x8000ed) (Int)
mov %l4, %o0
swap  [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P571: !MEMBAR (Int)
membar #StoreLoad

P572: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P573: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P574: !DWST [10] (maybe <- 0x8000ee) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P575: !MEMBAR (Int)
membar #StoreLoad

P576: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P577: !SWAP [6] (maybe <- 0x8000ef) (Int)
mov %l4, %o1
swap  [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P578: !MEMBAR (Int)
membar #StoreLoad

P579: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P580: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P581: !ST [1] (maybe <- 0x8000f0) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P582: !CAS [11] (maybe <- 0x8000f1) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P583: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P584: !CAS [1] (maybe <- 0x8000f2) (Int)
add %i0, 4, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P585: !CAS [0] (maybe <- 0x8000f3) (Int)
add %i0, 0, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P586: !ST [9] (maybe <- 0x8000f4) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P587: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P588: !CAS [3] (maybe <- 0x8000f5) (Int)
add %i0, 32, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P589: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P590: !CAS [14] (maybe <- 0x8000f6) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P591: !DWST [8] (maybe <- 0x8000f7) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P592: !CASX [10] (maybe <- 0x8000f8) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P593: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P594: !ST [8] (maybe <- 0x8000f9) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P595: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P596: !DWST [8] (maybe <- 0x8000fa) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P597: !ST [11] (maybe <- 0x8000fb) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P598: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P599: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P600: !DWST [0] (maybe <- 0x8000fc) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P601: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P602: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P603: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P604: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P605: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P606: !DWST [7] (maybe <- 0x8000fe) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P607: !ST [8] (maybe <- 0x800100) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P608: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P609: !CAS [12] (maybe <- 0x800101) (Int)
add %i3, 0, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P610: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P611: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P612: !DWST [13] (maybe <- 0x800102) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P613: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P614: !DWST [8] (maybe <- 0x800103) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P615: !DWST [5] (maybe <- 0x800104) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P616: !ST [5] (maybe <- 0x800105) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P617: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P618: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P619: !ST [10] (maybe <- 0x41980000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P620: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P621: !DWLD [3] (Int)
ldx [%i0 + 32], %o3
! move %o3(upper) -> %o3(upper)

P622: !DWST [14] (maybe <- 0x800106) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P623: !DWST [9] (maybe <- 0x800107) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P624: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P625: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P626: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P627: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P628: !MEMBAR (Int)
membar #StoreLoad

P629: !SWAP [13] (maybe <- 0x800108) (Int)
mov %l4, %o4
swap  [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P630: !DWST [4] (maybe <- 0x800109) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P631: !ST [4] (maybe <- 0x80010a) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P632: !DWST [13] (maybe <- 0x80010b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P633: !DWST [10] (maybe <- 0x80010c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P634: !DWLD [9] (FP)
! case fp 
ldd  [%i1 + 512], %f0
! 1 addresses covered

P635: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P636: !DWST [4] (maybe <- 0x80010d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P637: !DWST [9] (maybe <- 0x80010e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P638: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P639: !ST [1] (maybe <- 0x80010f) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P640: !ST [7] (maybe <- 0x800110) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P641: !ST [8] (maybe <- 0x800111) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P642: !MEMBAR (Int)
membar #StoreLoad

P643: !ST [9] (maybe <- 0x800112) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P644: !MEMBAR (Int)
membar #StoreLoad

P645: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P646: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P647: !DWST [7] (maybe <- 0x41a00000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P648: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P649: !MEMBAR (Int)
membar #StoreLoad

P650: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P651: !DWST [4] (maybe <- 0x800113) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P652: !SWAP [12] (maybe <- 0x800114) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P653: !ST [8] (maybe <- 0x800115) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P654: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P655: !ST [4] (maybe <- 0x41b00000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P656: !ST [8] (maybe <- 0x800116) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P657: !LD [11] (FP)
ld [%i2 + 64], %f1
! 1 addresses covered

P658: !DWLD [4] (Int)
ldx [%i0 + 64], %o3
! move %o3(upper) -> %o3(upper)

P659: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P660: !DWLD [5] (Int)
ldx [%i1 + 72], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P661: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P662: !DWST [1] (maybe <- 0x800117) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P663: !SWAP [7] (maybe <- 0x800119) (Int)
mov %l4, %l6
swap  [%i1 + 84], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P664: !MEMBAR (Int)
membar #StoreLoad

P665: !ST [6] (maybe <- 0x80011a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P666: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P667: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P668: !CASX [0] (maybe <- 0x80011b) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P669: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P670: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P671: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P672: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P673: !LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P674: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P675: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P676: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P677: !ST [6] (maybe <- 0x80011d) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P678: !DWLD [5] (Int)
ldx [%i1 + 72], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P679: !SWAP [10] (maybe <- 0x80011e) (Int)
mov %l4, %l6
swap  [%i2 + 32], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P680: !ST [8] (maybe <- 0x80011f) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P681: !LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P682: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P683: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P684: !SWAP [6] (maybe <- 0x800120) (Int)
mov %l4, %o1
swap  [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P685: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P686: !LD [2] (FP)
ld [%i0 + 12], %f2
! 1 addresses covered

P687: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P688: !SWAP [12] (maybe <- 0x800121) (Int)
mov %l4, %o2
swap  [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P689: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P690: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P691: !CASX [5] (maybe <- 0x800122) (Int)
add %i1, 72, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %l4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P692: !DWLD [11] (Int)
ldx [%i2 + 64], %o0
! move %o0(upper) -> %o0(upper)

P693: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P694: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P695: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P696: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P697: !SWAP [4] (maybe <- 0x800123) (Int)
mov %l4, %o1
swap  [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P698: !DWST [6] (maybe <- 0x800124) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P699: !MEMBAR (Int)
membar #StoreLoad

P700: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P701: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P702: !ST [6] (maybe <- 0x800126) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P703: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P704: !ST [5] (maybe <- 0x800127) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P705: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P706: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P707: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P708: !DWST [2] (maybe <- 0x800128) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P709: !MEMBAR (Int)
membar #StoreLoad

P710: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P711: !NOP (Int)
nop

P712: !ST [12] (maybe <- 0x41b80000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P713: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P714: !CASX [7] (maybe <- 0x800129) (Int)
add %i1, 80, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P715: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P716: !MEMBAR (Int)
membar #StoreLoad

P717: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P718: !ST [12] (maybe <- 0x80012b) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P719: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P720: !ST [10] (maybe <- 0x80012c) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P721: !LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P722: !SWAP [11] (maybe <- 0x80012d) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P723: !CAS [7] (maybe <- 0x80012e) (Int)
add %i1, 84, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P724: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P725: !DWLD [13] (Int)
ldx [%i3 + 64], %o3
! move %o3(upper) -> %o3(upper)

P726: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P727: !ST [9] (maybe <- 0x80012f) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P728: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P729: !DWST [14] (maybe <- 0x41c00000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P730: !NOP (Int)
nop

P731: !DWLD [3] (FP)
! case fp 
ldd  [%i0 + 32], %f18
! 1 addresses covered
fmovs %f18, %f3

P732: !ST [0] (maybe <- 0x800130) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P733: !SWAP [8] (maybe <- 0x800131) (Int)
mov %l4, %o4
swap  [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P734: !SWAP [9] (maybe <- 0x800132) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P735: !ST [12] (maybe <- 0x800133) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P736: !ST [4] (maybe <- 0x41c80000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P737: !ST [14] (maybe <- 0x800134) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P738: !DWST [5] (maybe <- 0x800135) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P739: !DWST [14] (maybe <- 0x800136) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P740: !SWAP [9] (maybe <- 0x800137) (Int)
mov %l4, %o0
swap  [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P741: !CASX [7] (maybe <- 0x800138) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P742: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P743: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P744: !DWST [2] (maybe <- 0x80013a) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P745: !ST [3] (maybe <- 0x80013b) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P746: !MEMBAR (Int)
membar #StoreLoad

P747: !CAS [9] (maybe <- 0x80013c) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P748: !ST [3] (maybe <- 0x80013d) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P749: !DWST [2] (maybe <- 0x41d00000) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 8]

P750: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P751: !MEMBAR (Int)
membar #StoreLoad

P752: !DWST [8] (maybe <- 0x80013e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P753: !ST [2] (maybe <- 0x80013f) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P754: !DWST [6] (maybe <- 0x800140) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P755: !DWST [2] (maybe <- 0x800142) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P756: !SWAP [15] (maybe <- 0x800143) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P757: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P758: !DWST [14] (maybe <- 0x41d80000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P759: !DWST [12] (maybe <- 0x800144) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P760: !MEMBAR (Int)
membar #StoreLoad

P761: !DWST [9] (maybe <- 0x800145) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P762: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P763: !SWAP [9] (maybe <- 0x800146) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P764: !CASX [5] (maybe <- 0x800147) (Int)
add %i1, 72, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %l4, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P765: !NOP (Int)
nop

P766: !DWLD [7] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P767: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P768: !MEMBAR (Int)
membar #StoreLoad

P769: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P770: !DWLD [1] (FP)
! case fp 
ldd  [%i0 + 0], %f4
! 2 addresses covered

P771: !DWLD [15] (Int)
ldx [%i3 + 192], %o3
! move %o3(upper) -> %o3(upper)

P772: !DWST [11] (maybe <- 0x800148) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P773: !ST [1] (maybe <- 0x800149) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P774: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P775: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P776: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P777: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P778: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P779: !ST [14] (maybe <- 0x80014a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P780: !DWLD [14] (Int)
ldx [%i3 + 128], %o4
! move %o4(upper) -> %o4(upper)

P781: !CASX [4] (maybe <- 0x80014b) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P782: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P783: !MEMBAR (Int)
membar #StoreLoad

P784: !DWLD [4] (Int)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

P785: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P786: !ST [1] (maybe <- 0x80014c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P787: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P788: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P789: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P790: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P791: !DWST [8] (maybe <- 0x80014d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P792: !MEMBAR (Int)
membar #StoreLoad

P793: !ST [7] (maybe <- 0x80014e) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P794: !CAS [7] (maybe <- 0x80014f) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P795: !DWST [1] (maybe <- 0x800150) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P796: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P797: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P798: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P799: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P800: !CAS [9] (maybe <- 0x800152) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P801: !MEMBAR (Int)
membar #StoreLoad

P802: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P803: !CASX [7] (maybe <- 0x800153) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P804: !CASX [10] (maybe <- 0x800155) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P805: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P806: !MEMBAR (Int)
membar #StoreLoad

P807: !ST [9] (maybe <- 0x41e00000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P808: !ST [5] (maybe <- 0x800156) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P809: !DWST [3] (maybe <- 0x800157) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P810: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P811: !DWST [12] (maybe <- 0x800158) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P812: !ST [11] (maybe <- 0x800159) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P813: !DWST [4] (maybe <- 0x80015a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P814: !MEMBAR (Int)
membar #StoreLoad

P815: !ST [9] (maybe <- 0x80015b) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P816: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P817: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P818: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P819: !MEMBAR (Int)
membar #StoreLoad

P820: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P821: !CAS [1] (maybe <- 0x80015c) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P822: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P823: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P824: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P825: !DWST [15] (maybe <- 0x41e80000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P826: !ST [12] (maybe <- 0x80015d) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P827: !DWST [7] (maybe <- 0x80015e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P828: !CASX [15] (maybe <- 0x800160) (Int)
add %i3, 192, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P829: !DWLD [10] (Int)
ldx [%i2 + 32], %o1
! move %o1(upper) -> %o1(upper)

P830: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P831: !CASX [11] (maybe <- 0x800161) (Int)
add %i2, 64, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P832: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P833: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P834: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P835: !CASX [3] (maybe <- 0x800162) (Int)
add %i0, 32, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P836: !ST [5] (maybe <- 0x800163) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P837: !MEMBAR (Int)
membar #StoreLoad

P838: !MEMBAR (Int)
membar #StoreLoad

P839: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P840: !SWAP [0] (maybe <- 0x800164) (Int)
mov %l4, %o2
swap  [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P841: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P842: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P843: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P844: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P845: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P846: !CAS [5] (maybe <- 0x800165) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P847: !ST [2] (maybe <- 0x800166) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P848: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P849: !ST [8] (maybe <- 0x800167) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P850: !ST [1] (maybe <- 0x800168) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P851: !MEMBAR (Int)
membar #StoreLoad

P852: !CASX [6] (maybe <- 0x800169) (Int)
add %i1, 80, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P853: !DWST [11] (maybe <- 0x41f00000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 64]

P854: !MEMBAR (Int)
membar #StoreLoad

P855: !NOP (Int)
nop

P856: !MEMBAR (Int)
membar #StoreLoad

P857: !MEMBAR (Int)
membar #StoreLoad

P858: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P859: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P860: !MEMBAR (Int)
membar #StoreLoad

P861: !NOP (Int)
nop

P862: !DWST [7] (maybe <- 0x80016b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P863: !MEMBAR (Int)
membar #StoreLoad

P864: !NOP (Int)
nop

P865: !MEMBAR (Int)
membar #StoreLoad

P866: !CASX [12] (maybe <- 0x80016d) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P867: !ST [3] (maybe <- 0x80016e) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P868: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P869: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P870: !ST [15] (maybe <- 0x80016f) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P871: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0

P872: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P873: !CAS [14] (maybe <- 0x800170) (Int)
add %i3, 128, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P874: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P875: !DWST [4] (maybe <- 0x800171) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P876: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P877: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f6
! 1 addresses covered

P878: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P879: !ST [14] (maybe <- 0x800172) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P880: !CAS [8] (maybe <- 0x800173) (Int)
add %i1, 256, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P881: !DWLD [15] (Int)
ldx [%i3 + 192], %o4
! move %o4(upper) -> %o4(upper)

P882: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P883: !DWLD [11] (FP)
! case fp 
ldd  [%i2 + 64], %f18
! 1 addresses covered
fmovs %f18, %f7

P884: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P885: !ST [8] (maybe <- 0x800174) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P886: !DWST [14] (maybe <- 0x800175) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P887: !DWST [0] (maybe <- 0x800176) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P888: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P889: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P890: !NOP (Int)
nop

P891: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P892: !DWST [12] (maybe <- 0x800178) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P893: !ST [13] (maybe <- 0x800179) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P894: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P895: !ST [15] (maybe <- 0x41f80000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P896: !CASX [4] (maybe <- 0x80017a) (Int)
add %i0, 64, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P897: !CAS [5] (maybe <- 0x80017b) (Int)
add %i1, 76, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P898: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P899: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P900: !DWST [11] (maybe <- 0x80017c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P901: !LD [5] (Int)
lduw [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P902: !CASX [14] (maybe <- 0x80017d) (Int)
add %i3, 128, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P903: !SWAP [7] (maybe <- 0x80017e) (Int)
mov %l4, %l6
swap  [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P904: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P905: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P906: !ST [12] (maybe <- 0x80017f) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P907: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P908: !ST [13] (maybe <- 0x800180) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P909: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P910: !DWST [8] (maybe <- 0x800181) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P911: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P912: !ST [4] (maybe <- 0x800182) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P913: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P914: !MEMBAR (Int)
membar #StoreLoad

P915: !MEMBAR (Int)
membar #StoreLoad

P916: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P917: !ST [13] (maybe <- 0x800183) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P918: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P919: !ST [7] (maybe <- 0x800184) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P920: !DWST [13] (maybe <- 0x800185) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P921: !DWST [12] (maybe <- 0x800186) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P922: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P923: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P924: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P925: !DWST [5] (maybe <- 0x800187) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P926: !MEMBAR (Int)
membar #StoreLoad

P927: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P928: !MEMBAR (Int)
membar #StoreLoad

P929: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P930: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P931: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P932: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P933: !LD [4] (FP)
ld [%i0 + 64], %f8
! 1 addresses covered

P934: !DWST [10] (maybe <- 0x42000000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 32]

P935: !ST [14] (maybe <- 0x800188) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P936: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P937: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P938: !CAS [13] (maybe <- 0x800189) (Int)
add %i3, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P939: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P940: !SWAP [2] (maybe <- 0x80018a) (Int)
mov %l4, %o2
swap  [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P941: !ST [11] (maybe <- 0x42040000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P942: !DWST [2] (maybe <- 0x80018b) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P943: !DWST [8] (maybe <- 0x80018c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P944: !ST [14] (maybe <- 0x42080000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P945: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P946: !MEMBAR (Int)
membar #StoreLoad

P947: !DWST [9] (maybe <- 0x80018d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P948: !CASX [10] (maybe <- 0x80018e) (Int)
add %i2, 32, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P949: !ST [5] (maybe <- 0x80018f) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P950: !ST [8] (maybe <- 0x800190) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P951: !LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P952: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P953: !MEMBAR (Int)
membar #StoreLoad

P954: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P955: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P956: !NOP (Int)
nop

P957: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P958: !NOP (Int)
nop

P959: !CASX [4] (maybe <- 0x800191) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P960: !ST [12] (maybe <- 0x800192) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P961: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P962: !CAS [8] (maybe <- 0x800193) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P963: !DWST [7] (maybe <- 0x800194) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P964: !ST [2] (maybe <- 0x800196) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P965: !CASX [9] (maybe <- 0x800197) (Int)
add %i1, 512, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P966: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P967: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P968: !SWAP [1] (maybe <- 0x800198) (Int)
mov %l4, %o3
swap  [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P969: !DWST [13] (maybe <- 0x800199) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P970: !DWST [8] (maybe <- 0x80019a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P971: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P972: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P973: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P974: !MEMBAR (Int)
membar #StoreLoad

P975: !CASX [15] (maybe <- 0x80019b) (Int)
add %i3, 192, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P976: !ST [5] (maybe <- 0x80019c) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P977: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P978: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P979: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P980: !ST [5] (maybe <- 0x80019d) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P981: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P982: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P983: !DWLD [14] (Int)
ldx [%i3 + 128], %o3
! move %o3(upper) -> %o3(upper)

P984: !ST [9] (maybe <- 0x420c0000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P985: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P986: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P987: !SWAP [9] (maybe <- 0x80019e) (Int)
mov %l4, %o4
swap  [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P988: !CASX [5] (maybe <- 0x80019f) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P989: !DWST [1] (maybe <- 0x8001a0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P990: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P991: !NOP (Int)
nop

P992: !SWAP [6] (maybe <- 0x8001a2) (Int)
mov %l4, %o2
swap  [%i1 + 80], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P993: !DWST [11] (maybe <- 0x8001a3) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P994: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P995: !CAS [5] (maybe <- 0x8001a4) (Int)
add %i1, 76, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P996: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P997: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P998: !ST [3] (maybe <- 0x8001a5) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P999: !CAS [0] (maybe <- 0x8001a6) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1000: !DWST [15] (maybe <- 0x42100000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P1001: !MEMBAR (Int)
membar #StoreLoad

P1002: !LD [0] (FP)
ld [%i0 + 0], %f9
! 1 addresses covered

P1003: !LD [1] (FP)
ld [%i0 + 4], %f10
! 1 addresses covered

P1004: !LD [2] (FP)
ld [%i0 + 12], %f11
! 1 addresses covered

P1005: !LD [3] (FP)
ld [%i0 + 32], %f12
! 1 addresses covered

P1006: !LD [4] (FP)
ld [%i0 + 64], %f13
! 1 addresses covered

P1007: !LD [5] (FP)
ld [%i1 + 76], %f14
! 1 addresses covered

P1008: !LD [6] (FP)
ld [%i1 + 80], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1009: !LD [7] (FP)
ld [%i1 + 84], %f0
! 1 addresses covered

P1010: !LD [8] (FP)
ld [%i1 + 256], %f1
! 1 addresses covered

P1011: !LD [9] (FP)
ld [%i1 + 512], %f2
! 1 addresses covered

P1012: !LD [10] (FP)
ld [%i2 + 32], %f3
! 1 addresses covered

P1013: !LD [11] (FP)
ld [%i2 + 64], %f4
! 1 addresses covered

P1014: !LD [12] (FP)
ld [%i3 + 0], %f5
! 1 addresses covered

P1015: !LD [13] (FP)
ld [%i3 + 64], %f6
! 1 addresses covered

P1016: !LD [14] (FP)
ld [%i3 + 128], %f7
! 1 addresses covered

P1017: !LD [15] (FP)
ld [%i3 + 192], %f8
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30

restore
retl
nop
!-----------------



func1:

! 1000 instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
srlx %i0, 6, %i0
sllx %i0, 6, %i0

add %i1, 63, %i1
srlx %i1, 6, %i1
sllx %i1, 6, %i1

add %i2, 63, %i2
srlx %i2, 6, %i2
sllx %i2, 6, %i2

add %i3, 63, %i3
srlx %i3, 6, %i3
sllx %i3, 6, %i3

add %i4, 63, %i4
srlx %i4, 6, %i4
sllx %i4, 6, %i4

add %i5, 63, %i5
srlx %i5, 6, %i5
sllx %i5, 6, %i5

mov   %i4, %l1
add   %i5, 1088, %l5

! Initialize %o7, the pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
addx  %o7, %l1, %o7 

! Initializing %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%l5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%l5+4]
ldd [%l5], %f0
ldd [%l5], %f2
ldd [%l5], %f4
ldd [%l5], %f6
ldd [%l5], %f8
ldd [%l5], %f10
ldd [%l5], %f12
ldd [%l5], %f14
ldd [%l5], %f16
ldd [%l5], %f18
ldd [%l5], %f20
ldd [%l5], %f22
ldd [%l5], %f24
ldd [%l5], %f26
ldd [%l5], %f28
ldd [%l5], %f30
ldd [%l5], %f32
ldd [%l5], %f34
ldd [%l5], %f36
ldd [%l5], %f38
ldd [%l5], %f40
ldd [%l5], %f42
ldd [%l5], %f44
ldd [%l5], %f46
ldd [%l5], %f48
ldd [%l5], %f50
ldd [%l5], %f52
ldd [%l5], %f54
ldd [%l5], %f56
ldd [%l5], %f58
ldd [%l5], %f60
ldd [%l5], %f62

! Initializing int results buffer registers: %o0 %o1 %o2 %o3 %o4 
mov %g0, %o0
mov %g0, %o1
mov %g0, %o2
mov %g0, %o3
mov %g0, %o4

! Signature for extract_loads
sethi %hi(0x01deade1), %l7
or    %l7, %lo(0x01deade1), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize integer counter 
sethi %hi(0x810001), %l4
or    %l4, %lo(0x810001), %l4

! Initialize FP counter 
sethi %hi(0x47800000), %l7
or    %l7, %lo(0x47800000), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize FP counter increment value 
sethi %hi(0x3f800000), %l7
or    %l7, %lo(0x3f800000), %l7
stw %l7, [%l5] 
ld [%l5], %f17 

P1018: !DWST [0] (maybe <- 0x47800000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P1019: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1020: !CAS [10] (maybe <- 0x810001) (Int)
add %i2, 32, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1021: !SWAP [13] (maybe <- 0x810002) (Int)
mov %l4, %o1
swap  [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1022: !CAS [1] (maybe <- 0x810003) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1023: !ST [13] (maybe <- 0x810004) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1024: !DWST [11] (maybe <- 0x810005) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1025: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P1026: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1027: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1028: !ST [1] (maybe <- 0x810006) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1029: !ST [3] (maybe <- 0x810007) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1030: !ST [14] (maybe <- 0x810008) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1031: !MEMBAR (Int)
membar #StoreLoad

P1032: !DWST [3] (maybe <- 0x810009) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P1033: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1034: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1035: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1036: !ST [14] (maybe <- 0x81000a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1037: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1038: !DWST [14] (maybe <- 0x47800100) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P1039: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1040: !CASX [13] (maybe <- 0x81000b) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1041: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1042: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1043: !DWST [5] (maybe <- 0x81000c) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P1044: !CASX [1] (maybe <- 0x81000d) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1045: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1046: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1047: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1048: !CASX [10] (maybe <- 0x81000f) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1049: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1050: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1051: !SWAP [1] (maybe <- 0x810010) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P1052: !CASX [12] (maybe <- 0x810011) (Int)
add %i3, 0, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1053: !SWAP [7] (maybe <- 0x810012) (Int)
mov %l4, %o0
swap  [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1054: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1055: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1056: !DWST [15] (maybe <- 0x810013) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P1057: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1058: !DWST [7] (maybe <- 0x810014) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1059: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1060: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1061: !CASX [13] (maybe <- 0x810016) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P1062: !CAS [8] (maybe <- 0x810017) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1063: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1064: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1065: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1066: !CAS [9] (maybe <- 0x810018) (Int)
add %i1, 512, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1067: !ST [15] (maybe <- 0x810019) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1068: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1069: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1070: !ST [0] (maybe <- 0x81001a) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1071: !CAS [3] (maybe <- 0x81001b) (Int)
add %i0, 32, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1072: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1073: !DWST [9] (maybe <- 0x81001c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P1074: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1075: !ST [8] (maybe <- 0x81001d) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1076: !ST [9] (maybe <- 0x81001e) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1077: !LD [3] (FP)
ld [%i0 + 32], %f0
! 1 addresses covered

P1078: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1079: !MEMBAR (Int)
membar #StoreLoad

P1080: !MEMBAR (Int)
membar #StoreLoad

P1081: !CAS [9] (maybe <- 0x81001f) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1082: !DWST [12] (maybe <- 0x810020) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1083: !ST [2] (maybe <- 0x810021) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1084: !CAS [10] (maybe <- 0x810022) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1085: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1086: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1087: !ST [10] (maybe <- 0x810023) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1088: !CASX [0] (maybe <- 0x810024) (Int)
add %i0, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1089: !CASX [12] (maybe <- 0x810026) (Int)
add %i3, 0, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1090: !CASX [0] (maybe <- 0x810027) (Int)
add %i0, 0, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1091: !CAS [9] (maybe <- 0x810029) (Int)
add %i1, 512, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1092: !ST [7] (maybe <- 0x81002a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1093: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1094: !DWLD [5] (FP)
! case fp 
ldd  [%i1 + 72], %f18
! 1 addresses covered
fmovs %f19, %f1

P1095: !SWAP [8] (maybe <- 0x81002b) (Int)
mov %l4, %o2
swap  [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1096: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1097: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1098: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1099: !SWAP [7] (maybe <- 0x81002c) (Int)
mov %l4, %o3
swap  [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1100: !ST [14] (maybe <- 0x81002d) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1101: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1102: !CAS [1] (maybe <- 0x81002e) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1103: !CASX [0] (maybe <- 0x81002f) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1104: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1105: !MEMBAR (Int)
membar #StoreLoad

P1106: !DWST [3] (maybe <- 0x810031) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P1107: !ST [15] (maybe <- 0x810032) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1108: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1109: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1110: !MEMBAR (Int)
membar #StoreLoad

P1111: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1112: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1113: !DWLD [4] (Int)
ldx [%i0 + 64], %o3
! move %o3(upper) -> %o3(upper)

P1114: !CAS [10] (maybe <- 0x810033) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1115: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1116: !ST [3] (maybe <- 0x810034) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1117: !ST [14] (maybe <- 0x810035) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1118: !CAS [3] (maybe <- 0x810036) (Int)
add %i0, 32, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1119: !MEMBAR (Int)
membar #StoreLoad

P1120: !SWAP [11] (maybe <- 0x810037) (Int)
mov %l4, %o1
swap  [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1121: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1122: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1123: !MEMBAR (Int)
membar #StoreLoad

P1124: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1125: !DWST [14] (maybe <- 0x810038) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1126: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1127: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1128: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1129: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1130: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P1131: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1132: !CASX [5] (maybe <- 0x810039) (Int)
add %i1, 72, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %l4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1133: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1134: !ST [2] (maybe <- 0x81003a) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1135: !DWST [9] (maybe <- 0x81003b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P1136: !ST [10] (maybe <- 0x47800180) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P1137: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1138: !MEMBAR (Int)
membar #StoreLoad

P1139: !SWAP [14] (maybe <- 0x81003c) (Int)
mov %l4, %o0
swap  [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1140: !ST [9] (maybe <- 0x81003d) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1141: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1142: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1143: !DWLD [3] (FP)
! case fp 
ldd  [%i0 + 32], %f2
! 1 addresses covered

P1144: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1145: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1146: !ST [10] (maybe <- 0x81003e) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1147: !ST [8] (maybe <- 0x81003f) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1148: !SWAP [9] (maybe <- 0x810040) (Int)
mov %l4, %o2
swap  [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1149: !ST [1] (maybe <- 0x810041) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1150: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1151: !MEMBAR (Int)
membar #StoreLoad

P1152: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1153: !ST [3] (maybe <- 0x810042) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1154: !MEMBAR (Int)
membar #StoreLoad

P1155: !SWAP [9] (maybe <- 0x810043) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P1156: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1157: !LD [10] (Int)
lduw [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1158: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1159: !LD [5] (Int)
lduw [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1160: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P1161: !ST [5] (maybe <- 0x810044) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1162: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1163: !SWAP [10] (maybe <- 0x810045) (Int)
mov %l4, %o1
swap  [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1164: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1165: !CAS [6] (maybe <- 0x810046) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1166: !MEMBAR (Int)
membar #StoreLoad

P1167: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1168: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P1169: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1170: !DWST [8] (maybe <- 0x810047) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1171: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1172: !MEMBAR (Int)
membar #StoreLoad

P1173: !CASX [7] (maybe <- 0x810048) (Int)
add %i1, 80, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1174: !CAS [7] (maybe <- 0x81004a) (Int)
add %i1, 84, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1175: !ST [4] (maybe <- 0x81004b) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1176: !MEMBAR (Int)
membar #StoreLoad

P1177: !DWLD [11] (Int)
ldx [%i2 + 64], %o2
! move %o2(upper) -> %o2(upper)

P1178: !LD [12] (FP)
ld [%i3 + 0], %f3
! 1 addresses covered

P1179: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P1180: !CAS [15] (maybe <- 0x81004c) (Int)
add %i3, 192, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1181: !CASX [9] (maybe <- 0x81004d) (Int)
add %i1, 512, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1182: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1183: !MEMBAR (Int)
membar #StoreLoad

P1184: !SWAP [4] (maybe <- 0x81004e) (Int)
mov %l4, %o1
swap  [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1185: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1186: !CASX [15] (maybe <- 0x81004f) (Int)
add %i3, 192, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P1187: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P1188: !CASX [6] (maybe <- 0x810050) (Int)
add %i1, 80, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1189: !DWLD [14] (Int)
ldx [%i3 + 128], %o1
! move %o1(upper) -> %o1(upper)

P1190: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1191: !SWAP [5] (maybe <- 0x810052) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1192: !DWLD [13] (Int)
ldx [%i3 + 64], %o2
! move %o2(upper) -> %o2(upper)

P1193: !DWLD [6] (FP)
! case fp 
ldd  [%i1 + 80], %f4
! 2 addresses covered

P1194: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P1195: !DWST [8] (maybe <- 0x810053) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1196: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1197: !LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1198: !ST [15] (maybe <- 0x810054) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1199: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1200: !MEMBAR (Int)
membar #StoreLoad

P1201: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1202: !DWST [2] (maybe <- 0x810055) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1203: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1204: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1205: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1206: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1207: !DWST [12] (maybe <- 0x810056) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1208: !DWST [13] (maybe <- 0x810057) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1209: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1210: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1211: !DWST [15] (maybe <- 0x47800200) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P1212: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1213: !ST [8] (maybe <- 0x810058) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1214: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1215: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1216: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P1217: !MEMBAR (Int)
membar #StoreLoad

P1218: !CAS [14] (maybe <- 0x810059) (Int)
add %i3, 128, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P1219: !DWST [6] (maybe <- 0x81005a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1220: !CAS [2] (maybe <- 0x81005c) (Int)
add %i0, 12, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1221: !ST [6] (maybe <- 0x81005d) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1222: !MEMBAR (Int)
membar #StoreLoad

P1223: !MEMBAR (Int)
membar #StoreLoad

P1224: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1225: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1226: !CASX [6] (maybe <- 0x81005e) (Int)
add %i1, 80, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1227: !DWLD [5] (Int)
ldx [%i1 + 72], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1228: !MEMBAR (Int)
membar #StoreLoad

P1229: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P1230: !ST [2] (maybe <- 0x810060) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1231: !ST [14] (maybe <- 0x810061) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1232: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1233: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P1234: !CAS [4] (maybe <- 0x810062) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1235: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1236: !ST [6] (maybe <- 0x810063) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1237: !DWST [0] (maybe <- 0x810064) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1238: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1239: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1240: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1241: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1242: !DWST [12] (maybe <- 0x810066) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1243: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P1244: !DWLD [6] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1245: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1246: !ST [1] (maybe <- 0x810067) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1247: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1248: !DWLD [1] (FP)
! case fp 
ldd  [%i0 + 0], %f6
! 2 addresses covered

P1249: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1250: !ST [4] (maybe <- 0x810068) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1251: !DWST [2] (maybe <- 0x810069) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1252: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1253: !DWST [6] (maybe <- 0x81006a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1254: !CASX [11] (maybe <- 0x81006c) (Int)
add %i2, 64, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1255: !MEMBAR (Int)
membar #StoreLoad

P1256: !ST [7] (maybe <- 0x81006d) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1257: !DWST [6] (maybe <- 0x81006e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1258: !LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1259: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1260: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1261: !ST [7] (maybe <- 0x810070) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1262: !CAS [12] (maybe <- 0x810071) (Int)
add %i3, 0, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1263: !SWAP [0] (maybe <- 0x810072) (Int)
mov %l4, %o2
swap  [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1264: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1265: !MEMBAR (Int)
membar #StoreLoad

P1266: !LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1267: !DWST [1] (maybe <- 0x810073) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1268: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1269: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3

P1270: !DWLD [10] (Int)
ldx [%i2 + 32], %o4
! move %o4(upper) -> %o4(upper)

P1271: !SWAP [10] (maybe <- 0x810075) (Int)
mov %l4, %l6
swap  [%i2 + 32], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P1272: !DWST [6] (maybe <- 0x810076) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1273: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1274: !CAS [11] (maybe <- 0x810078) (Int)
add %i2, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1275: !DWST [15] (maybe <- 0x810079) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P1276: !CASX [9] (maybe <- 0x81007a) (Int)
add %i1, 512, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1277: !NOP (Int)
nop

P1278: !DWST [2] (maybe <- 0x81007b) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1279: !DWLD [7] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1280: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1281: !ST [1] (maybe <- 0x81007c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1282: !ST [14] (maybe <- 0x81007d) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1283: !CAS [10] (maybe <- 0x81007e) (Int)
add %i2, 32, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P1284: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1285: !ST [10] (maybe <- 0x81007f) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1286: !ST [0] (maybe <- 0x810080) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1287: !CASX [14] (maybe <- 0x810081) (Int)
add %i3, 128, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1288: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1289: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1290: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1291: !DWST [8] (maybe <- 0x810082) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1292: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P1293: !DWST [0] (maybe <- 0x810083) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1294: !CAS [14] (maybe <- 0x810085) (Int)
add %i3, 128, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1295: !NOP (Int)
nop

P1296: !ST [15] (maybe <- 0x810086) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1297: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1298: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1299: !DWLD [15] (Int)
ldx [%i3 + 192], %o4
! move %o4(upper) -> %o4(upper)

P1300: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1301: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1302: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1303: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1304: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1305: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1306: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1307: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1308: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1309: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1310: !ST [3] (maybe <- 0x810087) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1311: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1312: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1313: !DWST [12] (maybe <- 0x810088) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1314: !ST [9] (maybe <- 0x810089) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1315: !ST [6] (maybe <- 0x81008a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1316: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1317: !ST [11] (maybe <- 0x81008b) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1318: !CASX [0] (maybe <- 0x81008c) (Int)
add %i0, 0, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1319: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1320: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1321: !CASX [11] (maybe <- 0x81008e) (Int)
add %i2, 64, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1322: !CASX [10] (maybe <- 0x81008f) (Int)
add %i2, 32, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1323: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1324: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1325: !CAS [5] (maybe <- 0x810090) (Int)
add %i1, 76, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1326: !ST [14] (maybe <- 0x810091) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1327: !SWAP [13] (maybe <- 0x810092) (Int)
mov %l4, %o4
swap  [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1328: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1329: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1330: !DWLD [11] (FP)
! case fp 
ldd  [%i2 + 64], %f8
! 1 addresses covered

P1331: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1332: !SWAP [14] (maybe <- 0x810093) (Int)
mov %l4, %o0
swap  [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1333: !ST [8] (maybe <- 0x810094) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1334: !LD [8] (FP)
ld [%i1 + 256], %f9
! 1 addresses covered

P1335: !DWST [11] (maybe <- 0x810095) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1336: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1337: !DWST [7] (maybe <- 0x810096) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1338: !CASX [11] (maybe <- 0x810098) (Int)
add %i2, 64, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1339: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f10
! 1 addresses covered

P1340: !ST [3] (maybe <- 0x810099) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1341: !MEMBAR (Int)
membar #StoreLoad

P1342: !SWAP [4] (maybe <- 0x81009a) (Int)
mov %l4, %o3
swap  [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1343: !DWST [1] (maybe <- 0x81009b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1344: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3

P1345: !ST [4] (maybe <- 0x81009d) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1346: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1347: !DWST [11] (maybe <- 0x81009e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1348: !MEMBAR (Int)
membar #StoreLoad

P1349: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1350: !LD [11] (FP)
ld [%i2 + 64], %f11
! 1 addresses covered

P1351: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1352: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1353: !DWST [2] (maybe <- 0x81009f) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1354: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1355: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1356: !SWAP [10] (maybe <- 0x8100a0) (Int)
mov %l4, %o0
swap  [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1357: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1358: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1359: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1360: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1361: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1362: !LD [11] (FP)
ld [%i2 + 64], %f12
! 1 addresses covered

P1363: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1364: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1365: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P1366: !DWST [13] (maybe <- 0x47800280) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P1367: !DWST [5] (maybe <- 0x47800300) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 72]

P1368: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P1369: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1370: !ST [12] (maybe <- 0x8100a1) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1371: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P1372: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1373: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1374: !LD [5] (Int)
lduw [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1375: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P1376: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1377: !DWST [12] (maybe <- 0x8100a2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1378: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1379: !DWLD [14] (Int)
ldx [%i3 + 128], %o1
! move %o1(upper) -> %o1(upper)

P1380: !DWST [13] (maybe <- 0x8100a3) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1381: !MEMBAR (Int)
membar #StoreLoad

P1382: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1383: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P1384: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P1385: !CASX [1] (maybe <- 0x8100a4) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P1386: !MEMBAR (Int)
membar #StoreLoad

P1387: !ST [5] (maybe <- 0x8100a6) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1388: !CASX [13] (maybe <- 0x8100a7) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1389: !DWST [2] (maybe <- 0x8100a8) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1390: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P1391: !MEMBAR (Int)
membar #StoreLoad

P1392: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1393: !SWAP [1] (maybe <- 0x8100a9) (Int)
mov %l4, %o3
swap  [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1394: !CASX [7] (maybe <- 0x8100aa) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P1395: !MEMBAR (Int)
membar #StoreLoad

P1396: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1397: !ST [15] (maybe <- 0x8100ac) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1398: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1399: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1400: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1401: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P1402: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1403: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1404: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1405: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1406: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1407: !CAS [11] (maybe <- 0x8100ad) (Int)
add %i2, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1408: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1409: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1410: !DWST [0] (maybe <- 0x8100ae) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1411: !MEMBAR (Int)
membar #StoreLoad

P1412: !SWAP [1] (maybe <- 0x8100b0) (Int)
mov %l4, %o4
swap  [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1413: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1414: !ST [4] (maybe <- 0x8100b1) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1415: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1416: !ST [11] (maybe <- 0x8100b2) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1417: !CAS [14] (maybe <- 0x8100b3) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1418: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1419: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1420: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1421: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1422: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1423: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1424: !CASX [2] (maybe <- 0x8100b4) (Int)
add %i0, 8, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %l4, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1425: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1426: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1427: !LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1428: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1429: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1430: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1431: !ST [8] (maybe <- 0x8100b5) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1432: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1433: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1434: !CASX [1] (maybe <- 0x8100b6) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1435: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1436: !DWST [13] (maybe <- 0x8100b8) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1437: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1438: !MEMBAR (Int)
membar #StoreLoad

P1439: !DWST [14] (maybe <- 0x8100b9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1440: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P1441: !DWST [4] (maybe <- 0x8100ba) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P1442: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1443: !CAS [7] (maybe <- 0x8100bb) (Int)
add %i1, 84, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1444: !DWST [14] (maybe <- 0x8100bc) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1445: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1446: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1447: !CASX [6] (maybe <- 0x8100bd) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1448: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1449: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1450: !MEMBAR (Int)
membar #StoreLoad

P1451: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1452: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1453: !ST [13] (maybe <- 0x8100bf) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1454: !ST [15] (maybe <- 0x8100c0) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1455: !MEMBAR (Int)
membar #StoreLoad

P1456: !DWLD [12] (Int)
ldx [%i3 + 0], %o2
! move %o2(upper) -> %o2(upper)

P1457: !CASX [13] (maybe <- 0x8100c1) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1458: !ST [6] (maybe <- 0x8100c2) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1459: !LD [1] (FP)
ld [%i0 + 4], %f13
! 1 addresses covered

P1460: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1461: !DWST [14] (maybe <- 0x8100c3) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1462: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1463: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1464: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1465: !CASX [0] (maybe <- 0x8100c4) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1466: !CAS [4] (maybe <- 0x8100c6) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1467: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1468: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1469: !DWLD [8] (Int)
ldx [%i1 + 256], %o4
! move %o4(upper) -> %o4(upper)

P1470: !DWST [15] (maybe <- 0x47800380) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P1471: !CAS [5] (maybe <- 0x8100c7) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1472: !ST [1] (maybe <- 0x8100c8) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1473: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1474: !CASX [15] (maybe <- 0x8100c9) (Int)
add %i3, 192, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1475: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1476: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1477: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P1478: !ST [9] (maybe <- 0x8100ca) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1479: !ST [8] (maybe <- 0x8100cb) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1480: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P1481: !DWST [1] (maybe <- 0x8100cc) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1482: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P1483: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1484: !ST [2] (maybe <- 0x47800400) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P1485: !MEMBAR (Int)
membar #StoreLoad

P1486: !DWST [1] (maybe <- 0x8100ce) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1487: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1488: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P1489: !MEMBAR (Int)
membar #StoreLoad

P1490: !CASX [8] (maybe <- 0x8100d0) (Int)
add %i1, 256, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1491: !SWAP [0] (maybe <- 0x8100d1) (Int)
mov %l4, %o4
swap  [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1492: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1493: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1494: !MEMBAR (Int)
membar #StoreLoad

P1495: !ST [0] (maybe <- 0x8100d2) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1496: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1497: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1498: !LD [7] (FP)
ld [%i1 + 84], %f14
! 1 addresses covered

P1499: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1500: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1501: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1502: !DWLD [1] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1503: !CAS [11] (maybe <- 0x8100d3) (Int)
add %i2, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1504: !LD [3] (FP)
ld [%i0 + 32], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1505: !ST [10] (maybe <- 0x8100d4) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1506: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1507: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P1508: !DWST [2] (maybe <- 0x8100d5) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1509: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P1510: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1511: !ST [12] (maybe <- 0x8100d6) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1512: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1513: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1514: !ST [6] (maybe <- 0x8100d7) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1515: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1516: !ST [5] (maybe <- 0x8100d8) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1517: !ST [0] (maybe <- 0x8100d9) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1518: !CAS [12] (maybe <- 0x8100da) (Int)
add %i3, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1519: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1520: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1521: !ST [2] (maybe <- 0x8100db) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1522: !SWAP [9] (maybe <- 0x8100dc) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P1523: !ST [8] (maybe <- 0x8100dd) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1524: !ST [9] (maybe <- 0x47800480) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P1525: !CAS [5] (maybe <- 0x8100de) (Int)
add %i1, 76, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1526: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1527: !MEMBAR (Int)
membar #StoreLoad

P1528: !CAS [2] (maybe <- 0x8100df) (Int)
add %i0, 12, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P1529: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1530: !ST [5] (maybe <- 0x47800500) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P1531: !DWST [13] (maybe <- 0x8100e0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1532: !CASX [11] (maybe <- 0x8100e1) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1533: !CAS [4] (maybe <- 0x8100e2) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1534: !SWAP [13] (maybe <- 0x8100e3) (Int)
mov %l4, %l6
swap  [%i3 + 64], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1535: !MEMBAR (Int)
membar #StoreLoad

P1536: !MEMBAR (Int)
membar #StoreLoad

P1537: !ST [15] (maybe <- 0x8100e4) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1538: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1539: !DWST [8] (maybe <- 0x8100e5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1540: !DWLD [4] (Int)
ldx [%i0 + 64], %o4
! move %o4(upper) -> %o4(upper)

P1541: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1542: !CAS [8] (maybe <- 0x8100e6) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1543: !DWST [10] (maybe <- 0x47800580) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 32]

P1544: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1545: !DWLD [2] (Int)
ldx [%i0 + 8], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1546: !ST [11] (maybe <- 0x8100e7) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1547: !ST [8] (maybe <- 0x8100e8) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1548: !SWAP [2] (maybe <- 0x8100e9) (Int)
mov %l4, %l6
swap  [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1549: !DWST [13] (maybe <- 0x8100ea) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1550: !DWST [8] (maybe <- 0x8100eb) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1551: !CASX [6] (maybe <- 0x8100ec) (Int)
add %i1, 80, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1552: !SWAP [1] (maybe <- 0x8100ee) (Int)
mov %l4, %o4
swap  [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1553: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1554: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1555: !DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1556: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1557: !DWST [15] (maybe <- 0x8100ef) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P1558: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1559: !DWST [0] (maybe <- 0x8100f0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1560: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f0
! 1 addresses covered

P1561: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P1562: !SWAP [7] (maybe <- 0x8100f2) (Int)
mov %l4, %o2
swap  [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1563: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1564: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1565: !CAS [4] (maybe <- 0x8100f3) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1566: !DWST [5] (maybe <- 0x8100f4) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P1567: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1568: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1569: !LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1570: !DWST [4] (maybe <- 0x8100f5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P1571: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1572: !ST [11] (maybe <- 0x8100f6) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1573: !DWST [12] (maybe <- 0x8100f7) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1574: !CAS [2] (maybe <- 0x8100f8) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1575: !ST [8] (maybe <- 0x8100f9) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1576: !DWST [15] (maybe <- 0x8100fa) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P1577: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1578: !LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1579: !ST [10] (maybe <- 0x47800600) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P1580: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1581: !ST [13] (maybe <- 0x8100fb) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1582: !ST [8] (maybe <- 0x8100fc) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1583: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1584: !LD [3] (FP)
ld [%i0 + 32], %f1
! 1 addresses covered

P1585: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1586: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1587: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1588: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1589: !DWLD [14] (Int)
ldx [%i3 + 128], %o2
! move %o2(upper) -> %o2(upper)

P1590: !DWST [4] (maybe <- 0x47800680) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 64]

P1591: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P1592: !DWLD [14] (Int)
ldx [%i3 + 128], %o3
! move %o3(upper) -> %o3(upper)

P1593: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1594: !DWLD [9] (FP)
! case fp 
ldd  [%i1 + 512], %f2
! 1 addresses covered

P1595: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1596: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P1597: !DWST [7] (maybe <- 0x8100fd) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1598: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1599: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1600: !CAS [11] (maybe <- 0x8100ff) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1601: !CAS [0] (maybe <- 0x810100) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1602: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1603: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1604: !NOP (Int)
nop

P1605: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1606: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1607: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1608: !NOP (Int)
nop

P1609: !DWLD [15] (Int)
ldx [%i3 + 192], %o4
! move %o4(upper) -> %o4(upper)

P1610: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1611: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1612: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1613: !MEMBAR (Int)
membar #StoreLoad

P1614: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P1615: !SWAP [6] (maybe <- 0x810101) (Int)
mov %l4, %o1
swap  [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1616: !DWST [1] (maybe <- 0x810102) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1617: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f18
! 1 addresses covered
fmovs %f19, %f3

P1618: !ST [13] (maybe <- 0x810104) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1619: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1620: !NOP (Int)
nop

P1621: !DWST [7] (maybe <- 0x47800700) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P1622: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1623: !CASX [12] (maybe <- 0x810105) (Int)
add %i3, 0, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1624: !CASX [2] (maybe <- 0x810106) (Int)
add %i0, 8, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1625: !DWST [5] (maybe <- 0x810107) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P1626: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P1627: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1628: !MEMBAR (Int)
membar #StoreLoad

P1629: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P1630: !ST [4] (maybe <- 0x810108) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1631: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1632: !CASX [12] (maybe <- 0x810109) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1633: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1634: !DWLD [8] (Int)
ldx [%i1 + 256], %o0
! move %o0(upper) -> %o0(upper)

P1635: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1636: !DWST [14] (maybe <- 0x81010a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1637: !ST [6] (maybe <- 0x81010b) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1638: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1639: !MEMBAR (Int)
membar #StoreLoad

P1640: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P1641: !DWLD [3] (FP)
! case fp 
ldd  [%i0 + 32], %f4
! 1 addresses covered

P1642: !DWLD [14] (Int)
ldx [%i3 + 128], %o2
! move %o2(upper) -> %o2(upper)

P1643: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1644: !CAS [13] (maybe <- 0x81010c) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1645: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1646: !CASX [12] (maybe <- 0x81010d) (Int)
add %i3, 0, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1647: !CAS [15] (maybe <- 0x81010e) (Int)
add %i3, 192, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1648: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1649: !ST [6] (maybe <- 0x81010f) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1650: !DWLD [10] (Int)
ldx [%i2 + 32], %o2
! move %o2(upper) -> %o2(upper)

P1651: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P1652: !DWLD [15] (Int)
ldx [%i3 + 192], %o3
! move %o3(upper) -> %o3(upper)

P1653: !ST [8] (maybe <- 0x810110) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1654: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1655: !MEMBAR (Int)
membar #StoreLoad

P1656: !ST [8] (maybe <- 0x47800800) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P1657: !CASX [13] (maybe <- 0x810111) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P1658: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1659: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1660: !MEMBAR (Int)
membar #StoreLoad

P1661: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1662: !CAS [13] (maybe <- 0x810112) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1663: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1664: !DWST [7] (maybe <- 0x810113) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1665: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1666: !CASX [13] (maybe <- 0x810115) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1667: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1668: !ST [7] (maybe <- 0x810116) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1669: !ST [10] (maybe <- 0x810117) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1670: !CASX [8] (maybe <- 0x810118) (Int)
add %i1, 256, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1671: !CAS [4] (maybe <- 0x810119) (Int)
add %i0, 64, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P1672: !CAS [7] (maybe <- 0x81011a) (Int)
add %i1, 84, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1673: !DWST [11] (maybe <- 0x81011b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1674: !LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1675: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P1676: !DWST [3] (maybe <- 0x81011c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P1677: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P1678: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1679: !DWST [5] (maybe <- 0x81011d) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P1680: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1681: !CAS [9] (maybe <- 0x81011e) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1682: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1683: !ST [12] (maybe <- 0x81011f) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1684: !NOP (Int)
nop

P1685: !SWAP [14] (maybe <- 0x810120) (Int)
mov %l4, %l6
swap  [%i3 + 128], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P1686: !DWLD [3] (Int)
ldx [%i0 + 32], %o3
! move %o3(upper) -> %o3(upper)

P1687: !CAS [12] (maybe <- 0x810121) (Int)
add %i3, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1688: !CASX [6] (maybe <- 0x810122) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1689: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1690: !ST [3] (maybe <- 0x47800880) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P1691: !CASX [1] (maybe <- 0x810124) (Int)
add %i0, 0, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1692: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1693: !ST [6] (maybe <- 0x810126) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1694: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1695: !CASX [9] (maybe <- 0x810127) (Int)
add %i1, 512, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1696: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P1697: !CAS [7] (maybe <- 0x810128) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1698: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1699: !DWST [8] (maybe <- 0x810129) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1700: !DWLD [4] (FP)
! case fp 
ldd  [%i0 + 64], %f18
! 1 addresses covered
fmovs %f18, %f5

P1701: !DWST [8] (maybe <- 0x81012a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1702: !ST [1] (maybe <- 0x81012b) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1703: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1704: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1705: !DWST [2] (maybe <- 0x81012c) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1706: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1707: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1708: !DWST [3] (maybe <- 0x81012d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P1709: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1710: !DWST [6] (maybe <- 0x81012e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1711: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f6
! 2 addresses covered

P1712: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1713: !ST [5] (maybe <- 0x810130) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1714: !ST [7] (maybe <- 0x810131) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1715: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1716: !DWLD [1] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1717: !DWST [10] (maybe <- 0x810132) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P1718: !LD [5] (Int)
lduw [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1719: !ST [11] (maybe <- 0x810133) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1720: !ST [3] (maybe <- 0x810134) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1721: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1722: !DWST [4] (maybe <- 0x810135) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P1723: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1724: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1725: !DWST [6] (maybe <- 0x810136) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1726: !CAS [14] (maybe <- 0x810138) (Int)
add %i3, 128, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1727: !DWLD [3] (Int)
ldx [%i0 + 32], %o2
! move %o2(upper) -> %o2(upper)

P1728: !ST [12] (maybe <- 0x810139) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1729: !DWST [2] (maybe <- 0x81013a) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1730: !MEMBAR (Int)
membar #StoreLoad

P1731: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P1732: !CASX [8] (maybe <- 0x81013b) (Int)
add %i1, 256, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1733: !ST [7] (maybe <- 0x81013c) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1734: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1735: !DWST [11] (maybe <- 0x81013d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1736: !DWST [6] (maybe <- 0x81013e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1737: !LD [5] (FP)
ld [%i1 + 76], %f8
! 1 addresses covered

P1738: !MEMBAR (Int)
membar #StoreLoad

P1739: !DWST [2] (maybe <- 0x810140) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1740: !ST [0] (maybe <- 0x810141) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1741: !DWST [1] (maybe <- 0x810142) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1742: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1743: !CAS [7] (maybe <- 0x810144) (Int)
add %i1, 84, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1744: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1745: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1746: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1747: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1748: !DWST [7] (maybe <- 0x810145) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1749: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f9

P1750: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1751: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1752: !SWAP [6] (maybe <- 0x810147) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P1753: !MEMBAR (Int)
membar #StoreLoad

P1754: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1755: !CAS [8] (maybe <- 0x810148) (Int)
add %i1, 256, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1756: !LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1757: !MEMBAR (Int)
membar #StoreLoad

P1758: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1759: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1760: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1761: !CASX [4] (maybe <- 0x810149) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1762: !DWST [13] (maybe <- 0x81014a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1763: !CASX [13] (maybe <- 0x81014b) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1764: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1765: !MEMBAR (Int)
membar #StoreLoad

P1766: !ST [11] (maybe <- 0x81014c) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1767: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1768: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P1769: !DWST [3] (maybe <- 0x81014d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P1770: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1771: !DWST [10] (maybe <- 0x81014e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P1772: !ST [12] (maybe <- 0x81014f) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1773: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1774: !DWST [14] (maybe <- 0x810150) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1775: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1776: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1777: !ST [8] (maybe <- 0x810151) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1778: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1779: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1780: !ST [2] (maybe <- 0x810152) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1781: !ST [0] (maybe <- 0x810153) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1782: !ST [4] (maybe <- 0x810154) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1783: !MEMBAR (Int)
membar #StoreLoad

P1784: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1785: !ST [4] (maybe <- 0x47800900) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P1786: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1787: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1788: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1789: !MEMBAR (Int)
membar #StoreLoad

P1790: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1791: !ST [5] (maybe <- 0x810155) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1792: !DWST [0] (maybe <- 0x810156) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1793: !CAS [13] (maybe <- 0x810158) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1794: !ST [4] (maybe <- 0x810159) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1795: !NOP (Int)
nop

P1796: !DWST [11] (maybe <- 0x81015a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1797: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1798: !ST [1] (maybe <- 0x81015b) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1799: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1800: !NOP (Int)
nop

P1801: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1802: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P1803: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1804: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1805: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1806: !DWST [10] (maybe <- 0x81015c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P1807: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1808: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1809: !NOP (Int)
nop

P1810: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1811: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1812: !ST [14] (maybe <- 0x81015d) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1813: !DWST [5] (maybe <- 0x81015e) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P1814: !DWST [10] (maybe <- 0x81015f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P1815: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1816: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1817: !DWLD [10] (Int)
ldx [%i2 + 32], %o3
! move %o3(upper) -> %o3(upper)

P1818: !ST [3] (maybe <- 0x810160) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1819: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1820: !MEMBAR (Int)
membar #StoreLoad

P1821: !MEMBAR (Int)
membar #StoreLoad

P1822: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1823: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f10
! 1 addresses covered
fmovs %f11, %f10

P1824: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1825: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1826: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1827: !ST [12] (maybe <- 0x810161) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1828: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1829: !DWST [3] (maybe <- 0x47800980) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P1830: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1831: !ST [15] (maybe <- 0x810162) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1832: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P1833: !MEMBAR (Int)
membar #StoreLoad

P1834: !DWST [2] (maybe <- 0x810163) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1835: !ST [8] (maybe <- 0x810164) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1836: !ST [3] (maybe <- 0x810165) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1837: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1838: !DWST [6] (maybe <- 0x810166) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1839: !CASX [14] (maybe <- 0x810168) (Int)
add %i3, 128, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1840: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1841: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1842: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1843: !CASX [13] (maybe <- 0x810169) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P1844: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P1845: !LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1846: !ST [4] (maybe <- 0x81016a) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1847: !DWST [1] (maybe <- 0x81016b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1848: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1849: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1850: !DWST [0] (maybe <- 0x81016d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1851: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1852: !DWST [13] (maybe <- 0x81016f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1853: !CASX [8] (maybe <- 0x810170) (Int)
add %i1, 256, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1854: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P1855: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P1856: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1857: !SWAP [14] (maybe <- 0x810171) (Int)
mov %l4, %o3
swap  [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1858: !CASX [12] (maybe <- 0x810172) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P1859: !CAS [15] (maybe <- 0x810173) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1860: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1861: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1862: !DWST [0] (maybe <- 0x810174) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1863: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1864: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1865: !DWST [9] (maybe <- 0x810176) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P1866: !MEMBAR (Int)
membar #StoreLoad

P1867: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1868: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1869: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1870: !MEMBAR (Int)
membar #StoreLoad

P1871: !CAS [0] (maybe <- 0x810177) (Int)
add %i0, 0, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P1872: !DWST [6] (maybe <- 0x810178) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1873: !DWST [13] (maybe <- 0x81017a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1874: !ST [8] (maybe <- 0x81017b) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1875: !LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1876: !ST [2] (maybe <- 0x81017c) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1877: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1878: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1879: !CASX [0] (maybe <- 0x81017d) (Int)
add %i0, 0, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1880: !DWST [4] (maybe <- 0x81017f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P1881: !DWST [2] (maybe <- 0x47800a00) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 8]

P1882: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P1883: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P1884: !ST [11] (maybe <- 0x810180) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1885: !CASX [1] (maybe <- 0x810181) (Int)
add %i0, 0, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1886: !ST [10] (maybe <- 0x810183) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1887: !CAS [11] (maybe <- 0x810184) (Int)
add %i2, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1888: !DWLD [4] (Int)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

P1889: !DWST [9] (maybe <- 0x810185) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P1890: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P1891: !CAS [5] (maybe <- 0x810186) (Int)
add %i1, 76, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1892: !DWLD [8] (FP)
! case fp 
ldd  [%i1 + 256], %f18
! 1 addresses covered
fmovs %f18, %f11

P1893: !DWST [14] (maybe <- 0x47800a80) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P1894: !ST [5] (maybe <- 0x810187) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1895: !DWLD [13] (Int)
ldx [%i3 + 64], %o4
! move %o4(upper) -> %o4(upper)

P1896: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1897: !DWLD [0] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1898: !DWST [10] (maybe <- 0x810188) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P1899: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1900: !MEMBAR (Int)
membar #StoreLoad

P1901: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P1902: !CASX [3] (maybe <- 0x810189) (Int)
add %i0, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P1903: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1904: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1905: !ST [7] (maybe <- 0x81018a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1906: !MEMBAR (Int)
membar #StoreLoad

P1907: !DWST [1] (maybe <- 0x81018b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1908: !DWLD [6] (FP)
! case fp 
ldd  [%i1 + 80], %f12
! 2 addresses covered

P1909: !DWST [14] (maybe <- 0x81018d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1910: !MEMBAR (Int)
membar #StoreLoad

P1911: !CASX [2] (maybe <- 0x81018e) (Int)
add %i0, 8, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1912: !DWST [10] (maybe <- 0x81018f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P1913: !DWST [7] (maybe <- 0x810190) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1914: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1915: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1916: !MEMBAR (Int)
membar #StoreLoad

P1917: !DWLD [4] (FP)
! case fp 
ldd  [%i0 + 64], %f14
! 1 addresses covered

P1918: !LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1919: !CASX [9] (maybe <- 0x810192) (Int)
add %i1, 512, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P1920: !SWAP [9] (maybe <- 0x810193) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1921: !CASX [12] (maybe <- 0x810194) (Int)
add %i3, 0, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1922: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1923: !LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1924: !DWST [13] (maybe <- 0x810195) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1925: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1926: !SWAP [2] (maybe <- 0x810196) (Int)
mov %l4, %l6
swap  [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1927: !DWLD [7] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1928: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1929: !CASX [2] (maybe <- 0x810197) (Int)
add %i0, 8, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %l4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1930: !DWST [7] (maybe <- 0x810198) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1931: !DWLD [0] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P1932: !DWLD [15] (Int)
ldx [%i3 + 192], %o1
! move %o1(upper) -> %o1(upper)

P1933: !DWST [13] (maybe <- 0x81019a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1934: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1935: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1936: !ST [14] (maybe <- 0x81019b) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1937: !LD [6] (Int)
lduw [%i1 + 80], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1938: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1939: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1940: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1941: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1942: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1943: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1944: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1945: !ST [14] (maybe <- 0x81019c) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1946: !DWST [5] (maybe <- 0x81019d) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P1947: !CASX [15] (maybe <- 0x81019e) (Int)
add %i3, 192, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1948: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1949: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1950: !SWAP [6] (maybe <- 0x81019f) (Int)
mov %l4, %o0
swap  [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1951: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1952: !SWAP [11] (maybe <- 0x8101a0) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1953: !DWLD [7] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1954: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1955: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1956: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1957: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1958: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1959: !DWST [15] (maybe <- 0x8101a1) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P1960: !LD [10] (Int)
lduw [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1961: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1962: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1963: !LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1964: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1965: !ST [0] (maybe <- 0x8101a2) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1966: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1967: !CAS [14] (maybe <- 0x8101a3) (Int)
add %i3, 128, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P1968: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1969: !CAS [2] (maybe <- 0x8101a4) (Int)
add %i0, 12, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1970: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1971: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1972: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1973: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1974: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P1975: !DWLD [6] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1976: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1977: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1978: !DWST [2] (maybe <- 0x47800b00) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 8]

P1979: !CASX [8] (maybe <- 0x8101a5) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1980: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1981: !MEMBAR (Int)
membar #StoreLoad

P1982: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1983: !DWST [15] (maybe <- 0x8101a6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P1984: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1985: !DWST [6] (maybe <- 0x8101a7) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1986: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1987: !ST [4] (maybe <- 0x8101a9) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1988: !CAS [0] (maybe <- 0x8101aa) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1989: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1990: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1991: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1992: !ST [2] (maybe <- 0x8101ab) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1993: !CASX [7] (maybe <- 0x8101ac) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1994: !DWST [9] (maybe <- 0x8101ae) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P1995: !DWST [12] (maybe <- 0x8101af) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1996: !ST [15] (maybe <- 0x8101b0) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1997: !DWST [5] (maybe <- 0x8101b1) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P1998: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1999: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2000: !DWST [4] (maybe <- 0x8101b2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P2001: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2002: !CAS [5] (maybe <- 0x8101b3) (Int)
add %i1, 76, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2003: !DWST [8] (maybe <- 0x8101b4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2004: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2005: !CASX [15] (maybe <- 0x8101b5) (Int)
add %i3, 192, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P2006: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2007: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2008: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2009: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2010: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2011: !CASX [13] (maybe <- 0x8101b6) (Int)
add %i3, 64, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2012: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2013: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2014: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2015: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2016: !LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2017: !CASX [11] (maybe <- 0x8101b7) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2018: !MEMBAR (Int)
membar #StoreLoad

P2019: !LD [0] (FP)
ld [%i0 + 0], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2020: !LD [1] (FP)
ld [%i0 + 4], %f0
! 1 addresses covered

P2021: !LD [2] (FP)
ld [%i0 + 12], %f1
! 1 addresses covered

P2022: !LD [3] (FP)
ld [%i0 + 32], %f2
! 1 addresses covered

P2023: !LD [4] (FP)
ld [%i0 + 64], %f3
! 1 addresses covered

P2024: !LD [5] (FP)
ld [%i1 + 76], %f4
! 1 addresses covered

P2025: !LD [6] (FP)
ld [%i1 + 80], %f5
! 1 addresses covered

P2026: !LD [7] (FP)
ld [%i1 + 84], %f6
! 1 addresses covered

P2027: !LD [8] (FP)
ld [%i1 + 256], %f7
! 1 addresses covered

P2028: !LD [9] (FP)
ld [%i1 + 512], %f8
! 1 addresses covered

P2029: !LD [10] (FP)
ld [%i2 + 32], %f9
! 1 addresses covered

P2030: !LD [11] (FP)
ld [%i2 + 64], %f10
! 1 addresses covered

P2031: !LD [12] (FP)
ld [%i3 + 0], %f11
! 1 addresses covered

P2032: !LD [13] (FP)
ld [%i3 + 64], %f12
! 1 addresses covered

P2033: !LD [14] (FP)
ld [%i3 + 128], %f13
! 1 addresses covered

P2034: !LD [15] (FP)
ld [%i3 + 192], %f14
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
!---- flushing fp results buffer, offset 0 ----
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



func2:

! 1000 instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
srlx %i0, 6, %i0
sllx %i0, 6, %i0

add %i1, 63, %i1
srlx %i1, 6, %i1
sllx %i1, 6, %i1

add %i2, 63, %i2
srlx %i2, 6, %i2
sllx %i2, 6, %i2

add %i3, 63, %i3
srlx %i3, 6, %i3
sllx %i3, 6, %i3

add %i4, 63, %i4
srlx %i4, 6, %i4
sllx %i4, 6, %i4

add %i5, 63, %i5
srlx %i5, 6, %i5
sllx %i5, 6, %i5

mov   %i4, %l1
add   %i5, 1152, %l5

! Initialize %o7, the pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
addx  %o7, %l1, %o7 

! Initializing %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%l5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%l5+4]
ldd [%l5], %f0
ldd [%l5], %f2
ldd [%l5], %f4
ldd [%l5], %f6
ldd [%l5], %f8
ldd [%l5], %f10
ldd [%l5], %f12
ldd [%l5], %f14
ldd [%l5], %f16
ldd [%l5], %f18
ldd [%l5], %f20
ldd [%l5], %f22
ldd [%l5], %f24
ldd [%l5], %f26
ldd [%l5], %f28
ldd [%l5], %f30
ldd [%l5], %f32
ldd [%l5], %f34
ldd [%l5], %f36
ldd [%l5], %f38
ldd [%l5], %f40
ldd [%l5], %f42
ldd [%l5], %f44
ldd [%l5], %f46
ldd [%l5], %f48
ldd [%l5], %f50
ldd [%l5], %f52
ldd [%l5], %f54
ldd [%l5], %f56
ldd [%l5], %f58
ldd [%l5], %f60
ldd [%l5], %f62

! Initializing int results buffer registers: %o0 %o1 %o2 %o3 %o4 
mov %g0, %o0
mov %g0, %o1
mov %g0, %o2
mov %g0, %o3
mov %g0, %o4

! Signature for extract_loads
sethi %hi(0x02deade1), %l7
or    %l7, %lo(0x02deade1), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize integer counter 
sethi %hi(0x820001), %l4
or    %l4, %lo(0x820001), %l4

! Initialize FP counter 
sethi %hi(0x47ffff80), %l7
or    %l7, %lo(0x47ffff80), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize FP counter increment value 
sethi %hi(0x3f800000), %l7
or    %l7, %lo(0x3f800000), %l7
stw %l7, [%l5] 
ld [%l5], %f17 

P2035: !ST [0] (maybe <- 0x820001) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2036: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2037: !MEMBAR (Int)
membar #StoreLoad

P2038: !CAS [4] (maybe <- 0x820002) (Int)
add %i0, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2039: !SWAP [3] (maybe <- 0x820003) (Int)
mov %l4, %o1
swap  [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2040: !NOP (Int)
nop

P2041: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P2042: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2043: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2044: !CAS [11] (maybe <- 0x820004) (Int)
add %i2, 64, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2045: !ST [10] (maybe <- 0x820005) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2046: !MEMBAR (Int)
membar #StoreLoad

P2047: !CASX [7] (maybe <- 0x820006) (Int)
add %i1, 80, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2048: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2049: !DWST [8] (maybe <- 0x820008) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2050: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2051: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2052: !DWST [9] (maybe <- 0x820009) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2053: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2054: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2055: !CASX [1] (maybe <- 0x82000a) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2056: !DWST [4] (maybe <- 0x82000c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P2057: !SWAP [6] (maybe <- 0x82000d) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P2058: !DWST [4] (maybe <- 0x82000e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P2059: !DWST [2] (maybe <- 0x82000f) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P2060: !DWST [15] (maybe <- 0x820010) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2061: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2062: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2063: !DWST [9] (maybe <- 0x47ffff80) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P2064: !ST [11] (maybe <- 0x820011) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2065: !DWLD [1] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2066: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2067: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2068: !DWLD [15] (FP)
! case fp 
ldd  [%i3 + 192], %f0
! 1 addresses covered

P2069: !ST [7] (maybe <- 0x820012) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2070: !MEMBAR (Int)
membar #StoreLoad

P2071: !CAS [11] (maybe <- 0x820013) (Int)
add %i2, 64, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2072: !DWST [5] (maybe <- 0x820014) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P2073: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2074: !ST [9] (maybe <- 0x820015) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2075: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2076: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2077: !DWST [0] (maybe <- 0x820016) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2078: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2079: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2080: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2081: !ST [15] (maybe <- 0x820018) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2082: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2083: !CAS [2] (maybe <- 0x820019) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2084: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2085: !ST [13] (maybe <- 0x82001a) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2086: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2087: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2088: !DWST [3] (maybe <- 0x82001b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2089: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2090: !DWST [8] (maybe <- 0x48000000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 256]

P2091: !DWST [6] (maybe <- 0x82001c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2092: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2093: !CAS [8] (maybe <- 0x82001e) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2094: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P2095: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f1

P2096: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2097: !SWAP [10] (maybe <- 0x82001f) (Int)
mov %l4, %o2
swap  [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2098: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P2099: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2100: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f2
! 1 addresses covered

P2101: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2102: !ST [15] (maybe <- 0x820020) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2103: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2104: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2105: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2106: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2107: !MEMBAR (Int)
membar #StoreLoad

P2108: !CAS [13] (maybe <- 0x820021) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2109: !ST [7] (maybe <- 0x820022) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2110: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2111: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2112: !DWLD [9] (Int)
ldx [%i1 + 512], %o0
! move %o0(upper) -> %o0(upper)

P2113: !CASX [4] (maybe <- 0x820023) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P2114: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2115: !MEMBAR (Int)
membar #StoreLoad

P2116: !DWST [4] (maybe <- 0x820024) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P2117: !MEMBAR (Int)
membar #StoreLoad

P2118: !ST [10] (maybe <- 0x820025) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2119: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2120: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2121: !MEMBAR (Int)
membar #StoreLoad

P2122: !CAS [3] (maybe <- 0x820026) (Int)
add %i0, 32, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P2123: !ST [3] (maybe <- 0x820027) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2124: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2125: !ST [11] (maybe <- 0x48000040) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2126: !ST [4] (maybe <- 0x820028) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2127: !CASX [3] (maybe <- 0x820029) (Int)
add %i0, 32, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2128: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2129: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P2130: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2131: !MEMBAR (Int)
membar #StoreLoad

P2132: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2133: !DWST [6] (maybe <- 0x82002a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2134: !LD [10] (FP)
ld [%i2 + 32], %f3
! 1 addresses covered

P2135: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f4
! 1 addresses covered
fmovs %f5, %f4

P2136: !ST [4] (maybe <- 0x82002c) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2137: !ST [14] (maybe <- 0x82002d) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2138: !DWST [12] (maybe <- 0x82002e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P2139: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P2140: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2141: !DWST [15] (maybe <- 0x82002f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2142: !ST [0] (maybe <- 0x820030) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2143: !DWLD [10] (Int)
ldx [%i2 + 32], %o2
! move %o2(upper) -> %o2(upper)

P2144: !SWAP [9] (maybe <- 0x820031) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2145: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P2146: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2147: !LD [6] (Int)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2148: !SWAP [10] (maybe <- 0x820032) (Int)
mov %l4, %l6
swap  [%i2 + 32], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P2149: !LD [6] (FP)
ld [%i1 + 80], %f5
! 1 addresses covered

P2150: !SWAP [14] (maybe <- 0x820033) (Int)
mov %l4, %o0
swap  [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2151: !ST [3] (maybe <- 0x820034) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2152: !ST [1] (maybe <- 0x820035) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2153: !LD [3] (FP)
ld [%i0 + 32], %f6
! 1 addresses covered

P2154: !MEMBAR (Int)
membar #StoreLoad

P2155: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2156: !DWST [5] (maybe <- 0x820036) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P2157: !MEMBAR (Int)
membar #StoreLoad

P2158: !DWST [0] (maybe <- 0x820037) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2159: !ST [10] (maybe <- 0x820039) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2160: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f7
fmovs %f19, %f8

P2161: !DWST [9] (maybe <- 0x82003a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2162: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2163: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2164: !DWLD [7] (FP)
! case fp 
ldd  [%i1 + 80], %f18
! 2 addresses covered
fmovs %f18, %f9
fmovs %f19, %f10

P2165: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2166: !MEMBAR (Int)
membar #StoreLoad

P2167: !MEMBAR (Int)
membar #StoreLoad

P2168: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2169: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2170: !ST [0] (maybe <- 0x82003b) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2171: !DWST [3] (maybe <- 0x48000080) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P2172: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P2173: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2174: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2175: !ST [4] (maybe <- 0x82003c) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2176: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2177: !SWAP [4] (maybe <- 0x82003d) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2178: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2179: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2180: !DWST [10] (maybe <- 0x82003e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P2181: !MEMBAR (Int)
membar #StoreLoad

P2182: !SWAP [5] (maybe <- 0x82003f) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2183: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2184: !DWLD [10] (Int)
ldx [%i2 + 32], %o3
! move %o3(upper) -> %o3(upper)

P2185: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2186: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2187: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2188: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2189: !DWST [2] (maybe <- 0x820040) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P2190: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2191: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2192: !DWST [15] (maybe <- 0x820041) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2193: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2194: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P2195: !DWLD [1] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2196: !CAS [4] (maybe <- 0x820042) (Int)
add %i0, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2197: !DWST [2] (maybe <- 0x820043) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P2198: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2199: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2200: !ST [6] (maybe <- 0x820044) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2201: !ST [2] (maybe <- 0x820045) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2202: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2203: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2204: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P2205: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2206: !MEMBAR (Int)
membar #StoreLoad

P2207: !CASX [6] (maybe <- 0x820046) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P2208: !ST [7] (maybe <- 0x820048) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2209: !MEMBAR (Int)
membar #StoreLoad

P2210: !CASX [13] (maybe <- 0x820049) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P2211: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2212: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2213: !SWAP [8] (maybe <- 0x82004a) (Int)
mov %l4, %l6
swap  [%i1 + 256], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P2214: !DWST [5] (maybe <- 0x82004b) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P2215: !ST [6] (maybe <- 0x82004c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2216: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2217: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2218: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2219: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2220: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2221: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2222: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2223: !ST [2] (maybe <- 0x82004d) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2224: !CASX [10] (maybe <- 0x82004e) (Int)
add %i2, 32, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2225: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2226: !ST [12] (maybe <- 0x82004f) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2227: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P2228: !CASX [8] (maybe <- 0x820050) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2229: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2230: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2231: !MEMBAR (Int)
membar #StoreLoad

P2232: !MEMBAR (Int)
membar #StoreLoad

P2233: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2234: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P2235: !CAS [4] (maybe <- 0x820051) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2236: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2237: !DWST [14] (maybe <- 0x820052) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2238: !DWST [4] (maybe <- 0x820053) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P2239: !ST [14] (maybe <- 0x820054) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2240: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2241: !CASX [5] (maybe <- 0x820055) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2242: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2243: !ST [5] (maybe <- 0x480000c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P2244: !CAS [1] (maybe <- 0x820056) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2245: !MEMBAR (Int)
membar #StoreLoad

P2246: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2247: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f11
fmovs %f19, %f12

P2248: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2249: !CASX [8] (maybe <- 0x820057) (Int)
add %i1, 256, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2250: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2251: !DWST [8] (maybe <- 0x820058) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2252: !DWST [7] (maybe <- 0x820059) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2253: !DWST [14] (maybe <- 0x82005b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2254: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2255: !SWAP [5] (maybe <- 0x82005c) (Int)
mov %l4, %o2
swap  [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2256: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P2257: !DWLD [14] (Int)
ldx [%i3 + 128], %o3
! move %o3(upper) -> %o3(upper)

P2258: !MEMBAR (Int)
membar #StoreLoad

P2259: !DWST [9] (maybe <- 0x82005d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2260: !DWST [12] (maybe <- 0x82005e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P2261: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P2262: !MEMBAR (Int)
membar #StoreLoad

P2263: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2264: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2265: !ST [4] (maybe <- 0x82005f) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2266: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2267: !ST [3] (maybe <- 0x820060) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2268: !CASX [2] (maybe <- 0x820061) (Int)
add %i0, 8, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2269: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2270: !ST [8] (maybe <- 0x820062) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2271: !CAS [10] (maybe <- 0x820063) (Int)
add %i2, 32, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2272: !DWST [6] (maybe <- 0x820064) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2273: !DWST [6] (maybe <- 0x820066) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2274: !ST [15] (maybe <- 0x820068) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2275: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2276: !CAS [15] (maybe <- 0x820069) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2277: !ST [7] (maybe <- 0x82006a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2278: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2279: !CAS [7] (maybe <- 0x82006b) (Int)
add %i1, 84, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P2280: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2281: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2282: !CASX [6] (maybe <- 0x82006c) (Int)
add %i1, 80, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2283: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2284: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2285: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P2286: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P2287: !CAS [5] (maybe <- 0x82006e) (Int)
add %i1, 76, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P2288: !ST [14] (maybe <- 0x82006f) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2289: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2290: !CAS [0] (maybe <- 0x820070) (Int)
add %i0, 0, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P2291: !DWST [15] (maybe <- 0x820071) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2292: !ST [1] (maybe <- 0x820072) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2293: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2294: !CAS [7] (maybe <- 0x820073) (Int)
add %i1, 84, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2295: !CASX [0] (maybe <- 0x820074) (Int)
add %i0, 0, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P2296: !ST [6] (maybe <- 0x48000100) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P2297: !DWLD [10] (Int)
ldx [%i2 + 32], %o3
! move %o3(upper) -> %o3(upper)

P2298: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P2299: !ST [4] (maybe <- 0x820076) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2300: !DWLD [8] (Int)
ldx [%i1 + 256], %o4
! move %o4(upper) -> %o4(upper)

P2301: !DWST [1] (maybe <- 0x820077) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2302: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2303: !ST [12] (maybe <- 0x820079) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2304: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2305: !MEMBAR (Int)
membar #StoreLoad

P2306: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f18
! 1 addresses covered
fmovs %f19, %f13

P2307: !ST [14] (maybe <- 0x82007a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2308: !LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2309: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2310: !LD [11] (FP)
ld [%i2 + 64], %f14
! 1 addresses covered

P2311: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2312: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2313: !DWST [10] (maybe <- 0x82007b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P2314: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2315: !ST [1] (maybe <- 0x82007c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2316: !MEMBAR (Int)
membar #StoreLoad

P2317: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2318: !CASX [10] (maybe <- 0x82007d) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P2319: !MEMBAR (Int)
membar #StoreLoad

P2320: !DWST [12] (maybe <- 0x82007e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P2321: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2322: !CAS [10] (maybe <- 0x82007f) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2323: !CAS [3] (maybe <- 0x820080) (Int)
add %i0, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2324: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2325: !CAS [8] (maybe <- 0x820081) (Int)
add %i1, 256, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2326: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2327: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P2328: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2329: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2330: !ST [6] (maybe <- 0x820082) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2331: !ST [11] (maybe <- 0x48000140) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2332: !ST [5] (maybe <- 0x820083) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2333: !DWST [1] (maybe <- 0x820084) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2334: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P2335: !DWST [2] (maybe <- 0x820086) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P2336: !SWAP [12] (maybe <- 0x820087) (Int)
mov %l4, %o2
swap  [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2337: !NOP (Int)
nop

P2338: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2339: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2340: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P2341: !DWLD [1] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f15
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P2342: !ST [4] (maybe <- 0x48000180) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P2343: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2344: !MEMBAR (Int)
membar #StoreLoad

P2345: !SWAP [6] (maybe <- 0x820088) (Int)
mov %l4, %o3
swap  [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2346: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2347: !DWST [13] (maybe <- 0x820089) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2348: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2349: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2350: !ST [14] (maybe <- 0x82008a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2351: !CASX [15] (maybe <- 0x82008b) (Int)
add %i3, 192, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P2352: !ST [4] (maybe <- 0x82008c) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2353: !MEMBAR (Int)
membar #StoreLoad

P2354: !DWST [5] (maybe <- 0x82008d) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P2355: !ST [10] (maybe <- 0x82008e) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2356: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2357: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2358: !DWST [5] (maybe <- 0x82008f) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P2359: !ST [10] (maybe <- 0x820090) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2360: !MEMBAR (Int)
membar #StoreLoad

P2361: !ST [10] (maybe <- 0x820091) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2362: !CASX [14] (maybe <- 0x820092) (Int)
add %i3, 128, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2363: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2364: !DWST [9] (maybe <- 0x820093) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2365: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2366: !LD [3] (Int)
lduw [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2367: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2368: !ST [11] (maybe <- 0x820094) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2369: !ST [5] (maybe <- 0x820095) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2370: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2371: !CAS [10] (maybe <- 0x820096) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2372: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P2373: !ST [15] (maybe <- 0x820097) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2374: !DWST [11] (maybe <- 0x820098) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P2375: !CAS [3] (maybe <- 0x820099) (Int)
add %i0, 32, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2376: !ST [8] (maybe <- 0x82009a) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2377: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2378: !ST [15] (maybe <- 0x82009b) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2379: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2380: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2381: !CASX [15] (maybe <- 0x82009c) (Int)
add %i3, 192, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2382: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2383: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2384: !MEMBAR (Int)
membar #StoreLoad

P2385: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2386: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2387: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2388: !MEMBAR (Int)
membar #StoreLoad

P2389: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2390: !CASX [14] (maybe <- 0x82009d) (Int)
add %i3, 128, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P2391: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P2392: !DWLD [2] (Int)
ldx [%i0 + 8], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2393: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2394: !MEMBAR (Int)
membar #StoreLoad

P2395: !MEMBAR (Int)
membar #StoreLoad

P2396: !LD [2] (FP)
ld [%i0 + 12], %f1
! 1 addresses covered

P2397: !SWAP [12] (maybe <- 0x82009e) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2398: !CASX [3] (maybe <- 0x82009f) (Int)
add %i0, 32, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P2399: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2400: !LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2401: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2402: !DWST [4] (maybe <- 0x8200a0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P2403: !LD [10] (FP)
ld [%i2 + 32], %f2
! 1 addresses covered

P2404: !CAS [10] (maybe <- 0x8200a1) (Int)
add %i2, 32, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2405: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2406: !CAS [15] (maybe <- 0x8200a2) (Int)
add %i3, 192, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2407: !CASX [1] (maybe <- 0x8200a3) (Int)
add %i0, 0, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P2408: !MEMBAR (Int)
membar #StoreLoad

P2409: !DWLD [0] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2410: !MEMBAR (Int)
membar #StoreLoad

P2411: !SWAP [11] (maybe <- 0x8200a5) (Int)
mov %l4, %o0
swap  [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2412: !CASX [10] (maybe <- 0x8200a6) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P2413: !DWST [8] (maybe <- 0x8200a7) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2414: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2415: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P2416: !CASX [12] (maybe <- 0x8200a8) (Int)
add %i3, 0, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2417: !ST [10] (maybe <- 0x8200a9) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2418: !CASX [3] (maybe <- 0x8200aa) (Int)
add %i0, 32, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2419: !DWLD [7] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P2420: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2421: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2422: !DWST [4] (maybe <- 0x8200ab) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P2423: !ST [8] (maybe <- 0x8200ac) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2424: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2425: !ST [5] (maybe <- 0x8200ad) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2426: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P2427: !MEMBAR (Int)
membar #StoreLoad

P2428: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2429: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2430: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2431: !NOP (Int)
nop

P2432: !MEMBAR (Int)
membar #StoreLoad

P2433: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2434: !SWAP [0] (maybe <- 0x8200ae) (Int)
mov %l4, %o0
swap  [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2435: !MEMBAR (Int)
membar #StoreLoad

P2436: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2437: !CASX [12] (maybe <- 0x8200af) (Int)
add %i3, 0, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P2438: !DWST [10] (maybe <- 0x8200b0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P2439: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2440: !CASX [11] (maybe <- 0x8200b1) (Int)
add %i2, 64, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2441: !ST [1] (maybe <- 0x8200b2) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2442: !ST [1] (maybe <- 0x8200b3) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2443: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2444: !CAS [6] (maybe <- 0x8200b4) (Int)
add %i1, 80, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2445: !CAS [6] (maybe <- 0x8200b5) (Int)
add %i1, 80, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2446: !MEMBAR (Int)
membar #StoreLoad

P2447: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2448: !CASX [2] (maybe <- 0x8200b6) (Int)
add %i0, 8, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %l4, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P2449: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2450: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2451: !CAS [11] (maybe <- 0x8200b7) (Int)
add %i2, 64, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P2452: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f3

P2453: !CAS [15] (maybe <- 0x8200b8) (Int)
add %i3, 192, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2454: !LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2455: !NOP (Int)
nop

P2456: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2457: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2458: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2459: !ST [1] (maybe <- 0x8200b9) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2460: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P2461: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2462: !CAS [1] (maybe <- 0x8200ba) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2463: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2464: !DWST [3] (maybe <- 0x8200bb) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2465: !CAS [10] (maybe <- 0x8200bc) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2466: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2467: !ST [14] (maybe <- 0x8200bd) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2468: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P2469: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2470: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2471: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2472: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2473: !MEMBAR (Int)
membar #StoreLoad

P2474: !ST [9] (maybe <- 0x8200be) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2475: !DWST [15] (maybe <- 0x8200bf) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2476: !CAS [2] (maybe <- 0x8200c0) (Int)
add %i0, 12, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2477: !LD [8] (FP)
ld [%i1 + 256], %f4
! 1 addresses covered

P2478: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2479: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2480: !ST [4] (maybe <- 0x8200c1) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2481: !ST [2] (maybe <- 0x8200c2) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2482: !DWST [1] (maybe <- 0x8200c3) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2483: !CAS [2] (maybe <- 0x8200c5) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2484: !DWST [13] (maybe <- 0x8200c6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2485: !LD [8] (FP)
ld [%i1 + 256], %f5
! 1 addresses covered

P2486: !ST [13] (maybe <- 0x8200c7) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2487: !NOP (Int)
nop

P2488: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2489: !CAS [6] (maybe <- 0x8200c8) (Int)
add %i1, 80, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2490: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2491: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2492: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2493: !ST [15] (maybe <- 0x8200c9) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2494: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2495: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2496: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2497: !ST [6] (maybe <- 0x480001c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P2498: !DWST [13] (maybe <- 0x8200ca) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2499: !DWST [5] (maybe <- 0x8200cb) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P2500: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2501: !ST [9] (maybe <- 0x48000200) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P2502: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f6
! 1 addresses covered
fmovs %f7, %f6

P2503: !CAS [10] (maybe <- 0x8200cc) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2504: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2505: !CAS [6] (maybe <- 0x8200cd) (Int)
add %i1, 80, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2506: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P2507: !SWAP [10] (maybe <- 0x8200ce) (Int)
mov %l4, %l6
swap  [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2508: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2509: !ST [13] (maybe <- 0x8200cf) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2510: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2511: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2512: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P2513: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2514: !DWLD [1] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f7
fmovs %f19, %f8

P2515: !ST [11] (maybe <- 0x8200d0) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2516: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2517: !ST [4] (maybe <- 0x8200d1) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2518: !ST [2] (maybe <- 0x8200d2) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2519: !CASX [0] (maybe <- 0x8200d3) (Int)
add %i0, 0, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2520: !DWST [1] (maybe <- 0x8200d5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2521: !DWST [11] (maybe <- 0x48000240) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 64]

P2522: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2523: !CASX [4] (maybe <- 0x8200d7) (Int)
add %i0, 64, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2524: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2525: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2526: !ST [11] (maybe <- 0x8200d8) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2527: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2528: !SWAP [6] (maybe <- 0x8200d9) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2529: !ST [14] (maybe <- 0x8200da) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2530: !LD [11] (Int)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2531: !DWST [14] (maybe <- 0x8200db) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2532: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f18
! 1 addresses covered
fmovs %f18, %f9

P2533: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2534: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2535: !CASX [12] (maybe <- 0x8200dc) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P2536: !ST [3] (maybe <- 0x8200dd) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2537: !ST [2] (maybe <- 0x8200de) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2538: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P2539: !SWAP [5] (maybe <- 0x8200df) (Int)
mov %l4, %o1
swap  [%i1 + 76], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2540: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2541: !ST [13] (maybe <- 0x8200e0) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2542: !ST [13] (maybe <- 0x48000280) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P2543: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2544: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2545: !ST [4] (maybe <- 0x8200e1) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2546: !SWAP [7] (maybe <- 0x8200e2) (Int)
mov %l4, %o2
swap  [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2547: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2548: !ST [5] (maybe <- 0x8200e3) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2549: !CASX [15] (maybe <- 0x8200e4) (Int)
add %i3, 192, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P2550: !NOP (Int)
nop

P2551: !CAS [0] (maybe <- 0x8200e5) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2552: !ST [10] (maybe <- 0x480002c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P2553: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2554: !ST [10] (maybe <- 0x48000300) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P2555: !SWAP [9] (maybe <- 0x8200e6) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2556: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2557: !DWLD [5] (Int)
ldx [%i1 + 72], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2558: !DWLD [4] (FP)
! case fp 
ldd  [%i0 + 64], %f10
! 1 addresses covered

P2559: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P2560: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2561: !ST [7] (maybe <- 0x8200e7) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2562: !DWST [11] (maybe <- 0x8200e8) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P2563: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2564: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2565: !MEMBAR (Int)
membar #StoreLoad

P2566: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2567: !MEMBAR (Int)
membar #StoreLoad

P2568: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2569: !DWST [1] (maybe <- 0x8200e9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2570: !DWLD [9] (FP)
! case fp 
ldd  [%i1 + 512], %f18
! 1 addresses covered
fmovs %f18, %f11

P2571: !CAS [13] (maybe <- 0x8200eb) (Int)
add %i3, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P2572: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2573: !ST [1] (maybe <- 0x8200ec) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2574: !DWST [14] (maybe <- 0x8200ed) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2575: !LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2576: !CASX [0] (maybe <- 0x8200ee) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P2577: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2578: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2579: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2580: !CAS [6] (maybe <- 0x8200f0) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2581: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2582: !MEMBAR (Int)
membar #StoreLoad

P2583: !CASX [9] (maybe <- 0x8200f1) (Int)
add %i1, 512, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2584: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2585: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2586: !DWST [13] (maybe <- 0x8200f2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2587: !MEMBAR (Int)
membar #StoreLoad

P2588: !LD [5] (FP)
ld [%i1 + 76], %f12
! 1 addresses covered

P2589: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2590: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2591: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2592: !CAS [15] (maybe <- 0x8200f3) (Int)
add %i3, 192, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2593: !ST [2] (maybe <- 0x8200f4) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2594: !ST [1] (maybe <- 0x8200f5) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2595: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2596: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2597: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2598: !DWLD [14] (Int)
ldx [%i3 + 128], %o2
! move %o2(upper) -> %o2(upper)

P2599: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P2600: !DWST [5] (maybe <- 0x8200f6) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P2601: !MEMBAR (Int)
membar #StoreLoad

P2602: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2603: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2604: !DWST [14] (maybe <- 0x8200f7) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2605: !CASX [10] (maybe <- 0x8200f8) (Int)
add %i2, 32, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2606: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2607: !ST [3] (maybe <- 0x48000340) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P2608: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2609: !DWST [14] (maybe <- 0x8200f9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2610: !DWST [8] (maybe <- 0x8200fa) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2611: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2612: !MEMBAR (Int)
membar #StoreLoad

P2613: !CAS [4] (maybe <- 0x8200fb) (Int)
add %i0, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2614: !SWAP [11] (maybe <- 0x8200fc) (Int)
mov %l4, %o1
swap  [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2615: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2616: !ST [11] (maybe <- 0x48000380) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2617: !ST [3] (maybe <- 0x8200fd) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2618: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2619: !CAS [8] (maybe <- 0x8200fe) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2620: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2621: !ST [0] (maybe <- 0x8200ff) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2622: !ST [0] (maybe <- 0x820100) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2623: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2624: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2625: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2626: !DWLD [9] (Int)
ldx [%i1 + 512], %o3
! move %o3(upper) -> %o3(upper)

P2627: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2628: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2629: !MEMBAR (Int)
membar #StoreLoad

P2630: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P2631: !CAS [5] (maybe <- 0x820101) (Int)
add %i1, 76, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P2632: !LD [6] (FP)
ld [%i1 + 80], %f13
! 1 addresses covered

P2633: !MEMBAR (Int)
membar #StoreLoad

P2634: !CAS [1] (maybe <- 0x820102) (Int)
add %i0, 4, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2635: !DWST [3] (maybe <- 0x820103) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2636: !DWLD [6] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2637: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2638: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2639: !CAS [10] (maybe <- 0x820104) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2640: !ST [11] (maybe <- 0x820105) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2641: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2642: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2643: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2644: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2645: !ST [1] (maybe <- 0x820106) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2646: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2647: !NOP (Int)
nop

P2648: !CAS [13] (maybe <- 0x820107) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2649: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2650: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2651: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f14
! 2 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2652: !CAS [1] (maybe <- 0x820108) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2653: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P2654: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2655: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2656: !ST [2] (maybe <- 0x480003c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P2657: !DWST [8] (maybe <- 0x820109) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2658: !DWLD [7] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P2659: !ST [14] (maybe <- 0x48000400) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P2660: !ST [15] (maybe <- 0x48000440) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P2661: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2662: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P2663: !DWST [0] (maybe <- 0x82010a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2664: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2665: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2666: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2667: !ST [10] (maybe <- 0x82010c) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2668: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2669: !DWST [13] (maybe <- 0x48000480) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P2670: !ST [12] (maybe <- 0x82010d) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2671: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2672: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P2673: !MEMBAR (Int)
membar #StoreLoad

P2674: !DWST [14] (maybe <- 0x82010e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2675: !ST [7] (maybe <- 0x480004c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 84 ]

P2676: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P2677: !CAS [8] (maybe <- 0x82010f) (Int)
add %i1, 256, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2678: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2679: !MEMBAR (Int)
membar #StoreLoad

P2680: !CAS [7] (maybe <- 0x820110) (Int)
add %i1, 84, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2681: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2682: !SWAP [0] (maybe <- 0x820111) (Int)
mov %l4, %o3
swap  [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2683: !ST [11] (maybe <- 0x820112) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2684: !CASX [6] (maybe <- 0x820113) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P2685: !ST [12] (maybe <- 0x820115) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2686: !CAS [10] (maybe <- 0x820116) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2687: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2688: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2689: !ST [7] (maybe <- 0x820117) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2690: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2691: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2692: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2693: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2694: !CASX [12] (maybe <- 0x820118) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2695: !DWST [9] (maybe <- 0x820119) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2696: !ST [11] (maybe <- 0x82011a) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2697: !DWST [1] (maybe <- 0x82011b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2698: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2699: !ST [9] (maybe <- 0x82011d) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2700: !DWLD [14] (Int)
ldx [%i3 + 128], %o0
! move %o0(upper) -> %o0(upper)

P2701: !MEMBAR (Int)
membar #StoreLoad

P2702: !CAS [14] (maybe <- 0x82011e) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2703: !CASX [13] (maybe <- 0x82011f) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2704: !CAS [9] (maybe <- 0x820120) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2705: !CASX [3] (maybe <- 0x820121) (Int)
add %i0, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P2706: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2707: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2708: !ST [1] (maybe <- 0x820122) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2709: !MEMBAR (Int)
membar #StoreLoad

P2710: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f0
! 2 addresses covered

P2711: !DWST [13] (maybe <- 0x820123) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2712: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2713: !LD [5] (FP)
ld [%i1 + 76], %f2
! 1 addresses covered

P2714: !DWST [3] (maybe <- 0x820124) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2715: !ST [6] (maybe <- 0x820125) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2716: !MEMBAR (Int)
membar #StoreLoad

P2717: !ST [13] (maybe <- 0x820126) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2718: !DWST [14] (maybe <- 0x820127) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2719: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2720: !CASX [10] (maybe <- 0x820128) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2721: !MEMBAR (Int)
membar #StoreLoad

P2722: !ST [15] (maybe <- 0x820129) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2723: !ST [10] (maybe <- 0x82012a) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2724: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3

P2725: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2726: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2727: !DWLD [3] (FP)
! case fp 
ldd  [%i0 + 32], %f18
! 1 addresses covered
fmovs %f18, %f3

P2728: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P2729: !ST [4] (maybe <- 0x82012b) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2730: !ST [7] (maybe <- 0x82012c) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2731: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2732: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P2733: !CAS [3] (maybe <- 0x82012d) (Int)
add %i0, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2734: !ST [0] (maybe <- 0x82012e) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2735: !ST [4] (maybe <- 0x82012f) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2736: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2737: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2738: !CASX [8] (maybe <- 0x820130) (Int)
add %i1, 256, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2739: !MEMBAR (Int)
membar #StoreLoad

P2740: !ST [9] (maybe <- 0x820131) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2741: !DWST [6] (maybe <- 0x820132) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2742: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2743: !CASX [12] (maybe <- 0x820134) (Int)
add %i3, 0, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2744: !DWST [0] (maybe <- 0x820135) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2745: !CAS [13] (maybe <- 0x820137) (Int)
add %i3, 64, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2746: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2747: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2748: !ST [12] (maybe <- 0x820138) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2749: !ST [15] (maybe <- 0x820139) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2750: !CAS [4] (maybe <- 0x82013a) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2751: !MEMBAR (Int)
membar #StoreLoad

P2752: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2753: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2754: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2755: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P2756: !ST [11] (maybe <- 0x48000500) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2757: !SWAP [11] (maybe <- 0x82013b) (Int)
mov %l4, %o1
swap  [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2758: !DWST [7] (maybe <- 0x48000540) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P2759: !DWST [13] (maybe <- 0x82013c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2760: !CAS [15] (maybe <- 0x82013d) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2761: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2762: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2763: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2764: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2765: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2766: !DWST [1] (maybe <- 0x82013e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2767: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2768: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2769: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2770: !SWAP [1] (maybe <- 0x820140) (Int)
mov %l4, %o3
swap  [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2771: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2772: !DWST [15] (maybe <- 0x820141) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2773: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2774: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2775: !DWST [5] (maybe <- 0x820142) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P2776: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2777: !CASX [5] (maybe <- 0x820143) (Int)
add %i1, 72, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2778: !CAS [6] (maybe <- 0x820144) (Int)
add %i1, 80, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2779: !MEMBAR (Int)
membar #StoreLoad

P2780: !ST [4] (maybe <- 0x820145) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2781: !DWST [7] (maybe <- 0x820146) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2782: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2783: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2784: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2785: !CASX [4] (maybe <- 0x820148) (Int)
add %i0, 64, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2786: !LD [3] (FP)
ld [%i0 + 32], %f4
! 1 addresses covered

P2787: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P2788: !DWST [7] (maybe <- 0x820149) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2789: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2790: !DWST [8] (maybe <- 0x82014b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2791: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2792: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2793: !DWST [15] (maybe <- 0x480005c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P2794: !DWST [10] (maybe <- 0x82014c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P2795: !DWLD [13] (FP)
! case fp 
ldd  [%i3 + 64], %f18
! 1 addresses covered
fmovs %f18, %f5

P2796: !MEMBAR (Int)
membar #StoreLoad

P2797: !ST [7] (maybe <- 0x82014d) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2798: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P2799: !LD [4] (FP)
ld [%i0 + 64], %f6
! 1 addresses covered

P2800: !CASX [7] (maybe <- 0x82014e) (Int)
add %i1, 80, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P2801: !DWST [9] (maybe <- 0x820150) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2802: !ST [5] (maybe <- 0x820151) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2803: !ST [14] (maybe <- 0x820152) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2804: !SWAP [14] (maybe <- 0x820153) (Int)
mov %l4, %o3
swap  [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2805: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P2806: !CAS [6] (maybe <- 0x820154) (Int)
add %i1, 80, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P2807: !MEMBAR (Int)
membar #StoreLoad

P2808: !DWST [1] (maybe <- 0x48000600) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P2809: !ST [8] (maybe <- 0x820155) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2810: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2811: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2812: !SWAP [3] (maybe <- 0x820156) (Int)
mov %l4, %o0
swap  [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2813: !ST [7] (maybe <- 0x820157) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2814: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2815: !SWAP [9] (maybe <- 0x820158) (Int)
mov %l4, %o1
swap  [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2816: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2817: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2818: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2819: !ST [12] (maybe <- 0x820159) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2820: !DWST [3] (maybe <- 0x48000680) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P2821: !MEMBAR (Int)
membar #StoreLoad

P2822: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2823: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2824: !NOP (Int)
nop

P2825: !MEMBAR (Int)
membar #StoreLoad

P2826: !CASX [12] (maybe <- 0x82015a) (Int)
add %i3, 0, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P2827: !DWST [0] (maybe <- 0x82015b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2828: !DWLD [7] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2829: !CAS [4] (maybe <- 0x82015d) (Int)
add %i0, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2830: !LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2831: !CASX [10] (maybe <- 0x82015e) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2832: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2833: !CASX [0] (maybe <- 0x82015f) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P2834: !DWST [7] (maybe <- 0x820161) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2835: !ST [11] (maybe <- 0x820163) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2836: !MEMBAR (Int)
membar #StoreLoad

P2837: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2838: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2839: !SWAP [8] (maybe <- 0x820164) (Int)
mov %l4, %o1
swap  [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2840: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2841: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2842: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P2843: !ST [7] (maybe <- 0x820165) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2844: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2845: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P2846: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2847: !DWST [1] (maybe <- 0x480006c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P2848: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2849: !LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2850: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3

P2851: !LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2852: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2853: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2854: !SWAP [1] (maybe <- 0x820166) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P2855: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2856: !CAS [0] (maybe <- 0x820167) (Int)
add %i0, 0, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2857: !ST [9] (maybe <- 0x820168) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2858: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2859: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2860: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2861: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2862: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2863: !CASX [6] (maybe <- 0x820169) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2864: !DWST [12] (maybe <- 0x82016b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P2865: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2866: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2867: !DWST [9] (maybe <- 0x82016c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2868: !NOP (Int)
nop

P2869: !ST [2] (maybe <- 0x82016d) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2870: !ST [11] (maybe <- 0x82016e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2871: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P2872: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2873: !ST [0] (maybe <- 0x82016f) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2874: !ST [9] (maybe <- 0x820170) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2875: !ST [15] (maybe <- 0x820171) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2876: !CASX [7] (maybe <- 0x820172) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P2877: !DWST [6] (maybe <- 0x820174) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2878: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2879: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2880: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2881: !ST [15] (maybe <- 0x48000740) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P2882: !ST [15] (maybe <- 0x820176) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2883: !DWST [3] (maybe <- 0x820177) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2884: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2885: !DWST [2] (maybe <- 0x48000780) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 8]

P2886: !ST [11] (maybe <- 0x820178) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2887: !NOP (Int)
nop

P2888: !DWST [3] (maybe <- 0x820179) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2889: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2890: !DWST [10] (maybe <- 0x82017a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P2891: !CASX [0] (maybe <- 0x82017b) (Int)
add %i0, 0, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2892: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2893: !ST [7] (maybe <- 0x82017d) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2894: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2895: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2896: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P2897: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2898: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2899: !NOP (Int)
nop

P2900: !ST [0] (maybe <- 0x82017e) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2901: !CASX [14] (maybe <- 0x82017f) (Int)
add %i3, 128, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2902: !MEMBAR (Int)
membar #StoreLoad

P2903: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2904: !DWLD [1] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f7
fmovs %f19, %f8

P2905: !SWAP [6] (maybe <- 0x820180) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P2906: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2907: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2908: !DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2909: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2910: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2911: !LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2912: !ST [7] (maybe <- 0x820181) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2913: !NOP (Int)
nop

P2914: !DWST [3] (maybe <- 0x820182) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2915: !DWST [13] (maybe <- 0x480007c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P2916: !SWAP [6] (maybe <- 0x820183) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2917: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2918: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2919: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2920: !DWLD [9] (Int)
ldx [%i1 + 512], %o3
! move %o3(upper) -> %o3(upper)

P2921: !ST [15] (maybe <- 0x820184) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2922: !SWAP [15] (maybe <- 0x820185) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P2923: !DWST [2] (maybe <- 0x820186) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P2924: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2925: !DWLD [0] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2926: !SWAP [2] (maybe <- 0x820187) (Int)
mov %l4, %o0
swap  [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2927: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2928: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P2929: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2930: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2931: !DWST [13] (maybe <- 0x820188) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2932: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P2933: !ST [8] (maybe <- 0x820189) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2934: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P2935: !DWST [4] (maybe <- 0x82018a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P2936: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2937: !DWST [1] (maybe <- 0x82018b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2938: !DWST [7] (maybe <- 0x82018d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2939: !DWST [14] (maybe <- 0x82018f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2940: !ST [6] (maybe <- 0x820190) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2941: !SWAP [10] (maybe <- 0x820191) (Int)
mov %l4, %o3
swap  [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2942: !DWST [14] (maybe <- 0x820192) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2943: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2944: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2945: !ST [14] (maybe <- 0x820193) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2946: !CASX [11] (maybe <- 0x820194) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P2947: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2948: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f9

P2949: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P2950: !ST [4] (maybe <- 0x820195) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2951: !SWAP [14] (maybe <- 0x820196) (Int)
mov %l4, %o1
swap  [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2952: !CASX [11] (maybe <- 0x820197) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2953: !MEMBAR (Int)
membar #StoreLoad

P2954: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2955: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2956: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2957: !DWLD [3] (Int)
ldx [%i0 + 32], %o4
! move %o4(upper) -> %o4(upper)

P2958: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2959: !DWST [8] (maybe <- 0x820198) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2960: !CAS [0] (maybe <- 0x820199) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2961: !CASX [4] (maybe <- 0x82019a) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P2962: !DWST [4] (maybe <- 0x82019b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P2963: !MEMBAR (Int)
membar #StoreLoad

P2964: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P2965: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2966: !ST [4] (maybe <- 0x82019c) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2967: !DWLD [6] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2968: !CAS [15] (maybe <- 0x82019d) (Int)
add %i3, 192, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2969: !LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2970: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2971: !DWLD [5] (FP)
! case fp 
ldd  [%i1 + 72], %f10
! 1 addresses covered
fmovs %f11, %f10

P2972: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P2973: !CASX [8] (maybe <- 0x82019e) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2974: !DWST [15] (maybe <- 0x82019f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2975: !SWAP [3] (maybe <- 0x8201a0) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P2976: !DWST [14] (maybe <- 0x8201a1) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2977: !DWLD [9] (Int)
ldx [%i1 + 512], %o0
! move %o0(upper) -> %o0(upper)

P2978: !CASX [11] (maybe <- 0x8201a2) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P2979: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2980: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P2981: !ST [7] (maybe <- 0x8201a3) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2982: !CASX [15] (maybe <- 0x8201a4) (Int)
add %i3, 192, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2983: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2984: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2985: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2986: !CAS [13] (maybe <- 0x8201a5) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2987: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2988: !DWST [0] (maybe <- 0x8201a6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2989: !ST [6] (maybe <- 0x8201a8) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2990: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2991: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2992: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2993: !DWST [13] (maybe <- 0x8201a9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2994: !DWST [0] (maybe <- 0x48000800) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P2995: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2996: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2997: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2998: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2999: !ST [10] (maybe <- 0x8201aa) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3000: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3001: !MEMBAR (Int)
membar #StoreLoad

P3002: !DWLD [5] (Int)
ldx [%i1 + 72], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3003: !LD [3] (FP)
ld [%i0 + 32], %f11
! 1 addresses covered

P3004: !MEMBAR (Int)
membar #StoreLoad

P3005: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3006: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P3007: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3008: !MEMBAR (Int)
membar #StoreLoad

P3009: !DWST [15] (maybe <- 0x8201ab) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P3010: !DWST [4] (maybe <- 0x8201ac) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3011: !DWST [4] (maybe <- 0x8201ad) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3012: !DWST [6] (maybe <- 0x8201ae) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3013: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3014: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3015: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3016: !SWAP [4] (maybe <- 0x8201b0) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3017: !CASX [15] (maybe <- 0x8201b1) (Int)
add %i3, 192, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P3018: !CAS [13] (maybe <- 0x8201b2) (Int)
add %i3, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3019: !ST [12] (maybe <- 0x8201b3) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3020: !SWAP [4] (maybe <- 0x8201b4) (Int)
mov %l4, %o2
swap  [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3021: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3022: !SWAP [4] (maybe <- 0x8201b5) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3023: !DWST [1] (maybe <- 0x8201b6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3024: !CASX [14] (maybe <- 0x8201b8) (Int)
add %i3, 128, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3025: !DWST [10] (maybe <- 0x8201b9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3026: !DWST [4] (maybe <- 0x8201ba) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3027: !ST [3] (maybe <- 0x8201bb) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3028: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3029: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3030: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3031: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3032: !ST [12] (maybe <- 0x8201bc) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3033: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3034: !DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3035: !MEMBAR (Int)
membar #StoreLoad

P3036: !LD [0] (FP)
ld [%i0 + 0], %f12
! 1 addresses covered

P3037: !LD [1] (FP)
ld [%i0 + 4], %f13
! 1 addresses covered

P3038: !LD [2] (FP)
ld [%i0 + 12], %f14
! 1 addresses covered

P3039: !LD [3] (FP)
ld [%i0 + 32], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3040: !LD [4] (FP)
ld [%i0 + 64], %f0
! 1 addresses covered

P3041: !LD [5] (FP)
ld [%i1 + 76], %f1
! 1 addresses covered

P3042: !LD [6] (FP)
ld [%i1 + 80], %f2
! 1 addresses covered

P3043: !LD [7] (FP)
ld [%i1 + 84], %f3
! 1 addresses covered

P3044: !LD [8] (FP)
ld [%i1 + 256], %f4
! 1 addresses covered

P3045: !LD [9] (FP)
ld [%i1 + 512], %f5
! 1 addresses covered

P3046: !LD [10] (FP)
ld [%i2 + 32], %f6
! 1 addresses covered

P3047: !LD [11] (FP)
ld [%i2 + 64], %f7
! 1 addresses covered

P3048: !LD [12] (FP)
ld [%i3 + 0], %f8
! 1 addresses covered

P3049: !LD [13] (FP)
ld [%i3 + 64], %f9
! 1 addresses covered

P3050: !LD [14] (FP)
ld [%i3 + 128], %f10
! 1 addresses covered

P3051: !LD [15] (FP)
ld [%i3 + 192], %f11
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
!---- flushing fp results buffer, offset 0 ----
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



func3:

! 1000 instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
srlx %i0, 6, %i0
sllx %i0, 6, %i0

add %i1, 63, %i1
srlx %i1, 6, %i1
sllx %i1, 6, %i1

add %i2, 63, %i2
srlx %i2, 6, %i2
sllx %i2, 6, %i2

add %i3, 63, %i3
srlx %i3, 6, %i3
sllx %i3, 6, %i3

add %i4, 63, %i4
srlx %i4, 6, %i4
sllx %i4, 6, %i4

add %i5, 63, %i5
srlx %i5, 6, %i5
sllx %i5, 6, %i5

mov   %i4, %l1
add   %i5, 1216, %l5

! Initialize %o7, the pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
addx  %o7, %l1, %o7 

! Initializing %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%l5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%l5+4]
ldd [%l5], %f0
ldd [%l5], %f2
ldd [%l5], %f4
ldd [%l5], %f6
ldd [%l5], %f8
ldd [%l5], %f10
ldd [%l5], %f12
ldd [%l5], %f14
ldd [%l5], %f16
ldd [%l5], %f18
ldd [%l5], %f20
ldd [%l5], %f22
ldd [%l5], %f24
ldd [%l5], %f26
ldd [%l5], %f28
ldd [%l5], %f30
ldd [%l5], %f32
ldd [%l5], %f34
ldd [%l5], %f36
ldd [%l5], %f38
ldd [%l5], %f40
ldd [%l5], %f42
ldd [%l5], %f44
ldd [%l5], %f46
ldd [%l5], %f48
ldd [%l5], %f50
ldd [%l5], %f52
ldd [%l5], %f54
ldd [%l5], %f56
ldd [%l5], %f58
ldd [%l5], %f60
ldd [%l5], %f62

! Initializing int results buffer registers: %o0 %o1 %o2 %o3 %o4 
mov %g0, %o0
mov %g0, %o1
mov %g0, %o2
mov %g0, %o3
mov %g0, %o4

! Signature for extract_loads
sethi %hi(0x03deade1), %l7
or    %l7, %lo(0x03deade1), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize integer counter 
sethi %hi(0x830001), %l4
or    %l4, %lo(0x830001), %l4

! Initialize FP counter 
sethi %hi(0x483fff80), %l7
or    %l7, %lo(0x483fff80), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize FP counter increment value 
sethi %hi(0x3f800000), %l7
or    %l7, %lo(0x3f800000), %l7
stw %l7, [%l5] 
ld [%l5], %f17 

P3052: !CASX [9] (maybe <- 0x830001) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_0:
add %i1, 512, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3053: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3054: !DWST [14] (maybe <- 0x483fff80) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P3055: !CAS [5] (maybe <- 0x830002) (Int)
add %i1, 76, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3056: !DWLD [15] (Int)
ldx [%i3 + 192], %o3
! move %o3(upper) -> %o3(upper)

P3057: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3058: !MEMBAR (Int)
membar #StoreLoad

P3059: !ST [7] (maybe <- 0x830003) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3060: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P3061: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P3062: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3063: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3064: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3065: !CAS [2] (maybe <- 0x830004) (Int)
add %i0, 12, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3066: !ST [14] (maybe <- 0x483fffc0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P3067: !ST [0] (maybe <- 0x830005) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3068: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3069: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f0
! 1 addresses covered

P3070: !DWLD [15] (Int)
ldx [%i3 + 192], %o1
! move %o1(upper) -> %o1(upper)

P3071: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3072: !ST [15] (maybe <- 0x830006) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3073: !ST [4] (maybe <- 0x48400000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P3074: !DWST [3] (maybe <- 0x830007) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3075: !SWAP [11] (maybe <- 0x830008) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3076: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3077: !SWAP [11] (maybe <- 0x830009) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3078: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3079: !ST [4] (maybe <- 0x83000a) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3080: !CASX [11] (maybe <- 0x83000b) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3081: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3082: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3083: !DWST [14] (maybe <- 0x48400040) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P3084: !DWLD [1] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f1
fmovs %f19, %f2

P3085: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3086: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3087: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3088: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P3089: !DWST [10] (maybe <- 0x83000c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3090: !CAS [0] (maybe <- 0x83000d) (Int)
add %i0, 0, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3091: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3092: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3093: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3094: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3095: !DWST [0] (maybe <- 0x48400080) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P3096: !LD [12] (FP)
ld [%i3 + 0], %f3
! 1 addresses covered

P3097: !DWST [0] (maybe <- 0x83000e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3098: !DWST [7] (maybe <- 0x830010) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3099: !ST [12] (maybe <- 0x830012) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3100: !CASX [15] (maybe <- 0x830013) (Int)
add %i3, 192, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P3101: !DWLD [11] (Int)
ldx [%i2 + 64], %o1
! move %o1(upper) -> %o1(upper)

P3102: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P3103: !DWST [11] (maybe <- 0x830014) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3104: !MEMBAR (Int)
membar #StoreLoad

P3105: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3106: !ST [0] (maybe <- 0x830015) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3107: !DWLD [8] (FP)
! case fp 
ldd  [%i1 + 256], %f4
! 1 addresses covered

P3108: !LD [15] (FP)
ld [%i3 + 192], %f5
! 1 addresses covered

P3109: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3110: !CAS [0] (maybe <- 0x830016) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3111: !CAS [0] (maybe <- 0x830017) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3112: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3113: !SWAP [12] (maybe <- 0x830018) (Int)
mov %l4, %o0
swap  [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3114: !DWST [10] (maybe <- 0x830019) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3115: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3116: !CAS [12] (maybe <- 0x83001a) (Int)
add %i3, 0, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3117: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3118: !DWST [12] (maybe <- 0x83001b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3119: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P3120: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P3121: !CAS [4] (maybe <- 0x83001c) (Int)
add %i0, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3122: !DWLD [6] (FP)
! case fp 
ldd  [%i1 + 80], %f6
! 2 addresses covered

P3123: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3124: !DWST [1] (maybe <- 0x83001d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3125: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3126: !DWLD [14] (Int)
ldx [%i3 + 128], %o0
! move %o0(upper) -> %o0(upper)

P3127: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3128: !ST [1] (maybe <- 0x48400100) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P3129: !CASX [6] (maybe <- 0x83001f) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3130: !ST [13] (maybe <- 0x830021) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3131: !ST [0] (maybe <- 0x48400140) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P3132: !ST [12] (maybe <- 0x830022) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3133: !CAS [1] (maybe <- 0x830023) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3134: !CASX [8] (maybe <- 0x830024) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3135: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3136: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3137: !DWLD [2] (Int)
ldx [%i0 + 8], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3138: !DWST [9] (maybe <- 0x48400180) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P3139: !DWST [9] (maybe <- 0x830025) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3140: !CAS [14] (maybe <- 0x830026) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3141: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P3142: !CASX [15] (maybe <- 0x830027) (Int)
add %i3, 192, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3143: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P3144: !MEMBAR (Int)
membar #StoreLoad

P3145: !ST [14] (maybe <- 0x830028) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3146: !CASX [13] (maybe <- 0x830029) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3147: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P3148: !MEMBAR (Int)
membar #StoreLoad

P3149: !DWST [6] (maybe <- 0x83002a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3150: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3151: !SWAP [10] (maybe <- 0x83002c) (Int)
mov %l4, %o3
swap  [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3152: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3153: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P3154: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3155: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3156: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3157: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3158: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3159: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3160: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3161: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3162: !DWST [1] (maybe <- 0x83002d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3163: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f8
! 1 addresses covered
fmovs %f9, %f8

P3164: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3165: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3166: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3167: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3168: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3169: !SWAP [6] (maybe <- 0x83002f) (Int)
mov %l4, %o0
swap  [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3170: !MEMBAR (Int)
membar #StoreLoad

P3171: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3172: !SWAP [11] (maybe <- 0x830030) (Int)
mov %l4, %o1
swap  [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3173: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3174: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3175: !DWST [12] (maybe <- 0x830031) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3176: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3177: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3178: !LD [14] (Int)
lduw [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3179: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3180: !DWST [12] (maybe <- 0x830032) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3181: !DWLD [10] (FP)
! case fp 
ldd  [%i2 + 32], %f18
! 1 addresses covered
fmovs %f18, %f9

P3182: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3183: !LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3184: !ST [11] (maybe <- 0x830033) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3185: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3186: !DWST [6] (maybe <- 0x830034) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3187: !NOP (Int)
nop

P3188: !DWLD [11] (Int)
ldx [%i2 + 64], %o0
! move %o0(upper) -> %o0(upper)

P3189: !ST [11] (maybe <- 0x830036) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3190: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P3191: !CAS [5] (maybe <- 0x830037) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3192: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3193: !MEMBAR (Int)
membar #StoreLoad

P3194: !DWST [15] (maybe <- 0x830038) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P3195: !ST [4] (maybe <- 0x830039) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3196: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3197: !MEMBAR (Int)
membar #StoreLoad

P3198: !DWST [13] (maybe <- 0x83003a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P3199: !CASX [10] (maybe <- 0x83003b) (Int)
add %i2, 32, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3200: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3201: !ST [1] (maybe <- 0x83003c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3202: !LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3203: !CASX [3] (maybe <- 0x83003d) (Int)
add %i0, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3204: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3205: !SWAP [14] (maybe <- 0x83003e) (Int)
mov %l4, %o3
swap  [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3206: !DWST [10] (maybe <- 0x83003f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3207: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3208: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3209: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3210: !CAS [12] (maybe <- 0x830040) (Int)
add %i3, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3211: !DWST [11] (maybe <- 0x830041) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3212: !MEMBAR (Int)
membar #StoreLoad

P3213: !CAS [15] (maybe <- 0x830042) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3214: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3215: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P3216: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3217: !DWST [10] (maybe <- 0x830043) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3218: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3219: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3220: !ST [4] (maybe <- 0x830044) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3221: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3222: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3223: !CAS [5] (maybe <- 0x830045) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3224: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3225: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3226: !DWST [7] (maybe <- 0x830046) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3227: !DWST [1] (maybe <- 0x830048) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3228: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3229: !DWST [3] (maybe <- 0x83004a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3230: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3231: !CAS [8] (maybe <- 0x83004b) (Int)
add %i1, 256, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P3232: !CASX [1] (maybe <- 0x83004c) (Int)
add %i0, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3233: !ST [8] (maybe <- 0x83004e) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3234: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P3235: !ST [7] (maybe <- 0x484001c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 84 ]

P3236: !DWST [6] (maybe <- 0x83004f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3237: !SWAP [7] (maybe <- 0x830051) (Int)
mov %l4, %l6
swap  [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3238: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f10
! 2 addresses covered

P3239: !ST [13] (maybe <- 0x830052) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3240: !LD [4] (Int)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3241: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3242: !DWLD [4] (Int)
ldx [%i0 + 64], %o4
! move %o4(upper) -> %o4(upper)

P3243: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3244: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3245: !DWST [9] (maybe <- 0x830053) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3246: !ST [3] (maybe <- 0x830054) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3247: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3248: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3249: !ST [7] (maybe <- 0x830055) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3250: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3251: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3252: !DWST [12] (maybe <- 0x830056) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3253: !DWST [0] (maybe <- 0x830057) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3254: !CAS [7] (maybe <- 0x830059) (Int)
add %i1, 84, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3255: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3256: !CAS [4] (maybe <- 0x83005a) (Int)
add %i0, 64, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3257: !DWLD [4] (Int)
ldx [%i0 + 64], %o3
! move %o3(upper) -> %o3(upper)

P3258: !CAS [15] (maybe <- 0x83005b) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3259: !DWST [6] (maybe <- 0x83005c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3260: !MEMBAR (Int)
membar #StoreLoad

P3261: !ST [4] (maybe <- 0x83005e) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3262: !ST [14] (maybe <- 0x83005f) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3263: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3264: !ST [13] (maybe <- 0x830060) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3265: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3266: !CASX [5] (maybe <- 0x830061) (Int)
add %i1, 72, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %l4, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3267: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3268: !LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3269: !CASX [6] (maybe <- 0x830062) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P3270: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3271: !SWAP [4] (maybe <- 0x830064) (Int)
mov %l4, %o0
swap  [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3272: !ST [15] (maybe <- 0x830065) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3273: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3274: !CASX [3] (maybe <- 0x830066) (Int)
add %i0, 32, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3275: !DWLD [4] (Int)
ldx [%i0 + 64], %o3
! move %o3(upper) -> %o3(upper)

P3276: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3277: !DWST [3] (maybe <- 0x830067) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3278: !MEMBAR (Int)
membar #StoreLoad

P3279: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P3280: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3281: !DWST [2] (maybe <- 0x830068) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3282: !MEMBAR (Int)
membar #StoreLoad

P3283: !DWLD [8] (Int)
ldx [%i1 + 256], %o4
! move %o4(upper) -> %o4(upper)

P3284: !SWAP [11] (maybe <- 0x830069) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P3285: !DWST [9] (maybe <- 0x83006a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3286: !DWST [5] (maybe <- 0x83006b) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P3287: !ST [1] (maybe <- 0x83006c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3288: !CAS [4] (maybe <- 0x83006d) (Int)
add %i0, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3289: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P3290: !ST [11] (maybe <- 0x83006e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3291: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3292: !SWAP [12] (maybe <- 0x83006f) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3293: !CAS [0] (maybe <- 0x830070) (Int)
add %i0, 0, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3294: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3295: !LD [14] (Int)
lduw [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3296: !CAS [5] (maybe <- 0x830071) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3297: !MEMBAR (Int)
membar #StoreLoad

P3298: !CAS [6] (maybe <- 0x830072) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3299: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3300: !SWAP [3] (maybe <- 0x830073) (Int)
mov %l4, %o1
swap  [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3301: !ST [0] (maybe <- 0x830074) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3302: !MEMBAR (Int)
membar #StoreLoad

P3303: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3304: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3305: !DWST [3] (maybe <- 0x830075) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3306: !SWAP [11] (maybe <- 0x830076) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3307: !ST [15] (maybe <- 0x830077) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3308: !DWLD [4] (Int)
ldx [%i0 + 64], %o3
! move %o3(upper) -> %o3(upper)

P3309: !CASX [2] (maybe <- 0x830078) (Int)
add %i0, 8, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3310: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3311: !DWST [7] (maybe <- 0x830079) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3312: !DWLD [5] (FP)
! case fp 
ldd  [%i1 + 72], %f12
! 1 addresses covered
fmovs %f13, %f12

P3313: !DWST [14] (maybe <- 0x83007b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P3314: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P3315: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3316: !DWST [10] (maybe <- 0x83007c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3317: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3318: !DWST [15] (maybe <- 0x83007d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P3319: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3320: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3321: !DWST [9] (maybe <- 0x83007e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3322: !DWST [9] (maybe <- 0x83007f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3323: !SWAP [0] (maybe <- 0x830080) (Int)
mov %l4, %o2
swap  [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3324: !ST [15] (maybe <- 0x48400200) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P3325: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P3326: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3327: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3328: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3329: !DWST [7] (maybe <- 0x830081) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3330: !DWST [4] (maybe <- 0x830083) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3331: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3332: !ST [15] (maybe <- 0x830084) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3333: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3334: !DWST [14] (maybe <- 0x830085) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P3335: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P3336: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3337: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3338: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3339: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3340: !DWST [14] (maybe <- 0x830086) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P3341: !SWAP [3] (maybe <- 0x830087) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3342: !MEMBAR (Int)
membar #StoreLoad

P3343: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3344: !CAS [15] (maybe <- 0x830088) (Int)
add %i3, 192, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3345: !DWST [15] (maybe <- 0x830089) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P3346: !ST [5] (maybe <- 0x83008a) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3347: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3348: !DWST [1] (maybe <- 0x83008b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3349: !DWST [15] (maybe <- 0x48400240) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P3350: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3351: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3352: !SWAP [3] (maybe <- 0x83008d) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3353: !ST [3] (maybe <- 0x83008e) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3354: !DWLD [3] (Int)
ldx [%i0 + 32], %o3
! move %o3(upper) -> %o3(upper)

P3355: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3

P3356: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3357: !ST [10] (maybe <- 0x83008f) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3358: !DWLD [9] (FP)
! case fp 
ldd  [%i1 + 512], %f18
! 1 addresses covered
fmovs %f18, %f13

P3359: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3360: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3361: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3362: !SWAP [6] (maybe <- 0x830090) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P3363: !ST [15] (maybe <- 0x830091) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3364: !CASX [1] (maybe <- 0x830092) (Int)
add %i0, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3365: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3366: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3367: !CAS [11] (maybe <- 0x830094) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3368: !SWAP [1] (maybe <- 0x830095) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3369: !DWST [0] (maybe <- 0x48400280) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P3370: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3371: !ST [13] (maybe <- 0x830096) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3372: !ST [5] (maybe <- 0x48400300) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P3373: !CASX [0] (maybe <- 0x830097) (Int)
add %i0, 0, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P3374: !LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3375: !MEMBAR (Int)
membar #StoreLoad

P3376: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3377: !MEMBAR (Int)
membar #StoreLoad

P3378: !DWST [10] (maybe <- 0x830099) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3379: !ST [13] (maybe <- 0x48400340) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P3380: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P3381: !DWST [6] (maybe <- 0x48400380) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P3382: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3383: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P3384: !DWLD [3] (Int)
ldx [%i0 + 32], %o3
! move %o3(upper) -> %o3(upper)

P3385: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P3386: !DWLD [15] (Int)
ldx [%i3 + 192], %o4
! move %o4(upper) -> %o4(upper)

P3387: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3388: !LD [9] (FP)
ld [%i1 + 512], %f14
! 1 addresses covered

P3389: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3390: !DWST [2] (maybe <- 0x83009a) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3391: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3392: !DWST [4] (maybe <- 0x83009b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3393: !ST [5] (maybe <- 0x83009c) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3394: !ST [3] (maybe <- 0x48400400) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P3395: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3396: !DWST [0] (maybe <- 0x83009d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3397: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P3398: !DWST [3] (maybe <- 0x83009f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3399: !ST [8] (maybe <- 0x48400440) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P3400: !NOP (Int)
nop

P3401: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P3402: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3403: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3404: !DWLD [3] (Int)
ldx [%i0 + 32], %o2
! move %o2(upper) -> %o2(upper)

P3405: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P3406: !CASX [4] (maybe <- 0x8300a0) (Int)
add %i0, 64, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3407: !ST [11] (maybe <- 0x8300a1) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3408: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3409: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3410: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3411: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3412: !ST [6] (maybe <- 0x8300a2) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3413: !ST [15] (maybe <- 0x8300a3) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3414: !ST [15] (maybe <- 0x8300a4) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3415: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3416: !DWST [3] (maybe <- 0x8300a5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3417: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3418: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3419: !DWST [12] (maybe <- 0x8300a6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3420: !DWLD [1] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3421: !DWST [10] (maybe <- 0x8300a7) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3422: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3423: !DWST [5] (maybe <- 0x8300a8) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P3424: !LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3425: !ST [15] (maybe <- 0x8300a9) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3426: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3427: !CAS [11] (maybe <- 0x8300aa) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3428: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3429: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3430: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3431: !ST [7] (maybe <- 0x8300ab) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3432: !CASX [11] (maybe <- 0x8300ac) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P3433: !CAS [9] (maybe <- 0x8300ad) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3434: !CASX [8] (maybe <- 0x8300ae) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P3435: !ST [4] (maybe <- 0x8300af) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3436: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3437: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3438: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3439: !CASX [2] (maybe <- 0x8300b0) (Int)
add %i0, 8, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %l4, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3440: !CAS [2] (maybe <- 0x8300b1) (Int)
add %i0, 12, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3441: !DWST [6] (maybe <- 0x8300b2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3442: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3443: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3444: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3445: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3446: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3447: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P3448: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3449: !MEMBAR (Int)
membar #StoreLoad

P3450: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3451: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3452: !CASX [0] (maybe <- 0x8300b4) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P3453: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3454: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3455: !CAS [7] (maybe <- 0x8300b6) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3456: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3457: !CASX [9] (maybe <- 0x8300b7) (Int)
add %i1, 512, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P3458: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P3459: !ST [4] (maybe <- 0x8300b8) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3460: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3461: !LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3462: !ST [5] (maybe <- 0x8300b9) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3463: !ST [12] (maybe <- 0x48400480) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P3464: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3465: !NOP (Int)
nop

P3466: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3467: !CASX [11] (maybe <- 0x8300ba) (Int)
add %i2, 64, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3468: !CASX [14] (maybe <- 0x8300bb) (Int)
add %i3, 128, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3469: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3470: !DWST [13] (maybe <- 0x8300bc) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P3471: !ST [5] (maybe <- 0x8300bd) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3472: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3473: !DWST [13] (maybe <- 0x8300be) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P3474: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3475: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3476: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3477: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P3478: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3479: !LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3480: !ST [2] (maybe <- 0x8300bf) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3481: !ST [15] (maybe <- 0x8300c0) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3482: !CASX [5] (maybe <- 0x8300c1) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3483: !ST [9] (maybe <- 0x8300c2) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3484: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3485: !MEMBAR (Int)
membar #StoreLoad

P3486: !SWAP [4] (maybe <- 0x8300c3) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3487: !CASX [0] (maybe <- 0x8300c4) (Int)
add %i0, 0, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3488: !DWST [1] (maybe <- 0x8300c6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3489: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3490: !MEMBAR (Int)
membar #StoreLoad

P3491: !CAS [12] (maybe <- 0x8300c8) (Int)
add %i3, 0, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3492: !NOP (Int)
nop

P3493: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3494: !ST [14] (maybe <- 0x8300c9) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3495: !DWST [2] (maybe <- 0x8300ca) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3496: !SWAP [13] (maybe <- 0x8300cb) (Int)
mov %l4, %o4
swap  [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3497: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3498: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3499: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3500: !DWST [7] (maybe <- 0x484004c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P3501: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3502: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3503: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3504: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3505: !ST [11] (maybe <- 0x8300cc) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3506: !DWLD [4] (Int)
ldx [%i0 + 64], %o0
! move %o0(upper) -> %o0(upper)

P3507: !ST [13] (maybe <- 0x8300cd) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3508: !MEMBAR (Int)
membar #StoreLoad

P3509: !DWST [0] (maybe <- 0x8300ce) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3510: !MEMBAR (Int)
membar #StoreLoad

P3511: !DWST [3] (maybe <- 0x48400540) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P3512: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P3513: !CASX [10] (maybe <- 0x8300d0) (Int)
add %i2, 32, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3514: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3515: !CAS [11] (maybe <- 0x8300d1) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3516: !CAS [1] (maybe <- 0x8300d2) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3517: !ST [2] (maybe <- 0x8300d3) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3518: !DWST [5] (maybe <- 0x8300d4) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P3519: !DWST [12] (maybe <- 0x8300d5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3520: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3521: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3522: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3523: !ST [5] (maybe <- 0x8300d6) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3524: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3525: !ST [13] (maybe <- 0x8300d7) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3526: !DWST [10] (maybe <- 0x8300d8) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3527: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3528: !DWST [2] (maybe <- 0x8300d9) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3529: !DWST [8] (maybe <- 0x8300da) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P3530: !SWAP [12] (maybe <- 0x8300db) (Int)
mov %l4, %o2
swap  [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3531: !CASX [1] (maybe <- 0x8300dc) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P3532: !DWST [11] (maybe <- 0x8300de) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3533: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3534: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3535: !LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3536: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3537: !CAS [13] (maybe <- 0x8300df) (Int)
add %i3, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3538: !CASX [11] (maybe <- 0x8300e0) (Int)
add %i2, 64, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P3539: !CASX [3] (maybe <- 0x8300e1) (Int)
add %i0, 32, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P3540: !SWAP [8] (maybe <- 0x8300e2) (Int)
mov %l4, %o1
swap  [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3541: !ST [12] (maybe <- 0x8300e3) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3542: !CAS [4] (maybe <- 0x8300e4) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3543: !DWST [5] (maybe <- 0x8300e5) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P3544: !ST [2] (maybe <- 0x8300e6) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3545: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P3546: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3547: !SWAP [11] (maybe <- 0x8300e7) (Int)
mov %l4, %o3
swap  [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3548: !MEMBAR (Int)
membar #StoreLoad

P3549: !ST [10] (maybe <- 0x48400580) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P3550: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3551: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3552: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3553: !ST [14] (maybe <- 0x8300e8) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3554: !DWST [11] (maybe <- 0x8300e9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3555: !MEMBAR (Int)
membar #StoreLoad

P3556: !CASX [14] (maybe <- 0x8300ea) (Int)
add %i3, 128, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P3557: !CASX [4] (maybe <- 0x8300eb) (Int)
add %i0, 64, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3558: !LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3559: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3560: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3561: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3562: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f18
! 1 addresses covered
fmovs %f18, %f15
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3563: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3564: !LD [14] (FP)
ld [%i3 + 128], %f0
! 1 addresses covered

P3565: !LD [13] (FP)
ld [%i3 + 64], %f1
! 1 addresses covered

P3566: !LD [11] (FP)
ld [%i2 + 64], %f2
! 1 addresses covered

P3567: !LD [13] (FP)
ld [%i3 + 64], %f3
! 1 addresses covered

P3568: !LD [4] (FP)
ld [%i0 + 64], %f4
! 1 addresses covered

P3569: !LD [13] (FP)
ld [%i3 + 64], %f5
! 1 addresses covered

P3570: !LD [6] (FP)
ld [%i1 + 80], %f6
! 1 addresses covered

P3571: !LD [2] (FP)
ld [%i0 + 12], %f7
! 1 addresses covered

P3572: !LD [14] (FP)
ld [%i3 + 128], %f8
! 1 addresses covered

P3573: !LD [12] (FP)
ld [%i3 + 0], %f9
! 1 addresses covered

P3574: !LD [3] (FP)
ld [%i0 + 32], %f10
! 1 addresses covered

P3575: !LD [11] (FP)
ld [%i2 + 64], %f11
! 1 addresses covered

P3576: !LD [7] (FP)
ld [%i1 + 84], %f12
! 1 addresses covered

P3577: !LD [5] (FP)
ld [%i1 + 76], %f13
! 1 addresses covered

P3578: !LD [9] (FP)
ld [%i1 + 512], %f14
! 1 addresses covered

P3579: !DWLD [5] (FP)
! case fp 
ldd  [%i1 + 72], %f18
! 1 addresses covered
fmovs %f19, %f15
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
loop_exit_3_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_0
nop

P3580: !LD [13] (FP)
ld [%i3 + 64], %f0
! 1 addresses covered

P3581: !LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3582: !NOP (Int)
nop

P3583: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3584: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3585: !ST [8] (maybe <- 0x8300ec) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3586: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3587: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P3588: !DWLD [3] (Int)
ldx [%i0 + 32], %o2
! move %o2(upper) -> %o2(upper)

P3589: !MEMBAR (Int)
membar #StoreLoad

P3590: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3591: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P3592: !DWLD [11] (FP)
! case fp 
ldd  [%i2 + 64], %f18
! 1 addresses covered
fmovs %f18, %f1

P3593: !LD [11] (Int)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3594: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P3595: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3596: !CAS [13] (maybe <- 0x8300ed) (Int)
add %i3, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3597: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3598: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3599: !ST [15] (maybe <- 0x8300ee) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3600: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3601: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3602: !DWLD [14] (Int)
ldx [%i3 + 128], %o2
! move %o2(upper) -> %o2(upper)

P3603: !ST [7] (maybe <- 0x8300ef) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3604: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P3605: !CAS [13] (maybe <- 0x8300f0) (Int)
add %i3, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3606: !CASX [9] (maybe <- 0x8300f1) (Int)
add %i1, 512, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P3607: !DWLD [2] (Int)
ldx [%i0 + 8], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3608: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3609: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3610: !DWST [6] (maybe <- 0x8300f2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3611: !DWST [6] (maybe <- 0x8300f4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3612: !ST [11] (maybe <- 0x8300f6) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3613: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P3614: !ST [12] (maybe <- 0x8300f7) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3615: !DWST [9] (maybe <- 0x8300f8) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3616: !NOP (Int)
nop

P3617: !CAS [6] (maybe <- 0x8300f9) (Int)
add %i1, 80, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3618: !DWLD [7] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3619: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3620: !MEMBAR (Int)
membar #StoreLoad

P3621: !SWAP [3] (maybe <- 0x8300fa) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3622: !ST [0] (maybe <- 0x8300fb) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3623: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3624: !DWST [2] (maybe <- 0x8300fc) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3625: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3626: !DWST [14] (maybe <- 0x8300fd) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P3627: !CASX [14] (maybe <- 0x8300fe) (Int)
add %i3, 128, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P3628: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3629: !CAS [3] (maybe <- 0x8300ff) (Int)
add %i0, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3630: !CASX [13] (maybe <- 0x830100) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3631: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3632: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P3633: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3634: !MEMBAR (Int)
membar #StoreLoad

P3635: !ST [5] (maybe <- 0x830101) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3636: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3637: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3638: !MEMBAR (Int)
membar #StoreLoad

P3639: !LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3640: !SWAP [14] (maybe <- 0x830102) (Int)
mov %l4, %l6
swap  [%i3 + 128], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3641: !DWLD [8] (Int)
ldx [%i1 + 256], %o4
! move %o4(upper) -> %o4(upper)

P3642: !MEMBAR (Int)
membar #StoreLoad

P3643: !DWLD [10] (FP)
! case fp 
ldd  [%i2 + 32], %f2
! 1 addresses covered

P3644: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3645: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3646: !SWAP [5] (maybe <- 0x830103) (Int)
mov %l4, %o0
swap  [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3647: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3648: !ST [8] (maybe <- 0x830104) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3649: !CAS [0] (maybe <- 0x830105) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3650: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3651: !MEMBAR (Int)
membar #StoreLoad

P3652: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P3653: !DWLD [3] (FP)
! case fp 
ldd  [%i0 + 32], %f18
! 1 addresses covered
fmovs %f18, %f3

P3654: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3655: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3656: !CAS [6] (maybe <- 0x830106) (Int)
add %i1, 80, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3657: !LD [4] (FP)
ld [%i0 + 64], %f4
! 1 addresses covered

P3658: !ST [4] (maybe <- 0x830107) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3659: !DWST [12] (maybe <- 0x830108) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3660: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3661: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3662: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3663: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3664: !ST [1] (maybe <- 0x830109) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3665: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3666: !DWLD [8] (Int)
ldx [%i1 + 256], %o4
! move %o4(upper) -> %o4(upper)

P3667: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f5
fmovs %f19, %f6

P3668: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3669: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3670: !ST [10] (maybe <- 0x83010a) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3671: !DWST [0] (maybe <- 0x83010b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3672: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3673: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3674: !SWAP [14] (maybe <- 0x83010d) (Int)
mov %l4, %l6
swap  [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3675: !CASX [12] (maybe <- 0x83010e) (Int)
add %i3, 0, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3676: !DWST [11] (maybe <- 0x83010f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3677: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3678: !DWST [5] (maybe <- 0x830110) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P3679: !CASX [12] (maybe <- 0x830111) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3680: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3681: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3682: !ST [0] (maybe <- 0x830112) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3683: !CAS [1] (maybe <- 0x830113) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3684: !CAS [9] (maybe <- 0x830114) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3685: !ST [13] (maybe <- 0x830115) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3686: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3687: !DWLD [10] (Int)
ldx [%i2 + 32], %o4
! move %o4(upper) -> %o4(upper)

P3688: !CAS [10] (maybe <- 0x830116) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3689: !NOP (Int)
nop

P3690: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3691: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3692: !ST [7] (maybe <- 0x484005c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 84 ]

P3693: !ST [2] (maybe <- 0x830117) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3694: !ST [9] (maybe <- 0x830118) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3695: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3696: !MEMBAR (Int)
membar #StoreLoad

P3697: !CAS [10] (maybe <- 0x830119) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3698: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3699: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3700: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3701: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3702: !CASX [15] (maybe <- 0x83011a) (Int)
add %i3, 192, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3703: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3704: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3705: !DWST [4] (maybe <- 0x83011b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3706: !MEMBAR (Int)
membar #StoreLoad

P3707: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3708: !ST [2] (maybe <- 0x83011c) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3709: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3710: !SWAP [2] (maybe <- 0x83011d) (Int)
mov %l4, %l6
swap  [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3711: !CAS [4] (maybe <- 0x83011e) (Int)
add %i0, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3712: !DWST [1] (maybe <- 0x83011f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3713: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3714: !DWLD [13] (Int)
ldx [%i3 + 64], %o2
! move %o2(upper) -> %o2(upper)

P3715: !CAS [7] (maybe <- 0x830121) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3716: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3717: !CASX [10] (maybe <- 0x830122) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3718: !ST [13] (maybe <- 0x830123) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3719: !CASX [5] (maybe <- 0x830124) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3720: !MEMBAR (Int)
membar #StoreLoad

P3721: !SWAP [10] (maybe <- 0x830125) (Int)
mov %l4, %l6
swap  [%i2 + 32], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3722: !DWST [5] (maybe <- 0x830126) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P3723: !CAS [12] (maybe <- 0x830127) (Int)
add %i3, 0, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3724: !ST [3] (maybe <- 0x830128) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3725: !ST [0] (maybe <- 0x830129) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3726: !ST [10] (maybe <- 0x83012a) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3727: !ST [15] (maybe <- 0x48400600) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P3728: !DWLD [13] (FP)
! case fp 
ldd  [%i3 + 64], %f18
! 1 addresses covered
fmovs %f18, %f7

P3729: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3730: !MEMBAR (Int)
membar #StoreLoad

P3731: !DWLD [8] (Int)
ldx [%i1 + 256], %o4
! move %o4(upper) -> %o4(upper)

P3732: !ST [2] (maybe <- 0x83012b) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3733: !DWST [2] (maybe <- 0x83012c) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3734: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3735: !DWST [6] (maybe <- 0x48400640) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P3736: !ST [2] (maybe <- 0x83012d) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3737: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3738: !ST [14] (maybe <- 0x83012e) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3739: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P3740: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P3741: !DWLD [8] (Int)
ldx [%i1 + 256], %o1
! move %o1(upper) -> %o1(upper)

P3742: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P3743: !CASX [3] (maybe <- 0x83012f) (Int)
add %i0, 32, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P3744: !MEMBAR (Int)
membar #StoreLoad

P3745: !CAS [1] (maybe <- 0x830130) (Int)
add %i0, 4, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P3746: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3747: !DWST [6] (maybe <- 0x830131) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3748: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3749: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3750: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P3751: !DWST [5] (maybe <- 0x830133) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P3752: !SWAP [5] (maybe <- 0x830134) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3753: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3754: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P3755: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3756: !LD [15] (FP)
ld [%i3 + 192], %f8
! 1 addresses covered

P3757: !LD [4] (FP)
ld [%i0 + 64], %f9
! 1 addresses covered

P3758: !CASX [12] (maybe <- 0x830135) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P3759: !DWST [11] (maybe <- 0x830136) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3760: !ST [0] (maybe <- 0x830137) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3761: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3762: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3763: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P3764: !ST [4] (maybe <- 0x830138) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3765: !DWLD [1] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3766: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3767: !DWLD [9] (Int)
ldx [%i1 + 512], %o0
! move %o0(upper) -> %o0(upper)

P3768: !SWAP [10] (maybe <- 0x830139) (Int)
mov %l4, %l6
swap  [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P3769: !LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3770: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P3771: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3772: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3773: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3774: !DWST [11] (maybe <- 0x83013a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3775: !DWLD [14] (Int)
ldx [%i3 + 128], %o2
! move %o2(upper) -> %o2(upper)

P3776: !DWST [2] (maybe <- 0x83013b) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3777: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P3778: !DWST [2] (maybe <- 0x83013c) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3779: !ST [9] (maybe <- 0x83013d) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3780: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3781: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3782: !MEMBAR (Int)
membar #StoreLoad

P3783: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3784: !ST [0] (maybe <- 0x83013e) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3785: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3786: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3787: !CAS [2] (maybe <- 0x83013f) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3788: !MEMBAR (Int)
membar #StoreLoad

P3789: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3790: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3791: !CAS [15] (maybe <- 0x830140) (Int)
add %i3, 192, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3792: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3793: !DWLD [11] (Int)
ldx [%i2 + 64], %o2
! move %o2(upper) -> %o2(upper)

P3794: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P3795: !DWST [10] (maybe <- 0x830141) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3796: !DWST [3] (maybe <- 0x484006c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P3797: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3798: !DWLD [5] (Int)
ldx [%i1 + 72], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3799: !ST [3] (maybe <- 0x830142) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3800: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3801: !DWST [8] (maybe <- 0x830143) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P3802: !CAS [8] (maybe <- 0x830144) (Int)
add %i1, 256, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P3803: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3804: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3805: !LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3806: !DWST [11] (maybe <- 0x830145) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3807: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3808: !DWST [3] (maybe <- 0x830146) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3809: !ST [5] (maybe <- 0x830147) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3810: !DWST [3] (maybe <- 0x830148) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3811: !MEMBAR (Int)
membar #StoreLoad

P3812: !DWLD [2] (Int)
ldx [%i0 + 8], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3813: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3814: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3815: !ST [11] (maybe <- 0x830149) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3816: !CASX [12] (maybe <- 0x83014a) (Int)
add %i3, 0, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P3817: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3818: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3819: !ST [3] (maybe <- 0x83014b) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3820: !SWAP [12] (maybe <- 0x83014c) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P3821: !DWLD [15] (FP)
! case fp 
ldd  [%i3 + 192], %f10
! 1 addresses covered

P3822: !SWAP [13] (maybe <- 0x83014d) (Int)
mov %l4, %o0
swap  [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3823: !ST [4] (maybe <- 0x83014e) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3824: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3825: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3826: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3827: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P3828: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3829: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3830: !LD [9] (FP)
ld [%i1 + 512], %f11
! 1 addresses covered

P3831: !MEMBAR (Int)
membar #StoreLoad

P3832: !ST [4] (maybe <- 0x83014f) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3833: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P3834: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3835: !DWLD [0] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3836: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3837: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P3838: !DWST [1] (maybe <- 0x830150) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3839: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3840: !NOP (Int)
nop

P3841: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3842: !DWLD [0] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P3843: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3844: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P3845: !ST [1] (maybe <- 0x830152) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3846: !CASX [14] (maybe <- 0x830153) (Int)
add %i3, 128, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P3847: !MEMBAR (Int)
membar #StoreLoad

P3848: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3849: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3850: !LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3851: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3852: !CASX [13] (maybe <- 0x830154) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3853: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3854: !DWST [1] (maybe <- 0x830155) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3855: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3856: !ST [9] (maybe <- 0x830157) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3857: !CASX [2] (maybe <- 0x830158) (Int)
add %i0, 8, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %l4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3858: !CASX [5] (maybe <- 0x830159) (Int)
add %i1, 72, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %l4, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3859: !ST [9] (maybe <- 0x83015a) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3860: !CAS [0] (maybe <- 0x83015b) (Int)
add %i0, 0, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3861: !MEMBAR (Int)
membar #StoreLoad

P3862: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3863: !ST [10] (maybe <- 0x83015c) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3864: !NOP (Int)
nop

P3865: !SWAP [4] (maybe <- 0x83015d) (Int)
mov %l4, %o3
swap  [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3866: !ST [13] (maybe <- 0x83015e) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3867: !DWLD [10] (FP)
! case fp 
ldd  [%i2 + 32], %f12
! 1 addresses covered

P3868: !CAS [5] (maybe <- 0x83015f) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3869: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3870: !DWST [12] (maybe <- 0x830160) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3871: !MEMBAR (Int)
membar #StoreLoad

P3872: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3873: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3874: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3875: !DWST [3] (maybe <- 0x830161) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3876: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3877: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3878: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3879: !DWST [15] (maybe <- 0x830162) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P3880: !CASX [3] (maybe <- 0x830163) (Int)
add %i0, 32, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3881: !SWAP [7] (maybe <- 0x830164) (Int)
mov %l4, %o3
swap  [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3882: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3883: !ST [10] (maybe <- 0x830165) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3884: !ST [4] (maybe <- 0x830166) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3885: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3886: !ST [5] (maybe <- 0x830167) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3887: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3888: !DWST [11] (maybe <- 0x830168) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3889: !ST [1] (maybe <- 0x830169) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3890: !ST [7] (maybe <- 0x83016a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3891: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3892: !DWST [3] (maybe <- 0x83016b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3893: !MEMBAR (Int)
membar #StoreLoad

P3894: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3895: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f13
fmovs %f19, %f14

P3896: !ST [11] (maybe <- 0x83016c) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3897: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3898: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3899: !ST [3] (maybe <- 0x83016d) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3900: !ST [11] (maybe <- 0x83016e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3901: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3902: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f15
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3903: !DWST [9] (maybe <- 0x83016f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3904: !CASX [13] (maybe <- 0x830170) (Int)
add %i3, 64, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3905: !DWLD [15] (Int)
ldx [%i3 + 192], %o3
! move %o3(upper) -> %o3(upper)

P3906: !ST [4] (maybe <- 0x830171) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3907: !SWAP [8] (maybe <- 0x830172) (Int)
mov %l4, %l6
swap  [%i1 + 256], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3908: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3909: !CASX [14] (maybe <- 0x830173) (Int)
add %i3, 128, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P3910: !SWAP [2] (maybe <- 0x830174) (Int)
mov %l4, %l6
swap  [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3911: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3912: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3913: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P3914: !LD [15] (FP)
ld [%i3 + 192], %f0
! 1 addresses covered

P3915: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3916: !ST [11] (maybe <- 0x830175) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3917: !ST [4] (maybe <- 0x830176) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3918: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P3919: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P3920: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P3921: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3922: !DWST [12] (maybe <- 0x830177) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3923: !ST [3] (maybe <- 0x830178) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3924: !DWST [2] (maybe <- 0x830179) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3925: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3926: !ST [10] (maybe <- 0x83017a) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3927: !ST [8] (maybe <- 0x83017b) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3928: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3929: !DWST [15] (maybe <- 0x83017c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P3930: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3931: !LD [2] (FP)
ld [%i0 + 12], %f1
! 1 addresses covered

P3932: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3933: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3934: !DWST [15] (maybe <- 0x83017d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P3935: !DWST [6] (maybe <- 0x83017e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3936: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3937: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3938: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3939: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3940: !LD [14] (Int)
lduw [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3941: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3942: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3943: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3944: !CASX [14] (maybe <- 0x830180) (Int)
add %i3, 128, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P3945: !ST [5] (maybe <- 0x830181) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3946: !SWAP [8] (maybe <- 0x830182) (Int)
mov %l4, %l6
swap  [%i1 + 256], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P3947: !DWLD [4] (Int)
ldx [%i0 + 64], %o0
! move %o0(upper) -> %o0(upper)

P3948: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3949: !DWST [0] (maybe <- 0x830183) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3950: !ST [12] (maybe <- 0x830185) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3951: !MEMBAR (Int)
membar #StoreLoad

P3952: !DWST [12] (maybe <- 0x830186) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3953: !DWST [9] (maybe <- 0x830187) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3954: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3955: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3956: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3957: !NOP (Int)
nop

P3958: !ST [14] (maybe <- 0x830188) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3959: !DWST [12] (maybe <- 0x830189) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3960: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3961: !ST [10] (maybe <- 0x83018a) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3962: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3963: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3964: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P3965: !MEMBAR (Int)
membar #StoreLoad

P3966: !LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3967: !MEMBAR (Int)
membar #StoreLoad

P3968: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3969: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3970: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3971: !DWST [4] (maybe <- 0x83018b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3972: !DWST [1] (maybe <- 0x48400700) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P3973: !LD [7] (FP)
ld [%i1 + 84], %f2
! 1 addresses covered

P3974: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3975: !CASX [11] (maybe <- 0x83018c) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P3976: !CASX [6] (maybe <- 0x83018d) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P3977: !DWST [6] (maybe <- 0x83018f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3978: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3979: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3980: !CASX [10] (maybe <- 0x830191) (Int)
add %i2, 32, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P3981: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3982: !CASX [2] (maybe <- 0x830192) (Int)
add %i0, 8, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P3983: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P3984: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3985: !CAS [10] (maybe <- 0x830193) (Int)
add %i2, 32, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3986: !CAS [3] (maybe <- 0x830194) (Int)
add %i0, 32, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3987: !ST [10] (maybe <- 0x830195) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3988: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P3989: !DWST [3] (maybe <- 0x830196) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3990: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3991: !DWST [4] (maybe <- 0x830197) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3992: !DWST [14] (maybe <- 0x830198) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P3993: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3994: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P3995: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3996: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3997: !CAS [11] (maybe <- 0x830199) (Int)
add %i2, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3998: !NOP (Int)
nop

P3999: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f3
fmovs %f19, %f4

P4000: !NOP (Int)
nop

P4001: !ST [4] (maybe <- 0x83019a) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4002: !CAS [8] (maybe <- 0x83019b) (Int)
add %i1, 256, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4003: !ST [2] (maybe <- 0x83019c) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4004: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4005: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P4006: !ST [11] (maybe <- 0x83019d) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4007: !CASX [11] (maybe <- 0x83019e) (Int)
add %i2, 64, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4008: !DWST [4] (maybe <- 0x83019f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4009: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4010: !ST [8] (maybe <- 0x8301a0) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4011: !MEMBAR (Int)
membar #StoreLoad

P4012: !CAS [10] (maybe <- 0x8301a1) (Int)
add %i2, 32, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4013: !LD [1] (FP)
ld [%i0 + 4], %f5
! 1 addresses covered

P4014: !ST [12] (maybe <- 0x8301a2) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4015: !CASX [4] (maybe <- 0x8301a3) (Int)
add %i0, 64, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P4016: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4017: !LD [10] (Int)
lduw [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4018: !CAS [13] (maybe <- 0x8301a4) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4019: !ST [14] (maybe <- 0x8301a5) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4020: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P4021: !LD [1] (FP)
ld [%i0 + 4], %f6
! 1 addresses covered

P4022: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4023: !DWST [2] (maybe <- 0x8301a6) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P4024: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4025: !ST [9] (maybe <- 0x8301a7) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4026: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4027: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4028: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4029: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4030: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4031: !CASX [3] (maybe <- 0x8301a8) (Int)
add %i0, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4032: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4033: !ST [1] (maybe <- 0x8301a9) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4034: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f7
fmovs %f19, %f8

P4035: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4036: !SWAP [0] (maybe <- 0x8301aa) (Int)
mov %l4, %l6
swap  [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4037: !MEMBAR (Int)
membar #StoreLoad

P4038: !MEMBAR (Int)
membar #StoreLoad

P4039: !CASX [4] (maybe <- 0x8301ab) (Int)
add %i0, 64, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4040: !CAS [7] (maybe <- 0x8301ac) (Int)
add %i1, 84, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4041: !LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4042: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4043: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4044: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4045: !DWST [2] (maybe <- 0x8301ad) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P4046: !CASX [15] (maybe <- 0x8301ae) (Int)
add %i3, 192, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P4047: !CAS [5] (maybe <- 0x8301af) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4048: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4049: !CAS [5] (maybe <- 0x8301b0) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4050: !CAS [9] (maybe <- 0x8301b1) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4051: !DWST [4] (maybe <- 0x8301b2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4052: !ST [15] (maybe <- 0x8301b3) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4053: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4054: !MEMBAR (Int)
membar #StoreLoad

P4055: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4056: !MEMBAR (Int)
membar #StoreLoad

P4057: !ST [0] (maybe <- 0x8301b4) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4058: !CAS [9] (maybe <- 0x8301b5) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4059: !ST [1] (maybe <- 0x8301b6) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4060: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4061: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4062: !ST [13] (maybe <- 0x8301b7) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4063: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4064: !CAS [6] (maybe <- 0x8301b8) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4065: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4066: !MEMBAR (Int)
membar #StoreLoad

P4067: !CASX [0] (maybe <- 0x8301b9) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4068: !MEMBAR (Int)
membar #StoreLoad

P4069: !LD [0] (FP)
ld [%i0 + 0], %f9
! 1 addresses covered

P4070: !LD [1] (FP)
ld [%i0 + 4], %f10
! 1 addresses covered

P4071: !LD [2] (FP)
ld [%i0 + 12], %f11
! 1 addresses covered

P4072: !LD [3] (FP)
ld [%i0 + 32], %f12
! 1 addresses covered

P4073: !LD [4] (FP)
ld [%i0 + 64], %f13
! 1 addresses covered

P4074: !LD [5] (FP)
ld [%i1 + 76], %f14
! 1 addresses covered

P4075: !LD [6] (FP)
ld [%i1 + 80], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P4076: !LD [7] (FP)
ld [%i1 + 84], %f0
! 1 addresses covered

P4077: !LD [8] (FP)
ld [%i1 + 256], %f1
! 1 addresses covered

P4078: !LD [9] (FP)
ld [%i1 + 512], %f2
! 1 addresses covered

P4079: !LD [10] (FP)
ld [%i2 + 32], %f3
! 1 addresses covered

P4080: !LD [11] (FP)
ld [%i2 + 64], %f4
! 1 addresses covered

P4081: !LD [12] (FP)
ld [%i3 + 0], %f5
! 1 addresses covered

P4082: !LD [13] (FP)
ld [%i3 + 64], %f6
! 1 addresses covered

P4083: !LD [14] (FP)
ld [%i3 + 128], %f7
! 1 addresses covered

P4084: !LD [15] (FP)
ld [%i3 + 192], %f8
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30

restore
retl
nop
!-----------------



func4:

! 1000 instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
srlx %i0, 6, %i0
sllx %i0, 6, %i0

add %i1, 63, %i1
srlx %i1, 6, %i1
sllx %i1, 6, %i1

add %i2, 63, %i2
srlx %i2, 6, %i2
sllx %i2, 6, %i2

add %i3, 63, %i3
srlx %i3, 6, %i3
sllx %i3, 6, %i3

add %i4, 63, %i4
srlx %i4, 6, %i4
sllx %i4, 6, %i4

add %i5, 63, %i5
srlx %i5, 6, %i5
sllx %i5, 6, %i5

mov   %i4, %l1
add   %i5, 1280, %l5

! Initialize %o7, the pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
addx  %o7, %l1, %o7 

! Initializing %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%l5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%l5+4]
ldd [%l5], %f0
ldd [%l5], %f2
ldd [%l5], %f4
ldd [%l5], %f6
ldd [%l5], %f8
ldd [%l5], %f10
ldd [%l5], %f12
ldd [%l5], %f14
ldd [%l5], %f16
ldd [%l5], %f18
ldd [%l5], %f20
ldd [%l5], %f22
ldd [%l5], %f24
ldd [%l5], %f26
ldd [%l5], %f28
ldd [%l5], %f30
ldd [%l5], %f32
ldd [%l5], %f34
ldd [%l5], %f36
ldd [%l5], %f38
ldd [%l5], %f40
ldd [%l5], %f42
ldd [%l5], %f44
ldd [%l5], %f46
ldd [%l5], %f48
ldd [%l5], %f50
ldd [%l5], %f52
ldd [%l5], %f54
ldd [%l5], %f56
ldd [%l5], %f58
ldd [%l5], %f60
ldd [%l5], %f62

! Initializing int results buffer registers: %o0 %o1 %o2 %o3 %o4 
mov %g0, %o0
mov %g0, %o1
mov %g0, %o2
mov %g0, %o3
mov %g0, %o4

! Signature for extract_loads
sethi %hi(0x04deade1), %l7
or    %l7, %lo(0x04deade1), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize integer counter 
sethi %hi(0x840001), %l4
or    %l4, %lo(0x840001), %l4

! Initialize FP counter 
sethi %hi(0x487fff40), %l7
or    %l7, %lo(0x487fff40), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize FP counter increment value 
sethi %hi(0x3f800000), %l7
or    %l7, %lo(0x3f800000), %l7
stw %l7, [%l5] 
ld [%l5], %f17 

P4085: !CASX [2] (maybe <- 0x840001) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_4_0:
add %i0, 8, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %l4, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4086: !DWLD [4] (Int)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

P4087: !DWST [11] (maybe <- 0x840002) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P4088: !DWST [1] (maybe <- 0x840003) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4089: !LD [11] (FP)
ld [%i2 + 64], %f0
! 1 addresses covered

P4090: !NOP (Int)
nop

P4091: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4092: !CASX [8] (maybe <- 0x840005) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P4093: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4094: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4095: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4096: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4097: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4098: !MEMBAR (Int)
membar #StoreLoad

P4099: !ST [5] (maybe <- 0x840006) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4100: !DWST [2] (maybe <- 0x840007) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P4101: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4102: !ST [4] (maybe <- 0x840008) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4103: !CAS [13] (maybe <- 0x840009) (Int)
add %i3, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4104: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P4105: !SWAP [15] (maybe <- 0x84000a) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4106: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4107: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P4108: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4109: !ST [1] (maybe <- 0x487fff40) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P4110: !MEMBAR (Int)
membar #StoreLoad

P4111: !ST [15] (maybe <- 0x84000b) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4112: !CAS [5] (maybe <- 0x84000c) (Int)
add %i1, 76, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4113: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4114: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4115: !MEMBAR (Int)
membar #StoreLoad

P4116: !MEMBAR (Int)
membar #StoreLoad

P4117: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4118: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4119: !DWST [14] (maybe <- 0x84000d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P4120: !ST [0] (maybe <- 0x84000e) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4121: !CAS [12] (maybe <- 0x84000f) (Int)
add %i3, 0, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4122: !DWLD [6] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4123: !MEMBAR (Int)
membar #StoreLoad

P4124: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4125: !SWAP [15] (maybe <- 0x840010) (Int)
mov %l4, %o2
swap  [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4126: !DWST [3] (maybe <- 0x840011) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P4127: !DWST [9] (maybe <- 0x840012) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4128: !DWST [12] (maybe <- 0x840013) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P4129: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4130: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4131: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P4132: !MEMBAR (Int)
membar #StoreLoad

P4133: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4134: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P4135: !DWST [4] (maybe <- 0x840014) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4136: !SWAP [14] (maybe <- 0x840015) (Int)
mov %l4, %l6
swap  [%i3 + 128], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4137: !NOP (Int)
nop

P4138: !CASX [1] (maybe <- 0x840016) (Int)
add %i0, 0, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4139: !CAS [12] (maybe <- 0x840018) (Int)
add %i3, 0, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4140: !SWAP [1] (maybe <- 0x840019) (Int)
mov %l4, %o2
swap  [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4141: !MEMBAR (Int)
membar #StoreLoad

P4142: !NOP (Int)
nop

P4143: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4144: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4145: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4146: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4147: !SWAP [11] (maybe <- 0x84001a) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4148: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4149: !CAS [10] (maybe <- 0x84001b) (Int)
add %i2, 32, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4150: !DWST [7] (maybe <- 0x84001c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4151: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4152: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4153: !CAS [10] (maybe <- 0x84001e) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4154: !SWAP [1] (maybe <- 0x84001f) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4155: !MEMBAR (Int)
membar #StoreLoad

P4156: !LD [14] (Int)
lduw [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4157: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4158: !DWST [9] (maybe <- 0x840020) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4159: !MEMBAR (Int)
membar #StoreLoad

P4160: !LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4161: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4162: !DWST [14] (maybe <- 0x487fff80) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P4163: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4164: !CASX [15] (maybe <- 0x840021) (Int)
add %i3, 192, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4165: !CAS [4] (maybe <- 0x840022) (Int)
add %i0, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4166: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4167: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P4168: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4169: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4170: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4171: !LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4172: !DWST [12] (maybe <- 0x840023) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P4173: !CASX [4] (maybe <- 0x840024) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P4174: !ST [3] (maybe <- 0x840025) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4175: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P4176: !DWLD [13] (Int)
ldx [%i3 + 64], %o3
! move %o3(upper) -> %o3(upper)

P4177: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4178: !CAS [1] (maybe <- 0x840026) (Int)
add %i0, 4, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4179: !DWLD [7] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4180: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P4181: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4182: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P4183: !DWST [7] (maybe <- 0x840027) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4184: !SWAP [10] (maybe <- 0x840029) (Int)
mov %l4, %o2
swap  [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4185: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4186: !ST [6] (maybe <- 0x84002a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4187: !DWST [4] (maybe <- 0x84002b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4188: !DWST [10] (maybe <- 0x84002c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P4189: !ST [1] (maybe <- 0x84002d) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4190: !CAS [10] (maybe <- 0x84002e) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4191: !ST [8] (maybe <- 0x84002f) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4192: !DWST [13] (maybe <- 0x840030) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P4193: !CASX [11] (maybe <- 0x840031) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4194: !DWST [13] (maybe <- 0x487fffc0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P4195: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4196: !DWLD [15] (Int)
ldx [%i3 + 192], %o1
! move %o1(upper) -> %o1(upper)

P4197: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4198: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4199: !CASX [1] (maybe <- 0x840032) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4200: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4201: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4202: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4203: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4204: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4205: !MEMBAR (Int)
membar #StoreLoad

P4206: !DWLD [13] (Int)
ldx [%i3 + 64], %o4
! move %o4(upper) -> %o4(upper)

P4207: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4208: !ST [10] (maybe <- 0x840034) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4209: !ST [7] (maybe <- 0x840035) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4210: !ST [8] (maybe <- 0x48800000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P4211: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4212: !MEMBAR (Int)
membar #StoreLoad

P4213: !MEMBAR (Int)
membar #StoreLoad

P4214: !NOP (Int)
nop

P4215: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4216: !DWST [1] (maybe <- 0x840036) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4217: !DWST [6] (maybe <- 0x840038) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4218: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4219: !ST [8] (maybe <- 0x84003a) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4220: !ST [5] (maybe <- 0x84003b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4221: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4222: !NOP (Int)
nop

P4223: !ST [6] (maybe <- 0x84003c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4224: !MEMBAR (Int)
membar #StoreLoad

P4225: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4226: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4227: !CASX [3] (maybe <- 0x84003d) (Int)
add %i0, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P4228: !MEMBAR (Int)
membar #StoreLoad

P4229: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P4230: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4231: !CAS [14] (maybe <- 0x84003e) (Int)
add %i3, 128, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4232: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4233: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4234: !DWLD [7] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4235: !SWAP [3] (maybe <- 0x84003f) (Int)
mov %l4, %o0
swap  [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4236: !CAS [9] (maybe <- 0x840040) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4237: !CASX [1] (maybe <- 0x840041) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4238: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4239: !DWLD [3] (Int)
ldx [%i0 + 32], %o4
! move %o4(upper) -> %o4(upper)

P4240: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4241: !NOP (Int)
nop

P4242: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4243: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4244: !DWLD [14] (Int)
ldx [%i3 + 128], %o0
! move %o0(upper) -> %o0(upper)

P4245: !DWLD [8] (FP)
! case fp 
ldd  [%i1 + 256], %f18
! 1 addresses covered
fmovs %f18, %f1

P4246: !CAS [7] (maybe <- 0x840043) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4247: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P4248: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P4249: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P4250: !LD [4] (FP)
ld [%i0 + 64], %f2
! 1 addresses covered

P4251: !DWST [15] (maybe <- 0x840044) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P4252: !CASX [1] (maybe <- 0x840045) (Int)
add %i0, 0, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4253: !ST [12] (maybe <- 0x840047) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4254: !DWLD [6] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4255: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4256: !DWST [6] (maybe <- 0x840048) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4257: !MEMBAR (Int)
membar #StoreLoad

P4258: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4259: !ST [1] (maybe <- 0x84004a) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4260: !CAS [0] (maybe <- 0x84004b) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4261: !CASX [12] (maybe <- 0x84004c) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P4262: !ST [4] (maybe <- 0x84004d) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4263: !CASX [12] (maybe <- 0x84004e) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P4264: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4265: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P4266: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4267: !ST [7] (maybe <- 0x84004f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4268: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P4269: !CASX [0] (maybe <- 0x840050) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P4270: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4271: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4272: !ST [13] (maybe <- 0x840052) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4273: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4274: !ST [14] (maybe <- 0x840053) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4275: !DWST [5] (maybe <- 0x840054) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P4276: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4277: !DWLD [11] (Int)
ldx [%i2 + 64], %o0
! move %o0(upper) -> %o0(upper)

P4278: !ST [5] (maybe <- 0x840055) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4279: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P4280: !DWST [13] (maybe <- 0x840056) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P4281: !DWST [8] (maybe <- 0x840057) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P4282: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4283: !SWAP [11] (maybe <- 0x840058) (Int)
mov %l4, %o1
swap  [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4284: !ST [3] (maybe <- 0x840059) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4285: !SWAP [14] (maybe <- 0x84005a) (Int)
mov %l4, %l6
swap  [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4286: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P4287: !DWST [1] (maybe <- 0x84005b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4288: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P4289: !DWST [14] (maybe <- 0x84005d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P4290: !DWST [0] (maybe <- 0x84005e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4291: !CASX [7] (maybe <- 0x840060) (Int)
add %i1, 80, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4292: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4293: !DWST [8] (maybe <- 0x840062) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P4294: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P4295: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4296: !CAS [12] (maybe <- 0x840063) (Int)
add %i3, 0, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4297: !CAS [6] (maybe <- 0x840064) (Int)
add %i1, 80, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4298: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f3

P4299: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4300: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4301: !CAS [9] (maybe <- 0x840065) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4302: !MEMBAR (Int)
membar #StoreLoad

P4303: !CAS [12] (maybe <- 0x840066) (Int)
add %i3, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4304: !DWST [3] (maybe <- 0x840067) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P4305: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4306: !ST [12] (maybe <- 0x840068) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4307: !DWST [10] (maybe <- 0x840069) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P4308: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4309: !DWLD [15] (FP)
! case fp 
ldd  [%i3 + 192], %f4
! 1 addresses covered

P4310: !ST [12] (maybe <- 0x84006a) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4311: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4312: !DWST [10] (maybe <- 0x84006b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P4313: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4314: !ST [6] (maybe <- 0x84006c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4315: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4316: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4317: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4318: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4319: !MEMBAR (Int)
membar #StoreLoad

P4320: !CAS [7] (maybe <- 0x84006d) (Int)
add %i1, 84, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4321: !CASX [10] (maybe <- 0x84006e) (Int)
add %i2, 32, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P4322: !CASX [8] (maybe <- 0x84006f) (Int)
add %i1, 256, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4323: !ST [2] (maybe <- 0x840070) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4324: !DWST [15] (maybe <- 0x840071) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P4325: !DWST [9] (maybe <- 0x48800020) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P4326: !LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4327: !ST [7] (maybe <- 0x840072) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4328: !CASX [14] (maybe <- 0x840073) (Int)
add %i3, 128, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4329: !MEMBAR (Int)
membar #StoreLoad

P4330: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4331: !MEMBAR (Int)
membar #StoreLoad

P4332: !DWST [13] (maybe <- 0x840074) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P4333: !DWLD [0] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4334: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4335: !SWAP [15] (maybe <- 0x840075) (Int)
mov %l4, %o0
swap  [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4336: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P4337: !MEMBAR (Int)
membar #StoreLoad

P4338: !ST [5] (maybe <- 0x48800040) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P4339: !DWLD [5] (FP)
! case fp 
ldd  [%i1 + 72], %f18
! 1 addresses covered
fmovs %f19, %f5

P4340: !LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4341: !ST [12] (maybe <- 0x840076) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4342: !DWST [15] (maybe <- 0x840077) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P4343: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4344: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P4345: !CAS [5] (maybe <- 0x840078) (Int)
add %i1, 76, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4346: !CASX [12] (maybe <- 0x840079) (Int)
add %i3, 0, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4347: !CASX [5] (maybe <- 0x84007a) (Int)
add %i1, 72, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %l4, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4348: !DWST [3] (maybe <- 0x84007b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P4349: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4350: !LD [14] (FP)
ld [%i3 + 128], %f6
! 1 addresses covered

P4351: !DWLD [13] (Int)
ldx [%i3 + 64], %o2
! move %o2(upper) -> %o2(upper)

P4352: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4353: !SWAP [3] (maybe <- 0x84007c) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4354: !DWLD [4] (Int)
ldx [%i0 + 64], %o4
! move %o4(upper) -> %o4(upper)

P4355: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4356: !DWST [6] (maybe <- 0x84007d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4357: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4358: !CAS [15] (maybe <- 0x84007f) (Int)
add %i3, 192, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4359: !DWST [8] (maybe <- 0x840080) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P4360: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P4361: !LD [9] (FP)
ld [%i1 + 512], %f7
! 1 addresses covered

P4362: !SWAP [5] (maybe <- 0x840081) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4363: !ST [11] (maybe <- 0x840082) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4364: !DWST [8] (maybe <- 0x840083) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P4365: !DWLD [7] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4366: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4367: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4368: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4369: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4370: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4371: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4372: !LD [14] (FP)
ld [%i3 + 128], %f8
! 1 addresses covered

P4373: !DWST [9] (maybe <- 0x840084) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4374: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4375: !ST [8] (maybe <- 0x840085) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4376: !DWST [14] (maybe <- 0x840086) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P4377: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4378: !CASX [4] (maybe <- 0x840087) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P4379: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f18
! 1 addresses covered
fmovs %f19, %f9

P4380: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4381: !CASX [8] (maybe <- 0x840088) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4382: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4383: !CASX [1] (maybe <- 0x840089) (Int)
add %i0, 0, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4384: !CASX [5] (maybe <- 0x84008b) (Int)
add %i1, 72, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %l4, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4385: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4386: !DWST [6] (maybe <- 0x84008c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4387: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4388: !DWST [10] (maybe <- 0x84008e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P4389: !DWST [0] (maybe <- 0x84008f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4390: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4391: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4392: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4393: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4394: !CAS [5] (maybe <- 0x840091) (Int)
add %i1, 76, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4395: !CAS [1] (maybe <- 0x840092) (Int)
add %i0, 4, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4396: !DWST [6] (maybe <- 0x840093) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4397: !DWST [3] (maybe <- 0x840095) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P4398: !CASX [2] (maybe <- 0x840096) (Int)
add %i0, 8, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %l4, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4399: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4400: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4401: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4402: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4403: !CASX [7] (maybe <- 0x840097) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4404: !ST [1] (maybe <- 0x840099) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4405: !DWST [7] (maybe <- 0x84009a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4406: !ST [10] (maybe <- 0x84009c) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4407: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4408: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4409: !NOP (Int)
nop

P4410: !DWLD [7] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4411: !CAS [14] (maybe <- 0x84009d) (Int)
add %i3, 128, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4412: !DWLD [5] (Int)
ldx [%i1 + 72], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4413: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4414: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4415: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4416: !CAS [10] (maybe <- 0x84009e) (Int)
add %i2, 32, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4417: !ST [7] (maybe <- 0x84009f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4418: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4419: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4420: !CAS [3] (maybe <- 0x8400a0) (Int)
add %i0, 32, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4421: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4422: !DWST [6] (maybe <- 0x8400a1) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4423: !CAS [6] (maybe <- 0x8400a3) (Int)
add %i1, 80, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4424: !CASX [7] (maybe <- 0x8400a4) (Int)
add %i1, 80, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P4425: !CAS [0] (maybe <- 0x8400a6) (Int)
add %i0, 0, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4426: !MEMBAR (Int)
membar #StoreLoad

P4427: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4428: !CAS [2] (maybe <- 0x8400a7) (Int)
add %i0, 12, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4429: !DWLD [10] (Int)
ldx [%i2 + 32], %o1
! move %o1(upper) -> %o1(upper)

P4430: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P4431: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4432: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4433: !DWST [9] (maybe <- 0x8400a8) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4434: !DWST [15] (maybe <- 0x8400a9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P4435: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4436: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P4437: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4438: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4439: !DWST [4] (maybe <- 0x8400aa) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4440: !SWAP [13] (maybe <- 0x8400ab) (Int)
mov %l4, %l6
swap  [%i3 + 64], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4441: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4442: !CAS [4] (maybe <- 0x8400ac) (Int)
add %i0, 64, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4443: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4444: !MEMBAR (Int)
membar #StoreLoad

P4445: !NOP (Int)
nop

P4446: !ST [8] (maybe <- 0x8400ad) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4447: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P4448: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4449: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4450: !DWLD [2] (Int)
ldx [%i0 + 8], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4451: !DWST [1] (maybe <- 0x8400ae) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4452: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P4453: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4454: !ST [6] (maybe <- 0x48800060) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P4455: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4456: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4457: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P4458: !LD [14] (Int)
lduw [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4459: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4460: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4461: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4462: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4463: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4464: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4465: !SWAP [7] (maybe <- 0x8400b0) (Int)
mov %l4, %o0
swap  [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4466: !ST [7] (maybe <- 0x8400b1) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4467: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4468: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4469: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4470: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4471: !DWST [4] (maybe <- 0x8400b2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4472: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4473: !CASX [15] (maybe <- 0x8400b3) (Int)
add %i3, 192, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P4474: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4475: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4476: !DWST [14] (maybe <- 0x8400b4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P4477: !ST [14] (maybe <- 0x8400b5) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4478: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4479: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4480: !NOP (Int)
nop

P4481: !ST [0] (maybe <- 0x8400b6) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4482: !DWST [8] (maybe <- 0x8400b7) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P4483: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4484: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4485: !DWST [14] (maybe <- 0x48800080) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P4486: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4487: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f10
! 1 addresses covered

P4488: !MEMBAR (Int)
membar #StoreLoad

P4489: !CASX [5] (maybe <- 0x8400b8) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P4490: !CAS [13] (maybe <- 0x8400b9) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4491: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P4492: !DWST [4] (maybe <- 0x8400ba) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4493: !ST [6] (maybe <- 0x8400bb) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4494: !DWLD [9] (Int)
ldx [%i1 + 512], %o3
! move %o3(upper) -> %o3(upper)

P4495: !CAS [9] (maybe <- 0x8400bc) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4496: !ST [0] (maybe <- 0x8400bd) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4497: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4498: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4499: !ST [1] (maybe <- 0x8400be) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4500: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4501: !DWST [0] (maybe <- 0x8400bf) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4502: !DWST [11] (maybe <- 0x8400c1) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P4503: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4504: !ST [9] (maybe <- 0x8400c2) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4505: !ST [14] (maybe <- 0x8400c3) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4506: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4507: !DWST [10] (maybe <- 0x8400c4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P4508: !MEMBAR (Int)
membar #StoreLoad

P4509: !CAS [7] (maybe <- 0x8400c5) (Int)
add %i1, 84, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4510: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4511: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4512: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4513: !NOP (Int)
nop

P4514: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4515: !CAS [0] (maybe <- 0x8400c6) (Int)
add %i0, 0, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4516: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4517: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P4518: !ST [3] (maybe <- 0x8400c7) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4519: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4520: !DWLD [10] (Int)
ldx [%i2 + 32], %o3
! move %o3(upper) -> %o3(upper)

P4521: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4522: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4523: !ST [5] (maybe <- 0x8400c8) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4524: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4525: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4526: !MEMBAR (Int)
membar #StoreLoad

P4527: !DWST [4] (maybe <- 0x8400c9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4528: !ST [3] (maybe <- 0x8400ca) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4529: !DWST [12] (maybe <- 0x8400cb) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P4530: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P4531: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4532: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4533: !MEMBAR (Int)
membar #StoreLoad

P4534: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P4535: !DWST [10] (maybe <- 0x8400cc) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P4536: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4537: !CASX [12] (maybe <- 0x8400cd) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P4538: !SWAP [12] (maybe <- 0x8400ce) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4539: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4540: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4541: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P4542: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4543: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4544: !DWLD [4] (Int)
ldx [%i0 + 64], %o0
! move %o0(upper) -> %o0(upper)

P4545: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4546: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P4547: !MEMBAR (Int)
membar #StoreLoad

P4548: !MEMBAR (Int)
membar #StoreLoad

P4549: !MEMBAR (Int)
membar #StoreLoad

P4550: !CASX [7] (maybe <- 0x8400cf) (Int)
add %i1, 80, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4551: !DWLD [10] (Int)
ldx [%i2 + 32], %o3
! move %o3(upper) -> %o3(upper)

P4552: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P4553: !ST [12] (maybe <- 0x8400d1) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4554: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4555: !ST [11] (maybe <- 0x488000a0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P4556: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P4557: !CASX [15] (maybe <- 0x8400d2) (Int)
add %i3, 192, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P4558: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4559: !CASX [13] (maybe <- 0x8400d3) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4560: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4561: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4562: !MEMBAR (Int)
membar #StoreLoad

P4563: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4564: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4565: !ST [7] (maybe <- 0x8400d4) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4566: !ST [9] (maybe <- 0x8400d5) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4567: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4568: !ST [1] (maybe <- 0x8400d6) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4569: !CASX [11] (maybe <- 0x8400d7) (Int)
add %i2, 64, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4570: !SWAP [13] (maybe <- 0x8400d8) (Int)
mov %l4, %o1
swap  [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4571: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4572: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4573: !SWAP [12] (maybe <- 0x8400d9) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4574: !CASX [9] (maybe <- 0x8400da) (Int)
add %i1, 512, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P4575: !DWST [1] (maybe <- 0x8400db) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4576: !CAS [8] (maybe <- 0x8400dd) (Int)
add %i1, 256, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4577: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P4578: !MEMBAR (Int)
membar #StoreLoad

P4579: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4580: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4581: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4582: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P4583: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4584: !ST [7] (maybe <- 0x8400de) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4585: !CAS [5] (maybe <- 0x8400df) (Int)
add %i1, 76, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4586: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4587: !DWST [6] (maybe <- 0x8400e0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4588: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4589: !CASX [12] (maybe <- 0x8400e2) (Int)
add %i3, 0, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P4590: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4591: !ST [15] (maybe <- 0x8400e3) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4592: !SWAP [15] (maybe <- 0x8400e4) (Int)
mov %l4, %o4
swap  [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4593: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4594: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4595: !DWST [6] (maybe <- 0x8400e5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4596: !LD [12] (FP)
ld [%i3 + 0], %f11
! 1 addresses covered

P4597: !LD [14] (FP)
ld [%i3 + 128], %f12
! 1 addresses covered

P4598: !LD [4] (FP)
ld [%i0 + 64], %f13
! 1 addresses covered

P4599: !LD [7] (FP)
ld [%i1 + 84], %f14
! 1 addresses covered

P4600: !LD [13] (FP)
ld [%i3 + 64], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P4601: !ST [0] (maybe <- 0x8400e7) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4
loop_exit_4_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_4_0
nop

P4602: !CAS [2] (maybe <- 0x8400e8) (Int)
add %i0, 12, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4603: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4604: !LD [6] (FP)
ld [%i1 + 80], %f0
! 1 addresses covered

P4605: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4606: !DWST [14] (maybe <- 0x8400e9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P4607: !ST [5] (maybe <- 0x488000c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P4608: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4609: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4610: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f18
! 1 addresses covered
fmovs %f18, %f1

P4611: !DWST [12] (maybe <- 0x8400ea) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P4612: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P4613: !SWAP [9] (maybe <- 0x8400eb) (Int)
mov %l4, %o3
swap  [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4614: !CASX [11] (maybe <- 0x8400ec) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4615: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4616: !MEMBAR (Int)
membar #StoreLoad

P4617: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4618: !CASX [14] (maybe <- 0x8400ed) (Int)
add %i3, 128, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4619: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4620: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4621: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4622: !ST [5] (maybe <- 0x8400ee) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4623: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4624: !ST [15] (maybe <- 0x8400ef) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4625: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4626: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4627: !CASX [0] (maybe <- 0x8400f0) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4628: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P4629: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4630: !LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4631: !CASX [2] (maybe <- 0x8400f2) (Int)
add %i0, 8, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4632: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4633: !DWST [6] (maybe <- 0x8400f3) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4634: !DWST [14] (maybe <- 0x8400f5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P4635: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4636: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4637: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4638: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4639: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4640: !SWAP [9] (maybe <- 0x8400f6) (Int)
mov %l4, %o0
swap  [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4641: !CAS [13] (maybe <- 0x8400f7) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4642: !DWST [12] (maybe <- 0x8400f8) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P4643: !NOP (Int)
nop

P4644: !CASX [4] (maybe <- 0x8400f9) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4645: !DWST [11] (maybe <- 0x8400fa) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P4646: !CASX [10] (maybe <- 0x8400fb) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4647: !MEMBAR (Int)
membar #StoreLoad

P4648: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4649: !ST [14] (maybe <- 0x8400fc) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4650: !CAS [4] (maybe <- 0x8400fd) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4651: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4652: !CAS [5] (maybe <- 0x8400fe) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4653: !ST [7] (maybe <- 0x8400ff) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4654: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P4655: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4656: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f2
! 1 addresses covered

P4657: !CASX [5] (maybe <- 0x840100) (Int)
add %i1, 72, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %l4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4658: !ST [15] (maybe <- 0x840101) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4659: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4660: !ST [15] (maybe <- 0x840102) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4661: !ST [10] (maybe <- 0x840103) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4662: !ST [6] (maybe <- 0x488000e0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P4663: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4664: !DWLD [8] (Int)
ldx [%i1 + 256], %o0
! move %o0(upper) -> %o0(upper)

P4665: !CAS [6] (maybe <- 0x840104) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4666: !MEMBAR (Int)
membar #StoreLoad

P4667: !ST [11] (maybe <- 0x48800100) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P4668: !ST [8] (maybe <- 0x840105) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4669: !DWST [13] (maybe <- 0x48800120) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P4670: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P4671: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4672: !DWST [1] (maybe <- 0x840106) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4673: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4674: !ST [0] (maybe <- 0x840108) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4675: !DWST [4] (maybe <- 0x840109) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4676: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4677: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4678: !CASX [8] (maybe <- 0x84010a) (Int)
add %i1, 256, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P4679: !CAS [5] (maybe <- 0x84010b) (Int)
add %i1, 76, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4680: !MEMBAR (Int)
membar #StoreLoad

P4681: !DWLD [7] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4682: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4683: !DWLD [14] (Int)
ldx [%i3 + 128], %o1
! move %o1(upper) -> %o1(upper)

P4684: !ST [15] (maybe <- 0x84010c) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4685: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P4686: !CAS [14] (maybe <- 0x84010d) (Int)
add %i3, 128, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4687: !DWST [1] (maybe <- 0x84010e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4688: !LD [4] (Int)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4689: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4690: !CASX [15] (maybe <- 0x840110) (Int)
add %i3, 192, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4691: !MEMBAR (Int)
membar #StoreLoad

P4692: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4693: !MEMBAR (Int)
membar #StoreLoad

P4694: !SWAP [7] (maybe <- 0x840111) (Int)
mov %l4, %o1
swap  [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4695: !DWST [11] (maybe <- 0x48800140) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 64]

P4696: !CASX [10] (maybe <- 0x840112) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4697: !ST [4] (maybe <- 0x840113) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4698: !DWST [8] (maybe <- 0x840114) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P4699: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4700: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4701: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4702: !ST [2] (maybe <- 0x840115) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4703: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4704: !CASX [11] (maybe <- 0x840116) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4705: !MEMBAR (Int)
membar #StoreLoad

P4706: !MEMBAR (Int)
membar #StoreLoad

P4707: !DWST [12] (maybe <- 0x840117) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P4708: !CAS [7] (maybe <- 0x840118) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4709: !ST [9] (maybe <- 0x840119) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4710: !CASX [2] (maybe <- 0x84011a) (Int)
add %i0, 8, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4711: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4712: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4713: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4714: !SWAP [7] (maybe <- 0x84011b) (Int)
mov %l4, %o0
swap  [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4715: !DWST [7] (maybe <- 0x84011c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4716: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4717: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4718: !DWST [10] (maybe <- 0x84011e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P4719: !MEMBAR (Int)
membar #StoreLoad

P4720: !ST [10] (maybe <- 0x48800160) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P4721: !NOP (Int)
nop

P4722: !CAS [11] (maybe <- 0x84011f) (Int)
add %i2, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4723: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4724: !DWST [3] (maybe <- 0x840120) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P4725: !SWAP [12] (maybe <- 0x840121) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4726: !CASX [2] (maybe <- 0x840122) (Int)
add %i0, 8, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %l4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4727: !MEMBAR (Int)
membar #StoreLoad

P4728: !SWAP [1] (maybe <- 0x840123) (Int)
mov %l4, %o0
swap  [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4729: !DWST [12] (maybe <- 0x840124) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P4730: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P4731: !LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4732: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4733: !DWST [13] (maybe <- 0x840125) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P4734: !CASX [9] (maybe <- 0x840126) (Int)
add %i1, 512, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4735: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4736: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4737: !MEMBAR (Int)
membar #StoreLoad

P4738: !SWAP [5] (maybe <- 0x840127) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4739: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4740: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4741: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4742: !LD [0] (FP)
ld [%i0 + 0], %f3
! 1 addresses covered

P4743: !MEMBAR (Int)
membar #StoreLoad

P4744: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4745: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4746: !CAS [15] (maybe <- 0x840128) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4747: !NOP (Int)
nop

P4748: !SWAP [1] (maybe <- 0x840129) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4749: !DWST [14] (maybe <- 0x84012a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P4750: !LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4751: !CAS [11] (maybe <- 0x84012b) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4752: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4753: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4754: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P4755: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4756: !DWST [0] (maybe <- 0x84012c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4757: !SWAP [9] (maybe <- 0x84012e) (Int)
mov %l4, %o3
swap  [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4758: !CASX [9] (maybe <- 0x84012f) (Int)
add %i1, 512, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4759: !MEMBAR (Int)
membar #StoreLoad

P4760: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4761: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4762: !MEMBAR (Int)
membar #StoreLoad

P4763: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P4764: !DWST [9] (maybe <- 0x840130) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4765: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P4766: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P4767: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P4768: !DWLD [2] (Int)
ldx [%i0 + 8], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4769: !ST [15] (maybe <- 0x840131) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4770: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4771: !LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4772: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4773: !LD [5] (Int)
lduw [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4774: !DWST [9] (maybe <- 0x840132) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4775: !DWLD [7] (FP)
! case fp 
ldd  [%i1 + 80], %f4
! 2 addresses covered

P4776: !ST [12] (maybe <- 0x48800180) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P4777: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4778: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4779: !DWST [14] (maybe <- 0x488001a0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P4780: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4781: !ST [10] (maybe <- 0x840133) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4782: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4783: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P4784: !DWLD [5] (Int)
ldx [%i1 + 72], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4785: !ST [7] (maybe <- 0x840134) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4786: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4787: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P4788: !DWST [15] (maybe <- 0x840135) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P4789: !ST [11] (maybe <- 0x840136) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4790: !ST [8] (maybe <- 0x840137) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4791: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P4792: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4793: !CASX [5] (maybe <- 0x840138) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4794: !MEMBAR (Int)
membar #StoreLoad

P4795: !DWLD [8] (FP)
! case fp 
ldd  [%i1 + 256], %f6
! 1 addresses covered

P4796: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4797: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P4798: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4799: !CASX [15] (maybe <- 0x840139) (Int)
add %i3, 192, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4800: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4801: !CAS [2] (maybe <- 0x84013a) (Int)
add %i0, 12, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P4802: !DWST [3] (maybe <- 0x84013b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P4803: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4804: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4805: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4806: !DWST [1] (maybe <- 0x84013c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4807: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4808: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4809: !SWAP [8] (maybe <- 0x84013e) (Int)
mov %l4, %l6
swap  [%i1 + 256], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4810: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4811: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P4812: !ST [10] (maybe <- 0x84013f) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4813: !CASX [1] (maybe <- 0x840140) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4814: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4815: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4816: !MEMBAR (Int)
membar #StoreLoad

P4817: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4818: !DWLD [5] (Int)
ldx [%i1 + 72], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4819: !CAS [10] (maybe <- 0x840142) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4820: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4821: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4822: !LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4823: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P4824: !CAS [6] (maybe <- 0x840143) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4825: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4826: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4827: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4828: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4829: !DWST [11] (maybe <- 0x840144) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P4830: !ST [6] (maybe <- 0x840145) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4831: !DWLD [4] (FP)
! case fp 
ldd  [%i0 + 64], %f18
! 1 addresses covered
fmovs %f18, %f7

P4832: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4833: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4834: !DWST [14] (maybe <- 0x840146) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P4835: !CAS [4] (maybe <- 0x840147) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4836: !MEMBAR (Int)
membar #StoreLoad

P4837: !CASX [8] (maybe <- 0x840148) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P4838: !DWST [12] (maybe <- 0x488001c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 0]

P4839: !CAS [4] (maybe <- 0x840149) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4840: !CASX [4] (maybe <- 0x84014a) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4841: !CASX [3] (maybe <- 0x84014b) (Int)
add %i0, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P4842: !SWAP [8] (maybe <- 0x84014c) (Int)
mov %l4, %l6
swap  [%i1 + 256], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4843: !CAS [4] (maybe <- 0x84014d) (Int)
add %i0, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4844: !DWLD [7] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4845: !LD [10] (FP)
ld [%i2 + 32], %f8
! 1 addresses covered

P4846: !CASX [8] (maybe <- 0x84014e) (Int)
add %i1, 256, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4847: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4848: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4849: !SWAP [7] (maybe <- 0x84014f) (Int)
mov %l4, %o2
swap  [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4850: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P4851: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4852: !NOP (Int)
nop

P4853: !DWST [15] (maybe <- 0x488001e0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P4854: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4855: !DWLD [11] (Int)
ldx [%i2 + 64], %o3
! move %o3(upper) -> %o3(upper)

P4856: !CASX [1] (maybe <- 0x840150) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4857: !ST [2] (maybe <- 0x840152) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4858: !ST [8] (maybe <- 0x840153) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4859: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f9

P4860: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P4861: !DWLD [2] (Int)
ldx [%i0 + 8], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4862: !MEMBAR (Int)
membar #StoreLoad

P4863: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P4864: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4865: !NOP (Int)
nop

P4866: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4867: !ST [13] (maybe <- 0x840154) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4868: !ST [15] (maybe <- 0x840155) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4869: !CASX [2] (maybe <- 0x840156) (Int)
add %i0, 8, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %l4, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P4870: !SWAP [7] (maybe <- 0x840157) (Int)
mov %l4, %o4
swap  [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4871: !DWST [4] (maybe <- 0x840158) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P4872: !ST [9] (maybe <- 0x840159) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4873: !DWST [9] (maybe <- 0x84015a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4874: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4875: !DWST [7] (maybe <- 0x84015b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4876: !DWST [11] (maybe <- 0x84015d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P4877: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4878: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4879: !CASX [7] (maybe <- 0x84015e) (Int)
add %i1, 80, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4880: !ST [11] (maybe <- 0x840160) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4881: !DWLD [7] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4882: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4883: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4884: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4885: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4886: !ST [8] (maybe <- 0x840161) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4887: !ST [9] (maybe <- 0x840162) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4888: !DWST [9] (maybe <- 0x840163) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4889: !CASX [12] (maybe <- 0x840164) (Int)
add %i3, 0, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4890: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4891: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P4892: !DWST [5] (maybe <- 0x840165) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P4893: !DWST [7] (maybe <- 0x840166) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4894: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4895: !CAS [0] (maybe <- 0x840168) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4896: !DWST [1] (maybe <- 0x48800200) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P4897: !ST [13] (maybe <- 0x840169) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4898: !SWAP [11] (maybe <- 0x84016a) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4899: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4900: !DWST [11] (maybe <- 0x84016b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P4901: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4902: !DWST [6] (maybe <- 0x84016c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4903: !CAS [11] (maybe <- 0x84016e) (Int)
add %i2, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4904: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4905: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4906: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4907: !ST [11] (maybe <- 0x84016f) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4908: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4909: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4910: !LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4911: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4912: !ST [5] (maybe <- 0x840170) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4913: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4914: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4915: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4916: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P4917: !DWLD [4] (FP)
! case fp 
ldd  [%i0 + 64], %f10
! 1 addresses covered

P4918: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4919: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4920: !MEMBAR (Int)
membar #StoreLoad

P4921: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4922: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4923: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P4924: !MEMBAR (Int)
membar #StoreLoad

P4925: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4926: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4927: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4928: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4929: !ST [6] (maybe <- 0x840171) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4930: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4931: !DWST [1] (maybe <- 0x840172) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4932: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P4933: !ST [0] (maybe <- 0x840174) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4934: !ST [2] (maybe <- 0x840175) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4935: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4936: !DWST [10] (maybe <- 0x840176) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P4937: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4938: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4939: !CAS [8] (maybe <- 0x840177) (Int)
add %i1, 256, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P4940: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4941: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4942: !MEMBAR (Int)
membar #StoreLoad

P4943: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4944: !LD [4] (Int)
lduw [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4945: !MEMBAR (Int)
membar #StoreLoad

P4946: !ST [12] (maybe <- 0x840178) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4947: !ST [3] (maybe <- 0x840179) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4948: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4949: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4950: !MEMBAR (Int)
membar #StoreLoad

P4951: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4952: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P4953: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4954: !DWST [15] (maybe <- 0x84017a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P4955: !DWST [6] (maybe <- 0x84017b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4956: !DWST [7] (maybe <- 0x84017d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P4957: !ST [2] (maybe <- 0x84017f) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4958: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4959: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P4960: !SWAP [14] (maybe <- 0x840180) (Int)
mov %l4, %o3
swap  [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4961: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4962: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P4963: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4964: !ST [13] (maybe <- 0x840181) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4965: !SWAP [2] (maybe <- 0x840182) (Int)
mov %l4, %o4
swap  [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4966: !MEMBAR (Int)
membar #StoreLoad

P4967: !DWST [3] (maybe <- 0x840183) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P4968: !MEMBAR (Int)
membar #StoreLoad

P4969: !CAS [14] (maybe <- 0x840184) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P4970: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4971: !ST [11] (maybe <- 0x840185) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4972: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4973: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4974: !ST [2] (maybe <- 0x840186) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4975: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P4976: !ST [10] (maybe <- 0x840187) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4977: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P4978: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4979: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4980: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P4981: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4982: !SWAP [14] (maybe <- 0x840188) (Int)
mov %l4, %o3
swap  [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4983: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4984: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4985: !ST [14] (maybe <- 0x840189) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4986: !LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4987: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P4988: !CASX [13] (maybe <- 0x84018a) (Int)
add %i3, 64, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4989: !ST [8] (maybe <- 0x84018b) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4990: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4991: !NOP (Int)
nop

P4992: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P4993: !CAS [9] (maybe <- 0x84018c) (Int)
add %i1, 512, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P4994: !LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4995: !CASX [1] (maybe <- 0x84018d) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P4996: !LD [6] (FP)
ld [%i1 + 80], %f11
! 1 addresses covered

P4997: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P4998: !MEMBAR (Int)
membar #StoreLoad

P4999: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5000: !LD [2] (FP)
ld [%i0 + 12], %f12
! 1 addresses covered

P5001: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P5002: !CAS [8] (maybe <- 0x84018f) (Int)
add %i1, 256, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P5003: !CASX [14] (maybe <- 0x840190) (Int)
add %i3, 128, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5004: !MEMBAR (Int)
membar #StoreLoad

P5005: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5006: !DWLD [2] (Int)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5007: !MEMBAR (Int)
membar #StoreLoad

P5008: !CAS [6] (maybe <- 0x840191) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5009: !MEMBAR (Int)
membar #StoreLoad

P5010: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5011: !CAS [12] (maybe <- 0x840192) (Int)
add %i3, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P5012: !SWAP [4] (maybe <- 0x840193) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P5013: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5014: !ST [7] (maybe <- 0x840194) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P5015: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P5016: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5017: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P5018: !MEMBAR (Int)
membar #StoreLoad

P5019: !CASX [14] (maybe <- 0x840195) (Int)
add %i3, 128, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5020: !DWST [15] (maybe <- 0x48800240) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P5021: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P5022: !MEMBAR (Int)
membar #StoreLoad

P5023: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5024: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5025: !CASX [2] (maybe <- 0x840196) (Int)
add %i0, 8, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %l4, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P5026: !NOP (Int)
nop

P5027: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5028: !DWLD [3] (Int)
ldx [%i0 + 32], %o2
! move %o2(upper) -> %o2(upper)

P5029: !LD [11] (FP)
ld [%i2 + 64], %f13
! 1 addresses covered

P5030: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P5031: !LD [10] (FP)
ld [%i2 + 32], %f14
! 1 addresses covered

P5032: !DWLD [2] (Int)
ldx [%i0 + 8], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5033: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P5034: !ST [7] (maybe <- 0x840197) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P5035: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5036: !DWLD [8] (FP)
! case fp 
ldd  [%i1 + 256], %f18
! 1 addresses covered
fmovs %f18, %f15
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P5037: !DWST [9] (maybe <- 0x840198) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P5038: !SWAP [2] (maybe <- 0x840199) (Int)
mov %l4, %l6
swap  [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P5039: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5040: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5041: !DWST [13] (maybe <- 0x84019a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5042: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5043: !MEMBAR (Int)
membar #StoreLoad

P5044: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P5045: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5046: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5047: !LD [11] (FP)
ld [%i2 + 64], %f0
! 1 addresses covered

P5048: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5049: !DWST [3] (maybe <- 0x84019b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P5050: !CAS [11] (maybe <- 0x84019c) (Int)
add %i2, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P5051: !CASX [7] (maybe <- 0x84019d) (Int)
add %i1, 80, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P5052: !DWLD [13] (Int)
ldx [%i3 + 64], %o3
! move %o3(upper) -> %o3(upper)

P5053: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P5054: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P5055: !SWAP [7] (maybe <- 0x84019f) (Int)
mov %l4, %o4
swap  [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5056: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5057: !DWLD [5] (FP)
! case fp 
ldd  [%i1 + 72], %f18
! 1 addresses covered
fmovs %f19, %f1

P5058: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5059: !ST [2] (maybe <- 0x8401a0) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P5060: !SWAP [2] (maybe <- 0x8401a1) (Int)
mov %l4, %l6
swap  [%i0 + 12], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P5061: !DWST [6] (maybe <- 0x8401a2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5062: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P5063: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5064: !DWST [4] (maybe <- 0x8401a4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P5065: !DWST [10] (maybe <- 0x8401a5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P5066: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5067: !DWST [6] (maybe <- 0x8401a6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5068: !MEMBAR (Int)
membar #StoreLoad

P5069: !CAS [8] (maybe <- 0x8401a8) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P5070: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P5071: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5072: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P5073: !DWLD [0] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5074: !LD [10] (Int)
lduw [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5075: !CAS [5] (maybe <- 0x8401a9) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5076: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5077: !SWAP [1] (maybe <- 0x8401aa) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P5078: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P5079: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P5080: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5081: !LD [10] (FP)
ld [%i2 + 32], %f2
! 1 addresses covered

P5082: !DWST [0] (maybe <- 0x8401ab) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5083: !CASX [5] (maybe <- 0x8401ad) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P5084: !DWST [10] (maybe <- 0x8401ae) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P5085: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5086: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5087: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5088: !MEMBAR (Int)
membar #StoreLoad

P5089: !MEMBAR (Int)
membar #StoreLoad

P5090: !MEMBAR (Int)
membar #StoreLoad

P5091: !LD [0] (FP)
ld [%i0 + 0], %f3
! 1 addresses covered

P5092: !LD [1] (FP)
ld [%i0 + 4], %f4
! 1 addresses covered

P5093: !LD [2] (FP)
ld [%i0 + 12], %f5
! 1 addresses covered

P5094: !LD [3] (FP)
ld [%i0 + 32], %f6
! 1 addresses covered

P5095: !LD [4] (FP)
ld [%i0 + 64], %f7
! 1 addresses covered

P5096: !LD [5] (FP)
ld [%i1 + 76], %f8
! 1 addresses covered

P5097: !LD [6] (FP)
ld [%i1 + 80], %f9
! 1 addresses covered

P5098: !LD [7] (FP)
ld [%i1 + 84], %f10
! 1 addresses covered

P5099: !LD [8] (FP)
ld [%i1 + 256], %f11
! 1 addresses covered

P5100: !LD [9] (FP)
ld [%i1 + 512], %f12
! 1 addresses covered

P5101: !LD [10] (FP)
ld [%i2 + 32], %f13
! 1 addresses covered

P5102: !LD [11] (FP)
ld [%i2 + 64], %f14
! 1 addresses covered

P5103: !LD [12] (FP)
ld [%i3 + 0], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P5104: !LD [13] (FP)
ld [%i3 + 64], %f0
! 1 addresses covered

P5105: !LD [14] (FP)
ld [%i3 + 128], %f1
! 1 addresses covered

P5106: !LD [15] (FP)
ld [%i3 + 192], %f2
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30

restore
retl
nop
!-----------------



func5:

! 1000 instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
srlx %i0, 6, %i0
sllx %i0, 6, %i0

add %i1, 63, %i1
srlx %i1, 6, %i1
sllx %i1, 6, %i1

add %i2, 63, %i2
srlx %i2, 6, %i2
sllx %i2, 6, %i2

add %i3, 63, %i3
srlx %i3, 6, %i3
sllx %i3, 6, %i3

add %i4, 63, %i4
srlx %i4, 6, %i4
sllx %i4, 6, %i4

add %i5, 63, %i5
srlx %i5, 6, %i5
sllx %i5, 6, %i5

mov   %i4, %l1
add   %i5, 1344, %l5

! Initialize %o7, the pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
addx  %o7, %l1, %o7 

! Initializing %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%l5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%l5+4]
ldd [%l5], %f0
ldd [%l5], %f2
ldd [%l5], %f4
ldd [%l5], %f6
ldd [%l5], %f8
ldd [%l5], %f10
ldd [%l5], %f12
ldd [%l5], %f14
ldd [%l5], %f16
ldd [%l5], %f18
ldd [%l5], %f20
ldd [%l5], %f22
ldd [%l5], %f24
ldd [%l5], %f26
ldd [%l5], %f28
ldd [%l5], %f30
ldd [%l5], %f32
ldd [%l5], %f34
ldd [%l5], %f36
ldd [%l5], %f38
ldd [%l5], %f40
ldd [%l5], %f42
ldd [%l5], %f44
ldd [%l5], %f46
ldd [%l5], %f48
ldd [%l5], %f50
ldd [%l5], %f52
ldd [%l5], %f54
ldd [%l5], %f56
ldd [%l5], %f58
ldd [%l5], %f60
ldd [%l5], %f62

! Initializing int results buffer registers: %o0 %o1 %o2 %o3 %o4 
mov %g0, %o0
mov %g0, %o1
mov %g0, %o2
mov %g0, %o3
mov %g0, %o4

! Signature for extract_loads
sethi %hi(0x05deade1), %l7
or    %l7, %lo(0x05deade1), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize integer counter 
sethi %hi(0x850001), %l4
or    %l4, %lo(0x850001), %l4

! Initialize FP counter 
sethi %hi(0x489fff80), %l7
or    %l7, %lo(0x489fff80), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize FP counter increment value 
sethi %hi(0x3f800000), %l7
or    %l7, %lo(0x3f800000), %l7
stw %l7, [%l5] 
ld [%l5], %f17 

P5107: !MEMBAR (Int)
membar #StoreLoad

P5108: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5109: !ST [5] (maybe <- 0x850001) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5110: !DWST [0] (maybe <- 0x850002) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5111: !LD [3] (Int)
lduw [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5112: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5113: !CAS [6] (maybe <- 0x850004) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P5114: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5115: !SWAP [15] (maybe <- 0x850005) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5116: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5117: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3

P5118: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P5119: !CAS [7] (maybe <- 0x850006) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5120: !ST [4] (maybe <- 0x850007) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P5121: !ST [7] (maybe <- 0x850008) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P5122: !SWAP [3] (maybe <- 0x850009) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P5123: !ST [12] (maybe <- 0x85000a) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P5124: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5125: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P5126: !DWST [15] (maybe <- 0x85000b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P5127: !CAS [1] (maybe <- 0x85000c) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5128: !CAS [14] (maybe <- 0x85000d) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P5129: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P5130: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P5131: !DWST [0] (maybe <- 0x85000e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5132: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5133: !ST [0] (maybe <- 0x850010) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P5134: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P5135: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5136: !LD [2] (FP)
ld [%i0 + 12], %f0
! 1 addresses covered

P5137: !DWST [2] (maybe <- 0x850011) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P5138: !MEMBAR (Int)
membar #StoreLoad

P5139: !MEMBAR (Int)
membar #StoreLoad

P5140: !CAS [4] (maybe <- 0x850012) (Int)
add %i0, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5141: !ST [0] (maybe <- 0x850013) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P5142: !MEMBAR (Int)
membar #StoreLoad

P5143: !ST [9] (maybe <- 0x850014) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P5144: !LD [9] (FP)
ld [%i1 + 512], %f1
! 1 addresses covered

P5145: !ST [13] (maybe <- 0x850015) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P5146: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5147: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5148: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P5149: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5150: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5151: !CAS [15] (maybe <- 0x850016) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5152: !ST [4] (maybe <- 0x850017) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P5153: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5154: !ST [11] (maybe <- 0x850018) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P5155: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5156: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5157: !DWST [13] (maybe <- 0x850019) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5158: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P5159: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P5160: !DWST [1] (maybe <- 0x85001a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5161: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5162: !DWST [10] (maybe <- 0x85001c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P5163: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P5164: !DWST [13] (maybe <- 0x489fff80) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P5165: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P5166: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P5167: !MEMBAR (Int)
membar #StoreLoad

P5168: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5169: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5170: !DWST [7] (maybe <- 0x85001d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5171: !CAS [6] (maybe <- 0x85001f) (Int)
add %i1, 80, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5172: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P5173: !ST [13] (maybe <- 0x489fffa0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P5174: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P5175: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P5176: !DWLD [4] (Int)
ldx [%i0 + 64], %o4
! move %o4(upper) -> %o4(upper)

P5177: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5178: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P5179: !DWST [14] (maybe <- 0x850020) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5180: !CAS [2] (maybe <- 0x850021) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5181: !DWST [12] (maybe <- 0x850022) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P5182: !DWST [7] (maybe <- 0x850023) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5183: !MEMBAR (Int)
membar #StoreLoad

P5184: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P5185: !CAS [15] (maybe <- 0x850025) (Int)
add %i3, 192, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P5186: !MEMBAR (Int)
membar #StoreLoad

P5187: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P5188: !DWST [0] (maybe <- 0x850026) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5189: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5190: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P5191: !CASX [2] (maybe <- 0x850028) (Int)
add %i0, 8, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %l4, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5192: !CAS [9] (maybe <- 0x850029) (Int)
add %i1, 512, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P5193: !DWST [13] (maybe <- 0x85002a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5194: !ST [3] (maybe <- 0x85002b) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P5195: !SWAP [8] (maybe <- 0x85002c) (Int)
mov %l4, %o0
swap  [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5196: !CASX [6] (maybe <- 0x85002d) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5197: !DWST [7] (maybe <- 0x85002f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5198: !ST [12] (maybe <- 0x850031) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P5199: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5200: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P5201: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5202: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5203: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f2
! 1 addresses covered
fmovs %f3, %f2

P5204: !DWST [14] (maybe <- 0x850032) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5205: !DWST [9] (maybe <- 0x850033) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P5206: !SWAP [10] (maybe <- 0x850034) (Int)
mov %l4, %o3
swap  [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P5207: !CAS [15] (maybe <- 0x850035) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5208: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5209: !ST [12] (maybe <- 0x489fffc0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P5210: !ST [9] (maybe <- 0x850036) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P5211: !DWLD [1] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P5212: !ST [5] (maybe <- 0x850037) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5213: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5214: !LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5215: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P5216: !CAS [0] (maybe <- 0x850038) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5217: !ST [0] (maybe <- 0x850039) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P5218: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5219: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5220: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5221: !CAS [7] (maybe <- 0x85003a) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P5222: !MEMBAR (Int)
membar #StoreLoad

P5223: !MEMBAR (Int)
membar #StoreLoad

P5224: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5225: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P5226: !DWST [9] (maybe <- 0x85003b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P5227: !MEMBAR (Int)
membar #StoreLoad

P5228: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5229: !DWST [15] (maybe <- 0x85003c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P5230: !LD [8] (FP)
ld [%i1 + 256], %f3
! 1 addresses covered

P5231: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5232: !ST [12] (maybe <- 0x85003d) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P5233: !ST [14] (maybe <- 0x85003e) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P5234: !DWLD [7] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P5235: !DWST [3] (maybe <- 0x489fffe0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P5236: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P5237: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5238: !DWLD [11] (Int)
ldx [%i2 + 64], %o1
! move %o1(upper) -> %o1(upper)

P5239: !ST [3] (maybe <- 0x85003f) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P5240: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P5241: !DWST [1] (maybe <- 0x850040) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5242: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P5243: !CASX [12] (maybe <- 0x850042) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P5244: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5245: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P5246: !CASX [12] (maybe <- 0x850043) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P5247: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P5248: !MEMBAR (Int)
membar #StoreLoad

P5249: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P5250: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5251: !DWST [12] (maybe <- 0x850044) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P5252: !CASX [6] (maybe <- 0x850045) (Int)
add %i1, 80, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5253: !DWLD [14] (Int)
ldx [%i3 + 128], %o4
! move %o4(upper) -> %o4(upper)

P5254: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P5255: !CASX [1] (maybe <- 0x850047) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P5256: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5257: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5258: !CASX [1] (maybe <- 0x850049) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P5259: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P5260: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5261: !NOP (Int)
nop

P5262: !SWAP [6] (maybe <- 0x85004b) (Int)
mov %l4, %o4
swap  [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5263: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5264: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5265: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5266: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P5267: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P5268: !ST [6] (maybe <- 0x85004c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P5269: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P5270: !DWST [6] (maybe <- 0x85004d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5271: !ST [14] (maybe <- 0x85004f) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P5272: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5273: !DWST [15] (maybe <- 0x48a00000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P5274: !CAS [5] (maybe <- 0x850050) (Int)
add %i1, 76, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5275: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P5276: !CASX [6] (maybe <- 0x850051) (Int)
add %i1, 80, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5277: !MEMBAR (Int)
membar #StoreLoad

P5278: !CAS [11] (maybe <- 0x850053) (Int)
add %i2, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P5279: !DWST [0] (maybe <- 0x850054) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5280: !LD [5] (Int)
lduw [%i1 + 76], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5281: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P5282: !DWST [9] (maybe <- 0x850056) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P5283: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5284: !SWAP [15] (maybe <- 0x850057) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5285: !DWST [13] (maybe <- 0x850058) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5286: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5287: !MEMBAR (Int)
membar #StoreLoad

P5288: !CASX [2] (maybe <- 0x850059) (Int)
add %i0, 8, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %l4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5289: !MEMBAR (Int)
membar #StoreLoad

P5290: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5291: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5292: !DWST [2] (maybe <- 0x85005a) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P5293: !LD [3] (FP)
ld [%i0 + 32], %f4
! 1 addresses covered

P5294: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P5295: !MEMBAR (Int)
membar #StoreLoad

P5296: !CASX [7] (maybe <- 0x85005b) (Int)
add %i1, 80, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P5297: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5298: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5299: !DWST [10] (maybe <- 0x85005d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P5300: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5301: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P5302: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5303: !CASX [7] (maybe <- 0x85005e) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P5304: !ST [5] (maybe <- 0x850060) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5305: !SWAP [5] (maybe <- 0x850061) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P5306: !LD [2] (FP)
ld [%i0 + 12], %f5
! 1 addresses covered

P5307: !CASX [9] (maybe <- 0x850062) (Int)
add %i1, 512, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
sllx %l4, 32, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P5308: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P5309: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5310: !CAS [4] (maybe <- 0x850063) (Int)
add %i0, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P5311: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5312: !SWAP [13] (maybe <- 0x850064) (Int)
mov %l4, %o4
swap  [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5313: !DWST [5] (maybe <- 0x850065) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P5314: !DWST [3] (maybe <- 0x850066) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P5315: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5316: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5317: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5318: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5319: !DWST [14] (maybe <- 0x850067) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5320: !ST [9] (maybe <- 0x850068) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P5321: !DWST [10] (maybe <- 0x850069) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P5322: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5323: !CAS [11] (maybe <- 0x85006a) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P5324: !CAS [15] (maybe <- 0x85006b) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5325: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P5326: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P5327: !DWST [1] (maybe <- 0x85006c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5328: !DWST [11] (maybe <- 0x85006e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P5329: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P5330: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P5331: !DWLD [2] (Int)
ldx [%i0 + 8], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5332: !ST [13] (maybe <- 0x85006f) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P5333: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5334: !CAS [2] (maybe <- 0x850070) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5335: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5336: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5337: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5338: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5339: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5340: !LD [3] (FP)
ld [%i0 + 32], %f6
! 1 addresses covered

P5341: !SWAP [11] (maybe <- 0x850071) (Int)
mov %l4, %o0
swap  [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5342: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P5343: !DWLD [2] (Int)
ldx [%i0 + 8], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5344: !ST [1] (maybe <- 0x850072) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P5345: !ST [12] (maybe <- 0x850073) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P5346: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P5347: !ST [2] (maybe <- 0x850074) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P5348: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5349: !DWST [15] (maybe <- 0x850075) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P5350: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5351: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P5352: !CASX [12] (maybe <- 0x850076) (Int)
add %i3, 0, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5353: !ST [14] (maybe <- 0x850077) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P5354: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5355: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5356: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5357: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5358: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5359: !ST [4] (maybe <- 0x850078) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P5360: !SWAP [12] (maybe <- 0x850079) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P5361: !SWAP [11] (maybe <- 0x85007a) (Int)
mov %l4, %o0
swap  [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5362: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P5363: !DWLD [12] (Int)
ldx [%i3 + 0], %o1
! move %o1(upper) -> %o1(upper)

P5364: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P5365: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P5366: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5367: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5368: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P5369: !DWST [14] (maybe <- 0x85007b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5370: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5371: !SWAP [3] (maybe <- 0x85007c) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P5372: !CASX [13] (maybe <- 0x85007d) (Int)
add %i3, 64, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P5373: !NOP (Int)
nop

P5374: !ST [1] (maybe <- 0x85007e) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P5375: !ST [1] (maybe <- 0x85007f) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P5376: !DWST [9] (maybe <- 0x850080) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P5377: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5378: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5379: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5380: !DWST [0] (maybe <- 0x850081) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5381: !CAS [0] (maybe <- 0x850083) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5382: !DWST [13] (maybe <- 0x850084) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5383: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P5384: !DWLD [0] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5385: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5386: !LD [5] (FP)
ld [%i1 + 76], %f7
! 1 addresses covered

P5387: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5388: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5389: !CAS [7] (maybe <- 0x850085) (Int)
add %i1, 84, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P5390: !DWST [13] (maybe <- 0x850086) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5391: !NOP (Int)
nop

P5392: !CAS [4] (maybe <- 0x850087) (Int)
add %i0, 64, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P5393: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P5394: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5395: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P5396: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5397: !ST [14] (maybe <- 0x850088) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P5398: !ST [4] (maybe <- 0x850089) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P5399: !DWST [0] (maybe <- 0x85008a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5400: !DWST [13] (maybe <- 0x85008c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5401: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P5402: !MEMBAR (Int)
membar #StoreLoad

P5403: !CASX [6] (maybe <- 0x85008d) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P5404: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P5405: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5406: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5407: !ST [1] (maybe <- 0x48a00020) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P5408: !ST [11] (maybe <- 0x85008f) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P5409: !SWAP [12] (maybe <- 0x850090) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P5410: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P5411: !SWAP [15] (maybe <- 0x850091) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5412: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5413: !ST [3] (maybe <- 0x850092) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P5414: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P5415: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5416: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5417: !DWST [5] (maybe <- 0x850093) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P5418: !CAS [15] (maybe <- 0x850094) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5419: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P5420: !ST [5] (maybe <- 0x850095) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5421: !ST [15] (maybe <- 0x850096) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P5422: !SWAP [10] (maybe <- 0x850097) (Int)
mov %l4, %o1
swap  [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P5423: !DWST [14] (maybe <- 0x850098) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5424: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5425: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P5426: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P5427: !DWST [13] (maybe <- 0x850099) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5428: !CAS [0] (maybe <- 0x85009a) (Int)
add %i0, 0, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5429: !CAS [11] (maybe <- 0x85009b) (Int)
add %i2, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P5430: !DWLD [1] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5431: !NOP (Int)
nop

P5432: !MEMBAR (Int)
membar #StoreLoad

P5433: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5434: !DWLD [1] (FP)
! case fp 
ldd  [%i0 + 0], %f8
! 2 addresses covered

P5435: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P5436: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5437: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5438: !DWST [11] (maybe <- 0x48a00040) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 64]

P5439: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5440: !ST [11] (maybe <- 0x85009c) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P5441: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P5442: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5443: !DWLD [10] (Int)
ldx [%i2 + 32], %o1
! move %o1(upper) -> %o1(upper)

P5444: !DWST [13] (maybe <- 0x85009d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5445: !CASX [2] (maybe <- 0x85009e) (Int)
add %i0, 8, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P5446: !MEMBAR (Int)
membar #StoreLoad

P5447: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P5448: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5449: !ST [5] (maybe <- 0x85009f) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5450: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P5451: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5452: !CASX [1] (maybe <- 0x8500a0) (Int)
add %i0, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P5453: !DWLD [1] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P5454: !ST [6] (maybe <- 0x8500a2) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P5455: !CASX [10] (maybe <- 0x8500a3) (Int)
add %i2, 32, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5456: !LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5457: !NOP (Int)
nop

P5458: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P5459: !DWST [10] (maybe <- 0x8500a4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P5460: !DWST [11] (maybe <- 0x8500a5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P5461: !NOP (Int)
nop

P5462: !DWST [15] (maybe <- 0x8500a6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P5463: !DWLD [6] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P5464: !ST [5] (maybe <- 0x8500a7) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5465: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P5466: !ST [0] (maybe <- 0x8500a8) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P5467: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5468: !CASX [13] (maybe <- 0x8500a9) (Int)
add %i3, 64, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5469: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5470: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5471: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5472: !DWST [2] (maybe <- 0x8500aa) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P5473: !MEMBAR (Int)
membar #StoreLoad

P5474: !DWLD [13] (Int)
ldx [%i3 + 64], %o4
! move %o4(upper) -> %o4(upper)

P5475: !CAS [15] (maybe <- 0x8500ab) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5476: !DWST [11] (maybe <- 0x8500ac) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P5477: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5478: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5479: !CASX [12] (maybe <- 0x8500ad) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5480: !SWAP [4] (maybe <- 0x8500ae) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5481: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P5482: !CASX [6] (maybe <- 0x8500af) (Int)
add %i1, 80, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5483: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P5484: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5485: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0

P5486: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P5487: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5488: !NOP (Int)
nop

P5489: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5490: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5491: !CASX [7] (maybe <- 0x8500b1) (Int)
add %i1, 80, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P5492: !LD [10] (Int)
lduw [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5493: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5494: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P5495: !CAS [11] (maybe <- 0x8500b3) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5496: !DWST [9] (maybe <- 0x8500b4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P5497: !ST [8] (maybe <- 0x8500b5) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P5498: !DWST [14] (maybe <- 0x8500b6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5499: !MEMBAR (Int)
membar #StoreLoad

P5500: !ST [11] (maybe <- 0x8500b7) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P5501: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5502: !DWST [1] (maybe <- 0x8500b8) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5503: !DWST [11] (maybe <- 0x8500ba) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P5504: !CASX [8] (maybe <- 0x8500bb) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P5505: !ST [8] (maybe <- 0x8500bc) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P5506: !CASX [12] (maybe <- 0x8500bd) (Int)
add %i3, 0, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P5507: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5508: !ST [5] (maybe <- 0x8500be) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5509: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5510: !DWST [7] (maybe <- 0x8500bf) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5511: !SWAP [4] (maybe <- 0x8500c1) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P5512: !CASX [13] (maybe <- 0x8500c2) (Int)
add %i3, 64, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P5513: !DWST [0] (maybe <- 0x48a00060) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P5514: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5515: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5516: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P5517: !ST [12] (maybe <- 0x8500c3) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P5518: !DWST [13] (maybe <- 0x8500c4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5519: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5520: !ST [5] (maybe <- 0x8500c5) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5521: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P5522: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P5523: !DWST [1] (maybe <- 0x8500c6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5524: !LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5525: !ST [6] (maybe <- 0x8500c8) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P5526: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P5527: !LD [4] (Int)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5528: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5529: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P5530: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5531: !DWLD [2] (Int)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5532: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5533: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P5534: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P5535: !CAS [0] (maybe <- 0x8500c9) (Int)
add %i0, 0, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P5536: !CASX [8] (maybe <- 0x8500ca) (Int)
add %i1, 256, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5537: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5538: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5539: !ST [15] (maybe <- 0x8500cb) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P5540: !SWAP [12] (maybe <- 0x8500cc) (Int)
mov %l4, %o4
swap  [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5541: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5542: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5543: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5544: !DWST [13] (maybe <- 0x8500cd) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5545: !DWST [13] (maybe <- 0x8500ce) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5546: !SWAP [11] (maybe <- 0x8500cf) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P5547: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5548: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5549: !DWST [10] (maybe <- 0x8500d0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P5550: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P5551: !DWST [3] (maybe <- 0x8500d1) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P5552: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5553: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P5554: !DWST [15] (maybe <- 0x48a000a0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P5555: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5556: !LD [3] (FP)
ld [%i0 + 32], %f10
! 1 addresses covered

P5557: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5558: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P5559: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5560: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P5561: !CAS [1] (maybe <- 0x8500d2) (Int)
add %i0, 4, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P5562: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5563: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5564: !ST [14] (maybe <- 0x8500d3) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P5565: !ST [12] (maybe <- 0x48a000c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P5566: !DWLD [14] (Int)
ldx [%i3 + 128], %o0
! move %o0(upper) -> %o0(upper)

P5567: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P5568: !DWLD [8] (Int)
ldx [%i1 + 256], %o1
! move %o1(upper) -> %o1(upper)

P5569: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P5570: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5571: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P5572: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5573: !DWST [1] (maybe <- 0x8500d4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5574: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5575: !DWST [1] (maybe <- 0x48a000e0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P5576: !ST [3] (maybe <- 0x8500d6) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P5577: !CASX [10] (maybe <- 0x8500d7) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P5578: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P5579: !CAS [8] (maybe <- 0x8500d8) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P5580: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5581: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P5582: !DWLD [3] (FP)
! case fp 
ldd  [%i0 + 32], %f18
! 1 addresses covered
fmovs %f18, %f11

P5583: !DWST [3] (maybe <- 0x8500d9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P5584: !DWLD [5] (Int)
ldx [%i1 + 72], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5585: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P5586: !DWST [15] (maybe <- 0x8500da) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P5587: !DWST [15] (maybe <- 0x8500db) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P5588: !ST [4] (maybe <- 0x48a00120) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P5589: !CASX [14] (maybe <- 0x8500dc) (Int)
add %i3, 128, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5590: !DWST [3] (maybe <- 0x8500dd) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P5591: !DWST [5] (maybe <- 0x8500de) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P5592: !CAS [3] (maybe <- 0x8500df) (Int)
add %i0, 32, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P5593: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P5594: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P5595: !CAS [7] (maybe <- 0x8500e0) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5596: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5597: !CASX [15] (maybe <- 0x8500e1) (Int)
add %i3, 192, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P5598: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P5599: !LD [8] (FP)
ld [%i1 + 256], %f12
! 1 addresses covered

P5600: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5601: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P5602: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P5603: !CASX [10] (maybe <- 0x8500e2) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5604: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P5605: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P5606: !ST [4] (maybe <- 0x8500e3) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P5607: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5608: !CAS [9] (maybe <- 0x8500e4) (Int)
add %i1, 512, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5609: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5610: !MEMBAR (Int)
membar #StoreLoad

P5611: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P5612: !DWLD [9] (Int)
ldx [%i1 + 512], %o0
! move %o0(upper) -> %o0(upper)

P5613: !CASX [8] (maybe <- 0x8500e5) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5614: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5615: !CASX [4] (maybe <- 0x8500e6) (Int)
add %i0, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P5616: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5617: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5618: !SWAP [13] (maybe <- 0x8500e7) (Int)
mov %l4, %o0
swap  [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5619: !ST [0] (maybe <- 0x8500e8) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P5620: !DWST [1] (maybe <- 0x8500e9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5621: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P5622: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5623: !CAS [8] (maybe <- 0x8500eb) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5624: !MEMBAR (Int)
membar #StoreLoad

P5625: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P5626: !DWLD [0] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f13
fmovs %f19, %f14

P5627: !DWST [8] (maybe <- 0x48a00140) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 256]

P5628: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P5629: !DWST [8] (maybe <- 0x8500ec) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P5630: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P5631: !ST [5] (maybe <- 0x8500ed) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5632: !SWAP [10] (maybe <- 0x8500ee) (Int)
mov %l4, %o4
swap  [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5633: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5634: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P5635: !ST [11] (maybe <- 0x8500ef) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P5636: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P5637: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0

P5638: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P5639: !DWLD [13] (Int)
ldx [%i3 + 64], %o2
! move %o2(upper) -> %o2(upper)

P5640: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P5641: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5642: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5643: !SWAP [4] (maybe <- 0x8500f0) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5644: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5645: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5646: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P5647: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5648: !CAS [12] (maybe <- 0x8500f1) (Int)
add %i3, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5649: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5650: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5651: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P5652: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5653: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P5654: !DWST [11] (maybe <- 0x8500f2) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P5655: !DWST [15] (maybe <- 0x8500f3) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P5656: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P5657: !MEMBAR (Int)
membar #StoreLoad

P5658: !DWST [0] (maybe <- 0x8500f4) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5659: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P5660: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5661: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P5662: !ST [3] (maybe <- 0x8500f6) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P5663: !MEMBAR (Int)
membar #StoreLoad

P5664: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5665: !MEMBAR (Int)
membar #StoreLoad

P5666: !ST [2] (maybe <- 0x8500f7) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P5667: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5668: !CAS [7] (maybe <- 0x8500f8) (Int)
add %i1, 84, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P5669: !MEMBAR (Int)
membar #StoreLoad

P5670: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P5671: !DWST [6] (maybe <- 0x8500f9) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5672: !MEMBAR (Int)
membar #StoreLoad

P5673: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5674: !CAS [7] (maybe <- 0x8500fb) (Int)
add %i1, 84, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P5675: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5676: !CASX [7] (maybe <- 0x8500fc) (Int)
add %i1, 80, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P5677: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5678: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5679: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P5680: !CAS [10] (maybe <- 0x8500fe) (Int)
add %i2, 32, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5681: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5682: !MEMBAR (Int)
membar #StoreLoad

P5683: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P5684: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P5685: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P5686: !LD [5] (FP)
ld [%i1 + 76], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P5687: !DWLD [7] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5688: !MEMBAR (Int)
membar #StoreLoad

P5689: !DWST [10] (maybe <- 0x8500ff) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P5690: !DWLD [2] (Int)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5691: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P5692: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5693: !CAS [1] (maybe <- 0x850100) (Int)
add %i0, 4, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P5694: !LD [4] (Int)
lduw [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5695: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P5696: !DWST [3] (maybe <- 0x48a00160) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P5697: !CASX [7] (maybe <- 0x850101) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P5698: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5699: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P5700: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5701: !NOP (Int)
nop

P5702: !ST [8] (maybe <- 0x850103) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P5703: !SWAP [12] (maybe <- 0x850104) (Int)
mov %l4, %o0
swap  [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5704: !MEMBAR (Int)
membar #StoreLoad

P5705: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P5706: !MEMBAR (Int)
membar #StoreLoad

P5707: !CAS [12] (maybe <- 0x850105) (Int)
add %i3, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5708: !ST [13] (maybe <- 0x850106) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P5709: !LD [9] (FP)
ld [%i1 + 512], %f0
! 1 addresses covered

P5710: !ST [7] (maybe <- 0x850107) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P5711: !CAS [0] (maybe <- 0x850108) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P5712: !ST [5] (maybe <- 0x850109) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5713: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5714: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5715: !ST [5] (maybe <- 0x85010a) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5716: !MEMBAR (Int)
membar #StoreLoad

P5717: !ST [10] (maybe <- 0x85010b) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P5718: !DWLD [1] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5719: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P5720: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P5721: !LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5722: !MEMBAR (Int)
membar #StoreLoad

P5723: !MEMBAR (Int)
membar #StoreLoad

P5724: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P5725: !MEMBAR (Int)
membar #StoreLoad

P5726: !DWST [8] (maybe <- 0x85010c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P5727: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5728: !DWLD [15] (Int)
ldx [%i3 + 192], %o1
! move %o1(upper) -> %o1(upper)

P5729: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5730: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P5731: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5732: !DWST [2] (maybe <- 0x85010d) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P5733: !ST [6] (maybe <- 0x85010e) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P5734: !ST [8] (maybe <- 0x85010f) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P5735: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5736: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5737: !DWST [2] (maybe <- 0x850110) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P5738: !CAS [6] (maybe <- 0x850111) (Int)
add %i1, 80, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P5739: !CASX [14] (maybe <- 0x850112) (Int)
add %i3, 128, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P5740: !MEMBAR (Int)
membar #StoreLoad

P5741: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5742: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P5743: !DWST [13] (maybe <- 0x850113) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5744: !CAS [14] (maybe <- 0x850114) (Int)
add %i3, 128, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P5745: !SWAP [9] (maybe <- 0x850115) (Int)
mov %l4, %o2
swap  [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5746: !ST [0] (maybe <- 0x850116) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P5747: !MEMBAR (Int)
membar #StoreLoad

P5748: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P5749: !DWST [9] (maybe <- 0x850117) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P5750: !DWST [6] (maybe <- 0x850118) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5751: !NOP (Int)
nop

P5752: !ST [14] (maybe <- 0x85011a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P5753: !MEMBAR (Int)
membar #StoreLoad

P5754: !DWST [1] (maybe <- 0x85011b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5755: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P5756: !DWLD [14] (Int)
ldx [%i3 + 128], %o3
! move %o3(upper) -> %o3(upper)

P5757: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5758: !MEMBAR (Int)
membar #StoreLoad

P5759: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P5760: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5761: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5762: !DWST [13] (maybe <- 0x85011d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5763: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P5764: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5765: !ST [8] (maybe <- 0x85011e) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P5766: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5767: !SWAP [8] (maybe <- 0x85011f) (Int)
mov %l4, %o0
swap  [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5768: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P5769: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5770: !DWST [10] (maybe <- 0x850120) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P5771: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5772: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5773: !MEMBAR (Int)
membar #StoreLoad

P5774: !ST [4] (maybe <- 0x48a00180) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P5775: !CAS [0] (maybe <- 0x850121) (Int)
add %i0, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5776: !MEMBAR (Int)
membar #StoreLoad

P5777: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P5778: !MEMBAR (Int)
membar #StoreLoad

P5779: !DWST [14] (maybe <- 0x850122) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5780: !ST [8] (maybe <- 0x850123) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P5781: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5782: !CASX [3] (maybe <- 0x850124) (Int)
add %i0, 32, %l7
ldx [%l7], %o3
mov %o3, %l3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
sllx %l4, 32, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5783: !MEMBAR (Int)
membar #StoreLoad

P5784: !MEMBAR (Int)
membar #StoreLoad

P5785: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P5786: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0

P5787: !LD [14] (Int)
lduw [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5788: !CASX [10] (maybe <- 0x850125) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P5789: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5790: !ST [1] (maybe <- 0x850126) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P5791: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P5792: !CASX [10] (maybe <- 0x850127) (Int)
add %i2, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P5793: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5794: !DWST [14] (maybe <- 0x850128) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5795: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5796: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5797: !CASX [1] (maybe <- 0x850129) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5798: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P5799: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P5800: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5801: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P5802: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P5803: !ST [5] (maybe <- 0x85012b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5804: !ST [15] (maybe <- 0x85012c) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P5805: !LD [8] (FP)
ld [%i1 + 256], %f1
! 1 addresses covered

P5806: !ST [8] (maybe <- 0x85012d) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P5807: !SWAP [3] (maybe <- 0x85012e) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P5808: !CASX [1] (maybe <- 0x85012f) (Int)
add %i0, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P5809: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5810: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5811: !MEMBAR (Int)
membar #StoreLoad

P5812: !CASX [11] (maybe <- 0x850131) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P5813: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5814: !DWST [11] (maybe <- 0x850132) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P5815: !CASX [15] (maybe <- 0x850133) (Int)
add %i3, 192, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P5816: !DWST [8] (maybe <- 0x850134) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P5817: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5818: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5819: !ST [8] (maybe <- 0x850135) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P5820: !ST [3] (maybe <- 0x850136) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P5821: !DWST [13] (maybe <- 0x48a001a0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P5822: !LD [2] (FP)
ld [%i0 + 12], %f2
! 1 addresses covered

P5823: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P5824: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5825: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5826: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5827: !ST [5] (maybe <- 0x850137) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5828: !MEMBAR (Int)
membar #StoreLoad

P5829: !CAS [5] (maybe <- 0x850138) (Int)
add %i1, 76, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P5830: !DWLD [1] (FP)
! case fp 
ldd  [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f3
fmovs %f19, %f4

P5831: !DWST [14] (maybe <- 0x850139) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5832: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5833: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P5834: !ST [1] (maybe <- 0x85013a) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P5835: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5836: !MEMBAR (Int)
membar #StoreLoad

P5837: !ST [2] (maybe <- 0x85013b) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P5838: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5839: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5840: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5841: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f18
! 1 addresses covered
fmovs %f19, %f5

P5842: !CASX [6] (maybe <- 0x85013c) (Int)
add %i1, 80, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P5843: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5844: !MEMBAR (Int)
membar #StoreLoad

P5845: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P5846: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5847: !DWST [3] (maybe <- 0x85013e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P5848: !NOP (Int)
nop

P5849: !MEMBAR (Int)
membar #StoreLoad

P5850: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5851: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P5852: !ST [6] (maybe <- 0x48a001c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P5853: !SWAP [5] (maybe <- 0x85013f) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5854: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5855: !SWAP [3] (maybe <- 0x850140) (Int)
mov %l4, %o3
swap  [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P5856: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P5857: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5858: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P5859: !DWLD [10] (FP)
! case fp 
ldd  [%i2 + 32], %f6
! 1 addresses covered

P5860: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P5861: !MEMBAR (Int)
membar #StoreLoad

P5862: !MEMBAR (Int)
membar #StoreLoad

P5863: !ST [15] (maybe <- 0x850141) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P5864: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P5865: !SWAP [10] (maybe <- 0x850142) (Int)
mov %l4, %l6
swap  [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P5866: !ST [6] (maybe <- 0x850143) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P5867: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5868: !MEMBAR (Int)
membar #StoreLoad

P5869: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P5870: !ST [6] (maybe <- 0x850144) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P5871: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f18
! 1 addresses covered
fmovs %f18, %f7

P5872: !DWST [13] (maybe <- 0x850145) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5873: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P5874: !CASX [13] (maybe <- 0x850146) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P5875: !DWST [0] (maybe <- 0x850147) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5876: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5877: !DWLD [9] (Int)
ldx [%i1 + 512], %o0
! move %o0(upper) -> %o0(upper)

P5878: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5879: !CASX [1] (maybe <- 0x850149) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5880: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5881: !SWAP [7] (maybe <- 0x85014b) (Int)
mov %l4, %l6
swap  [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P5882: !LD [11] (Int)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5883: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5884: !SWAP [3] (maybe <- 0x85014c) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P5885: !LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5886: !CAS [8] (maybe <- 0x85014d) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5887: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P5888: !CASX [6] (maybe <- 0x85014e) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5889: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P5890: !ST [6] (maybe <- 0x850150) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P5891: !MEMBAR (Int)
membar #StoreLoad

P5892: !DWST [4] (maybe <- 0x850151) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P5893: !CAS [13] (maybe <- 0x850152) (Int)
add %i3, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P5894: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P5895: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5896: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5897: !SWAP [1] (maybe <- 0x850153) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P5898: !DWST [14] (maybe <- 0x850154) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P5899: !DWST [9] (maybe <- 0x850155) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P5900: !DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5901: !CAS [10] (maybe <- 0x850156) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P5902: !ST [5] (maybe <- 0x48a001e0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P5903: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5904: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P5905: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5906: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5907: !CASX [3] (maybe <- 0x850157) (Int)
add %i0, 32, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P5908: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5909: !ST [1] (maybe <- 0x850158) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P5910: !ST [8] (maybe <- 0x48a00200) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P5911: !ST [5] (maybe <- 0x850159) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P5912: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P5913: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5914: !CAS [2] (maybe <- 0x85015a) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5915: !SWAP [6] (maybe <- 0x85015b) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P5916: !ST [10] (maybe <- 0x48a00220) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P5917: !MEMBAR (Int)
membar #StoreLoad

P5918: !LD [4] (Int)
lduw [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5919: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P5920: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5921: !ST [14] (maybe <- 0x48a00240) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P5922: !ST [0] (maybe <- 0x85015c) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P5923: !CAS [1] (maybe <- 0x85015d) (Int)
add %i0, 4, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5924: !MEMBAR (Int)
membar #StoreLoad

P5925: !DWST [11] (maybe <- 0x85015e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P5926: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P5927: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P5928: !DWST [8] (maybe <- 0x85015f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P5929: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5930: !MEMBAR (Int)
membar #StoreLoad

P5931: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P5932: !ST [10] (maybe <- 0x48a00260) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P5933: !CASX [0] (maybe <- 0x850160) (Int)
add %i0, 0, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5934: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P5935: !DWLD [5] (FP)
! case fp 
ldd  [%i1 + 72], %f8
! 1 addresses covered
fmovs %f9, %f8

P5936: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5937: !DWST [6] (maybe <- 0x850162) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5938: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P5939: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P5940: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5941: !NOP (Int)
nop

P5942: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P5943: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P5944: !DWLD [13] (FP)
! case fp 
ldd  [%i3 + 64], %f18
! 1 addresses covered
fmovs %f18, %f9

P5945: !NOP (Int)
nop

P5946: !DWST [13] (maybe <- 0x850164) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5947: !ST [1] (maybe <- 0x48a00280) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P5948: !ST [13] (maybe <- 0x850165) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P5949: !DWST [13] (maybe <- 0x850166) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5950: !CAS [14] (maybe <- 0x850167) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P5951: !CAS [10] (maybe <- 0x850168) (Int)
add %i2, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5952: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5953: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P5954: !CAS [13] (maybe <- 0x850169) (Int)
add %i3, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P5955: !ST [3] (maybe <- 0x85016a) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P5956: !CAS [3] (maybe <- 0x85016b) (Int)
add %i0, 32, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P5957: !CASX [7] (maybe <- 0x85016c) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P5958: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5959: !DWST [7] (maybe <- 0x85016e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5960: !DWST [9] (maybe <- 0x850170) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P5961: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P5962: !SWAP [7] (maybe <- 0x850171) (Int)
mov %l4, %o0
swap  [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P5963: !DWST [4] (maybe <- 0x48a002a0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 64]

P5964: !DWST [12] (maybe <- 0x850172) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P5965: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5966: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5967: !ST [11] (maybe <- 0x850173) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P5968: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P5969: !DWST [8] (maybe <- 0x850174) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P5970: !CASX [0] (maybe <- 0x850175) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P5971: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P5972: !MEMBAR (Int)
membar #StoreLoad

P5973: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P5974: !ST [11] (maybe <- 0x850177) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P5975: !CASX [1] (maybe <- 0x850178) (Int)
add %i0, 0, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
add  %l4, 1, %l4
casx [%l7], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P5976: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5977: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P5978: !ST [12] (maybe <- 0x85017a) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P5979: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5980: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5981: !LD [2] (FP)
ld [%i0 + 12], %f10
! 1 addresses covered

P5982: !DWLD [10] (Int)
ldx [%i2 + 32], %o1
! move %o1(upper) -> %o1(upper)

P5983: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P5984: !MEMBAR (Int)
membar #StoreLoad

P5985: !CASX [8] (maybe <- 0x85017b) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P5986: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P5987: !CAS [13] (maybe <- 0x85017c) (Int)
add %i3, 64, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P5988: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5989: !DWST [0] (maybe <- 0x85017d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P5990: !DWST [6] (maybe <- 0x85017f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P5991: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P5992: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P5993: !ST [6] (maybe <- 0x48a002c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P5994: !CAS [1] (maybe <- 0x850181) (Int)
add %i0, 4, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P5995: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P5996: !DWST [13] (maybe <- 0x850182) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P5997: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P5998: !CASX [6] (maybe <- 0x850183) (Int)
add %i1, 80, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P5999: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6000: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6001: !ST [11] (maybe <- 0x850185) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P6002: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6003: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P6004: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P6005: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P6006: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P6007: !CAS [2] (maybe <- 0x850186) (Int)
add %i0, 12, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P6008: !MEMBAR (Int)
membar #StoreLoad

P6009: !SWAP [10] (maybe <- 0x850187) (Int)
mov %l4, %l6
swap  [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P6010: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P6011: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6012: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P6013: !MEMBAR (Int)
membar #StoreLoad

P6014: !ST [10] (maybe <- 0x850188) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P6015: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P6016: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6017: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6018: !CASX [2] (maybe <- 0x850189) (Int)
add %i0, 8, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %l4, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P6019: !ST [12] (maybe <- 0x85018a) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P6020: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6021: !CAS [8] (maybe <- 0x85018b) (Int)
add %i1, 256, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P6022: !LD [9] (FP)
ld [%i1 + 512], %f11
! 1 addresses covered

P6023: !MEMBAR (Int)
membar #StoreLoad

P6024: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6025: !DWST [13] (maybe <- 0x85018c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P6026: !MEMBAR (Int)
membar #StoreLoad

P6027: !DWST [1] (maybe <- 0x85018d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P6028: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P6029: !DWST [9] (maybe <- 0x85018f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P6030: !LD [3] (Int)
lduw [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P6031: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P6032: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P6033: !SWAP [2] (maybe <- 0x850190) (Int)
mov %l4, %o1
swap  [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P6034: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6035: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P6036: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P6037: !MEMBAR (Int)
membar #StoreLoad

P6038: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P6039: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P6040: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P6041: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P6042: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3

P6043: !ST [14] (maybe <- 0x850191) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P6044: !DWST [6] (maybe <- 0x850192) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P6045: !DWLD [13] (Int)
ldx [%i3 + 64], %o4
! move %o4(upper) -> %o4(upper)

P6046: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P6047: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P6048: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P6049: !DWST [0] (maybe <- 0x850194) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P6050: !DWLD [10] (Int)
ldx [%i2 + 32], %o2
! move %o2(upper) -> %o2(upper)

P6051: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6052: !DWST [12] (maybe <- 0x850196) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P6053: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P6054: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P6055: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6056: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P6057: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6058: !CASX [5] (maybe <- 0x850197) (Int)
add %i1, 72, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P6059: !ST [10] (maybe <- 0x850198) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P6060: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6061: !CAS [4] (maybe <- 0x850199) (Int)
add %i0, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P6062: !SWAP [2] (maybe <- 0x85019a) (Int)
mov %l4, %o2
swap  [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P6063: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P6064: !LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P6065: !CAS [8] (maybe <- 0x85019b) (Int)
add %i1, 256, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o3(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P6066: !DWST [1] (maybe <- 0x85019c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P6067: !NOP (Int)
nop

P6068: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P6069: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P6070: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P6071: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P6072: !ST [11] (maybe <- 0x85019e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P6073: !ST [3] (maybe <- 0x85019f) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P6074: !DWST [2] (maybe <- 0x8501a0) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P6075: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P6076: !DWLD [10] (Int)
ldx [%i2 + 32], %o1
! move %o1(upper) -> %o1(upper)

P6077: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6078: !SWAP [0] (maybe <- 0x8501a1) (Int)
mov %l4, %l6
swap  [%i0 + 0], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P6079: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P6080: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6081: !MEMBAR (Int)
membar #StoreLoad

P6082: !CASX [4] (maybe <- 0x8501a2) (Int)
add %i0, 64, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P6083: !ST [1] (maybe <- 0x8501a3) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P6084: !MEMBAR (Int)
membar #StoreLoad

P6085: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P6086: !DWST [2] (maybe <- 0x8501a4) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P6087: !CASX [5] (maybe <- 0x8501a5) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P6088: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P6089: !DWST [8] (maybe <- 0x8501a6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P6090: !LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P6091: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P6092: !MEMBAR (Int)
membar #StoreLoad

P6093: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6094: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6095: !DWST [5] (maybe <- 0x8501a7) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P6096: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P6097: !DWLD [12] (Int)
ldx [%i3 + 0], %o4
! move %o4(upper) -> %o4(upper)

P6098: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6099: !ST [2] (maybe <- 0x8501a8) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P6100: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P6101: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P6102: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P6103: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P6104: !LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P6105: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6106: !SWAP [15] (maybe <- 0x8501a9) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P6107: !MEMBAR (Int)
membar #StoreLoad

P6108: !LD [0] (FP)
ld [%i0 + 0], %f12
! 1 addresses covered

P6109: !LD [1] (FP)
ld [%i0 + 4], %f13
! 1 addresses covered

P6110: !LD [2] (FP)
ld [%i0 + 12], %f14
! 1 addresses covered

P6111: !LD [3] (FP)
ld [%i0 + 32], %f15
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P6112: !LD [4] (FP)
ld [%i0 + 64], %f0
! 1 addresses covered

P6113: !LD [5] (FP)
ld [%i1 + 76], %f1
! 1 addresses covered

P6114: !LD [6] (FP)
ld [%i1 + 80], %f2
! 1 addresses covered

P6115: !LD [7] (FP)
ld [%i1 + 84], %f3
! 1 addresses covered

P6116: !LD [8] (FP)
ld [%i1 + 256], %f4
! 1 addresses covered

P6117: !LD [9] (FP)
ld [%i1 + 512], %f5
! 1 addresses covered

P6118: !LD [10] (FP)
ld [%i2 + 32], %f6
! 1 addresses covered

P6119: !LD [11] (FP)
ld [%i2 + 64], %f7
! 1 addresses covered

P6120: !LD [12] (FP)
ld [%i3 + 0], %f8
! 1 addresses covered

P6121: !LD [13] (FP)
ld [%i3 + 64], %f9
! 1 addresses covered

P6122: !LD [14] (FP)
ld [%i3 + 128], %f10
! 1 addresses covered

P6123: !LD [15] (FP)
ld [%i3 + 192], %f11
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
!---- flushing fp results buffer, offset 0 ----
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



func6:

! 1000 instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
srlx %i0, 6, %i0
sllx %i0, 6, %i0

add %i1, 63, %i1
srlx %i1, 6, %i1
sllx %i1, 6, %i1

add %i2, 63, %i2
srlx %i2, 6, %i2
sllx %i2, 6, %i2

add %i3, 63, %i3
srlx %i3, 6, %i3
sllx %i3, 6, %i3

add %i4, 63, %i4
srlx %i4, 6, %i4
sllx %i4, 6, %i4

add %i5, 63, %i5
srlx %i5, 6, %i5
sllx %i5, 6, %i5

mov   %i4, %l1
add   %i5, 1408, %l5

! Initialize %o7, the pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
addx  %o7, %l1, %o7 

! Initializing %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%l5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%l5+4]
ldd [%l5], %f0
ldd [%l5], %f2
ldd [%l5], %f4
ldd [%l5], %f6
ldd [%l5], %f8
ldd [%l5], %f10
ldd [%l5], %f12
ldd [%l5], %f14
ldd [%l5], %f16
ldd [%l5], %f18
ldd [%l5], %f20
ldd [%l5], %f22
ldd [%l5], %f24
ldd [%l5], %f26
ldd [%l5], %f28
ldd [%l5], %f30
ldd [%l5], %f32
ldd [%l5], %f34
ldd [%l5], %f36
ldd [%l5], %f38
ldd [%l5], %f40
ldd [%l5], %f42
ldd [%l5], %f44
ldd [%l5], %f46
ldd [%l5], %f48
ldd [%l5], %f50
ldd [%l5], %f52
ldd [%l5], %f54
ldd [%l5], %f56
ldd [%l5], %f58
ldd [%l5], %f60
ldd [%l5], %f62

! Initializing int results buffer registers: %o0 %o1 %o2 %o3 %o4 
mov %g0, %o0
mov %g0, %o1
mov %g0, %o2
mov %g0, %o3
mov %g0, %o4

! Signature for extract_loads
sethi %hi(0x06deade1), %l7
or    %l7, %lo(0x06deade1), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize integer counter 
sethi %hi(0x860001), %l4
or    %l4, %lo(0x860001), %l4

! Initialize FP counter 
sethi %hi(0x48bfff60), %l7
or    %l7, %lo(0x48bfff60), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize FP counter increment value 
sethi %hi(0x3f800000), %l7
or    %l7, %lo(0x3f800000), %l7
stw %l7, [%l5] 
ld [%l5], %f17 

P6124: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P6125: !CASX [14] (maybe <- 0x860001) (Int)
add %i3, 128, %l7
ldx [%l7], %o0
mov %o0, %l3
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
sllx %l4, 32, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P6126: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P6127: !DWST [2] (maybe <- 0x860002) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P6128: !CAS [10] (maybe <- 0x860003) (Int)
add %i2, 32, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P6129: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P6130: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6131: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6132: !CASX [8] (maybe <- 0x860004) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P6133: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P6134: !ST [0] (maybe <- 0x860005) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P6135: !CASX [0] (maybe <- 0x860006) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P6136: !CASX [9] (maybe <- 0x860008) (Int)
add %i1, 512, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P6137: !MEMBAR (Int)
membar #StoreLoad

P6138: !SWAP [1] (maybe <- 0x860009) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P6139: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6140: !CAS [13] (maybe <- 0x86000a) (Int)
add %i3, 64, %l7
lduw [%l7], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P6141: !DWLD [12] (Int)
ldx [%i3 + 0], %o2
! move %o2(upper) -> %o2(upper)

P6142: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P6143: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P6144: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P6145: !CASX [15] (maybe <- 0x86000b) (Int)
add %i3, 192, %l7
ldx [%l7], %o4
mov %o4, %l3
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
casx [%l7], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P6146: !DWST [14] (maybe <- 0x86000c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P6147: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P6148: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1

P6149: !ST [12] (maybe <- 0x86000d) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P6150: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P6151: !DWLD [10] (FP)
! case fp 
ldd  [%i2 + 32], %f0
! 1 addresses covered

P6152: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P6153: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6154: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P6155: !CAS [10] (maybe <- 0x86000e) (Int)
add %i2, 32, %l7
lduw [%l7], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P6156: !CAS [12] (maybe <- 0x86000f) (Int)
add %i3, 0, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P6157: !MEMBAR (Int)
membar #StoreLoad

P6158: !DWST [14] (maybe <- 0x860010) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P6159: !SWAP [11] (maybe <- 0x860011) (Int)
mov %l4, %o4
swap  [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P6160: !DWST [6] (maybe <- 0x860012) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P6161: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P6162: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P6163: !NOP (Int)
nop

P6164: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P6165: !DWST [9] (maybe <- 0x48bfff60) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P6166: !ST [6] (maybe <- 0x860014) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P6167: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6168: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P6169: !CASX [5] (maybe <- 0x860015) (Int)
add %i1, 72, %l7
ldx [%l7], %o1
mov %o1, %l3
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %l4, %o2
add  %l4, 1, %l4
casx [%l7], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P6170: !CAS [15] (maybe <- 0x860016) (Int)
add %i3, 192, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P6171: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P6172: !CAS [10] (maybe <- 0x860017) (Int)
add %i2, 32, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P6173: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P6174: !CAS [14] (maybe <- 0x860018) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P6175: !ST [11] (maybe <- 0x860019) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P6176: !ST [7] (maybe <- 0x86001a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P6177: !CASX [3] (maybe <- 0x86001b) (Int)
add %i0, 32, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P6178: !CASX [11] (maybe <- 0x86001c) (Int)
add %i2, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P6179: !ST [0] (maybe <- 0x48bfff80) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P6180: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P6181: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6182: !DWST [13] (maybe <- 0x86001d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P6183: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P6184: !DWST [13] (maybe <- 0x86001e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P6185: !ST [15] (maybe <- 0x86001f) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P6186: !MEMBAR (Int)
membar #StoreLoad

P6187: !ST [10] (maybe <- 0x860020) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P6188: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6189: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P6190: !MEMBAR (Int)
membar #StoreLoad

P6191: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P6192: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P6193: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P6194: !DWST [2] (maybe <- 0x860021) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P6195: !MEMBAR (Int)
membar #StoreLoad

P6196: !SWAP [1] (maybe <- 0x860022) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P6197: !SWAP [7] (maybe <- 0x860023) (Int)
mov %l4, %o2
swap  [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P6198: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P6199: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P6200: !DWLD [2] (Int)
ldx [%i0 + 8], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P6201: !ST [4] (maybe <- 0x860024) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P6202: !CASX [5] (maybe <- 0x860025) (Int)
add %i1, 72, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P6203: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P6204: !LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P6205: !CAS [15] (maybe <- 0x860026) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P6206: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P6207: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6208: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P6209: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P6210: !DWST [2] (maybe <- 0x860027) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P6211: !CASX [1] (maybe <- 0x860028) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P6212: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P6213: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P6214: !DWST [15] (maybe <- 0x86002a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P6215: !ST [1] (maybe <- 0x86002b) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P6216: !DWST [13] (maybe <- 0x86002c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P6217: !MEMBAR (Int)
membar #StoreLoad

P6218: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P6219: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P6220: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P6221: !DWST [9] (maybe <- 0x48bfffa0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P6222: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6223: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6224: !DWST [3] (maybe <- 0x86002d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P6225: !DWLD [9] (Int)
ldx [%i1 + 512], %o0
! move %o0(upper) -> %o0(upper)

P6226: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P6227: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6228: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P6229: !LD [14] (FP)
ld [%i3 + 128], %f1
! 1 addresses covered

P6230: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P6231: !ST [13] (maybe <- 0x48bfffc0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P6232: !MEMBAR (Int)
membar #StoreLoad

P6233: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P6234: !DWST [0] (maybe <- 0x86002e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P6235: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P6236: !CAS [4] (maybe <- 0x860030) (Int)
add %i0, 64, %l7
lduw [%l7], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P6237: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P6238: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P6239: !CAS [11] (maybe <- 0x860031) (Int)
add %i2, 64, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o0(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P6240: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6241: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P6242: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6243: !MEMBAR (Int)
membar #StoreLoad

P6244: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P6245: !DWLD [1] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P6246: !DWST [14] (maybe <- 0x860032) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P6247: !LD [10] (Int)
lduw [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P6248: !ST [1] (maybe <- 0x860033) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P6249: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P6250: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6251: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P6252: !MEMBAR (Int)
membar #StoreLoad

P6253: !CASX [1] (maybe <- 0x860034) (Int)
add %i0, 0, %l7
ldx [%l7], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l3
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P6254: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P6255: !ST [6] (maybe <- 0x860036) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P6256: !DWST [9] (maybe <- 0x48bfffe0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P6257: !SWAP [14] (maybe <- 0x860037) (Int)
mov %l4, %o1
swap  [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P6258: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P6259: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P6260: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P6261: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6262: !DWST [13] (maybe <- 0x860038) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P6263: !SWAP [4] (maybe <- 0x860039) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P6264: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P6265: !ST [6] (maybe <- 0x86003a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P6266: !ST [0] (maybe <- 0x86003b) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P6267: !ST [8] (maybe <- 0x86003c) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P6268: !NOP (Int)
nop

P6269: !CASX [8] (maybe <- 0x86003d) (Int)
add %i1, 256, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P6270: !ST [6] (maybe <- 0x86003e) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P6271: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P6272: !DWST [3] (maybe <- 0x86003f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P6273: !DWST [0] (maybe <- 0x860040) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P6274: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P6275: !ST [7] (maybe <- 0x860042) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P6276: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P6277: !CAS [15] (maybe <- 0x860043) (Int)
add %i3, 192, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o1(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P6278: !DWST [15] (maybe <- 0x48c00000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P6279: !CAS [14] (maybe <- 0x860044) (Int)
add %i3, 128, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o2(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P6280: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P6281: !MEMBAR (Int)
membar #StoreLoad

P6282: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P6283: !DWST [12] (maybe <- 0x860045) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P6284: !ST [1] (maybe <- 0x860046) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P6285: !DWST [2] (maybe <- 0x860047) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P6286: !CAS [12] (maybe <- 0x860048) (Int)
add %i3, 0, %l7
lduw [%l7], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o4(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
add   %l4, 1, %l4

P6287: !DWST [12] (maybe <- 0x48c00020) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 0]

P6288: !DWST [7] (maybe <- 0x860049) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P6289: !MEMBAR (Int)
membar #StoreLoad

P6290: !DWST [9] (maybe <- 0x48c00040) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P6291: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P6292: !CASX [6] (maybe <- 0x86004b) (Int)
add %i1, 80, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
add  %l4, 1, %l4
casx [%l7], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P6293: !ST [12] (maybe <- 0x86004d) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P6294: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P6295: !CASX [12] (maybe <- 0x86004e) (Int)
add %i3, 0, %l7
ldx [%l7], %o2
mov %o2, %l3
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
sllx %l4, 32, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P6296: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6297: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P6298: !CAS [12] (maybe <- 0x86004f) (Int)
add %i3, 0, %l7
lduw [%l7], %l6
mov %l6, %l3
! move %l3(lower) -> %o4(lower)
sllx %l3, 32, %l6
srlx %l6, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5
mov %l4, %o0
cas [%l7], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P6299: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P6300: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6301: !ST [1] (maybe <- 0x48c00060) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P6302: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P6303: !ST [5] (maybe <- 0x860050) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P6304: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P6305: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P6306: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P6307: !ST [10] (maybe <- 0x860051) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P6308: !ST [7] (maybe <- 0x860052) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P6309: !ST [10] (maybe <- 0x48c00080) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P6310: !CASX [7] (maybe <- 0x860053) (Int)
add %i1, 80, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
add  %l4, 1, %l4
casx [%l7], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P6311: !DWLD [1] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P6312: !CAS [8] (maybe <- 0x860055) (Int)
add %i1, 256, %l7
lduw [%l7], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %l6
cas [%l7], %l3, %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P6313: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P6314: !DWST [15] (maybe <- 0x860056) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P6315: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6316: !LD [4] (Int)
lduw [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P6317: !NOP (Int)
nop

P6318: !MEMBAR (Int)
membar #StoreLoad

P6319: !CASX [13] (maybe <- 0x860057) (Int)
add %i3, 64, %l7
ldx [%l7], %l6
mov %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
sllx %l4, 32, %l6
add  %l4, 1, %l4
casx [%l7], %l3, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P6320: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6321: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P6322: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P6323: !DWLD [7] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P6324: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P6325: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
add %i3, %l6, %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P6326: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P6327: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P6328: !DWLD [1] (Int)
ldx [%i0 + 0], %o1

add %i0, 0, %l7