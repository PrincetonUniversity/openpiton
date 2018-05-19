// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsotool_diag5_050903.s
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
! GEN.EGI_FILE 
! GEN.TEST_NAME diag
! GEN.N_PROCS 8
! GEN.N_INSTR_PER_PROC 500
! GEN.AVG_LOOP_SIZE 512
! GEN.AVG_LOOP_ITER 10
! GEN.SEED 0
! ADMAP.REGION_SIZE 64
! ADMAP.REGION_OFFSETS 0-4-12-32-64,76-80-84-256-512,32-64,0-64-128-192
! ADMAP.NC_REGIONS 0x1
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
! WT.BLD 100
! WT.DWLD 10
! WT.QWLD 0
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

! 500 instruction sequence begins
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

P1: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2: !BST [0] (maybe <- 0x3f800000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3: !BST [6] (maybe <- 0x40a00000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4: !BST [3] (maybe <- 0x41000000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P5: !BST [11] (maybe <- 0x41400000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P6: !REPLACEMENT [10] (Int)
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

P7: !BST [5] (maybe <- 0x41500000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P8: !BST [0] (maybe <- 0x41800000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P9: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P10: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P11: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P12: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P13: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P14: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P15: !DWST [6] (maybe <- 0x800001) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P16: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P17: !BST [12] (maybe <- 0x41a00000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P18: !REPLACEMENT [2] (Int)
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

P19: !MEMBAR (Int)
membar #StoreLoad

P20: !BST [0] (maybe <- 0x41a80000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P21: !BST [14] (maybe <- 0x41c80000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P22: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P23: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P24: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P25: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P26: !BST [14] (maybe <- 0x41d00000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P27: !BST [3] (maybe <- 0x41d80000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P28: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P29: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P30: !BST [13] (maybe <- 0x41f80000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P31: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P32: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P33: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P34: !BST [5] (maybe <- 0x42000000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P35: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P36: !REPLACEMENT [7] (Int)
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

P37: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0

P38: !BST [10] (maybe <- 0x420c0000) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P39: !BST [8] (maybe <- 0x42100000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P40: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P41: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P42: !BST [0] (maybe <- 0x42140000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P43: !BST [1] (maybe <- 0x42240000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P44: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P45: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P46: !ST [2] (maybe <- 0x800003) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P47: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P48: !BST [14] (maybe <- 0x42340000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P49: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P50: !BST [7] (maybe <- 0x42380000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P51: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P52: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P53: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P54: !ST [8] (maybe <- 0x800004) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P55: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P56: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P57: !ST [5] (maybe <- 0x800005) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P58: !BST [2] (maybe <- 0x42440000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P59: !BST [14] (maybe <- 0x42540000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P60: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P61: !ST [15] (maybe <- 0x42580000) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P62: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P63: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P64: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P65: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P66: !BST [0] (maybe <- 0x425c0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P67: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P68: !ST [5] (maybe <- 0x800006) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P69: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P70: !DWST [0] (maybe <- 0x800007) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P71: !DWST [14] (maybe <- 0x800009) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P72: !BST [7] (maybe <- 0x426c0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P73: !BST [15] (maybe <- 0x42780000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P74: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P75: !BST [4] (maybe <- 0x427c0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P76: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P77: !LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P78: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P79: !BST [2] (maybe <- 0x42800000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P80: !BST [8] (maybe <- 0x42880000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P81: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P82: !BST [0] (maybe <- 0x428a0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P83: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P84: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P85: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P86: !CAS [7] (maybe <- 0x80000a) (Int)
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

P87: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P88: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P89: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P90: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P91: !SWAP [5] (maybe <- 0x80000b) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P92: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P93: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P94: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P95: !BST [10] (maybe <- 0x42920000) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P96: !BST [11] (maybe <- 0x42940000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P97: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P98: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P99: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P100: !DWLD [5] (Int)
ldx [%i1 + 72], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P101: !BST [6] (maybe <- 0x42960000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P102: !CASX [2] (maybe <- 0x80000c) (Int)
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

P103: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P104: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P105: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P106: !BST [13] (maybe <- 0x429c0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P107: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P108: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P109: !BST [8] (maybe <- 0x429e0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P110: !BST [7] (maybe <- 0x42a00000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P111: !BST [3] (maybe <- 0x42a60000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P112: !BST [8] (maybe <- 0x42ae0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P113: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P114: !MEMBAR (Int)
membar #StoreLoad

P115: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P116: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P117: !BST [11] (maybe <- 0x42b00000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P118: !BST [15] (maybe <- 0x42b20000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P119: !BST [11] (maybe <- 0x42b40000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P120: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P121: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P122: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P123: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P124: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P125: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P126: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P127: !DWLD [4] (Int)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

P128: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P129: !BST [1] (maybe <- 0x42b60000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P130: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P131: !BST [7] (maybe <- 0x42be0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P132: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P133: !BST [12] (maybe <- 0x42c40000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P134: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l7
or %l7, %o2, %o2

P135: !CAS [8] (maybe <- 0x80000d) (Int)
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

P136: !BST [15] (maybe <- 0x42c60000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P137: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P138: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P139: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P140: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P141: !BST [10] (maybe <- 0x42c80000) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P142: !CAS [12] (maybe <- 0x80000e) (Int)
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

P143: !REPLACEMENT [4] (Int)
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

P144: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P145: !DWST [6] (maybe <- 0x80000f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P146: !BST [15] (maybe <- 0x42ca0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P147: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P148: !BST [14] (maybe <- 0x42cc0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P149: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P150: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P151: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P152: !DWST [2] (maybe <- 0x42ce0000) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 8]

P153: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P154: !ST [10] (maybe <- 0x800011) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P155: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P156: !BST [0] (maybe <- 0x42d00000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P157: !BST [5] (maybe <- 0x42d80000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P158: !ST [10] (maybe <- 0x800012) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P159: !BST [13] (maybe <- 0x42de0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P160: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P161: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P162: !BST [12] (maybe <- 0x42e00000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P163: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P164: !BST [1] (maybe <- 0x42e20000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P165: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0

P166: !BST [9] (maybe <- 0x42ea0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P167: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P168: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P169: !BST [14] (maybe <- 0x42ec0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P170: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P171: !BST [2] (maybe <- 0x42ee0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P172: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P173: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P174: !BST [9] (maybe <- 0x42f60000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P175: !ST [3] (maybe <- 0x800013) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P176: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P177: !ST [7] (maybe <- 0x800014) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P178: !ST [14] (maybe <- 0x800015) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P179: !BST [1] (maybe <- 0x42f80000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P180: !BST [3] (maybe <- 0x43000000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P181: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P182: !BST [5] (maybe <- 0x43040000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P183: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P184: !BST [12] (maybe <- 0x43070000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P185: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P186: !DWST [2] (maybe <- 0x43080000) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 8]

P187: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P188: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P189: !SWAP [15] (maybe <- 0x800016) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P190: !BST [3] (maybe <- 0x43090000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P191: !BST [9] (maybe <- 0x430d0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P192: !CASX [5] (maybe <- 0x800017) (Int)
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

P193: !REPLACEMENT [13] (Int)
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

P194: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P195: !BST [5] (maybe <- 0x430e0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P196: !DWST [11] (maybe <- 0x800018) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P197: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
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

P198: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P199: !BST [2] (maybe <- 0x43110000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P200: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P201: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P202: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P203: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P204: !ST [6] (maybe <- 0x800019) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P205: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P206: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P207: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P208: !CAS [9] (maybe <- 0x80001a) (Int)
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

P209: !BST [15] (maybe <- 0x43150000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P210: !BST [14] (maybe <- 0x43160000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P211: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P212: !ST [11] (maybe <- 0x80001b) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P213: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P214: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P215: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P216: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f18
! 1 addresses covered
fmovs %f18, %f1

P217: !BST [15] (maybe <- 0x43170000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P218: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P219: !BST [10] (maybe <- 0x43180000) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P220: !BST [4] (maybe <- 0x43190000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P221: !REPLACEMENT [10] (Int)
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

P222: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P223: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P224: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P225: !BST [7] (maybe <- 0x431a0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P226: !BST [0] (maybe <- 0x431d0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P227: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P228: !BST [5] (maybe <- 0x43210000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P229: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P230: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P231: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P232: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P233: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P234: !BST [11] (maybe <- 0x43240000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P235: !ST [0] (maybe <- 0x80001c) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P236: !BST [5] (maybe <- 0x43250000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P237: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P238: !DWST [2] (maybe <- 0x43280000) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 8]

P239: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P240: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P241: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P242: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P243: !BST [6] (maybe <- 0x43290000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P244: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P245: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P246: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P247: !BST [6] (maybe <- 0x432c0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P248: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P249: !BST [8] (maybe <- 0x432f0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P250: !BST [3] (maybe <- 0x43300000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P251: !DWLD [8] (FP)
! case fp 
ldd  [%i1 + 256], %f18
! 1 addresses covered
fmovs %f18, %f5

P252: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P253: !REPLACEMENT [0] (Int)
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

P254: !BST [2] (maybe <- 0x43340000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P255: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P256: !BST [14] (maybe <- 0x43380000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P257: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P258: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P259: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P260: !BST [14] (maybe <- 0x43390000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P261: !BST [0] (maybe <- 0x433a0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P262: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P263: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P264: !BST [15] (maybe <- 0x433e0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P265: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P266: !ST [2] (maybe <- 0x80001d) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P267: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P268: !BST [15] (maybe <- 0x433f0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P269: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P270: !BST [2] (maybe <- 0x43400000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P271: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P272: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P273: !BST [6] (maybe <- 0x43440000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P274: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P275: !BST [5] (maybe <- 0x43470000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P276: !BST [8] (maybe <- 0x434a0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P277: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P278: !DWLD [7] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P279: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P280: !BST [15] (maybe <- 0x434b0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P281: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P282: !BST [7] (maybe <- 0x434c0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P283: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P284: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P285: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P286: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P287: !REPLACEMENT [12] (Int)
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

P288: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P289: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P290: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P291: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P292: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P293: !BST [5] (maybe <- 0x434f0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P294: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P295: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P296: !ST [3] (maybe <- 0x80001e) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P297: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P298: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P299: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P300: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P301: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P302: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P303: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P304: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P305: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P306: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P307: !ST [15] (maybe <- 0x80001f) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P308: !BST [11] (maybe <- 0x43520000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P309: !BST [2] (maybe <- 0x43530000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P310: !DWST [10] (maybe <- 0x800020) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P311: !BST [1] (maybe <- 0x43570000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P312: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P313: !MEMBAR (Int)
membar #StoreLoad

P314: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P315: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P316: !BST [1] (maybe <- 0x435b0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P317: !BST [11] (maybe <- 0x435f0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P318: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P319: !CASX [10] (maybe <- 0x800021) (Int)
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

P320: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P321: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P322: !SWAP [6] (maybe <- 0x800022) (Int)
mov %l4, %o0
swap  [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P323: !BST [5] (maybe <- 0x43600000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P324: !BST [1] (maybe <- 0x43630000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P325: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P326: !REPLACEMENT [4] (Int)
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

P327: !BST [5] (maybe <- 0x43670000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P328: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P329: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P330: !BST [5] (maybe <- 0x436a0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P331: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P332: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P333: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P334: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P335: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P336: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P337: !MEMBAR (Int)
membar #StoreLoad

P338: !BST [7] (maybe <- 0x436d0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P339: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P340: !BST [13] (maybe <- 0x43700000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P341: !ST [2] (maybe <- 0x800023) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P342: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P343: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P344: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P345: !BST [7] (maybe <- 0x43710000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P346: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P347: !BST [1] (maybe <- 0x43740000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P348: !BST [9] (maybe <- 0x43780000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P349: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P350: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P351: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P352: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P353: !BST [15] (maybe <- 0x43790000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P354: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P355: !ST [8] (maybe <- 0x800024) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P356: !BST [8] (maybe <- 0x437a0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P357: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P358: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P359: !REPLACEMENT [2] (Int)
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

P360: !BST [9] (maybe <- 0x437b0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P361: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P362: !CASX [10] (maybe <- 0x800025) (Int)
add %i2, 32, %l7
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

P363: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P364: !BST [15] (maybe <- 0x437c0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P365: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P366: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P367: !BST [1] (maybe <- 0x437d0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P368: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P369: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P370: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P371: !BST [3] (maybe <- 0x43808000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P372: !BST [7] (maybe <- 0x43828000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P373: !BST [7] (maybe <- 0x43840000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P374: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P375: !BST [7] (maybe <- 0x43858000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P376: !ST [0] (maybe <- 0x800026) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P377: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P378: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P379: !BST [0] (maybe <- 0x43870000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P380: !BST [1] (maybe <- 0x43890000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P381: !BST [9] (maybe <- 0x438b0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P382: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P383: !BST [4] (maybe <- 0x438b8000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P384: !BST [10] (maybe <- 0x438c0000) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P385: !BST [8] (maybe <- 0x438c8000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P386: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P387: !BST [12] (maybe <- 0x438d0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P388: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P389: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P390: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P391: !BST [0] (maybe <- 0x438d8000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P392: !DWLD [9] (Int)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P393: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P394: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P395: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P396: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P397: !BST [11] (maybe <- 0x438f8000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P398: !BST [5] (maybe <- 0x43900000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P399: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P400: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P401: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P402: !BST [13] (maybe <- 0x43918000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P403: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P404: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P405: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P406: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P407: !REPLACEMENT [8] (Int)
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

P408: !BST [4] (maybe <- 0x43920000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P409: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P410: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P411: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P412: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P413: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P414: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P415: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P416: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P417: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P418: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P419: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P420: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P421: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P422: !BST [7] (maybe <- 0x43928000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P423: !BST [1] (maybe <- 0x43940000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P424: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P425: !CAS [14] (maybe <- 0x800027) (Int)
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

P426: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P427: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P428: !BST [1] (maybe <- 0x43960000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P429: !BST [2] (maybe <- 0x43980000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P430: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P431: !ST [6] (maybe <- 0x800028) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P432: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P433: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P434: !BST [9] (maybe <- 0x439a0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P435: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P436: !BST [11] (maybe <- 0x439a8000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P437: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P438: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P439: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P440: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P441: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P442: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P443: !BST [7] (maybe <- 0x439b0000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P444: !ST [13] (maybe <- 0x800029) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P445: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P446: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P447: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P448: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P449: !BST [0] (maybe <- 0x439c8000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P450: !ST [13] (maybe <- 0x80002a) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P451: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P452: !BST [10] (maybe <- 0x439e8000) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P453: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P454: !REPLACEMENT [0] (Int)
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

P455: !DWST [8] (maybe <- 0x80002b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P456: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P457: !BST [12] (maybe <- 0x439f0000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P458: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P459: !BST [7] (maybe <- 0x439f8000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P460: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P461: !DWLD [10] (Int)
ldx [%i2 + 32], %o1
! move %o1(upper) -> %o1(upper)

P462: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P463: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P464: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P465: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P466: !MEMBAR (Int)
membar #StoreLoad

P467: !BST [7] (maybe <- 0x43a10000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P468: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P469: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P470: !BST [1] (maybe <- 0x43a28000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P471: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P472: !REPLACEMENT [14] (Int)
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

P473: !BST [14] (maybe <- 0x43a48000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P474: !BST [2] (maybe <- 0x43a50000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P475: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P476: !DWST [12] (maybe <- 0x80002c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P477: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P478: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P479: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P480: !BST [6] (maybe <- 0x43a70000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P481: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P482: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P483: !DWST [15] (maybe <- 0x80002d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P484: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P485: !BST [10] (maybe <- 0x43a88000) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P486: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P487: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P488: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P489: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P490: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P491: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P492: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P493: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P494: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P495: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P496: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P497: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P498: !BST [11] (maybe <- 0x43a90000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P499: !BST [15] (maybe <- 0x43a98000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P500: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P501: !MEMBAR (FP)
membar #StoreLoad

P502: !LD [0] (FP)
ld [%i0 + 0], %f4
! 1 addresses covered

P503: !LD [1] (FP)
ld [%i0 + 4], %f5
! 1 addresses covered

P504: !LD [2] (FP)
ld [%i0 + 12], %f6
! 1 addresses covered

P505: !LD [3] (FP)
ld [%i0 + 32], %f7
! 1 addresses covered

P506: !LD [4] (FP)
ld [%i0 + 64], %f8
! 1 addresses covered

P507: !LD [5] (FP)
ld [%i1 + 76], %f9
! 1 addresses covered

P508: !LD [6] (FP)
ld [%i1 + 80], %f10
! 1 addresses covered

P509: !LD [7] (FP)
ld [%i1 + 84], %f11
! 1 addresses covered

P510: !LD [8] (FP)
ld [%i1 + 256], %f12
! 1 addresses covered

P511: !LD [9] (FP)
ld [%i1 + 512], %f13
! 1 addresses covered

P512: !LD [10] (FP)
ld [%i2 + 32], %f14
! 1 addresses covered

P513: !LD [11] (FP)
ld [%i2 + 64], %f15
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

P514: !LD [12] (FP)
ld [%i3 + 0], %f0
! 1 addresses covered

P515: !LD [13] (FP)
ld [%i3 + 64], %f1
! 1 addresses covered

P516: !LD [14] (FP)
ld [%i3 + 128], %f2
! 1 addresses covered

P517: !LD [15] (FP)
ld [%i3 + 192], %f3
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30

restore
retl
nop
!-----------------



func1:

! 500 instruction sequence begins
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

P518: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P519: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P520: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P521: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P522: !MEMBAR (Int)
membar #StoreLoad

P523: !BST [3] (maybe <- 0x47800000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P524: !BST [5] (maybe <- 0x47800200) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P525: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P526: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P527: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P528: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P529: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P530: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P531: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P532: !BST [8] (maybe <- 0x47800380) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P533: !BST [12] (maybe <- 0x47800400) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P534: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P535: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P536: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P537: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P538: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P539: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P540: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P541: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P542: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P543: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P544: !BST [11] (maybe <- 0x47800480) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P545: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P546: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P547: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P548: !BST [9] (maybe <- 0x47800500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P549: !DWST [8] (maybe <- 0x810001) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P550: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P551: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P552: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P553: !BST [7] (maybe <- 0x47800580) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P554: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P555: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P556: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P557: !BST [10] (maybe <- 0x47800700) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P558: !DWST [3] (maybe <- 0x810002) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P559: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P560: !BST [10] (maybe <- 0x47800780) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P561: !BST [3] (maybe <- 0x47800800) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P562: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P563: !BST [3] (maybe <- 0x47800a00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P564: !MEMBAR (Int)
membar #StoreLoad

P565: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P566: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P567: !BST [3] (maybe <- 0x47800c00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P568: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P569: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P570: !BST [6] (maybe <- 0x47800e00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P571: !SWAP [1] (maybe <- 0x810003) (Int)
mov %l4, %o1
swap  [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P572: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P573: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P574: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P575: !BST [1] (maybe <- 0x47800f80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P576: !MEMBAR (Int)
membar #StoreLoad

P577: !MEMBAR (Int)
membar #StoreLoad

P578: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P579: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P580: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P581: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P582: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P583: !BST [14] (maybe <- 0x47801180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P584: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P585: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P586: !BST [9] (maybe <- 0x47801200) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P587: !ST [6] (maybe <- 0x810004) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P588: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P589: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P590: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P591: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P592: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P593: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P594: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P595: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P596: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P597: !BST [13] (maybe <- 0x47801280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P598: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P599: !BST [5] (maybe <- 0x47801300) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P600: !DWST [1] (maybe <- 0x810005) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P601: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P602: !BST [9] (maybe <- 0x47801480) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P603: !BST [12] (maybe <- 0x47801500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P604: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P605: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P606: !BST [5] (maybe <- 0x47801580) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P607: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P608: !BST [3] (maybe <- 0x47801700) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P609: !REPLACEMENT [15] (Int)
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

P610: !BST [0] (maybe <- 0x47801900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P611: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P612: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P613: !BST [8] (maybe <- 0x47801b00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P614: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P615: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P616: !BST [11] (maybe <- 0x47801b80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P617: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P618: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P619: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P620: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P621: !LD [7] (FP)
ld [%i1 + 84], %f13
! 1 addresses covered

P622: !BST [15] (maybe <- 0x47801c00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P623: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P624: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P625: !ST [11] (maybe <- 0x810007) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P626: !CAS [14] (maybe <- 0x810008) (Int)
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

P627: !BST [5] (maybe <- 0x47801c80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P628: !BST [7] (maybe <- 0x47801e00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P629: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P630: !BST [6] (maybe <- 0x47801f80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P631: !MEMBAR (Int)
membar #StoreLoad

P632: !BST [9] (maybe <- 0x47802100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P633: !ST [4] (maybe <- 0x47802180) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P634: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P635: !LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P636: !REPLACEMENT [10] (Int)
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

P637: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P638: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P639: !BST [6] (maybe <- 0x47802200) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P640: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P641: !BST [14] (maybe <- 0x47802380) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P642: !BST [1] (maybe <- 0x47802400) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P643: !DWST [7] (maybe <- 0x810009) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P644: !DWST [13] (maybe <- 0x81000b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P645: !BST [8] (maybe <- 0x47802600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P646: !BST [1] (maybe <- 0x47802680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P647: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P648: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P649: !BST [10] (maybe <- 0x47802880) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P650: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P651: !BST [12] (maybe <- 0x47802900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P652: !BST [9] (maybe <- 0x47802980) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P653: !ST [1] (maybe <- 0x81000c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P654: !ST [3] (maybe <- 0x81000d) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P655: !BST [10] (maybe <- 0x47802a00) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P656: !BST [3] (maybe <- 0x47802a80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P657: !BST [3] (maybe <- 0x47802c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P658: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P659: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P660: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P661: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P662: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P663: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P664: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P665: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P666: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P667: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P668: !BST [14] (maybe <- 0x47802e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P669: !BST [1] (maybe <- 0x47802f00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P670: !DWST [1] (maybe <- 0x81000e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P671: !DWST [12] (maybe <- 0x810010) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P672: !BST [0] (maybe <- 0x47803100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P673: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P674: !BST [15] (maybe <- 0x47803300) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P675: !BST [12] (maybe <- 0x47803380) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P676: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P677: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P678: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P679: !REPLACEMENT [12] (Int)
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

P680: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P681: !BST [5] (maybe <- 0x47803400) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P682: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P683: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P684: !BST [14] (maybe <- 0x47803580) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P685: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P686: !BST [4] (maybe <- 0x47803600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P687: !SWAP [5] (maybe <- 0x810011) (Int)
mov %l4, %l6
swap  [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P688: !BST [8] (maybe <- 0x47803680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P689: !BST [8] (maybe <- 0x47803700) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P690: !BST [0] (maybe <- 0x47803780) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P691: !REPLACEMENT [8] (Int)
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

P692: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P693: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P694: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P695: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P696: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P697: !BST [6] (maybe <- 0x47803980) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P698: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P699: !REPLACEMENT [2] (Int)
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

P700: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P701: !CAS [11] (maybe <- 0x810012) (Int)
add %i2, 64, %l7
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

P702: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P703: !BST [14] (maybe <- 0x47803b00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P704: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P705: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P706: !REPLACEMENT [12] (Int)
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

P707: !REPLACEMENT [10] (Int)
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

P708: !DWST [4] (maybe <- 0x810013) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P709: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P710: !BST [1] (maybe <- 0x47803b80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P711: !BST [11] (maybe <- 0x47803d80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P712: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P713: !BST [9] (maybe <- 0x47803e00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P714: !BST [11] (maybe <- 0x47803e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P715: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P716: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P717: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P718: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P719: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P720: !BST [2] (maybe <- 0x47803f00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P721: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P722: !REPLACEMENT [4] (Int)
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

P723: !BST [8] (maybe <- 0x47804100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P724: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P725: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P726: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P727: !LD [6] (Int)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P728: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P729: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P730: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P731: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P732: !CASX [4] (maybe <- 0x810014) (Int)
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

P733: !BST [15] (maybe <- 0x47804180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P734: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P735: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P736: !BST [0] (maybe <- 0x47804200) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P737: !ST [4] (maybe <- 0x47804400) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P738: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P739: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P740: !BST [5] (maybe <- 0x47804480) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P741: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P742: !BST [12] (maybe <- 0x47804600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P743: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P744: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P745: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P746: !BST [1] (maybe <- 0x47804680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P747: !BST [15] (maybe <- 0x47804880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P748: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P749: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P750: !BST [5] (maybe <- 0x47804900) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P751: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P752: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P753: !BST [2] (maybe <- 0x47804a80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P754: !BST [3] (maybe <- 0x47804c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P755: !ST [0] (maybe <- 0x810015) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P756: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P757: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P758: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P759: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P760: !BST [4] (maybe <- 0x47804e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P761: !BST [8] (maybe <- 0x47804f00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P762: !BST [7] (maybe <- 0x47804f80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P763: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P764: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P765: !BST [11] (maybe <- 0x47805100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P766: !BST [5] (maybe <- 0x47805180) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P767: !DWST [0] (maybe <- 0x810016) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P768: !BST [9] (maybe <- 0x47805300) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P769: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P770: !BST [1] (maybe <- 0x47805380) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P771: !BST [8] (maybe <- 0x47805580) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P772: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P773: !NOP (Int)
nop

P774: !BST [0] (maybe <- 0x47805600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P775: !BST [9] (maybe <- 0x47805800) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P776: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P777: !LD [7] (FP)
ld [%i1 + 84], %f3
! 1 addresses covered

P778: !BST [1] (maybe <- 0x47805880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P779: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P780: !BST [13] (maybe <- 0x47805a80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P781: !BST [3] (maybe <- 0x47805b00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P782: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P783: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P784: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P785: !BST [9] (maybe <- 0x47805d00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P786: !BST [1] (maybe <- 0x47805d80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P787: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P788: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P789: !ST [1] (maybe <- 0x810018) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P790: !BST [5] (maybe <- 0x47805f80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P791: !BST [1] (maybe <- 0x47806100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P792: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P793: !MEMBAR (Int)
membar #StoreLoad

P794: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P795: !BST [0] (maybe <- 0x47806300) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P796: !ST [5] (maybe <- 0x810019) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P797: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P798: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P799: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P800: !BST [1] (maybe <- 0x47806500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P801: !BST [5] (maybe <- 0x47806700) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P802: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P803: !BST [9] (maybe <- 0x47806880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P804: !BST [1] (maybe <- 0x47806900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P805: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P806: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P807: !BST [5] (maybe <- 0x47806b00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P808: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P809: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P810: !REPLACEMENT [4] (Int)
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

P811: !CASX [14] (maybe <- 0x81001a) (Int)
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

P812: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P813: !REPLACEMENT [5] (Int)
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

P814: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P815: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P816: !BST [7] (maybe <- 0x47806c80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P817: !BST [15] (maybe <- 0x47806e00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P818: !BST [1] (maybe <- 0x47806e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P819: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P820: !BST [0] (maybe <- 0x47807080) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P821: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P822: !BST [11] (maybe <- 0x47807280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P823: !BST [9] (maybe <- 0x47807300) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P824: !REPLACEMENT [11] (Int)
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

P825: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P826: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P827: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P828: !BST [6] (maybe <- 0x47807380) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P829: !BST [6] (maybe <- 0x47807500) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P830: !BST [2] (maybe <- 0x47807680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P831: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P832: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P833: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P834: !BST [15] (maybe <- 0x47807880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P835: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P836: !BST [5] (maybe <- 0x47807900) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P837: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P838: !BST [2] (maybe <- 0x47807a80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P839: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P840: !BST [8] (maybe <- 0x47807c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P841: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P842: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P843: !BST [5] (maybe <- 0x47807d00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P844: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P845: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P846: !BST [15] (maybe <- 0x47807e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P847: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P848: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P849: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P850: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P851: !BST [12] (maybe <- 0x47807f00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P852: !BST [14] (maybe <- 0x47807f80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P853: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P854: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P855: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P856: !BST [10] (maybe <- 0x47808000) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P857: !BST [13] (maybe <- 0x47808080) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P858: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P859: !ST [12] (maybe <- 0x47808100) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P860: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P861: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P862: !BST [13] (maybe <- 0x47808180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P863: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P864: !BST [9] (maybe <- 0x47808200) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P865: !SWAP [12] (maybe <- 0x81001b) (Int)
mov %l4, %o1
swap  [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P866: !DWLD [12] (FP)
! case fp 
ldd  [%i3 + 0], %f8
! 1 addresses covered

P867: !BST [11] (maybe <- 0x47808280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P868: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P869: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P870: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P871: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
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

P872: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P873: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P874: !BST [6] (maybe <- 0x47808300) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P875: !CAS [10] (maybe <- 0x81001c) (Int)
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

P876: !LD [13] (FP)
ld [%i3 + 64], %f5
! 1 addresses covered

P877: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P878: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P879: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P880: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P881: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P882: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P883: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P884: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P885: !BST [11] (maybe <- 0x47808480) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P886: !REPLACEMENT [15] (Int)
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

P887: !BST [7] (maybe <- 0x47808500) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P888: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P889: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P890: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P891: !BST [1] (maybe <- 0x47808680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P892: !BST [15] (maybe <- 0x47808880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P893: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P894: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P895: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P896: !CAS [3] (maybe <- 0x81001d) (Int)
add %i0, 32, %l7
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

P897: !BST [0] (maybe <- 0x47808900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P898: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P899: !BST [3] (maybe <- 0x47808b00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P900: !BST [3] (maybe <- 0x47808d00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P901: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P902: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P903: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P904: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P905: !BST [4] (maybe <- 0x47808f00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P906: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P907: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P908: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P909: !DWLD [4] (FP)
! case fp 
ldd  [%i0 + 64], %f14
! 1 addresses covered

P910: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P911: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P912: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P913: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P914: !BST [11] (maybe <- 0x47808f80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P915: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P916: !BST [11] (maybe <- 0x47809000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P917: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P918: !ST [13] (maybe <- 0x81001e) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P919: !DWST [2] (maybe <- 0x81001f) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P920: !BST [10] (maybe <- 0x47809080) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P921: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P922: !BST [5] (maybe <- 0x47809100) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P923: !BST [10] (maybe <- 0x47809280) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P924: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P925: !CASX [14] (maybe <- 0x810020) (Int)
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

P926: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P927: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P928: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P929: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P930: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P931: !BST [5] (maybe <- 0x47809300) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P932: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P933: !BST [3] (maybe <- 0x47809480) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P934: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P935: !CAS [9] (maybe <- 0x810021) (Int)
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

P936: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P937: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P938: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P939: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P940: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P941: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P942: !BST [11] (maybe <- 0x47809680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P943: !BST [11] (maybe <- 0x47809700) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P944: !BST [6] (maybe <- 0x47809780) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P945: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P946: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P947: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P948: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P949: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P950: !DWST [13] (maybe <- 0x47809900) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P951: !DWLD [7] (Int)
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

P952: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P953: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P954: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P955: !BST [13] (maybe <- 0x47809980) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P956: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P957: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P958: !BST [3] (maybe <- 0x47809a00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P959: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P960: !DWST [14] (maybe <- 0x810022) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P961: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P962: !DWLD [6] (FP)
! case fp 
ldd  [%i1 + 80], %f18
! 2 addresses covered
fmovs %f18, %f3
fmovs %f19, %f4

P963: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P964: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P965: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P966: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P967: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P968: !BST [12] (maybe <- 0x47809c00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P969: !BST [7] (maybe <- 0x47809c80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P970: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P971: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P972: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P973: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P974: !BST [0] (maybe <- 0x47809e00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P975: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P976: !BST [6] (maybe <- 0x4780a000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P977: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P978: !BST [5] (maybe <- 0x4780a180) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P979: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P980: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P981: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P982: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P983: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P984: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P985: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P986: !BST [10] (maybe <- 0x4780a300) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P987: !BST [3] (maybe <- 0x4780a380) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P988: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P989: !BST [4] (maybe <- 0x4780a580) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P990: !BST [14] (maybe <- 0x4780a600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P991: !CAS [8] (maybe <- 0x810023) (Int)
add %i1, 256, %l7
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

P992: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P993: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P994: !ST [13] (maybe <- 0x810024) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P995: !REPLACEMENT [0] (Int)
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

P996: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P997: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P998: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P999: !DWLD [7] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1000: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1001: !BST [10] (maybe <- 0x4780a680) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1002: !LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1003: !BST [7] (maybe <- 0x4780a700) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1004: !BST [14] (maybe <- 0x4780a880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1005: !CASX [9] (maybe <- 0x810025) (Int)
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

P1006: !BST [0] (maybe <- 0x4780a900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1007: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1008: !BST [5] (maybe <- 0x4780ab00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1009: !BST [1] (maybe <- 0x4780ac80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1010: !SWAP [15] (maybe <- 0x810026) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1011: !REPLACEMENT [6] (Int)
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

P1012: !BST [5] (maybe <- 0x4780ae80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1013: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1014: !DWST [13] (maybe <- 0x810027) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1015: !BST [4] (maybe <- 0x4780b000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1016: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1017: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1018: !MEMBAR (FP)
membar #StoreLoad

P1019: !LD [0] (FP)
ld [%i0 + 0], %f4
! 1 addresses covered

P1020: !LD [1] (FP)
ld [%i0 + 4], %f5
! 1 addresses covered

P1021: !LD [2] (FP)
ld [%i0 + 12], %f6
! 1 addresses covered

P1022: !LD [3] (FP)
ld [%i0 + 32], %f7
! 1 addresses covered

P1023: !LD [4] (FP)
ld [%i0 + 64], %f8
! 1 addresses covered

P1024: !LD [5] (FP)
ld [%i1 + 76], %f9
! 1 addresses covered

P1025: !LD [6] (FP)
ld [%i1 + 80], %f10
! 1 addresses covered

P1026: !LD [7] (FP)
ld [%i1 + 84], %f11
! 1 addresses covered

P1027: !LD [8] (FP)
ld [%i1 + 256], %f12
! 1 addresses covered

P1028: !LD [9] (FP)
ld [%i1 + 512], %f13
! 1 addresses covered

P1029: !LD [10] (FP)
ld [%i2 + 32], %f14
! 1 addresses covered

P1030: !LD [11] (FP)
ld [%i2 + 64], %f15
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

P1031: !LD [12] (FP)
ld [%i3 + 0], %f0
! 1 addresses covered

P1032: !LD [13] (FP)
ld [%i3 + 64], %f1
! 1 addresses covered

P1033: !LD [14] (FP)
ld [%i3 + 128], %f2
! 1 addresses covered

P1034: !LD [15] (FP)
ld [%i3 + 192], %f3
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30

restore
retl
nop
!-----------------



func2:

! 500 instruction sequence begins
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

P1035: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1036: !CASX [12] (maybe <- 0x820001) (Int)
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

P1037: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1038: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1039: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1040: !BST [11] (maybe <- 0x47ffff80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1041: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P1042: !BST [4] (maybe <- 0x48000000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1043: !BST [2] (maybe <- 0x48000040) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1044: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1045: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1046: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1047: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1048: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1049: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1050: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1051: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1052: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1053: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1054: !REPLACEMENT [0] (Int)
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

P1055: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1056: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1057: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1058: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1059: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1060: !BST [13] (maybe <- 0x48000140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1061: !BST [13] (maybe <- 0x48000180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1062: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1063: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1064: !BST [4] (maybe <- 0x480001c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1065: !BST [7] (maybe <- 0x48000200) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1066: !BST [11] (maybe <- 0x480002c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1067: !CASX [4] (maybe <- 0x820002) (Int)
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

P1068: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P1069: !BST [12] (maybe <- 0x48000300) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1070: !BST [2] (maybe <- 0x48000340) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1071: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P1072: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1073: !ST [3] (maybe <- 0x820003) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1074: !BST [7] (maybe <- 0x48000440) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1075: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1076: !DWST [1] (maybe <- 0x820004) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1077: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1078: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1079: !REPLACEMENT [6] (Int)
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

P1080: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1081: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1082: !BST [12] (maybe <- 0x48000500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1083: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1084: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1085: !BST [6] (maybe <- 0x48000540) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1086: !DWST [13] (maybe <- 0x48000600) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P1087: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1088: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1089: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1090: !BST [9] (maybe <- 0x48000640) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1091: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P1092: !BST [2] (maybe <- 0x48000680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1093: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1094: !CASX [6] (maybe <- 0x820006) (Int)
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

P1095: !BST [1] (maybe <- 0x48000780) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1096: !REPLACEMENT [6] (Int)
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

P1097: !BST [14] (maybe <- 0x48000880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1098: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1099: !BST [13] (maybe <- 0x480008c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1100: !BST [12] (maybe <- 0x48000900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1101: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P1102: !DWST [14] (maybe <- 0x48000940) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P1103: !MEMBAR (Int)
membar #StoreLoad

P1104: !DWST [13] (maybe <- 0x820008) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1105: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1106: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1107: !ST [12] (maybe <- 0x48000980) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P1108: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1109: !DWST [11] (maybe <- 0x820009) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1110: !DWLD [14] (Int)
ldx [%i3 + 128], %o1
! move %o1(upper) -> %o1(upper)

P1111: !BST [0] (maybe <- 0x480009c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1112: !BST [5] (maybe <- 0x48000ac0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1113: !DWST [15] (maybe <- 0x82000a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P1114: !DWST [4] (maybe <- 0x82000b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P1115: !BST [13] (maybe <- 0x48000b80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1116: !REPLACEMENT [14] (Int)
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

P1117: !BST [1] (maybe <- 0x48000bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1118: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1119: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1120: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1121: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1122: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1123: !DWST [11] (maybe <- 0x82000c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1124: !BST [13] (maybe <- 0x48000cc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1125: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1126: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1127: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1128: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P1129: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1130: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1131: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1132: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1133: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1134: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P1135: !ST [14] (maybe <- 0x82000d) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1136: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1137: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1138: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1139: !BST [6] (maybe <- 0x48000d00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1140: !LD [9] (FP)
ld [%i1 + 512], %f6
! 1 addresses covered

P1141: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P1142: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1143: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P1144: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1145: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1146: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1147: !BST [0] (maybe <- 0x48000dc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1148: !LD [6] (Int)
lduw [%i1 + 80], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1149: !BST [3] (maybe <- 0x48000ec0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1150: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P1151: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1152: !BST [5] (maybe <- 0x48000fc0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1153: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1154: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1155: !SWAP [11] (maybe <- 0x82000e) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P1156: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1157: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1158: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1159: !BST [6] (maybe <- 0x48001080) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1160: !BST [11] (maybe <- 0x48001140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1161: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1162: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1163: !CAS [3] (maybe <- 0x82000f) (Int)
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

P1164: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1165: !BST [7] (maybe <- 0x48001180) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1166: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1167: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1168: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1169: !BST [4] (maybe <- 0x48001240) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1170: !BST [0] (maybe <- 0x48001280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1171: !MEMBAR (Int)
membar #StoreLoad

P1172: !SWAP [8] (maybe <- 0x820010) (Int)
mov %l4, %o4
swap  [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1173: !MEMBAR (Int)
membar #StoreLoad

P1174: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P1175: !BST [6] (maybe <- 0x48001380) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1176: !DWLD [4] (Int)
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

P1177: !DWST [0] (maybe <- 0x820011) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1178: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P1179: !BST [1] (maybe <- 0x48001440) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1180: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1181: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1182: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1183: !BST [4] (maybe <- 0x48001540) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1184: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P1185: !BST [9] (maybe <- 0x48001580) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1186: !SWAP [5] (maybe <- 0x820013) (Int)
mov %l4, %o1
swap  [%i1 + 76], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1187: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1188: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1189: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1190: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P1191: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1192: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P1193: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1194: !SWAP [8] (maybe <- 0x820014) (Int)
mov %l4, %o2
swap  [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1195: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1196: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1197: !BST [9] (maybe <- 0x480015c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1198: !SWAP [11] (maybe <- 0x820015) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P1199: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1200: !BST [11] (maybe <- 0x48001600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1201: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1202: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1203: !BST [6] (maybe <- 0x48001640) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1204: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1205: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1206: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P1207: !SWAP [5] (maybe <- 0x820016) (Int)
mov %l4, %o3
swap  [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1208: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1209: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1210: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1211: !BST [7] (maybe <- 0x48001700) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1212: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1213: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1214: !BST [11] (maybe <- 0x480017c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1215: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1216: !BST [11] (maybe <- 0x48001800) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1217: !ST [4] (maybe <- 0x820017) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1218: !SWAP [9] (maybe <- 0x820018) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1219: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1220: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1221: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1222: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1223: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1224: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1225: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1226: !BST [0] (maybe <- 0x48001840) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1227: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1228: !BST [8] (maybe <- 0x48001940) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1229: !DWST [14] (maybe <- 0x820019) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1230: !BST [13] (maybe <- 0x48001980) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1231: !ST [1] (maybe <- 0x82001a) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1232: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1233: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1234: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1235: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1236: !DWST [15] (maybe <- 0x82001b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P1237: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1238: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1239: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1240: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1241: !BST [2] (maybe <- 0x480019c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1242: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1243: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P1244: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P1245: !MEMBAR (Int)
membar #StoreLoad

P1246: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1247: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1248: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1249: !BST [2] (maybe <- 0x48001ac0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1250: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1251: !BST [3] (maybe <- 0x48001bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1252: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1253: !BST [9] (maybe <- 0x48001cc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1254: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1255: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1256: !BST [0] (maybe <- 0x48001d00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1257: !BST [7] (maybe <- 0x48001e00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1258: !BST [8] (maybe <- 0x48001ec0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1259: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1260: !BST [5] (maybe <- 0x48001f00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1261: !BST [13] (maybe <- 0x48001fc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1262: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P1263: !BST [15] (maybe <- 0x48002000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1264: !MEMBAR (Int)
membar #StoreLoad

P1265: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1266: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1267: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1268: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1269: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1270: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1271: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1272: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1273: !DWST [3] (maybe <- 0x82001c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P1274: !CAS [10] (maybe <- 0x82001d) (Int)
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

P1275: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1276: !REPLACEMENT [2] (Int)
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

P1277: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1278: !DWST [13] (maybe <- 0x82001e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1279: !ST [4] (maybe <- 0x82001f) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1280: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1281: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P1282: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1283: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1284: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P1285: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P1286: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1287: !BST [0] (maybe <- 0x48002040) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1288: !ST [11] (maybe <- 0x820020) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1289: !CASX [6] (maybe <- 0x820021) (Int)
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

P1290: !BST [15] (maybe <- 0x48002140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1291: !BST [12] (maybe <- 0x48002180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1292: !SWAP [1] (maybe <- 0x820023) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o0(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1293: !BST [0] (maybe <- 0x480021c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1294: !BST [5] (maybe <- 0x480022c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1295: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1296: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1297: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1298: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1299: !BST [10] (maybe <- 0x48002380) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1300: !BST [2] (maybe <- 0x480023c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1301: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1302: !CASX [9] (maybe <- 0x820024) (Int)
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

P1303: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1304: !REPLACEMENT [13] (Int)
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

P1305: !CAS [7] (maybe <- 0x820025) (Int)
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

P1306: !BST [13] (maybe <- 0x480024c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1307: !BST [5] (maybe <- 0x48002500) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1308: !BST [8] (maybe <- 0x480025c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1309: !ST [1] (maybe <- 0x820026) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1310: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1311: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1312: !CAS [15] (maybe <- 0x820027) (Int)
add %i3, 192, %l7
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

P1313: !BST [4] (maybe <- 0x48002600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1314: !BST [1] (maybe <- 0x48002640) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1315: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1316: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1317: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1318: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P1319: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1320: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1321: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1322: !LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1323: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1324: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1325: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1326: !BST [14] (maybe <- 0x48002740) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1327: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1328: !ST [4] (maybe <- 0x820028) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1329: !BST [9] (maybe <- 0x48002780) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1330: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1331: !ST [5] (maybe <- 0x820029) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1332: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1333: !REPLACEMENT [10] (Int)
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

P1334: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1335: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1336: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1337: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1338: !BST [1] (maybe <- 0x480027c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1339: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P1340: !BST [8] (maybe <- 0x480028c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1341: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1342: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1343: !BST [13] (maybe <- 0x48002900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1344: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1345: !BST [11] (maybe <- 0x48002940) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1346: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1347: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1348: !BST [3] (maybe <- 0x48002980) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1349: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1350: !DWST [0] (maybe <- 0x82002a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1351: !CAS [1] (maybe <- 0x82002c) (Int)
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

P1352: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P1353: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1354: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1355: !BST [0] (maybe <- 0x48002a80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1356: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P1357: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1358: !BST [5] (maybe <- 0x48002b80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1359: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1360: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1361: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1362: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1363: !DWLD [10] (Int)
ldx [%i2 + 32], %o2
! move %o2(upper) -> %o2(upper)

P1364: !BST [4] (maybe <- 0x48002c40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1365: !BST [1] (maybe <- 0x48002c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1366: !BST [10] (maybe <- 0x48002d80) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1367: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1368: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1369: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1370: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1371: !BST [2] (maybe <- 0x48002dc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1372: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1373: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1374: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P1375: !SWAP [3] (maybe <- 0x82002d) (Int)
mov %l4, %o3
swap  [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1376: !BST [6] (maybe <- 0x48002ec0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1377: !BST [13] (maybe <- 0x48002f80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1378: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1379: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P1380: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1381: !DWST [2] (maybe <- 0x82002e) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1382: !BST [0] (maybe <- 0x48002fc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1383: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1384: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1385: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1386: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1387: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1388: !BST [6] (maybe <- 0x480030c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1389: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1390: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1391: !CASX [6] (maybe <- 0x82002f) (Int)
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

P1392: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1393: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1394: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1395: !BST [7] (maybe <- 0x48003180) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1396: !CASX [13] (maybe <- 0x820031) (Int)
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

P1397: !MEMBAR (Int)
membar #StoreLoad

P1398: !CAS [14] (maybe <- 0x820032) (Int)
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

P1399: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P1400: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1401: !BST [13] (maybe <- 0x48003240) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1402: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P1403: !BST [5] (maybe <- 0x48003280) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1404: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1405: !BST [1] (maybe <- 0x48003340) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1406: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1407: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1408: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1409: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1410: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1411: !BST [15] (maybe <- 0x48003440) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1412: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1413: !ST [3] (maybe <- 0x820033) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1414: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P1415: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1416: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1417: !LD [10] (FP)
ld [%i2 + 32], %f11
! 1 addresses covered

P1418: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1419: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1420: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P1421: !BST [9] (maybe <- 0x48003480) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1422: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1423: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1424: !DWST [13] (maybe <- 0x820034) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1425: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1426: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1427: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1428: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1429: !REPLACEMENT [13] (Int)
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

P1430: !DWST [3] (maybe <- 0x820035) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P1431: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1432: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P1433: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1434: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1435: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1436: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P1437: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1438: !BST [12] (maybe <- 0x480034c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1439: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1440: !MEMBAR (Int)
membar #StoreLoad

P1441: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1442: !LD [6] (Int)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1443: !BST [0] (maybe <- 0x48003500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1444: !MEMBAR (Int)
membar #StoreLoad

P1445: !REPLACEMENT [15] (Int)
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

P1446: !BST [8] (maybe <- 0x48003600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1447: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1448: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1449: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1450: !BST [1] (maybe <- 0x48003640) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1451: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1452: !CASX [12] (maybe <- 0x820036) (Int)
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

P1453: !CAS [14] (maybe <- 0x820037) (Int)
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

P1454: !BST [9] (maybe <- 0x48003740) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1455: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1456: !LD [14] (FP)
ld [%i3 + 128], %f7
! 1 addresses covered

P1457: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1458: !BST [6] (maybe <- 0x48003780) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1459: !BST [15] (maybe <- 0x48003840) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1460: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1461: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1462: !BST [13] (maybe <- 0x48003880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1463: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P1464: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1465: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1466: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1467: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
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

P1468: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1469: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1470: !BST [10] (maybe <- 0x480038c0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1471: !BST [6] (maybe <- 0x48003900) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1472: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1473: !BST [2] (maybe <- 0x480039c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1474: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P1475: !BST [8] (maybe <- 0x48003ac0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1476: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1477: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1478: !DWLD [11] (Int)
ldx [%i2 + 64], %o3
! move %o3(upper) -> %o3(upper)

P1479: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1480: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1481: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1482: !BST [12] (maybe <- 0x48003b00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1483: !ST [4] (maybe <- 0x820038) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1484: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1485: !DWST [5] (maybe <- 0x820039) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P1486: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1487: !BST [6] (maybe <- 0x48003b40) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1488: !BST [8] (maybe <- 0x48003c00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1489: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1490: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P1491: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1492: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1493: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1494: !ST [5] (maybe <- 0x82003a) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1495: !CAS [1] (maybe <- 0x82003b) (Int)
add %i0, 4, %l7
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

P1496: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1497: !CASX [15] (maybe <- 0x82003c) (Int)
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

P1498: !BST [9] (maybe <- 0x48003c40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1499: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1500: !BST [12] (maybe <- 0x48003c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1501: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1502: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1503: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1504: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1505: !DWST [12] (maybe <- 0x82003d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1506: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1507: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1508: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1509: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1510: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1511: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1512: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1513: !BST [9] (maybe <- 0x48003cc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1514: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1515: !BST [14] (maybe <- 0x48003d00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1516: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P1517: !REPLACEMENT [2] (Int)
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

P1518: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1519: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1520: !BST [4] (maybe <- 0x48003d40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1521: !ST [1] (maybe <- 0x82003e) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1522: !BST [3] (maybe <- 0x48003d80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1523: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1524: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1525: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1526: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P1527: !BST [15] (maybe <- 0x48003e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1528: !ST [15] (maybe <- 0x82003f) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1529: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P1530: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1531: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1532: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P1533: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1534: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1535: !MEMBAR (Int)
membar #StoreLoad

P1536: !LD [0] (FP)
ld [%i0 + 0], %f3
! 1 addresses covered

P1537: !LD [1] (FP)
ld [%i0 + 4], %f4
! 1 addresses covered

P1538: !LD [2] (FP)
ld [%i0 + 12], %f5
! 1 addresses covered

P1539: !LD [3] (FP)
ld [%i0 + 32], %f6
! 1 addresses covered

P1540: !LD [4] (FP)
ld [%i0 + 64], %f7
! 1 addresses covered

P1541: !LD [5] (FP)
ld [%i1 + 76], %f8
! 1 addresses covered

P1542: !LD [6] (FP)
ld [%i1 + 80], %f9
! 1 addresses covered

P1543: !LD [7] (FP)
ld [%i1 + 84], %f10
! 1 addresses covered

P1544: !LD [8] (FP)
ld [%i1 + 256], %f11
! 1 addresses covered

P1545: !LD [9] (FP)
ld [%i1 + 512], %f12
! 1 addresses covered

P1546: !LD [10] (FP)
ld [%i2 + 32], %f13
! 1 addresses covered

P1547: !LD [11] (FP)
ld [%i2 + 64], %f14
! 1 addresses covered

P1548: !LD [12] (FP)
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

P1549: !LD [13] (FP)
ld [%i3 + 64], %f0
! 1 addresses covered

P1550: !LD [14] (FP)
ld [%i3 + 128], %f1
! 1 addresses covered

P1551: !LD [15] (FP)
ld [%i3 + 192], %f2
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30

restore
retl
nop
!-----------------



func3:

! 500 instruction sequence begins
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

P1552: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P1553: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1554: !BST [2] (maybe <- 0x483fff80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1555: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1556: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1557: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1558: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1559: !DWST [12] (maybe <- 0x830001) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1560: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1561: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P1562: !MEMBAR (Int)
membar #StoreLoad

P1563: !BST [7] (maybe <- 0x48400080) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1564: !BST [4] (maybe <- 0x48400140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1565: !DWST [8] (maybe <- 0x830002) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1566: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1567: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1568: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P1569: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1570: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1571: !DWLD [4] (Int)
ldx [%i0 + 64], %o0
! move %o0(upper) -> %o0(upper)

P1572: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1573: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1574: !MEMBAR (Int)
membar #StoreLoad

P1575: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P1576: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1577: !BST [13] (maybe <- 0x48400180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1578: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1579: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1580: !BST [7] (maybe <- 0x484001c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1581: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1582: !DWLD [15] (Int)
ldx [%i3 + 192], %o1
! move %o1(upper) -> %o1(upper)

P1583: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1

P1584: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P1585: !BST [12] (maybe <- 0x48400280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1586: !DWST [2] (maybe <- 0x830003) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1587: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1588: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1589: !BST [0] (maybe <- 0x484002c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1590: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1591: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1592: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1593: !BST [1] (maybe <- 0x484003c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1594: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1595: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1596: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1597: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1598: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1599: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P1600: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1601: !BST [11] (maybe <- 0x484004c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1602: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1603: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P1604: !BST [7] (maybe <- 0x48400500) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1605: !BST [8] (maybe <- 0x484005c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1606: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1607: !BST [0] (maybe <- 0x48400600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1608: !BST [0] (maybe <- 0x48400700) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1609: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1610: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1611: !ST [15] (maybe <- 0x830004) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1612: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1613: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1614: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1615: !BST [9] (maybe <- 0x48400800) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1616: !DWST [5] (maybe <- 0x830005) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P1617: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P1618: !BST [4] (maybe <- 0x48400840) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1619: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1620: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1621: !DWST [2] (maybe <- 0x830006) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P1622: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1623: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1624: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1625: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1626: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1627: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1628: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1629: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P1630: !DWLD [14] (FP)
! case fp 
ldd  [%i3 + 128], %f0
! 1 addresses covered

P1631: !BST [1] (maybe <- 0x48400880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1632: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1633: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1634: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P1635: !BST [12] (maybe <- 0x48400980) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1636: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1637: !ST [15] (maybe <- 0x830007) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1638: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1639: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P1640: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1641: !BST [2] (maybe <- 0x484009c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1642: !REPLACEMENT [8] (Int)
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

P1643: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1644: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1645: !DWST [4] (maybe <- 0x830008) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P1646: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1647: !CAS [5] (maybe <- 0x830009) (Int)
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

P1648: !BST [7] (maybe <- 0x48400ac0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1649: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1650: !CASX [4] (maybe <- 0x83000a) (Int)
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

P1651: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1652: !BST [6] (maybe <- 0x48400b80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1653: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1654: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1655: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1656: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1657: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1658: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1659: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1660: !BST [7] (maybe <- 0x48400c40) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1661: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1662: !LD [6] (Int)
lduw [%i1 + 80], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1663: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1664: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P1665: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P1666: !BST [10] (maybe <- 0x48400d00) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1667: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1668: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1669: !BST [11] (maybe <- 0x48400d40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1670: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1671: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1672: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1673: !CAS [11] (maybe <- 0x83000b) (Int)
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

P1674: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P1675: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1676: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1677: !BST [1] (maybe <- 0x48400d80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1678: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1679: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1680: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1681: !REPLACEMENT [4] (Int)
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

P1682: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1683: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1684: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1685: !BST [14] (maybe <- 0x48400e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1686: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P1687: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1688: !LD [5] (Int)
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

P1689: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1690: !BST [12] (maybe <- 0x48400ec0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1691: !ST [1] (maybe <- 0x83000c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1692: !BST [3] (maybe <- 0x48400f00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1693: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1694: !BST [15] (maybe <- 0x48401000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1695: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1696: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1697: !BST [12] (maybe <- 0x48401040) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1698: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1699: !BST [5] (maybe <- 0x48401080) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1700: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1701: !CAS [0] (maybe <- 0x83000d) (Int)
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

P1702: !BST [9] (maybe <- 0x48401140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1703: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1704: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1705: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1706: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P1707: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P1708: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1709: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1710: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1711: !BST [13] (maybe <- 0x48401180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1712: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1713: !DWST [14] (maybe <- 0x83000e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1714: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1715: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1716: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1717: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1718: !BST [4] (maybe <- 0x484011c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1719: !BST [10] (maybe <- 0x48401200) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1720: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1721: !BST [3] (maybe <- 0x48401240) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1722: !BST [2] (maybe <- 0x48401340) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1723: !BST [14] (maybe <- 0x48401440) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1724: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P1725: !BST [13] (maybe <- 0x48401480) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1726: !REPLACEMENT [13] (Int)
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

P1727: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1728: !ST [14] (maybe <- 0x484014c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P1729: !BST [8] (maybe <- 0x48401500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1730: !BST [4] (maybe <- 0x48401540) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1731: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1732: !BST [13] (maybe <- 0x48401580) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1733: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1734: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1735: !BST [5] (maybe <- 0x484015c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1736: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1737: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1738: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1739: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1740: !BST [10] (maybe <- 0x48401680) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1741: !BST [14] (maybe <- 0x484016c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1742: !REPLACEMENT [8] (Int)
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

P1743: !NOP (Int)
nop

P1744: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1745: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1746: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P1747: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1748: !MEMBAR (Int)
membar #StoreLoad

P1749: !BST [0] (maybe <- 0x48401700) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1750: !NOP (Int)
nop

P1751: !DWST [12] (maybe <- 0x83000f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1752: !SWAP [9] (maybe <- 0x830010) (Int)
mov %l4, %o1
swap  [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1753: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1754: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1755: !BST [9] (maybe <- 0x48401800) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1756: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1757: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1758: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1759: !BST [15] (maybe <- 0x48401840) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1760: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1761: !REPLACEMENT [2] (Int)
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

P1762: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1763: !BST [1] (maybe <- 0x48401880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1764: !BST [1] (maybe <- 0x48401980) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1765: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1766: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1767: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1768: !BST [14] (maybe <- 0x48401a80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1769: !REPLACEMENT [9] (Int)
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

P1770: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1771: !DWLD [5] (Int)
ldx [%i1 + 72], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1772: !BST [9] (maybe <- 0x48401ac0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1773: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P1774: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1775: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1776: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1777: !ST [4] (maybe <- 0x830011) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1778: !BST [7] (maybe <- 0x48401b00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1779: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1780: !MEMBAR (Int)
membar #StoreLoad

P1781: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P1782: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1783: !SWAP [6] (maybe <- 0x830012) (Int)
mov %l4, %o3
swap  [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1784: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1785: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1786: !BST [9] (maybe <- 0x48401bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1787: !BST [8] (maybe <- 0x48401c00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1788: !BST [0] (maybe <- 0x48401c40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1789: !BST [6] (maybe <- 0x48401d40) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1790: !BST [8] (maybe <- 0x48401e00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1791: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1792: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1793: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1794: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1795: !BST [12] (maybe <- 0x48401e40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1796: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1797: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1798: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1799: !BST [14] (maybe <- 0x48401e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1800: !BST [1] (maybe <- 0x48401ec0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1801: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1802: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P1803: !BST [11] (maybe <- 0x48401fc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1804: !ST [11] (maybe <- 0x830013) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1805: !BST [12] (maybe <- 0x48402000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1806: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1807: !BST [12] (maybe <- 0x48402040) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1808: !BST [8] (maybe <- 0x48402080) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1809: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1810: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P1811: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1812: !DWST [0] (maybe <- 0x830014) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P1813: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1814: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1815: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1816: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1817: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1818: !BST [4] (maybe <- 0x484020c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1819: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1820: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1821: !BST [4] (maybe <- 0x48402100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1822: !ST [2] (maybe <- 0x830016) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1823: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1824: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1825: !NOP (Int)
nop

P1826: !BST [11] (maybe <- 0x48402140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1827: !BST [14] (maybe <- 0x48402180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1828: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1829: !CAS [14] (maybe <- 0x830017) (Int)
add %i3, 128, %l7
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

P1830: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1831: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1832: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P1833: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1834: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P1835: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1836: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1837: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1838: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1839: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1840: !LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1841: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P1842: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1843: !BST [0] (maybe <- 0x484021c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1844: !BST [1] (maybe <- 0x484022c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1845: !ST [3] (maybe <- 0x830018) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1846: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1847: !BST [8] (maybe <- 0x484023c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1848: !BST [6] (maybe <- 0x48402400) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1849: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1850: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1851: !REPLACEMENT [3] (Int)
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

P1852: !BST [14] (maybe <- 0x484024c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1853: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1854: !CASX [9] (maybe <- 0x830019) (Int)
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

P1855: !BST [12] (maybe <- 0x48402500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1856: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1857: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1858: !BST [1] (maybe <- 0x48402540) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1859: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1860: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1861: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1862: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1863: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1864: !BST [5] (maybe <- 0x48402640) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1865: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1866: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1867: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1868: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1869: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1870: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1871: !MEMBAR (Int)
membar #StoreLoad

P1872: !DWLD [0] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P1873: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1874: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1875: !LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1876: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1877: !ST [2] (maybe <- 0x83001a) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1878: !BST [10] (maybe <- 0x48402700) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1879: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1880: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1881: !MEMBAR (Int)
membar #StoreLoad

P1882: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1883: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P1884: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1885: !BST [9] (maybe <- 0x48402740) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1886: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P1887: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1888: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1889: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P1890: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1891: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P1892: !BST [9] (maybe <- 0x48402780) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1893: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1894: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1895: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1896: !BST [14] (maybe <- 0x484027c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1897: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1898: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1899: !BST [9] (maybe <- 0x48402800) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1900: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1901: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1902: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1903: !DWST [6] (maybe <- 0x83001b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P1904: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1905: !DWST [11] (maybe <- 0x83001d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1906: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P1907: !BST [7] (maybe <- 0x48402840) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1908: !BST [3] (maybe <- 0x48402900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1909: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1910: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1911: !LD [10] (FP)
ld [%i2 + 32], %f4
! 1 addresses covered

P1912: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1913: !BST [2] (maybe <- 0x48402a00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1914: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1915: !BST [7] (maybe <- 0x48402b00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1916: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1917: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1918: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1919: !BST [9] (maybe <- 0x48402bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1920: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1921: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1922: !DWLD [7] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1923: !BST [7] (maybe <- 0x48402c00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1924: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1925: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1926: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1927: !DWLD [3] (Int)
ldx [%i0 + 32], %o2
! move %o2(upper) -> %o2(upper)

P1928: !BST [7] (maybe <- 0x48402cc0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1929: !BST [15] (maybe <- 0x48402d80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1930: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1931: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1932: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1933: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1934: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P1935: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1936: !BST [5] (maybe <- 0x48402dc0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1937: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P1938: !BST [14] (maybe <- 0x48402e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1939: !BST [10] (maybe <- 0x48402ec0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1940: !ST [14] (maybe <- 0x83001e) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1941: !MEMBAR (Int)
membar #StoreLoad

P1942: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1943: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1944: !ST [13] (maybe <- 0x83001f) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1945: !BST [5] (maybe <- 0x48402f00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1946: !BST [3] (maybe <- 0x48402fc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1947: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P1948: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1949: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1950: !BST [8] (maybe <- 0x484030c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1951: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1952: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1953: !BST [11] (maybe <- 0x48403100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1954: !BST [3] (maybe <- 0x48403140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1955: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1956: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1957: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1958: !DWST [13] (maybe <- 0x830020) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1959: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1960: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1961: !BST [1] (maybe <- 0x48403240) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1962: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1963: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1964: !REPLACEMENT [9] (Int)
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

P1965: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1966: !BST [4] (maybe <- 0x48403340) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1967: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1968: !BST [13] (maybe <- 0x48403380) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1969: !ST [15] (maybe <- 0x830021) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1970: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1971: !BST [7] (maybe <- 0x484033c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1972: !BST [10] (maybe <- 0x48403480) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1973: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1974: !BST [2] (maybe <- 0x484034c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1975: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1976: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1977: !BST [3] (maybe <- 0x484035c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1978: !BST [10] (maybe <- 0x484036c0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1979: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1980: !DWST [10] (maybe <- 0x830022) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P1981: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1982: !BST [6] (maybe <- 0x48403700) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1983: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1984: !BST [12] (maybe <- 0x484037c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1985: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P1986: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1987: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1988: !BST [11] (maybe <- 0x48403800) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1989: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1990: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
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

P1991: !BST [12] (maybe <- 0x48403840) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1992: !DWLD [9] (Int)
ldx [%i1 + 512], %o3
! move %o3(upper) -> %o3(upper)

P1993: !BST [3] (maybe <- 0x48403880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1994: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1995: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1996: !BST [0] (maybe <- 0x48403980) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1997: !MEMBAR (Int)
membar #StoreLoad

P1998: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1999: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2000: !BST [14] (maybe <- 0x48403a80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2001: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P2002: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2003: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2004: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2005: !BST [12] (maybe <- 0x48403ac0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2006: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P2007: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2008: !BST [7] (maybe <- 0x48403b00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2009: !BST [8] (maybe <- 0x48403bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2010: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2011: !REPLACEMENT [8] (Int)
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

P2012: !BST [14] (maybe <- 0x48403c00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2013: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2014: !BST [12] (maybe <- 0x48403c40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2015: !CASX [8] (maybe <- 0x830023) (Int)
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

P2016: !BST [7] (maybe <- 0x48403c80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2017: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2018: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P2019: !DWST [13] (maybe <- 0x830024) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2020: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2021: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2022: !BST [15] (maybe <- 0x48403d40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2023: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2024: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2025: !BST [5] (maybe <- 0x48403d80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2026: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2027: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2028: !ST [10] (maybe <- 0x48403e40) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P2029: !BST [13] (maybe <- 0x48403e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2030: !BST [13] (maybe <- 0x48403ec0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2031: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2032: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P2033: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2034: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2035: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2036: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2037: !BST [10] (maybe <- 0x48403f00) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2038: !MEMBAR (Int)
membar #StoreLoad

P2039: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2040: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2041: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2042: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2043: !DWST [11] (maybe <- 0x48403f40) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 64]

P2044: !BST [3] (maybe <- 0x48403f80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2045: !BST [2] (maybe <- 0x48404080) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2046: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2047: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2048: !BST [14] (maybe <- 0x48404180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2049: !BST [8] (maybe <- 0x484041c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2050: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P2051: !ST [0] (maybe <- 0x830025) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2052: !MEMBAR (Int)
membar #StoreLoad

P2053: !LD [0] (FP)
ld [%i0 + 0], %f0
! 1 addresses covered

P2054: !LD [1] (FP)
ld [%i0 + 4], %f1
! 1 addresses covered

P2055: !LD [2] (FP)
ld [%i0 + 12], %f2
! 1 addresses covered

P2056: !LD [3] (FP)
ld [%i0 + 32], %f3
! 1 addresses covered

P2057: !LD [4] (FP)
ld [%i0 + 64], %f4
! 1 addresses covered

P2058: !LD [5] (FP)
ld [%i1 + 76], %f5
! 1 addresses covered

P2059: !LD [6] (FP)
ld [%i1 + 80], %f6
! 1 addresses covered

P2060: !LD [7] (FP)
ld [%i1 + 84], %f7
! 1 addresses covered

P2061: !LD [8] (FP)
ld [%i1 + 256], %f8
! 1 addresses covered

P2062: !LD [9] (FP)
ld [%i1 + 512], %f9
! 1 addresses covered

P2063: !LD [10] (FP)
ld [%i2 + 32], %f10
! 1 addresses covered

P2064: !LD [11] (FP)
ld [%i2 + 64], %f11
! 1 addresses covered

P2065: !LD [12] (FP)
ld [%i3 + 0], %f12
! 1 addresses covered

P2066: !LD [13] (FP)
ld [%i3 + 64], %f13
! 1 addresses covered

P2067: !LD [14] (FP)
ld [%i3 + 128], %f14
! 1 addresses covered

P2068: !LD [15] (FP)
ld [%i3 + 192], %f15
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
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5

restore
retl
nop
!-----------------



func4:

! 500 instruction sequence begins
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

P2069: !BST [4] (maybe <- 0x487fff40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2070: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2071: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2072: !BST [12] (maybe <- 0x487fff80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2073: !CAS [6] (maybe <- 0x840001) (Int)
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

P2074: !BST [11] (maybe <- 0x487fffc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2075: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P2076: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2077: !BST [2] (maybe <- 0x48800000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2078: !REPLACEMENT [14] (Int)
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

P2079: !BST [14] (maybe <- 0x48800080) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2080: !BST [5] (maybe <- 0x488000a0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2081: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2082: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P2083: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2084: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P2085: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2086: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2087: !BST [4] (maybe <- 0x48800100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2088: !ST [10] (maybe <- 0x48800120) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P2089: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2090: !BST [4] (maybe <- 0x48800140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2091: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2092: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2093: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2094: !BST [14] (maybe <- 0x48800160) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2095: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2096: !ST [15] (maybe <- 0x840002) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2097: !ST [5] (maybe <- 0x840003) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2098: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P2099: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P2100: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2101: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2102: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2103: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2104: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2105: !BST [6] (maybe <- 0x48800180) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2106: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2107: !DWST [14] (maybe <- 0x488001e0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P2108: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2109: !BST [1] (maybe <- 0x48800200) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2110: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P2111: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P2112: !DWST [1] (maybe <- 0x840004) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2113: !REPLACEMENT [12] (Int)
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

P2114: !DWST [8] (maybe <- 0x840006) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2115: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2116: !CASX [13] (maybe <- 0x840007) (Int)
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

P2117: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2118: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2119: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2120: !BST [9] (maybe <- 0x48800280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2121: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2122: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2123: !LD [6] (Int)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2124: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2125: !DWST [6] (maybe <- 0x840008) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2126: !BST [15] (maybe <- 0x488002a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2127: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2128: !BST [15] (maybe <- 0x488002c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2129: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2130: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P2131: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2132: !BST [3] (maybe <- 0x488002e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2133: !BST [1] (maybe <- 0x48800360) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2134: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P2135: !MEMBAR (Int)
membar #StoreLoad

P2136: !REPLACEMENT [2] (Int)
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

P2137: !BST [2] (maybe <- 0x488003e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2138: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2139: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2140: !REPLACEMENT [0] (Int)
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

P2141: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2142: !DWST [15] (maybe <- 0x84000a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2143: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2144: !BST [12] (maybe <- 0x48800460) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2145: !CASX [2] (maybe <- 0x84000b) (Int)
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

P2146: !BST [12] (maybe <- 0x48800480) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2147: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P2148: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2149: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2150: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P2151: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2152: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2153: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2154: !BST [9] (maybe <- 0x488004a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2155: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P2156: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2157: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2158: !ST [10] (maybe <- 0x84000c) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2159: !BST [14] (maybe <- 0x488004c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2160: !BST [1] (maybe <- 0x488004e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2161: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P2162: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2163: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2164: !BST [3] (maybe <- 0x48800560) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2165: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P2166: !BST [15] (maybe <- 0x488005e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2167: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2168: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2169: !DWST [12] (maybe <- 0x84000d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P2170: !REPLACEMENT [7] (Int)
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

P2171: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2172: !BST [2] (maybe <- 0x48800600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2173: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2174: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P2175: !BST [11] (maybe <- 0x48800680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2176: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2177: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2178: !REPLACEMENT [7] (Int)
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

P2179: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2180: !BST [14] (maybe <- 0x488006a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2181: !SWAP [1] (maybe <- 0x84000e) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2182: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2183: !BST [11] (maybe <- 0x488006c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2184: !BST [6] (maybe <- 0x488006e0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2185: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2186: !BST [1] (maybe <- 0x48800740) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2187: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2188: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2189: !BST [1] (maybe <- 0x488007c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2190: !BST [0] (maybe <- 0x48800840) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2191: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2192: !SWAP [3] (maybe <- 0x84000f) (Int)
mov %l4, %o3
swap  [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2193: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2194: !BST [3] (maybe <- 0x488008c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2195: !ST [6] (maybe <- 0x840010) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2196: !ST [10] (maybe <- 0x840011) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2197: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2198: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P2199: !BST [4] (maybe <- 0x48800940) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2200: !BST [6] (maybe <- 0x48800960) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2201: !NOP (Int)
nop

P2202: !BST [5] (maybe <- 0x488009c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2203: !BST [8] (maybe <- 0x48800a20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2204: !CASX [15] (maybe <- 0x840012) (Int)
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

P2205: !CASX [7] (maybe <- 0x840013) (Int)
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

P2206: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2207: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2208: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P2209: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2210: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2211: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2212: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P2213: !CASX [14] (maybe <- 0x840015) (Int)
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

P2214: !BST [9] (maybe <- 0x48800a40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2215: !DWST [10] (maybe <- 0x840016) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P2216: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2217: !BST [6] (maybe <- 0x48800a60) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2218: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2219: !SWAP [8] (maybe <- 0x840017) (Int)
mov %l4, %o1
swap  [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2220: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P2221: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2222: !BST [7] (maybe <- 0x48800ac0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2223: !BST [10] (maybe <- 0x48800b20) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2224: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2225: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P2226: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2227: !CAS [10] (maybe <- 0x840018) (Int)
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

P2228: !BST [3] (maybe <- 0x48800b40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2229: !BST [8] (maybe <- 0x48800bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2230: !BST [8] (maybe <- 0x48800be0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2231: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2232: !BST [15] (maybe <- 0x48800c00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2233: !CAS [3] (maybe <- 0x840019) (Int)
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

P2234: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2235: !MEMBAR (Int)
membar #StoreLoad

P2236: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2237: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P2238: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2239: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2240: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P2241: !BST [2] (maybe <- 0x48800c20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2242: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2243: !BST [2] (maybe <- 0x48800ca0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2244: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P2245: !BST [8] (maybe <- 0x48800d20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2246: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P2247: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2248: !BST [0] (maybe <- 0x48800d40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2249: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2250: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2251: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2252: !REPLACEMENT [9] (Int)
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

P2253: !CAS [8] (maybe <- 0x84001a) (Int)
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

P2254: !REPLACEMENT [2] (Int)
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

P2255: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2256: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2257: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2258: !MEMBAR (Int)
membar #StoreLoad

P2259: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2260: !BST [2] (maybe <- 0x48800dc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2261: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P2262: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2263: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2264: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P2265: !BST [9] (maybe <- 0x48800e40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2266: !BST [3] (maybe <- 0x48800e60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2267: !BST [5] (maybe <- 0x48800ee0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2268: !BST [11] (maybe <- 0x48800f40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2269: !CAS [0] (maybe <- 0x84001b) (Int)
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

P2270: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2271: !BST [0] (maybe <- 0x48800f60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2272: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2273: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2274: !BST [15] (maybe <- 0x48800fe0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2275: !BST [7] (maybe <- 0x48801000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2276: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2277: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2278: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2279: !DWST [8] (maybe <- 0x84001c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2280: !BST [3] (maybe <- 0x48801060) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2281: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2282: !BST [5] (maybe <- 0x488010e0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2283: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2284: !BST [15] (maybe <- 0x48801140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2285: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2286: !BST [1] (maybe <- 0x48801160) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2287: !BST [9] (maybe <- 0x488011e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2288: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2289: !DWST [2] (maybe <- 0x84001d) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P2290: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2291: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P2292: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2293: !ST [7] (maybe <- 0x84001e) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2294: !BST [0] (maybe <- 0x48801200) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2295: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2296: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2297: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2298: !BST [9] (maybe <- 0x48801280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2299: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P2300: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2301: !ST [13] (maybe <- 0x84001f) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2302: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P2303: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2304: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2305: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P2306: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2307: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2308: !BST [13] (maybe <- 0x488012a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2309: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2310: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2311: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2312: !SWAP [15] (maybe <- 0x840020) (Int)
mov %l4, %o4
swap  [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2313: !REPLACEMENT [2] (Int)
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

P2314: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2315: !CASX [15] (maybe <- 0x840021) (Int)
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

P2316: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2317: !BST [4] (maybe <- 0x488012c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2318: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P2319: !DWST [5] (maybe <- 0x840022) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P2320: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2321: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2322: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2323: !BST [1] (maybe <- 0x488012e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2324: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2325: !BST [6] (maybe <- 0x48801360) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2326: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2327: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2328: !CAS [12] (maybe <- 0x840023) (Int)
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

P2329: !BST [6] (maybe <- 0x488013c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2330: !CAS [13] (maybe <- 0x840024) (Int)
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

P2331: !REPLACEMENT [11] (Int)
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

P2332: !BST [6] (maybe <- 0x48801420) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2333: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2334: !DWST [7] (maybe <- 0x840025) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2335: !BST [6] (maybe <- 0x48801480) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2336: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2337: !MEMBAR (Int)
membar #StoreLoad

P2338: !BST [4] (maybe <- 0x488014e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2339: !BST [4] (maybe <- 0x48801500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2340: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2341: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2342: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2343: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2344: !BST [12] (maybe <- 0x48801520) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2345: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P2346: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P2347: !BST [1] (maybe <- 0x48801540) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2348: !BST [15] (maybe <- 0x488015c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2349: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P2350: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2351: !BST [1] (maybe <- 0x488015e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2352: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2353: !BST [15] (maybe <- 0x48801660) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2354: !MEMBAR (Int)
membar #StoreLoad

P2355: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2356: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P2357: !DWST [15] (maybe <- 0x840027) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2358: !BST [6] (maybe <- 0x48801680) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2359: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2360: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2361: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2362: !BST [10] (maybe <- 0x488016e0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2363: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2364: !BST [15] (maybe <- 0x48801700) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2365: !ST [3] (maybe <- 0x840028) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2366: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P2367: !BST [0] (maybe <- 0x48801720) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2368: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2369: !REPLACEMENT [14] (Int)
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

P2370: !BST [0] (maybe <- 0x488017a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2371: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2372: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2373: !REPLACEMENT [14] (Int)
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

P2374: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2375: !CASX [15] (maybe <- 0x840029) (Int)
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

P2376: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2377: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2378: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2379: !BST [7] (maybe <- 0x48801820) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2380: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2381: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2382: !BST [15] (maybe <- 0x48801880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2383: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2384: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2385: !REPLACEMENT [5] (Int)
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

P2386: !BST [1] (maybe <- 0x488018a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2387: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2388: !BST [0] (maybe <- 0x48801920) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2389: !CAS [15] (maybe <- 0x84002a) (Int)
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

P2390: !BST [12] (maybe <- 0x488019a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2391: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2392: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2393: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P2394: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2395: !BST [6] (maybe <- 0x488019c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2396: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2397: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2398: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2399: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2400: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2401: !BST [9] (maybe <- 0x48801a20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2402: !BST [8] (maybe <- 0x48801a40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2403: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2404: !BST [7] (maybe <- 0x48801a60) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2405: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P2406: !BST [12] (maybe <- 0x48801ac0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2407: !BST [9] (maybe <- 0x48801ae0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2408: !BST [9] (maybe <- 0x48801b00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2409: !REPLACEMENT [6] (Int)
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

P2410: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2411: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2412: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2413: !ST [5] (maybe <- 0x84002b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2414: !BST [9] (maybe <- 0x48801b20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2415: !BST [4] (maybe <- 0x48801b40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2416: !BST [8] (maybe <- 0x48801b60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2417: !BST [14] (maybe <- 0x48801b80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2418: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o2(lower)
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o2, %o2

P2419: !BST [14] (maybe <- 0x48801ba0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2420: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2421: !BST [4] (maybe <- 0x48801bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2422: !BST [2] (maybe <- 0x48801be0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2423: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P2424: !BST [11] (maybe <- 0x48801c60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2425: !ST [15] (maybe <- 0x84002c) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2426: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2427: !BST [10] (maybe <- 0x48801c80) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2428: !BST [9] (maybe <- 0x48801ca0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2429: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2430: !SWAP [15] (maybe <- 0x84002d) (Int)
mov %l4, %o3
swap  [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2431: !BST [3] (maybe <- 0x48801cc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2432: !BST [6] (maybe <- 0x48801d40) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2433: !CAS [8] (maybe <- 0x84002e) (Int)
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

P2434: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P2435: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2436: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2437: !BST [8] (maybe <- 0x48801da0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2438: !BST [3] (maybe <- 0x48801dc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2439: !BST [6] (maybe <- 0x48801e40) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2440: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P2441: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2442: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2443: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2444: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2445: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2446: !ST [12] (maybe <- 0x84002f) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2447: !CAS [0] (maybe <- 0x840030) (Int)
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

P2448: !BST [4] (maybe <- 0x48801ea0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2449: !REPLACEMENT [9] (Int)
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

P2450: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2451: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2452: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P2453: !MEMBAR (Int)
membar #StoreLoad

P2454: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2455: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P2456: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2457: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P2458: !SWAP [10] (maybe <- 0x840031) (Int)
mov %l4, %o1
swap  [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2459: !BST [9] (maybe <- 0x48801ec0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2460: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2461: !BST [8] (maybe <- 0x48801ee0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2462: !BST [12] (maybe <- 0x48801f00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2463: !BST [9] (maybe <- 0x48801f20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2464: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2465: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2466: !BST [8] (maybe <- 0x48801f40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2467: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2468: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2469: !BST [8] (maybe <- 0x48801f60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2470: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2471: !REPLACEMENT [6] (Int)
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

P2472: !BST [0] (maybe <- 0x48801f80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2473: !BST [0] (maybe <- 0x48802000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2474: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P2475: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2476: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2477: !REPLACEMENT [9] (Int)
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

P2478: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2479: !DWST [2] (maybe <- 0x840032) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P2480: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P2481: !MEMBAR (Int)
membar #StoreLoad

P2482: !REPLACEMENT [8] (Int)
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

P2483: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2484: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2485: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2486: !BST [8] (maybe <- 0x48802080) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2487: !BST [10] (maybe <- 0x488020a0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2488: !BST [3] (maybe <- 0x488020c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2489: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2490: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2491: !BST [9] (maybe <- 0x48802140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2492: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2493: !DWST [0] (maybe <- 0x840033) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P2494: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2495: !BST [1] (maybe <- 0x48802160) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2496: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2497: !BST [1] (maybe <- 0x488021e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2498: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P2499: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2500: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2501: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2502: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2503: !BST [11] (maybe <- 0x48802260) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2504: !BST [4] (maybe <- 0x48802280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2505: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P2506: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2507: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2508: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2509: !BST [4] (maybe <- 0x488022a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2510: !DWLD [7] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P2511: !BST [0] (maybe <- 0x488022c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2512: !BST [6] (maybe <- 0x48802340) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2513: !BST [6] (maybe <- 0x488023a0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2514: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P2515: !LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2516: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2517: !BST [6] (maybe <- 0x48802400) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2518: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P2519: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2520: !BST [7] (maybe <- 0x48802460) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2521: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2522: !BST [0] (maybe <- 0x488024c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2523: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2524: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2525: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2526: !BST [14] (maybe <- 0x48802540) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2527: !BST [5] (maybe <- 0x48802560) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2528: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2529: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2530: !BST [10] (maybe <- 0x488025c0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2531: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2532: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2533: !BST [4] (maybe <- 0x488025e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2534: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P2535: !BST [8] (maybe <- 0x48802600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2536: !BST [15] (maybe <- 0x48802620) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2537: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2538: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2539: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2540: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2541: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P2542: !BST [6] (maybe <- 0x48802640) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2543: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2544: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P2545: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2546: !BST [7] (maybe <- 0x488026a0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2547: !MEMBAR (Int)
membar #StoreLoad

P2548: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P2549: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2550: !BST [9] (maybe <- 0x48802700) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2551: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2552: !REPLACEMENT [7] (Int)
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

P2553: !REPLACEMENT [2] (Int)
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

P2554: !CASX [0] (maybe <- 0x840035) (Int)
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

P2555: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2556: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P2557: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2558: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2559: !BST [8] (maybe <- 0x48802720) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2560: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2561: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2562: !BST [4] (maybe <- 0x48802740) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2563: !SWAP [11] (maybe <- 0x840037) (Int)
mov %l4, %o1
swap  [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2564: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2565: !BST [15] (maybe <- 0x48802760) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2566: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P2567: !REPLACEMENT [2] (Int)
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

P2568: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2569: !MEMBAR (Int)
membar #StoreLoad

P2570: !LD [0] (FP)
ld [%i0 + 0], %f9
! 1 addresses covered

P2571: !LD [1] (FP)
ld [%i0 + 4], %f10
! 1 addresses covered

P2572: !LD [2] (FP)
ld [%i0 + 12], %f11
! 1 addresses covered

P2573: !LD [3] (FP)
ld [%i0 + 32], %f12
! 1 addresses covered

P2574: !LD [4] (FP)
ld [%i0 + 64], %f13
! 1 addresses covered

P2575: !LD [5] (FP)
ld [%i1 + 76], %f14
! 1 addresses covered

P2576: !LD [6] (FP)
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

P2577: !LD [7] (FP)
ld [%i1 + 84], %f0
! 1 addresses covered

P2578: !LD [8] (FP)
ld [%i1 + 256], %f1
! 1 addresses covered

P2579: !LD [9] (FP)
ld [%i1 + 512], %f2
! 1 addresses covered

P2580: !LD [10] (FP)
ld [%i2 + 32], %f3
! 1 addresses covered

P2581: !LD [11] (FP)
ld [%i2 + 64], %f4
! 1 addresses covered

P2582: !LD [12] (FP)
ld [%i3 + 0], %f5
! 1 addresses covered

P2583: !LD [13] (FP)
ld [%i3 + 64], %f6
! 1 addresses covered

P2584: !LD [14] (FP)
ld [%i3 + 128], %f7
! 1 addresses covered

P2585: !LD [15] (FP)
ld [%i3 + 192], %f8
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

restore
retl
nop
!-----------------



func5:

! 500 instruction sequence begins
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

P2586: !BST [8] (maybe <- 0x489fff80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2587: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P2588: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2589: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2590: !BST [0] (maybe <- 0x489fffa0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2591: !BST [11] (maybe <- 0x48a00020) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2592: !BST [4] (maybe <- 0x48a00040) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2593: !BST [11] (maybe <- 0x48a00060) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2594: !BST [1] (maybe <- 0x48a00080) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2595: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2596: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2597: !BST [1] (maybe <- 0x48a00100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2598: !CAS [2] (maybe <- 0x850001) (Int)
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

P2599: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P2600: !DWLD [3] (FP)
! case fp 
ldd  [%i0 + 32], %f4
! 1 addresses covered

P2601: !BST [3] (maybe <- 0x48a00180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2602: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2603: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2604: !CASX [13] (maybe <- 0x850002) (Int)
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

P2605: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P2606: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2607: !LD [11] (Int)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2608: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2609: !BST [6] (maybe <- 0x48a00200) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2610: !LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2611: !SWAP [2] (maybe <- 0x850003) (Int)
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

P2612: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2613: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2614: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2615: !BST [13] (maybe <- 0x48a00260) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2616: !ST [10] (maybe <- 0x850004) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2617: !BST [6] (maybe <- 0x48a00280) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2618: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2619: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2620: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P2621: !BST [1] (maybe <- 0x48a002e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2622: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2623: !ST [15] (maybe <- 0x850005) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2624: !BST [8] (maybe <- 0x48a00360) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2625: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2626: !BST [15] (maybe <- 0x48a00380) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2627: !CAS [8] (maybe <- 0x850006) (Int)
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

P2628: !BST [3] (maybe <- 0x48a003a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2629: !BST [1] (maybe <- 0x48a00420) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2630: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2631: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2632: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2633: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P2634: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2635: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2636: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2637: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2638: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2639: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2640: !CAS [15] (maybe <- 0x850007) (Int)
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

P2641: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2642: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2643: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2644: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2645: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2646: !CASX [10] (maybe <- 0x850008) (Int)
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

P2647: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2648: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2649: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2650: !BST [2] (maybe <- 0x48a004a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2651: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P2652: !BST [7] (maybe <- 0x48a00520) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2653: !BST [9] (maybe <- 0x48a00580) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2654: !LD [3] (FP)
ld [%i0 + 32], %f9
! 1 addresses covered

P2655: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2656: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P2657: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2658: !ST [15] (maybe <- 0x850009) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2659: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2660: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2661: !ST [5] (maybe <- 0x85000a) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2662: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2663: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2664: !DWST [14] (maybe <- 0x85000b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2665: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2666: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2667: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2668: !CASX [15] (maybe <- 0x85000c) (Int)
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

P2669: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2670: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2671: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2672: !LD [15] (FP)
ld [%i3 + 192], %f12
! 1 addresses covered

P2673: !BST [9] (maybe <- 0x48a005a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2674: !BST [3] (maybe <- 0x48a005c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2675: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2676: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2677: !NOP (Int)
nop

P2678: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2679: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2680: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P2681: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2682: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2683: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2684: !BST [13] (maybe <- 0x48a00640) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2685: !BST [4] (maybe <- 0x48a00660) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2686: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2687: !ST [13] (maybe <- 0x85000d) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2688: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2689: !DWLD [11] (FP)
! case fp 
ldd  [%i2 + 64], %f18
! 1 addresses covered
fmovs %f18, %f7

P2690: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2691: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2692: !BST [14] (maybe <- 0x48a00680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2693: !BST [4] (maybe <- 0x48a006a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2694: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2695: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2696: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2697: !NOP (Int)
nop

P2698: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2699: !LD [10] (FP)
ld [%i2 + 32], %f9
! 1 addresses covered

P2700: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2701: !CASX [11] (maybe <- 0x85000e) (Int)
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

P2702: !BST [4] (maybe <- 0x48a006c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2703: !BST [4] (maybe <- 0x48a006e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2704: !BST [5] (maybe <- 0x48a00700) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2705: !BST [2] (maybe <- 0x48a00760) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2706: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P2707: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2708: !BST [13] (maybe <- 0x48a007e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2709: !CAS [7] (maybe <- 0x85000f) (Int)
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

P2710: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2711: !BST [14] (maybe <- 0x48a00800) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2712: !MEMBAR (Int)
membar #StoreLoad

P2713: !BST [0] (maybe <- 0x48a00820) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2714: !REPLACEMENT [15] (Int)
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

P2715: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2716: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2717: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2718: !CASX [14] (maybe <- 0x850010) (Int)
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

P2719: !DWST [14] (maybe <- 0x850011) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2720: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2721: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2722: !BST [1] (maybe <- 0x48a008a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2723: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2724: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P2725: !BST [8] (maybe <- 0x48a00920) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2726: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2727: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P2728: !BST [13] (maybe <- 0x48a00940) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2729: !BST [15] (maybe <- 0x48a00960) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2730: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2731: !BST [6] (maybe <- 0x48a00980) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2732: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2733: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2734: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2735: !DWST [15] (maybe <- 0x850012) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2736: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2737: !BST [3] (maybe <- 0x48a009e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2738: !BST [10] (maybe <- 0x48a00a60) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2739: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2740: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2741: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2742: !REPLACEMENT [9] (Int)
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

P2743: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2744: !MEMBAR (Int)
membar #StoreLoad

P2745: !DWST [13] (maybe <- 0x850013) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2746: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2747: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2748: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2749: !DWLD [2] (FP)
! case fp 
ldd  [%i0 + 8], %f6
! 1 addresses covered
fmovs %f7, %f6

P2750: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2751: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2752: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2753: !BST [3] (maybe <- 0x48a00a80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2754: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2755: !BST [5] (maybe <- 0x48a00b00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2756: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2757: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2758: !ST [6] (maybe <- 0x850014) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2759: !DWST [12] (maybe <- 0x850015) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P2760: !BST [3] (maybe <- 0x48a00b60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2761: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2762: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2763: !BST [5] (maybe <- 0x48a00be0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2764: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P2765: !BST [8] (maybe <- 0x48a00c40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2766: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2767: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2768: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2769: !BST [11] (maybe <- 0x48a00c60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2770: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2771: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2772: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2773: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P2774: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2775: !BST [13] (maybe <- 0x48a00c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2776: !REPLACEMENT [7] (Int)
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

P2777: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P2778: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2779: !DWST [15] (maybe <- 0x850016) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2780: !REPLACEMENT [5] (Int)
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

P2781: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P2782: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2783: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2784: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2785: !REPLACEMENT [11] (Int)
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

P2786: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
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

P2787: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P2788: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2789: !BST [3] (maybe <- 0x48a00ca0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2790: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2791: !BST [6] (maybe <- 0x48a00d20) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2792: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2793: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2794: !BST [8] (maybe <- 0x48a00d80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2795: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2796: !DWST [6] (maybe <- 0x850017) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2797: !BST [4] (maybe <- 0x48a00da0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2798: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2799: !BST [9] (maybe <- 0x48a00dc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2800: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2801: !BST [12] (maybe <- 0x48a00de0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2802: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2803: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2804: !DWLD [1] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P2805: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2806: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P2807: !BST [1] (maybe <- 0x48a00e00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2808: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2809: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2810: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2811: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2812: !BST [9] (maybe <- 0x48a00e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2813: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2814: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2815: !BST [15] (maybe <- 0x48a00ea0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2816: !DWST [7] (maybe <- 0x850019) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2817: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P2818: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2819: !BST [8] (maybe <- 0x48a00ec0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2820: !BST [12] (maybe <- 0x48a00ee0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2821: !ST [9] (maybe <- 0x85001b) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2822: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3

P2823: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2824: !DWST [11] (maybe <- 0x48a00f00) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 64]

P2825: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2826: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2827: !CAS [9] (maybe <- 0x85001c) (Int)
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

P2828: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2829: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2830: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2831: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2832: !ST [5] (maybe <- 0x85001d) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2833: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2834: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2835: !BST [5] (maybe <- 0x48a00f20) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2836: !BST [5] (maybe <- 0x48a00f80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2837: !BST [3] (maybe <- 0x48a00fe0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2838: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2839: !BST [0] (maybe <- 0x48a01060) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2840: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2841: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2842: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2843: !DWST [4] (maybe <- 0x48a010e0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 64]

P2844: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2845: !BST [12] (maybe <- 0x48a01100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2846: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2847: !BST [2] (maybe <- 0x48a01120) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2848: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2849: !REPLACEMENT [4] (Int)
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

P2850: !BST [10] (maybe <- 0x48a011a0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2851: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P2852: !BST [8] (maybe <- 0x48a011c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2853: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2854: !ST [3] (maybe <- 0x85001e) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2855: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2856: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2857: !REPLACEMENT [0] (Int)
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

P2858: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2859: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P2860: !DWLD [6] (FP)
! case fp 
ldd  [%i1 + 80], %f18
! 2 addresses covered
fmovs %f18, %f9
fmovs %f19, %f10

P2861: !BST [2] (maybe <- 0x48a011e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2862: !BST [12] (maybe <- 0x48a01260) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2863: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2864: !DWLD [0] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2865: !DWST [3] (maybe <- 0x85001f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2866: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2867: !BST [11] (maybe <- 0x48a01280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2868: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2869: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2870: !BST [3] (maybe <- 0x48a012a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2871: !DWLD [4] (Int)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

P2872: !DWST [7] (maybe <- 0x850020) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P2873: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2874: !ST [13] (maybe <- 0x850022) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2875: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P2876: !BST [1] (maybe <- 0x48a01320) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2877: !BST [6] (maybe <- 0x48a013a0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2878: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2879: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2880: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2881: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2882: !REPLACEMENT [6] (Int)
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

P2883: !BST [15] (maybe <- 0x48a01400) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2884: !BST [6] (maybe <- 0x48a01420) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2885: !ST [12] (maybe <- 0x850023) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2886: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2887: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2888: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2889: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2890: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2891: !BST [8] (maybe <- 0x48a01480) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2892: !BST [0] (maybe <- 0x48a014a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2893: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2894: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2895: !REPLACEMENT [13] (Int)
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

P2896: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2897: !REPLACEMENT [11] (Int)
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

P2898: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P2899: !REPLACEMENT [12] (Int)
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

P2900: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2901: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2902: !BST [1] (maybe <- 0x48a01520) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2903: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2904: !BST [4] (maybe <- 0x48a015a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2905: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2906: !BST [6] (maybe <- 0x48a015c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2907: !BST [12] (maybe <- 0x48a01620) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2908: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P2909: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2910: !BST [14] (maybe <- 0x48a01640) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2911: !BST [9] (maybe <- 0x48a01660) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2912: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P2913: !BST [2] (maybe <- 0x48a01680) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2914: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2915: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P2916: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2917: !BST [9] (maybe <- 0x48a01700) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2918: !BST [0] (maybe <- 0x48a01720) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2919: !BST [15] (maybe <- 0x48a017a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2920: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2921: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2922: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2923: !REPLACEMENT [6] (Int)
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

P2924: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P2925: !BST [8] (maybe <- 0x48a017c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2926: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2927: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2928: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P2929: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2930: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2931: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2932: !BST [5] (maybe <- 0x48a017e0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2933: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P2934: !BST [12] (maybe <- 0x48a01840) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2935: !BST [10] (maybe <- 0x48a01860) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2936: !BST [0] (maybe <- 0x48a01880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2937: !BST [1] (maybe <- 0x48a01900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2938: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2939: !DWST [15] (maybe <- 0x850024) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2940: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2941: !DWST [7] (maybe <- 0x48a01980) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P2942: !LD [5] (FP)
ld [%i1 + 76], %f1
! 1 addresses covered

P2943: !BST [10] (maybe <- 0x48a019c0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2944: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2945: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P2946: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P2947: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2948: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2949: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2950: !BST [5] (maybe <- 0x48a019e0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2951: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2952: !DWLD [4] (Int)
ldx [%i0 + 64], %o3
! move %o3(upper) -> %o3(upper)

P2953: !MEMBAR (Int)
membar #StoreLoad

P2954: !BST [7] (maybe <- 0x48a01a40) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2955: !BST [1] (maybe <- 0x48a01aa0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2956: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2957: !BST [13] (maybe <- 0x48a01b20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2958: !ST [13] (maybe <- 0x850025) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2959: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2960: !BST [0] (maybe <- 0x48a01b40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2961: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2962: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P2963: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2964: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2965: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P2966: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2967: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2968: !BST [2] (maybe <- 0x48a01bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2969: !BST [9] (maybe <- 0x48a01c40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2970: !BST [4] (maybe <- 0x48a01c60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2971: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2972: !BST [14] (maybe <- 0x48a01c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2973: !BST [6] (maybe <- 0x48a01ca0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2974: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2975: !BST [4] (maybe <- 0x48a01d00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2976: !DWLD [9] (FP)
! case fp 
ldd  [%i1 + 512], %f8
! 1 addresses covered

P2977: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2978: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2979: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2980: !DWLD [7] (Int)
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

P2981: !BST [4] (maybe <- 0x48a01d20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2982: !BST [7] (maybe <- 0x48a01d40) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2983: !ST [4] (maybe <- 0x850026) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2984: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2985: !BST [6] (maybe <- 0x48a01da0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2986: !BST [14] (maybe <- 0x48a01e00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2987: !BST [8] (maybe <- 0x48a01e20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2988: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2989: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2990: !NOP (Int)
nop

P2991: !BST [6] (maybe <- 0x48a01e40) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2992: !ST [4] (maybe <- 0x850027) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2993: !BST [14] (maybe <- 0x48a01ea0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2994: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2995: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P2996: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2997: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P2998: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2999: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3000: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P3001: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3002: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P3003: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3004: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P3005: !ST [9] (maybe <- 0x850028) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3006: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3007: !BST [1] (maybe <- 0x48a01ec0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3008: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3009: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3010: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3011: !MEMBAR (Int)
membar #StoreLoad

P3012: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P3013: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P3014: !BST [6] (maybe <- 0x48a01f40) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3015: !BST [1] (maybe <- 0x48a01fa0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3016: !BST [4] (maybe <- 0x48a02020) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3017: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3018: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3019: !REPLACEMENT [6] (Int)
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

P3020: !BST [8] (maybe <- 0x48a02040) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3021: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3022: !BST [0] (maybe <- 0x48a02060) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3023: !BST [4] (maybe <- 0x48a020e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3024: !ST [8] (maybe <- 0x850029) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3025: !BST [9] (maybe <- 0x48a02100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3026: !REPLACEMENT [9] (Int)
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

P3027: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3028: !BST [0] (maybe <- 0x48a02120) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3029: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3030: !BST [4] (maybe <- 0x48a021a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3031: !REPLACEMENT [5] (Int)
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

P3032: !ST [1] (maybe <- 0x85002a) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3033: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P3034: !BST [4] (maybe <- 0x48a021c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3035: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3036: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3037: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3038: !BST [7] (maybe <- 0x48a021e0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3039: !BST [13] (maybe <- 0x48a02240) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3040: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3041: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3042: !CAS [10] (maybe <- 0x85002b) (Int)
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

P3043: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3044: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3045: !CAS [11] (maybe <- 0x85002c) (Int)
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

P3046: !DWST [8] (maybe <- 0x85002d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P3047: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3048: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3049: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3050: !SWAP [8] (maybe <- 0x85002e) (Int)
mov %l4, %o3
swap  [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3051: !BST [3] (maybe <- 0x48a02260) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3052: !CAS [7] (maybe <- 0x85002f) (Int)
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

P3053: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3054: !ST [7] (maybe <- 0x850030) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3055: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3056: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3057: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3058: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3059: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3060: !BST [15] (maybe <- 0x48a022e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3061: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3062: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3063: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3064: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3065: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3066: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3067: !BST [2] (maybe <- 0x48a02300) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3068: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3069: !DWLD [0] (Int)
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

P3070: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3071: !BST [10] (maybe <- 0x48a02380) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3072: !REPLACEMENT [11] (Int)
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

P3073: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3074: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3075: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3076: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3077: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3078: !BST [4] (maybe <- 0x48a023a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3079: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3080: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P3081: !BST [2] (maybe <- 0x48a023c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3082: !BST [7] (maybe <- 0x48a02440) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3083: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3084: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3085: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3086: !MEMBAR (FP)
membar #StoreLoad

P3087: !LD [0] (FP)
ld [%i0 + 0], %f2
! 1 addresses covered

P3088: !LD [1] (FP)
ld [%i0 + 4], %f3
! 1 addresses covered

P3089: !LD [2] (FP)
ld [%i0 + 12], %f4
! 1 addresses covered

P3090: !LD [3] (FP)
ld [%i0 + 32], %f5
! 1 addresses covered

P3091: !LD [4] (FP)
ld [%i0 + 64], %f6
! 1 addresses covered

P3092: !LD [5] (FP)
ld [%i1 + 76], %f7
! 1 addresses covered

P3093: !LD [6] (FP)
ld [%i1 + 80], %f8
! 1 addresses covered

P3094: !LD [7] (FP)
ld [%i1 + 84], %f9
! 1 addresses covered

P3095: !LD [8] (FP)
ld [%i1 + 256], %f10
! 1 addresses covered

P3096: !LD [9] (FP)
ld [%i1 + 512], %f11
! 1 addresses covered

P3097: !LD [10] (FP)
ld [%i2 + 32], %f12
! 1 addresses covered

P3098: !LD [11] (FP)
ld [%i2 + 64], %f13
! 1 addresses covered

P3099: !LD [12] (FP)
ld [%i3 + 0], %f14
! 1 addresses covered

P3100: !LD [13] (FP)
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

P3101: !LD [14] (FP)
ld [%i3 + 128], %f0
! 1 addresses covered

P3102: !LD [15] (FP)
ld [%i3 + 192], %f1
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %o5
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30

restore
retl
nop
!-----------------



func6:

! 500 instruction sequence begins
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

P3103: !BST [15] (maybe <- 0x48bfff60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3104: !BST [11] (maybe <- 0x48bfff80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3105: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3106: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3107: !DWST [8] (maybe <- 0x860001) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P3108: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3109: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3110: !DWLD [11] (Int)
ldx [%i2 + 64], %o0
! move %o0(upper) -> %o0(upper)

P3111: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3112: !BST [11] (maybe <- 0x48bfffa0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3113: !BST [14] (maybe <- 0x48bfffc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3114: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P3115: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P3116: !BST [12] (maybe <- 0x48bfffe0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3117: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3118: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3119: !DWST [9] (maybe <- 0x860002) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3120: !BST [3] (maybe <- 0x48c00000) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3121: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3122: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3123: !BST [7] (maybe <- 0x48c00080) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3124: !ST [5] (maybe <- 0x860003) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3125: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3126: !DWLD [11] (Int)
ldx [%i2 + 64], %o1
! move %o1(upper) -> %o1(upper)

P3127: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3128: !BST [8] (maybe <- 0x48c000e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3129: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3130: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3131: !REPLACEMENT [10] (Int)
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

P3132: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3133: !SWAP [11] (maybe <- 0x860004) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3134: !DWST [2] (maybe <- 0x860005) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P3135: !REPLACEMENT [6] (Int)
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

P3136: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P3137: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3138: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3139: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3140: !BST [13] (maybe <- 0x48c00100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3141: !BST [11] (maybe <- 0x48c00120) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3142: !DWST [3] (maybe <- 0x860006) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3143: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P3144: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3145: !BST [8] (maybe <- 0x48c00140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3146: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3147: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3148: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P3149: !BST [8] (maybe <- 0x48c00160) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3150: !BST [12] (maybe <- 0x48c00180) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3151: !BST [8] (maybe <- 0x48c001a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3152: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3153: !BST [8] (maybe <- 0x48c001c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3154: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3155: !BST [9] (maybe <- 0x48c001e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3156: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3157: !BST [15] (maybe <- 0x48c00200) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3158: !DWST [7] (maybe <- 0x860007) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3159: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3160: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3161: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3162: !DWLD [4] (FP)
! case fp 
ldd  [%i0 + 64], %f18
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

P3163: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3164: !CAS [1] (maybe <- 0x860009) (Int)
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

P3165: !BST [4] (maybe <- 0x48c00220) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3166: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3167: !BST [4] (maybe <- 0x48c00240) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3168: !BST [10] (maybe <- 0x48c00260) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3169: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3170: !BST [5] (maybe <- 0x48c00280) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3171: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3172: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P3173: !BST [0] (maybe <- 0x48c002e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3174: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3175: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3176: !DWLD [8] (Int)
ldx [%i1 + 256], %o0
! move %o0(upper) -> %o0(upper)

P3177: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3178: !BST [7] (maybe <- 0x48c00360) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3179: !DWST [11] (maybe <- 0x86000a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3180: !BST [1] (maybe <- 0x48c003c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3181: !BST [2] (maybe <- 0x48c00440) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3182: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3183: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3184: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3185: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P3186: !MEMBAR (Int)
membar #StoreLoad

P3187: !BST [6] (maybe <- 0x48c004c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3188: !BST [14] (maybe <- 0x48c00520) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3189: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3190: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3191: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3192: !MEMBAR (Int)
membar #StoreLoad

P3193: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3194: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3195: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3196: !BST [2] (maybe <- 0x48c00540) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3197: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3198: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3199: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P3200: !BST [5] (maybe <- 0x48c005c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3201: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3202: !ST [12] (maybe <- 0x48c00620) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P3203: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3204: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3205: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P3206: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3207: !BST [3] (maybe <- 0x48c00640) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3208: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3209: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3210: !BST [5] (maybe <- 0x48c006c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3211: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
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
fmovd %f36, %f0

P3212: !BST [3] (maybe <- 0x48c00720) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3213: !BST [8] (maybe <- 0x48c007a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3214: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3215: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3216: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3217: !BST [3] (maybe <- 0x48c007c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3218: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3219: !BST [1] (maybe <- 0x48c00840) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3220: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3221: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3222: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3223: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3224: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3225: !BST [8] (maybe <- 0x48c008c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3226: !BST [8] (maybe <- 0x48c008e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3227: !BST [13] (maybe <- 0x48c00900) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3228: !ST [12] (maybe <- 0x86000b) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3229: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3230: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3231: !REPLACEMENT [11] (Int)
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

P3232: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3233: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3234: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3235: !BST [8] (maybe <- 0x48c00920) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3236: !BST [5] (maybe <- 0x48c00940) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3237: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3238: !BST [7] (maybe <- 0x48c009a0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3239: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P3240: !CAS [4] (maybe <- 0x86000c) (Int)
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

P3241: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3242: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3243: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3244: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3245: !BST [0] (maybe <- 0x48c00a00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3246: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P3247: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3248: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3249: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3250: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3251: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3252: !BST [11] (maybe <- 0x48c00a80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3253: !ST [2] (maybe <- 0x86000d) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3254: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3255: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3256: !ST [9] (maybe <- 0x86000e) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3257: !BST [1] (maybe <- 0x48c00aa0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3258: !BST [1] (maybe <- 0x48c00b20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3259: !ST [2] (maybe <- 0x86000f) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3260: !BST [15] (maybe <- 0x48c00ba0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3261: !BST [15] (maybe <- 0x48c00bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3262: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P3263: !SWAP [11] (maybe <- 0x860010) (Int)
mov %l4, %o2
swap  [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3264: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P3265: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3266: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P3267: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3268: !ST [10] (maybe <- 0x860011) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3269: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3270: !BST [0] (maybe <- 0x48c00be0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3271: !BST [12] (maybe <- 0x48c00c60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3272: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3273: !BST [7] (maybe <- 0x48c00c80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3274: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P3275: !BST [4] (maybe <- 0x48c00ce0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3276: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3277: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3278: !BST [9] (maybe <- 0x48c00d00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3279: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3280: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3281: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3282: !ST [13] (maybe <- 0x860012) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3283: !BST [12] (maybe <- 0x48c00d20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3284: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3285: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3286: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P3287: !CASX [5] (maybe <- 0x860013) (Int)
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

P3288: !LD [4] (FP)
ld [%i0 + 64], %f9
! 1 addresses covered

P3289: !BST [2] (maybe <- 0x48c00d40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3290: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3291: !BST [4] (maybe <- 0x48c00dc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3292: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3293: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3294: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3295: !BST [11] (maybe <- 0x48c00de0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3296: !BST [12] (maybe <- 0x48c00e00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3297: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P3298: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3299: !BST [5] (maybe <- 0x48c00e20) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3300: !BST [7] (maybe <- 0x48c00e80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3301: !REPLACEMENT [13] (Int)
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

P3302: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3303: !BST [2] (maybe <- 0x48c00ee0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3304: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3305: !BST [4] (maybe <- 0x48c00f60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3306: !BST [4] (maybe <- 0x48c00f80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3307: !BST [11] (maybe <- 0x48c00fa0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3308: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3309: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3310: !CASX [8] (maybe <- 0x860014) (Int)
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

P3311: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3312: !CAS [10] (maybe <- 0x860015) (Int)
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

P3313: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3314: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3315: !BST [0] (maybe <- 0x48c00fc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3316: !BST [4] (maybe <- 0x48c01040) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3317: !REPLACEMENT [10] (Int)
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

P3318: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3319: !BST [1] (maybe <- 0x48c01060) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3320: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3321: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3322: !BST [5] (maybe <- 0x48c010e0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3323: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3324: !BST [2] (maybe <- 0x48c01140) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3325: !CAS [14] (maybe <- 0x860016) (Int)
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

P3326: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P3327: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3328: !REPLACEMENT [2] (Int)
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

P3329: !REPLACEMENT [5] (Int)
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

P3330: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3331: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3332: !BST [4] (maybe <- 0x48c011c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3333: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3334: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3335: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3336: !BST [7] (maybe <- 0x48c011e0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3337: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3338: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P3339: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3340: !CAS [15] (maybe <- 0x860017) (Int)
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

P3341: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3342: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3343: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3344: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3345: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3346: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3347: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P3348: !CASX [1] (maybe <- 0x860018) (Int)
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

P3349: !ST [2] (maybe <- 0x86001a) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3350: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3351: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3352: !CASX [11] (maybe <- 0x86001b) (Int)
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

P3353: !ST [6] (maybe <- 0x86001c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3354: !REPLACEMENT [15] (Int)
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

P3355: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3356: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3357: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3358: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3359: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3360: !REPLACEMENT [5] (Int)
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

P3361: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3362: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3363: !BST [8] (maybe <- 0x48c01240) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3364: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P3365: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3366: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3367: !CAS [0] (maybe <- 0x86001d) (Int)
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

P3368: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P3369: !CAS [0] (maybe <- 0x86001e) (Int)
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

P3370: !BST [9] (maybe <- 0x48c01260) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3371: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3372: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3373: !REPLACEMENT [2] (Int)
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

P3374: !CAS [9] (maybe <- 0x86001f) (Int)
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

P3375: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P3376: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3377: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3378: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3379: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3380: !BST [11] (maybe <- 0x48c01280) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3381: !BST [6] (maybe <- 0x48c012a0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3382: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3383: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3384: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3385: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P3386: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3387: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3388: !BST [4] (maybe <- 0x48c01300) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3389: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3390: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3391: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P3392: !ST [4] (maybe <- 0x860020) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3393: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3394: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3395: !BST [0] (maybe <- 0x48c01320) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3396: !CASX [6] (maybe <- 0x860021) (Int)
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

P3397: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3398: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3399: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3400: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3401: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3402: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P3403: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3404: !DWST [13] (maybe <- 0x860023) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P3405: !BST [6] (maybe <- 0x48c013a0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3406: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3407: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3408: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3409: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3410: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3411: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3412: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3413: !BST [2] (maybe <- 0x48c01400) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3414: !BST [0] (maybe <- 0x48c01480) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3415: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3416: !BST [12] (maybe <- 0x48c01500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3417: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P3418: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3419: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3420: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3421: !BST [15] (maybe <- 0x48c01520) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3422: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3423: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P3424: !REPLACEMENT [14] (Int)
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

P3425: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3426: !CAS [1] (maybe <- 0x860024) (Int)
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

P3427: !CASX [12] (maybe <- 0x860025) (Int)
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

P3428: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3429: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3430: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P3431: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3432: !LD [5] (FP)
ld [%i1 + 76], %f5
! 1 addresses covered

P3433: !BST [11] (maybe <- 0x48c01540) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3434: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3435: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P3436: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3437: !BST [4] (maybe <- 0x48c01560) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3438: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3439: !CASX [2] (maybe <- 0x860026) (Int)
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

P3440: !CASX [12] (maybe <- 0x860027) (Int)
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

P3441: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3442: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3443: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3444: !BST [1] (maybe <- 0x48c01580) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3445: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3446: !MEMBAR (Int)
membar #StoreLoad

P3447: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3448: !BST [11] (maybe <- 0x48c01600) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3449: !BST [12] (maybe <- 0x48c01620) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3450: !BST [3] (maybe <- 0x48c01640) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3451: !BST [0] (maybe <- 0x48c016c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3452: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3453: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3454: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3455: !SWAP [4] (maybe <- 0x860028) (Int)
mov %l4, %l6
swap  [%i0 + 64], %l6
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

P3456: !ST [15] (maybe <- 0x860029) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3457: !BST [2] (maybe <- 0x48c01740) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3458: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3459: !DWST [5] (maybe <- 0x86002a) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72 ] 
add   %l4, 1, %l4

P3460: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3461: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3462: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3463: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3464: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3465: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3466: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3467: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3468: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3469: !BST [7] (maybe <- 0x48c017c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3470: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3471: !CASX [10] (maybe <- 0x86002b) (Int)
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

P3472: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P3473: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2

P3474: !BST [9] (maybe <- 0x48c01820) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3475: !BST [4] (maybe <- 0x48c01840) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3476: !CAS [12] (maybe <- 0x86002c) (Int)
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

P3477: !BST [12] (maybe <- 0x48c01860) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3478: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3479: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3480: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3481: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3482: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3483: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3484: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3485: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P3486: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3487: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3488: !BST [9] (maybe <- 0x48c01880) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3489: !BST [12] (maybe <- 0x48c018a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3490: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3491: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3492: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3493: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3494: !BST [5] (maybe <- 0x48c018c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3495: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3496: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3497: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3498: !BST [14] (maybe <- 0x48c01920) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3499: !BST [13] (maybe <- 0x48c01940) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3500: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3501: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3502: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P3503: !CAS [15] (maybe <- 0x86002d) (Int)
add %i3, 192, %l7
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

P3504: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3505: !ST [10] (maybe <- 0x86002e) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3506: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3507: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3508: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P3509: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3510: !BST [3] (maybe <- 0x48c01960) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3511: !REPLACEMENT [15] (Int)
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

P3512: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3513: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3514: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3515: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3516: !CAS [15] (maybe <- 0x86002f) (Int)
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

P3517: !ST [0] (maybe <- 0x860030) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3518: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3519: !BST [9] (maybe <- 0x48c019e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3520: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3521: !BST [10] (maybe <- 0x48c01a00) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3522: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3523: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3524: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3525: !BST [0] (maybe <- 0x48c01a20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3526: !BST [13] (maybe <- 0x48c01aa0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3527: !BST [12] (maybe <- 0x48c01ac0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3528: !BST [8] (maybe <- 0x48c01ae0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3529: !BST [15] (maybe <- 0x48c01b00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3530: !BST [14] (maybe <- 0x48c01b20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3531: !BST [13] (maybe <- 0x48c01b40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3532: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3533: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3534: !BST [12] (maybe <- 0x48c01b60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3535: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3536: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P3537: !BST [1] (maybe <- 0x48c01b80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3538: !DWST [7] (maybe <- 0x860031) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3539: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3540: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3541: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3542: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3543: !BST [3] (maybe <- 0x48c01c00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3544: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3545: !BST [12] (maybe <- 0x48c01c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3546: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3547: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P3548: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3549: !BST [6] (maybe <- 0x48c01ca0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3550: !BST [8] (maybe <- 0x48c01d00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3551: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P3552: !BST [12] (maybe <- 0x48c01d20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3553: !DWST [0] (maybe <- 0x860033) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P3554: !BST [2] (maybe <- 0x48c01d40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3555: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3556: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3557: !BST [10] (maybe <- 0x48c01dc0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3558: !BST [11] (maybe <- 0x48c01de0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3559: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3560: !CASX [13] (maybe <- 0x860035) (Int)
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

P3561: !BST [2] (maybe <- 0x48c01e00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3562: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3563: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3564: !SWAP [5] (maybe <- 0x860036) (Int)
mov %l4, %o3
swap  [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3565: !BST [1] (maybe <- 0x48c01e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3566: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3567: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P3568: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3569: !BST [5] (maybe <- 0x48c01f00) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3570: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3571: !BST [13] (maybe <- 0x48c01f60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3572: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3

P3573: !BST [3] (maybe <- 0x48c01f80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3574: !BST [5] (maybe <- 0x48c02000) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3575: !BST [13] (maybe <- 0x48c02060) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3576: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
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
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P3577: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P3578: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3579: !BST [9] (maybe <- 0x48c02080) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3580: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3581: !BST [1] (maybe <- 0x48c020a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3582: !CASX [8] (maybe <- 0x860037) (Int)
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

P3583: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3584: !BST [1] (maybe <- 0x48c02120) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3585: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3586: !CAS [12] (maybe <- 0x860038) (Int)
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

P3587: !BST [15] (maybe <- 0x48c021a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3588: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P3589: !BST [11] (maybe <- 0x48c021c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3590: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P3591: !CASX [10] (maybe <- 0x860039) (Int)
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

P3592: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P3593: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3594: !ST [0] (maybe <- 0x86003a) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3595: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3596: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3597: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3598: !SWAP [6] (maybe <- 0x86003b) (Int)
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

P3599: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3600: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P3601: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3602: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3603: !MEMBAR (FP)
membar #StoreLoad

P3604: !LD [0] (FP)
ld [%i0 + 0], %f0
! 1 addresses covered

P3605: !LD [1] (FP)
ld [%i0 + 4], %f1
! 1 addresses covered

P3606: !LD [2] (FP)
ld [%i0 + 12], %f2
! 1 addresses covered

P3607: !LD [3] (FP)
ld [%i0 + 32], %f3
! 1 addresses covered

P3608: !LD [4] (FP)
ld [%i0 + 64], %f4
! 1 addresses covered

P3609: !LD [5] (FP)
ld [%i1 + 76], %f5
! 1 addresses covered

P3610: !LD [6] (FP)
ld [%i1 + 80], %f6
! 1 addresses covered

P3611: !LD [7] (FP)
ld [%i1 + 84], %f7
! 1 addresses covered

P3612: !LD [8] (FP)
ld [%i1 + 256], %f8
! 1 addresses covered

P3613: !LD [9] (FP)
ld [%i1 + 512], %f9
! 1 addresses covered

P3614: !LD [10] (FP)
ld [%i2 + 32], %f10
! 1 addresses covered

P3615: !LD [11] (FP)
ld [%i2 + 64], %f11
! 1 addresses covered

P3616: !LD [12] (FP)
ld [%i3 + 0], %f12
! 1 addresses covered

P3617: !LD [13] (FP)
ld [%i3 + 64], %f13
! 1 addresses covered

P3618: !LD [14] (FP)
ld [%i3 + 128], %f14
! 1 addresses covered

P3619: !LD [15] (FP)
ld [%i3 + 192], %f15
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

restore
retl
nop
!-----------------



func7:

! 500 instruction sequence begins
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
add   %i5, 1472, %l5

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
sethi %hi(0x07deade1), %l7
or    %l7, %lo(0x07deade1), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize integer counter 
sethi %hi(0x870001), %l4
or    %l4, %lo(0x870001), %l4

! Initialize FP counter 
sethi %hi(0x48dfff40), %l7
or    %l7, %lo(0x48dfff40), %l7
stw %l7, [%l5] 
ld [%l5], %f16

! Initialize FP counter increment value 
sethi %hi(0x3f800000), %l7
or    %l7, %lo(0x3f800000), %l7
stw %l7, [%l5] 
ld [%l5], %f17 

P3620: !BST [3] (maybe <- 0x48dfff40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3621: !SWAP [10] (maybe <- 0x870001) (Int)
mov %l4, %o0
swap  [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3622: !BST [13] (maybe <- 0x48dfffc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3623: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3624: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P3625: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3626: !BST [11] (maybe <- 0x48dfffe0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3627: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3628: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3629: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3630: !BST [10] (maybe <- 0x48e00000) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3631: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3632: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3633: !BST [8] (maybe <- 0x48e00020) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3634: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3635: !BST [1] (maybe <- 0x48e00040) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3636: !DWLD [12] (Int)
ldx [%i3 + 0], %o1
! move %o1(upper) -> %o1(upper)

P3637: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3638: !MEMBAR (Int)
membar #StoreLoad

P3639: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3640: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3641: !BST [8] (maybe <- 0x48e000c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3642: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3643: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3644: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3645: !BST [14] (maybe <- 0x48e000e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3646: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3647: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3648: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3649: !BST [7] (maybe <- 0x48e00100) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3650: !CAS [4] (maybe <- 0x870002) (Int)
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

P3651: !BST [7] (maybe <- 0x48e00160) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3652: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3653: !BST [1] (maybe <- 0x48e001c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3654: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3655: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P3656: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3657: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3658: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3659: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3660: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P3661: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3662: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3663: !DWST [7] (maybe <- 0x870003) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i1 + 80 ] 
add   %l4, 1, %l4

P3664: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3665: !BST [13] (maybe <- 0x48e00240) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3666: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3667: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3668: !BST [15] (maybe <- 0x48e00260) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3669: !ST [6] (maybe <- 0x48e00280) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P3670: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3671: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3672: !ST [14] (maybe <- 0x870005) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3673: !BST [10] (maybe <- 0x48e002a0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3674: !MEMBAR (Int)
membar #StoreLoad

P3675: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3676: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3677: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3678: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3679: !BST [5] (maybe <- 0x48e002c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3680: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3681: !BST [6] (maybe <- 0x48e00320) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3682: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3683: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P3684: !BST [10] (maybe <- 0x48e00380) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3685: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P3686: !MEMBAR (Int)
membar #StoreLoad

P3687: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3688: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3689: !REPLACEMENT [1] (Int)
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

P3690: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3691: !BST [12] (maybe <- 0x48e003a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3692: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3693: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3694: !REPLACEMENT [3] (Int)
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

P3695: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P3696: !BST [4] (maybe <- 0x48e003c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3697: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3698: !BST [5] (maybe <- 0x48e003e0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3699: !BST [11] (maybe <- 0x48e00440) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3700: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
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

P3701: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P3702: !BST [6] (maybe <- 0x48e00460) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3703: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %o5
mov %o1, %o5
mov %o2, %o5
mov %o3, %o5
mov %o4, %o5

P3704: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3705: !DWST [9] (maybe <- 0x870006) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P3706: !BST [13] (maybe <- 0x48e004c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3707: !SWAP [2] (maybe <- 0x870007) (Int)
mov %l4, %o0
swap  [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3708: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3709: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P3710: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3711: !REPLACEMENT [9] (Int)
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

P3712: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3713: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3714: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3715: !CASX [6] (maybe <- 0x870008) (Int)
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

P3716: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3717: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P3718: !BST [9] (maybe <- 0x48e004e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3719: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3720: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3721: !BST [4] (maybe <- 0x48e00500) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3722: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3723: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3724: !ST [1] (maybe <- 0x48e00520) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P3725: !BST [14] (maybe <- 0x48e00540) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3726: !BST [9] (maybe <- 0x48e00560) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3727: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3728: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3729: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3730: !BST [8] (maybe <- 0x48e00580) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3731: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3732: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3733: !BST [0] (maybe <- 0x48e005a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3734: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3735: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3736: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3737: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3738: !BST [13] (maybe <- 0x48e00620) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3739: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P3740: !CAS [5] (maybe <- 0x87000a) (Int)
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

P3741: !CASX [1] (maybe <- 0x87000b) (Int)
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

P3742: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3743: !BST [1] (maybe <- 0x48e00640) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3744: !NOP (Int)
nop

P3745: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P3746: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3747: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P3748: !BST [5] (maybe <- 0x48e006c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3749: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3750: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3751: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3752: !BST [0] (maybe <- 0x48e00720) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3753: !ST [4] (maybe <- 0x87000d) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3754: !DWST [3] (maybe <- 0x87000e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P3755: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3756: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P3757: !MEMBAR (Int)
membar #StoreLoad

P3758: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3759: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P3760: !MEMBAR (Int)
membar #StoreLoad

P3761: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3762: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P3763: !BST [2] (maybe <- 0x48e007a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3764: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3765: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3766: !BST [2] (maybe <- 0x48e00820) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3767: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3768: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P3769: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3770: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3771: !BST [2] (maybe <- 0x48e008a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3772: !BST [3] (maybe <- 0x48e00920) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3773: !BST [10] (maybe <- 0x48e009a0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3774: !BST [7] (maybe <- 0x48e009c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3775: !REPLACEMENT [5] (Int)
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

P3776: !BST [2] (maybe <- 0x48e00a20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3777: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3778: !CAS [0] (maybe <- 0x87000f) (Int)
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

P3779: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3780: !BST [4] (maybe <- 0x48e00aa0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3781: !DWST [13] (maybe <- 0x48e00ac0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P3782: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3783: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3784: !BST [7] (maybe <- 0x48e00ae0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3785: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3786: !BST [1] (maybe <- 0x48e00b40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3787: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3788: !BST [9] (maybe <- 0x48e00bc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3789: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3790: !BST [9] (maybe <- 0x48e00be0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3791: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3792: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P3793: !REPLACEMENT [0] (Int)
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

P3794: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3795: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3796: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3797: !BST [13] (maybe <- 0x48e00c00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3798: !BST [6] (maybe <- 0x48e00c20) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3799: !BST [2] (maybe <- 0x48e00c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3800: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3801: !CAS [3] (maybe <- 0x870010) (Int)
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

P3802: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3803: !SWAP [6] (maybe <- 0x870011) (Int)
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

P3804: !BST [3] (maybe <- 0x48e00d00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3805: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3806: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3807: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P3808: !BST [9] (maybe <- 0x48e00d80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3809: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3810: !BST [12] (maybe <- 0x48e00da0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3811: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3812: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3813: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3814: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3815: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3816: !BST [15] (maybe <- 0x48e00dc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3817: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3818: !ST [9] (maybe <- 0x870012) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3819: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P3820: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3821: !REPLACEMENT [1] (Int)
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

P3822: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3823: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3824: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3825: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3826: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3827: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3828: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3829: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3830: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3831: !BST [8] (maybe <- 0x48e00de0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3832: !BST [2] (maybe <- 0x48e00e00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3833: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3834: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P3835: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3836: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3837: !BST [2] (maybe <- 0x48e00e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3838: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3839: !BST [9] (maybe <- 0x48e00f00) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3840: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3841: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3842: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3843: !BST [8] (maybe <- 0x48e00f20) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3844: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3845: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3846: !ST [4] (maybe <- 0x870013) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3847: !BST [12] (maybe <- 0x48e00f40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3848: !ST [9] (maybe <- 0x870014) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3849: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3850: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3851: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3852: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P3853: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3854: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3855: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3856: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3857: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P3858: !DWLD [12] (Int)
ldx [%i3 + 0], %o1
! move %o1(upper) -> %o1(upper)

P3859: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3860: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3861: !BST [6] (maybe <- 0x48e00f60) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3862: !ST [12] (maybe <- 0x870015) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3863: !CASX [7] (maybe <- 0x870016) (Int)
add %i1, 80, %l7
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

P3864: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3865: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3866: !BST [6] (maybe <- 0x48e00fc0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3867: !BST [9] (maybe <- 0x48e01020) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3868: !DWST [12] (maybe <- 0x870018) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3869: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3870: !BST [0] (maybe <- 0x48e01040) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3871: !BST [12] (maybe <- 0x48e010c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3872: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3873: !REPLACEMENT [15] (Int)
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

P3874: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3875: !CASX [11] (maybe <- 0x870019) (Int)
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

P3876: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P3877: !BST [9] (maybe <- 0x48e010e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3878: !BST [15] (maybe <- 0x48e01100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3879: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3880: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3881: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3882: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3883: !BST [12] (maybe <- 0x48e01120) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3884: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3885: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P3886: !CASX [15] (maybe <- 0x87001a) (Int)
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

P3887: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3888: !BST [7] (maybe <- 0x48e01140) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3889: !ST [15] (maybe <- 0x87001b) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3890: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3891: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3892: !BST [7] (maybe <- 0x48e011a0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3893: !BST [12] (maybe <- 0x48e01200) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3894: !BST [11] (maybe <- 0x48e01220) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3895: !BST [12] (maybe <- 0x48e01240) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3896: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3897: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3898: !BST [7] (maybe <- 0x48e01260) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3899: !BST [10] (maybe <- 0x48e012c0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3900: !BST [6] (maybe <- 0x48e012e0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3901: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3902: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P3903: !BLD [1] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3904: !REPLACEMENT [8] (Int)
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

P3905: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3906: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P3907: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3908: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3909: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3910: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3911: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3912: !DWLD [12] (Int)
ldx [%i3 + 0], %o4
! move %o4(upper) -> %o4(upper)

P3913: !BST [2] (maybe <- 0x48e01340) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3914: !BST [2] (maybe <- 0x48e013c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3915: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P3916: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3917: !BLD [0] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P3918: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3919: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3920: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3921: !BST [2] (maybe <- 0x48e01440) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3922: !LD [3] (Int)
lduw [%i0 + 32], %l6
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

P3923: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3924: !ST [5] (maybe <- 0x87001c) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3925: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P3926: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3927: !REPLACEMENT [14] (Int)
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

P3928: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P3929: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3930: !BST [14] (maybe <- 0x48e014c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3931: !BST [2] (maybe <- 0x48e014e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3932: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P3933: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l7
or %l7, %o0, %o0

P3934: !DWLD [7] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3935: !DWLD [1] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3936: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3937: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3938: !MEMBAR (Int)
membar #StoreLoad

P3939: !BST [14] (maybe <- 0x48e01560) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3940: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P3941: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P3942: !BST [13] (maybe <- 0x48e01580) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3943: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P3944: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3945: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3946: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3947: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3948: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3949: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3950: !BST [9] (maybe <- 0x48e015a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3951: !BST [7] (maybe <- 0x48e015c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3952: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3953: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3954: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P3955: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3956: !BST [11] (maybe <- 0x48e01620) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3957: !BST [10] (maybe <- 0x48e01640) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3958: !BST [3] (maybe <- 0x48e01660) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3959: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
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

P3960: !MEMBAR (Int)
membar #StoreLoad

P3961: !LD [6] (Int)
lduw [%i1 + 80], %l6
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

P3962: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3963: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3964: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3965: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3966: !BST [4] (maybe <- 0x48e016e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3967: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3968: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3969: !REPLACEMENT [15] (Int)
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

P3970: !BST [6] (maybe <- 0x48e01700) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3971: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3972: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3973: !BST [15] (maybe <- 0x48e01760) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3974: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3975: !BLD [10] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P3976: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3977: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3978: !BST [14] (maybe <- 0x48e01780) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3979: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3980: !BST [8] (maybe <- 0x48e017a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3981: !BST [7] (maybe <- 0x48e017c0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3982: !BST [9] (maybe <- 0x48e01820) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3983: !BST [7] (maybe <- 0x48e01840) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3984: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3985: !BST [0] (maybe <- 0x48e018a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3986: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3987: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3988: !BST [0] (maybe <- 0x48e01920) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3989: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3990: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3991: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3992: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3993: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P3994: !BST [0] (maybe <- 0x48e019a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3995: !CAS [13] (maybe <- 0x87001d) (Int)
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

P3996: !BST [5] (maybe <- 0x48e01a20) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3997: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P3998: !BST [10] (maybe <- 0x48e01a80) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3999: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f0
membar #Sync 
! 1 addresses covered

P4000: !BST [11] (maybe <- 0x48e01aa0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4001: !BST [14] (maybe <- 0x48e01ac0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P4002: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4003: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P4004: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4005: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4006: !BST [5] (maybe <- 0x48e01ae0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4007: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P4008: !BST [0] (maybe <- 0x48e01b40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4009: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P4010: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P4011: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P4012: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4013: !BST [7] (maybe <- 0x48e01bc0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4014: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4015: !BST [6] (maybe <- 0x48e01c20) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4016: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P4017: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P4018: !BST [12] (maybe <- 0x48e01c80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P4019: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4020: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4021: !BLD [15] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 192 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P4022: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P4023: !DWST [1] (maybe <- 0x87001e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
add   %l4, 1, %l4
mov %l4, %l7 
or %l6, %l7, %l6
stx %l6, [%i0 + 0 ] 
add   %l4, 1, %l4

P4024: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4025: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P4026: !BLD [6] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P4027: !DWST [11] (maybe <- 0x870020) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P4028: !BST [3] (maybe <- 0x48e01ca0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4029: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P4030: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4031: !BST [6] (maybe <- 0x48e01d20) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4032: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P4033: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4034: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
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

P4035: !BST [5] (maybe <- 0x48e01d80) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4036: !DWLD [7] (FP)
! case fp 
ldd  [%i1 + 80], %f0
! 2 addresses covered

P4037: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P4038: !DWST [9] (maybe <- 0x870021) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4039: !BST [5] (maybe <- 0x48e01de0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4040: !BST [14] (maybe <- 0x48e01e40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P4041: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4042: !BST [15] (maybe <- 0x48e01e60) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P4043: !BST [13] (maybe <- 0x48e01e80) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4044: !BLD [13] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P4045: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4046: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4047: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P4048: !ST [15] (maybe <- 0x870022) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4049: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4050: !BLD [9] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 512 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P4051: !BLD [2] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P4052: !BST [13] (maybe <- 0x48e01ea0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4053: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4054: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P4055: !DWST [13] (maybe <- 0x870023) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P4056: !SWAP [11] (maybe <- 0x870024) (Int)
mov %l4, %l6
swap  [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
sllx %l6, 32, %l7
srlx %l7, 32, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P4057: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
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
fmovd %f40, %f0

P4058: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4059: !BLD [12] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 0 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P4060: !ST [13] (maybe <- 0x870025) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4061: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4062: !ST [12] (maybe <- 0x870026) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4063: !BST [4] (maybe <- 0x48e01ec0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4064: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4065: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4066: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4067: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4068: !BST [6] (maybe <- 0x48e01ee0) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4069: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4070: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4071: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4072: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4073: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4074: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P4075: !BLD [4] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P4076: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4077: !BST [0] (maybe <- 0x48e01f40) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4078: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4079: !BLD [11] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i2 + 64 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P4080: !BST [8] (maybe <- 0x48e01fc0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P4081: !ST [14] (maybe <- 0x870027) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4082: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P4083: !BST [2] (maybe <- 0x48e01fe0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4084: !BST [7] (maybe <- 0x48e02060) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4085: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P4086: !BST [9] (maybe <- 0x48e020c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4087: !DWLD [11] (FP)
! case fp 
ldd  [%i2 + 64], %f18
! 1 addresses covered
fmovs %f18, %f9

P4088: !BST [14] (maybe <- 0x48e020e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P4089: !BST [13] (maybe <- 0x48e02100) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4090: !BST [0] (maybe <- 0x48e02120) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4091: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P4092: !BST [9] (maybe <- 0x48e021a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4093: !BLD [8] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 256 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P4094: !BST [12] (maybe <- 0x48e021c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P4095: !BST [11] (maybe <- 0x48e021e0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4096: !BST [12] (maybe <- 0x48e02200) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P4097: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4098: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4099: !REPLACEMENT [6] (Int)
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

P4100: !DWST [2] (maybe <- 0x870028) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8 ] 
add   %l4, 1, %l4

P4101: !DWLD [6] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4102: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P4103: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P4104: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4105: !BLD [3] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i0 + 0 ] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer, offset 0 ----
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

P4106: !BST [0] (maybe <- 0x48e02220) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4107: !BST [0] (maybe <- 0x48e022a0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f32
! 2 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 3 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4108: !BST [13] (maybe <- 0x48e02320) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4109: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4110: !CAS [1] (maybe <- 0x870029) (Int)
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

P4111: !BLD [7] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P4112: !BLD [14] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i3 + 128 ] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P4113: !BLD [5] (FP)
membar #Sync 
wr %g0, 0xf0, %asi 
ldda [%i1 + 64 ] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P4114: !BST [11] (maybe <- 0x48e02340) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4115: !BST [7] (maybe <- 0x48e02360) (FP)
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f34
! 1 th moved, current_fp_src=36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
wr %g0, 0xf0, %asi 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4116: !CAS [0] (maybe <- 0x87002a) (Int)
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

P4117: !BST [13] (maybe <- 0x48e023c0) (FP)
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
wr %g0, 0xf0, %asi 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4118: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4119: !BST [10] (maybe <- 0x48e023e0) (FP)
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
wr %g0, 0xf0, %asi 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P4120: !MEMBAR (Int)
membar #StoreLoad

P4121: !LD [0] (FP)
ld [%i0 + 0], %f9
! 1 addresses covered

P4122: !LD [1] (FP)
ld [%i0 + 4], %f10
! 1 addresses covered

P4123: !LD [2] (FP)
ld [%i0 + 12], %f11
! 1 addresses covered

P4124: !LD [3] (FP)
ld [%i0 + 32], %f12
! 1 addresses covered

P4125: !LD [4] (FP)
ld [%i0 + 64], %f13
! 1 addresses covered

P4126: !LD [5] (FP)
ld [%i1 + 76], %f14
! 1 addresses covered

P4127: !LD [6] (FP)
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

P4128: !LD [7] (FP)
ld [%i1 + 84], %f0
! 1 addresses covered

P4129: !LD [8] (FP)
ld [%i1 + 256], %f1
! 1 addresses covered

P4130: !LD [9] (FP)
ld [%i1 + 512], %f2
! 1 addresses covered

P4131: !LD [10] (FP)
ld [%i2 + 32], %f3
! 1 addresses covered

P4132: !LD [11] (FP)
ld [%i2 + 64], %f4
! 1 addresses covered

P4133: !LD [12] (FP)
ld [%i3 + 0], %f5
! 1 addresses covered

P4134: !LD [13] (FP)
ld [%i3 + 64], %f6
! 1 addresses covered

P4135: !LD [14] (FP)
ld [%i3 + 128], %f7
! 1 addresses covered

P4136: !LD [15] (FP)
ld [%i3 + 192], %f8
! 1 addresses covered
!---- flushing fp results buffer, offset 0 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30

restore
retl
nop
mymod_text_end:

!====#include "mmap_diag.s"

