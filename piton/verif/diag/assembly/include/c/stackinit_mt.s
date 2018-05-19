// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: stackinit_mt.s
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
!---------------------------------------------------
! stack initialization for MT diags.
! Can be used for ST diags also.
!---------------------------------------------------

#include "defines.h"

#define ZERO_OFFSET 48

!---------------------------------------------------
! Number of arguments passed to the diag
! We have a CONVENTION:
!       argv[1] is THREAD ID 
!       argv[2] is number of threads
!       argv[3] is USER DEFINED
!       argv[4] is USER DEFINED
! currently we support up to argv[4]
!---------------------------------------------------
#ifndef C_ARGNUM
#define C_ARGNUM 5
#endif

#ifndef C_ARG3
#define C_ARG3 0
#endif

#ifndef C_ARG4
#define C_ARG4 0
#endif

!---------------------------------------------------
! stack pointer offset per Sparc V9 rules
!---------------------------------------------------
#define SP_OFFSET (STACKSIZE-4095)


!---------------------------------------------------
! some macros
!---------------------------------------------------
#define INIT_LOCAL_REGS                         \
	set 0x0, %l0;                           \
	set 0x0, %l1;                           \
	set 0x0, %l2;                           \
	set 0x0, %l3;                           \
	set 0x0, %l4;                           \
	set 0x0, %l5;                           \
	set 0x0, %l6;                           \
	set 0x0, %l7;                           \
	set 0x0, %i0;                           \
	set 0x0, %i1;                           \
	set 0x0, %i2;                           \
	set 0x0, %i3;                           \
	set 0x0, %i4;                           \
	set 0x0, %i5;                           \
	set 0x0, %i6;                           \
	set 0x0, %i7;

!---------------------------------------------------

!---------------------------------------------------
.section .text

!---------------------------------------------------
! the start of the C program
!---------------------------------------------------
.align 4
.global c_start
c_start:

!---------------------------------------------------
! register init - avoid mismatches in spill/fill traps
!---------------------------------------------------
	ta              T_CHANGE_PRIV
	wrpr            %g0, 0, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 1, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 2, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 3, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 4, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 5, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 6, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 7, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 0, %cwp
	ta              T_CHANGE_NONPRIV

!---------------------------------------------------
! set up stack per thread for all threads
!---------------------------------------------------
	th_fork(prepare_thread, %l0);

changequote([, ])dnl
forloop([i], 0, eval(THREAD_COUNT-1), [
[prepare_thread_]eval(i*THREAD_STRIDE):
	setx    [hs]eval(i*THREAD_STRIDE), %l0, %o2     ! pointer to help string per thread

	setx    [arg1t]eval(i*THREAD_STRIDE), %l0, %o0  ! a pointer to arg1tN
	set     eval(i*THREAD_STRIDE), %o1              ! arg1 is the thread ID
	call    itos, 0
	nop
	setx    [arg2t]eval(i*THREAD_STRIDE), %l0, %o0  ! a pointer to arg2tN
	set     THREAD_COUNT, %o1                       ! arg2 is the thread count
	call    itos, 0
	nop
	setx    [arg3t]eval(i*THREAD_STRIDE), %l0, %o0
	set     C_ARG3, %o1                             ! USER defined
	call    itos, 0
	nop
	setx    [arg4t]eval(i*THREAD_STRIDE), %l0, %o0
	set     C_ARG4, %o1                             ! user defined
	call    itos, 0
	nop

	setx    [stack]eval(i*THREAD_STRIDE), %l5, %sp
	setx    SP_OFFSET, %l0, %l1
	add     %sp, %l1, %sp                           ! set and adjust the stack pointer

	set     C_ARGNUM, %o0           ! argc          ! %o0 is argc
	setx    [argvp]eval(i*THREAD_STRIDE), %l0, %o1  ! %o1 is a ponter of array of arrays
	ba      call_main                               ! now go to call_main...
	nop
])dnl
changequote(`,')dnl'


!---------------------------------------
call_main:                                              ! call the C program
#ifndef MAIN_INIT
	setx    main, %l0, %l1
#else
	setx    MAIN_INIT, %l0, %l1
#endif
	jmpl    %l1,%o7
	nop

	brnz    %o0, c_fail
	nop
c_pass: 
	ta      T_GOOD_TRAP
	nop

c_fail:
	ta      T_BAD_TRAP
	nop
!--------------------------------------------------------------------------
!--------------------------------------------------------------------------
!--------------------------------------------------------------------------

!--------------------------------------------------------------------------
! the itos - integer to string function below - is implemented in assembly
! based on the C implementation in the comments
!--------------------------------------------------------------------------
!void itos (char *s, int a){
!   if(a ==0){
!     s[0] = '0';
!     s[1] = 0;
!     return;
!   }
!   count  = 0;
!   result = a;
!   while(result >0){
!     hs[count++] = result % 10 + '0';
!     result = result /10;
!   }
!   if(a<0) hs[count] = '-';
!   else    count--;
!   for(iter= count; iter>=0; iter--) s[count-iter] = hs[iter];
!   s[count+1] = 0;
!}
!--------------------------------------------------------------------------
itos:
	mov     %g0, %l7                ! count
	brnz    %o1, itos_proceed       ! o1 is the number
	nop
	mov     ZERO_OFFSET, %l0        ! number is 0 
	stb     %l0, [%o0]              ! return '0', 0
	retl
	stb     %g0, [%o0 +1]

itos_proceed:                           ! check for sign
	brgz    %o1, itos_positive
	nop
	ba      itos_while_entry
	mulx    %o1, -1, %i4
itos_positive:
	mov     %o1, %i4                ! result
itos_while_entry:
	brgz    %i4, itos_while_body
	nop
	ba      itos_while_exit
	nop
itos_while_body:
       sdivx   %i4, 10, %i3             ! divide by 10
       sllx    %i3, 2, %i5              ! multiply result by 4
       add     %i5, %i3, %i5            ! add it once -> multipy by 5 by now.
	add     %i5, %i5, %i5           ! multiply by 10 overall
       sub     %i4, %i5, %l4            ! l4 is the remainder now.
       add     %l4, ZERO_OFFSET, %l4
       stb     %l4, [%o2 + %l7]
       mov     %i3, %i4
       inc     %l7
       ba      itos_while_entry
       nop
itos_while_exit:
       brgz    %o1, itos_positive2
       nop
       set     45, %i2                  ! 45 is the value of the '-' character
       stb     %i2, [%o2 + %l7]
       mov     %g0, %l0
       ba      itos_for_entry
       nop
itos_positive2:
       dec     %l7
       mov     %g0, %l0
itos_for_entry:
       brgez   %l7, itos_for_body
       nop
       ba      itos_for_exit
       nop
itos_for_body:
       ldub    [%o2 + %l7], %l4
       stb     %l4, [%o0 +%l0]
       inc     %l0
       dec     %l7
       ba      itos_for_entry
       nop
itos_for_exit:
       retl
       stb     %g0, [%o0 +%l0]
!--------------------------------------------------------------------------------------------


!--------------------------------------------------------------------------------------------
!--------------------------------------------------------------------------------------------
.section .data

.global shared_memory
shared_memory:
	.skip 0x1000

.global shared_memory_buffers
shared_memory_buffers:
       init_mem(0x0101010101010101, 4096, 8, +, 0, +, 0)
       .skip 0x10000

.global barp
barp:
	.skip 0x100

.global barrier_lock
barrier_lock:
	.skip 0x100

.global argvp0
argvp0:
	.xword arg0
	.xword arg1t0
	.xword arg2t0
	.xword arg3t0
	.xword arg4t0
	.xword arg5t0
	.xword arg6t0
	.xword arg7t0
	.xword 0

.global arg1t0
arg1t0:
	.skip 128

.global arg2t0
arg2t0:
	.skip 128

.global arg3t0
arg3t0:
	.skip 128

.global arg4t0
arg4t0:
	.skip 128

.global arg5t0
arg5t0:
	.skip 128

.global arg6t0
arg6t0:
	.skip 128

.global arg7t0
arg7t0:
	.skip 128

.global hs0
hs0:
	.skip 128
.global argvp1
argvp1:
	.xword arg0
	.xword arg1t1
	.xword arg2t1
	.xword arg3t1
	.xword arg4t1
	.xword arg5t1
	.xword arg6t1
	.xword arg7t1
	.xword 0

.global arg1t1
arg1t1:
	.skip 128

.global arg2t1
arg2t1:
	.skip 128

.global arg3t1
arg3t1:
	.skip 128

.global arg4t1
arg4t1:
	.skip 128

.global arg5t1
arg5t1:
	.skip 128

.global arg6t1
arg6t1:
	.skip 128

.global arg7t1
arg7t1:
	.skip 128

.global hs1
hs1:
	.skip 128
.global argvp2
argvp2:
	.xword arg0
	.xword arg1t2
	.xword arg2t2
	.xword arg3t2
	.xword arg4t2
	.xword arg5t2
	.xword arg6t2
	.xword arg7t2
	.xword 0

.global arg1t2
arg1t2:
	.skip 128

.global arg2t2
arg2t2:
	.skip 128

.global arg3t2
arg3t2:
	.skip 128

.global arg4t2
arg4t2:
	.skip 128

.global arg5t2
arg5t2:
	.skip 128

.global arg6t2
arg6t2:
	.skip 128

.global arg7t2
arg7t2:
	.skip 128

.global hs2
hs2:
	.skip 128
.global argvp3
argvp3:
	.xword arg0
	.xword arg1t3
	.xword arg2t3
	.xword arg3t3
	.xword arg4t3
	.xword arg5t3
	.xword arg6t3
	.xword arg7t3
	.xword 0

.global arg1t3
arg1t3:
	.skip 128

.global arg2t3
arg2t3:
	.skip 128

.global arg3t3
arg3t3:
	.skip 128

.global arg4t3
arg4t3:
	.skip 128

.global arg5t3
arg5t3:
	.skip 128

.global arg6t3
arg6t3:
	.skip 128

.global arg7t3
arg7t3:
	.skip 128

.global hs3
hs3:
	.skip 128
.global argvp4
argvp4:
	.xword arg0
	.xword arg1t4
	.xword arg2t4
	.xword arg3t4
	.xword arg4t4
	.xword arg5t4
	.xword arg6t4
	.xword arg7t4
	.xword 0

.global arg1t4
arg1t4:
	.skip 128

.global arg2t4
arg2t4:
	.skip 128

.global arg3t4
arg3t4:
	.skip 128

.global arg4t4
arg4t4:
	.skip 128

.global arg5t4
arg5t4:
	.skip 128

.global arg6t4
arg6t4:
	.skip 128

.global arg7t4
arg7t4:
	.skip 128

.global hs4
hs4:
	.skip 128
.global argvp5
argvp5:
	.xword arg0
	.xword arg1t5
	.xword arg2t5
	.xword arg3t5
	.xword arg4t5
	.xword arg5t5
	.xword arg6t5
	.xword arg7t5
	.xword 0

.global arg1t5
arg1t5:
	.skip 128

.global arg2t5
arg2t5:
	.skip 128

.global arg3t5
arg3t5:
	.skip 128

.global arg4t5
arg4t5:
	.skip 128

.global arg5t5
arg5t5:
	.skip 128

.global arg6t5
arg6t5:
	.skip 128

.global arg7t5
arg7t5:
	.skip 128

.global hs5
hs5:
	.skip 128
.global argvp6
argvp6:
	.xword arg0
	.xword arg1t6
	.xword arg2t6
	.xword arg3t6
	.xword arg4t6
	.xword arg5t6
	.xword arg6t6
	.xword arg7t6
	.xword 0

.global arg1t6
arg1t6:
	.skip 128

.global arg2t6
arg2t6:
	.skip 128

.global arg3t6
arg3t6:
	.skip 128

.global arg4t6
arg4t6:
	.skip 128

.global arg5t6
arg5t6:
	.skip 128

.global arg6t6
arg6t6:
	.skip 128

.global arg7t6
arg7t6:
	.skip 128

.global hs6
hs6:
	.skip 128
.global argvp7
argvp7:
	.xword arg0
	.xword arg1t7
	.xword arg2t7
	.xword arg3t7
	.xword arg4t7
	.xword arg5t7
	.xword arg6t7
	.xword arg7t7
	.xword 0

.global arg1t7
arg1t7:
	.skip 128

.global arg2t7
arg2t7:
	.skip 128

.global arg3t7
arg3t7:
	.skip 128

.global arg4t7
arg4t7:
	.skip 128

.global arg5t7
arg5t7:
	.skip 128

.global arg6t7
arg6t7:
	.skip 128

.global arg7t7
arg7t7:
	.skip 128

.global hs7
hs7:
	.skip 128

.global argvp8
argvp8:
	.xword arg0
	.xword arg1t8
	.xword arg2t8
	.xword arg3t8
	.xword arg4t8
	.xword arg5t8
	.xword arg6t8
	.xword arg7t8
	.xword 0

.global arg1t8
arg1t8:
	.skip 128

.global arg2t8
arg2t8:
	.skip 128

.global arg3t8
arg3t8:
	.skip 128

.global arg4t8
arg4t8:
	.skip 128

.global arg5t8
arg5t8:
	.skip 128

.global arg6t8
arg6t8:
	.skip 128

.global arg7t8
arg7t8:
	.skip 128

.global hs8
hs8:
	.skip 128



.global argvp9
argvp9:
	.xword arg0
	.xword arg1t9
	.xword arg2t9
	.xword arg3t9
	.xword arg4t9
	.xword arg5t9
	.xword arg6t9
	.xword arg7t9
	.xword 0

.global arg1t9
arg1t9:
	.skip 128

.global arg2t9
arg2t9:
	.skip 128

.global arg3t9
arg3t9:
	.skip 128

.global arg4t9
arg4t9:
	.skip 128

.global arg5t9
arg5t9:
	.skip 128

.global arg6t9
arg6t9:
	.skip 128

.global arg7t9
arg7t9:
	.skip 128

.global hs9
hs9:
	.skip 128



.global argvp10
argvp10:
	.xword arg0
	.xword arg1t10
	.xword arg2t10
	.xword arg3t10
	.xword arg4t10
	.xword arg5t10
	.xword arg6t10
	.xword arg7t10
	.xword 0

.global arg1t10
arg1t10:
	.skip 128

.global arg2t10
arg2t10:
	.skip 128

.global arg3t10
arg3t10:
	.skip 128

.global arg4t10
arg4t10:
	.skip 128

.global arg5t10
arg5t10:
	.skip 128

.global arg6t10
arg6t10:
	.skip 128

.global arg7t10
arg7t10:
	.skip 128

.global hs10
hs10:
	.skip 128


.global argvp11
argvp11:
	.xword arg0
	.xword arg1t11
	.xword arg2t11
	.xword arg3t11
	.xword arg4t11
	.xword arg5t11
	.xword arg6t11
	.xword arg7t11
	.xword 0

.global arg1t11
arg1t11:
	.skip 128

.global arg2t11
arg2t11:
	.skip 128

.global arg3t11
arg3t11:
	.skip 128

.global arg4t11
arg4t11:
	.skip 128

.global arg5t11
arg5t11:
	.skip 128

.global arg6t11
arg6t11:
	.skip 128

.global arg7t11
arg7t11:
	.skip 128

.global hs11
hs11:
	.skip 128


.global argvp12
argvp12:
	.xword arg0
	.xword arg1t12
	.xword arg2t12
	.xword arg3t12
	.xword arg4t12
	.xword arg5t12
	.xword arg6t12
	.xword arg7t12
	.xword 0

.global arg1t12
arg1t12:
	.skip 128

.global arg2t12
arg2t12:
	.skip 128

.global arg3t12
arg3t12:
	.skip 128

.global arg4t12
arg4t12:
	.skip 128

.global arg5t12
arg5t12:
	.skip 128

.global arg6t12
arg6t12:
	.skip 128

.global arg7t12
arg7t12:
	.skip 128

.global hs12
hs12:
	.skip 128


.global argvp13
argvp13:
	.xword arg0
	.xword arg1t13
	.xword arg2t13
	.xword arg3t13
	.xword arg4t13
	.xword arg5t13
	.xword arg6t13
	.xword arg7t13
	.xword 0

.global arg1t13
arg1t13:
	.skip 128

.global arg2t13
arg2t13:
	.skip 128

.global arg3t13
arg3t13:
	.skip 128

.global arg4t13
arg4t13:
	.skip 128

.global arg5t13
arg5t13:
	.skip 128

.global arg6t13
arg6t13:
	.skip 128

.global arg7t13
arg7t13:
	.skip 128

.global hs13
hs13:
	.skip 128


.global argvp14
argvp14:
	.xword arg0
	.xword arg1t14
	.xword arg2t14
	.xword arg3t14
	.xword arg4t14
	.xword arg5t14
	.xword arg6t14
	.xword arg7t14
	.xword 0

.global arg1t14
arg1t14:
	.skip 128

.global arg2t14
arg2t14:
	.skip 128

.global arg3t14
arg3t14:
	.skip 128

.global arg4t14
arg4t14:
	.skip 128

.global arg5t14
arg5t14:
	.skip 128

.global arg6t14
arg6t14:
	.skip 128

.global arg7t14
arg7t14:
	.skip 128

.global hs14
hs14:
	.skip 128


.global argvp15
argvp15:
	.xword arg0
	.xword arg1t15
	.xword arg2t15
	.xword arg3t15
	.xword arg4t15
	.xword arg5t15
	.xword arg6t15
	.xword arg7t15
	.xword 0

.global arg1t15
arg1t15:
	.skip 128

.global arg2t15
arg2t15:
	.skip 128

.global arg3t15
arg3t15:
	.skip 128

.global arg4t15
arg4t15:
	.skip 128

.global arg5t15
arg5t15:
	.skip 128

.global arg6t15
arg6t15:
	.skip 128

.global arg7t15
arg7t15:
	.skip 128

.global hs15
hs15:
	.skip 128


.global argvp16
argvp16:
	.xword arg0
	.xword arg1t16
	.xword arg2t16
	.xword arg3t16
	.xword arg4t16
	.xword arg5t16
	.xword arg6t16
	.xword arg7t16
	.xword 0

.global arg1t16
arg1t16:
	.skip 128

.global arg2t16
arg2t16:
	.skip 128

.global arg3t16
arg3t16:
	.skip 128

.global arg4t16
arg4t16:
	.skip 128

.global arg5t16
arg5t16:
	.skip 128

.global arg6t16
arg6t16:
	.skip 128

.global arg7t16
arg7t16:
	.skip 128

.global hs16
hs16:
	.skip 128


.global argvp17
argvp17:
	.xword arg0
	.xword arg1t17
	.xword arg2t17
	.xword arg3t17
	.xword arg4t17
	.xword arg5t17
	.xword arg6t17
	.xword arg7t17
	.xword 0

.global arg1t17
arg1t17:
	.skip 128

.global arg2t17
arg2t17:
	.skip 128

.global arg3t17
arg3t17:
	.skip 128

.global arg4t17
arg4t17:
	.skip 128

.global arg5t17
arg5t17:
	.skip 128

.global arg6t17
arg6t17:
	.skip 128

.global arg7t17
arg7t17:
	.skip 128

.global hs17
hs17:
	.skip 128


.global argvp18
argvp18:
	.xword arg0
	.xword arg1t18
	.xword arg2t18
	.xword arg3t18
	.xword arg4t18
	.xword arg5t18
	.xword arg6t18
	.xword arg7t18
	.xword 0

.global arg1t18
arg1t18:
	.skip 128

.global arg2t18
arg2t18:
	.skip 128

.global arg3t18
arg3t18:
	.skip 128

.global arg4t18
arg4t18:
	.skip 128

.global arg5t18
arg5t18:
	.skip 128

.global arg6t18
arg6t18:
	.skip 128

.global arg7t18
arg7t18:
	.skip 128

.global hs18
hs18:
	.skip 128


.global argvp19
argvp19:
	.xword arg0
	.xword arg1t19
	.xword arg2t19
	.xword arg3t19
	.xword arg4t19
	.xword arg5t19
	.xword arg6t19
	.xword arg7t19
	.xword 0

.global arg1t19
arg1t19:
	.skip 128

.global arg2t19
arg2t19:
	.skip 128

.global arg3t19
arg3t19:
	.skip 128

.global arg4t19
arg4t19:
	.skip 128

.global arg5t19
arg5t19:
	.skip 128

.global arg6t19
arg6t19:
	.skip 128

.global arg7t19
arg7t19:
	.skip 128

.global hs19
hs19:
	.skip 128


.global argvp20
argvp20:
	.xword arg0
	.xword arg1t20
	.xword arg2t20
	.xword arg3t20
	.xword arg4t20
	.xword arg5t20
	.xword arg6t20
	.xword arg7t20
	.xword 0

.global arg1t20
arg1t20:
	.skip 128

.global arg2t20
arg2t20:
	.skip 128

.global arg3t20
arg3t20:
	.skip 128

.global arg4t20
arg4t20:
	.skip 128

.global arg5t20
arg5t20:
	.skip 128

.global arg6t20
arg6t20:
	.skip 128

.global arg7t20
arg7t20:
	.skip 128

.global hs20
hs20:
	.skip 128


.global argvp21
argvp21:
	.xword arg0
	.xword arg1t21
	.xword arg2t21
	.xword arg3t21
	.xword arg4t21
	.xword arg5t21
	.xword arg6t21
	.xword arg7t21
	.xword 0

.global arg1t21
arg1t21:
	.skip 128

.global arg2t21
arg2t21:
	.skip 128

.global arg3t21
arg3t21:
	.skip 128

.global arg4t21
arg4t21:
	.skip 128

.global arg5t21
arg5t21:
	.skip 128

.global arg6t21
arg6t21:
	.skip 128

.global arg7t21
arg7t21:
	.skip 128

.global hs21
hs21:
	.skip 128


.global argvp22
argvp22:
	.xword arg0
	.xword arg1t22
	.xword arg2t22
	.xword arg3t22
	.xword arg4t22
	.xword arg5t22
	.xword arg6t22
	.xword arg7t22
	.xword 0

.global arg1t22
arg1t22:
	.skip 128

.global arg2t22
arg2t22:
	.skip 128

.global arg3t22
arg3t22:
	.skip 128

.global arg4t22
arg4t22:
	.skip 128

.global arg5t22
arg5t22:
	.skip 128

.global arg6t22
arg6t22:
	.skip 128

.global arg7t22
arg7t22:
	.skip 128

.global hs22
hs22:
	.skip 128


.global argvp23
argvp23:
	.xword arg0
	.xword arg1t23
	.xword arg2t23
	.xword arg3t23
	.xword arg4t23
	.xword arg5t23
	.xword arg6t23
	.xword arg7t23
	.xword 0

.global arg1t23
arg1t23:
	.skip 128

.global arg2t23
arg2t23:
	.skip 128

.global arg3t23
arg3t23:
	.skip 128

.global arg4t23
arg4t23:
	.skip 128

.global arg5t23
arg5t23:
	.skip 128

.global arg6t23
arg6t23:
	.skip 128

.global arg7t23
arg7t23:
	.skip 128

.global hs23
hs23:
	.skip 128


.global argvp24
argvp24:
	.xword arg0
	.xword arg1t24
	.xword arg2t24
	.xword arg3t24
	.xword arg4t24
	.xword arg5t24
	.xword arg6t24
	.xword arg7t24
	.xword 0

.global arg1t24
arg1t24:
	.skip 128

.global arg2t24
arg2t24:
	.skip 128

.global arg3t24
arg3t24:
	.skip 128

.global arg4t24
arg4t24:
	.skip 128

.global arg5t24
arg5t24:
	.skip 128

.global arg6t24
arg6t24:
	.skip 128

.global arg7t24
arg7t24:
	.skip 128

.global hs24
hs24:
	.skip 128


.global argvp25
argvp25:
	.xword arg0
	.xword arg1t25
	.xword arg2t25
	.xword arg3t25
	.xword arg4t25
	.xword arg5t25
	.xword arg6t25
	.xword arg7t25
	.xword 0

.global arg1t25
arg1t25:
	.skip 128

.global arg2t25
arg2t25:
	.skip 128

.global arg3t25
arg3t25:
	.skip 128

.global arg4t25
arg4t25:
	.skip 128

.global arg5t25
arg5t25:
	.skip 128

.global arg6t25
arg6t25:
	.skip 128

.global arg7t25
arg7t25:
	.skip 128

.global hs25
hs25:
	.skip 128


.global argvp26
argvp26:
	.xword arg0
	.xword arg1t26
	.xword arg2t26
	.xword arg3t26
	.xword arg4t26
	.xword arg5t26
	.xword arg6t26
	.xword arg7t26
	.xword 0

.global arg1t26
arg1t26:
	.skip 128

.global arg2t26
arg2t26:
	.skip 128

.global arg3t26
arg3t26:
	.skip 128

.global arg4t26
arg4t26:
	.skip 128

.global arg5t26
arg5t26:
	.skip 128

.global arg6t26
arg6t26:
	.skip 128

.global arg7t26
arg7t26:
	.skip 128

.global hs26
hs26:
	.skip 128


.global argvp27
argvp27:
	.xword arg0
	.xword arg1t27
	.xword arg2t27
	.xword arg3t27
	.xword arg4t27
	.xword arg5t27
	.xword arg6t27
	.xword arg7t27
	.xword 0

.global arg1t27
arg1t27:
	.skip 128

.global arg2t27
arg2t27:
	.skip 128

.global arg3t27
arg3t27:
	.skip 128

.global arg4t27
arg4t27:
	.skip 128

.global arg5t27
arg5t27:
	.skip 128

.global arg6t27
arg6t27:
	.skip 128

.global arg7t27
arg7t27:
	.skip 128

.global hs27
hs27:
	.skip 128


.global argvp28
argvp28:
	.xword arg0
	.xword arg1t28
	.xword arg2t28
	.xword arg3t28
	.xword arg4t28
	.xword arg5t28
	.xword arg6t28
	.xword arg7t28
	.xword 0

.global arg1t28
arg1t28:
	.skip 128

.global arg2t28
arg2t28:
	.skip 128

.global arg3t28
arg3t28:
	.skip 128

.global arg4t28
arg4t28:
	.skip 128

.global arg5t28
arg5t28:
	.skip 128

.global arg6t28
arg6t28:
	.skip 128

.global arg7t28
arg7t28:
	.skip 128

.global hs28
hs28:
	.skip 128


.global argvp29
argvp29:
	.xword arg0
	.xword arg1t29
	.xword arg2t29
	.xword arg3t29
	.xword arg4t29
	.xword arg5t29
	.xword arg6t29
	.xword arg7t29
	.xword 0

.global arg1t29
arg1t29:
	.skip 128

.global arg2t29
arg2t29:
	.skip 128

.global arg3t29
arg3t29:
	.skip 128

.global arg4t29
arg4t29:
	.skip 128

.global arg5t29
arg5t29:
	.skip 128

.global arg6t29
arg6t29:
	.skip 128

.global arg7t29
arg7t29:
	.skip 128

.global hs29
hs29:
	.skip 128


.global argvp30
argvp30:
	.xword arg0
	.xword arg1t30
	.xword arg2t30
	.xword arg3t30
	.xword arg4t30
	.xword arg5t30
	.xword arg6t30
	.xword arg7t30
	.xword 0

.global arg1t30
arg1t30:
	.skip 128

.global arg2t30
arg2t30:
	.skip 128

.global arg3t30
arg3t30:
	.skip 128

.global arg4t30
arg4t30:
	.skip 128

.global arg5t30
arg5t30:
	.skip 128

.global arg6t30
arg6t30:
	.skip 128

.global arg7t30
arg7t30:
	.skip 128

.global hs30
hs30:
	.skip 128


.global argvp31
argvp31:
	.xword arg0
	.xword arg1t31
	.xword arg2t31
	.xword arg3t31
	.xword arg4t31
	.xword arg5t31
	.xword arg6t31
	.xword arg7t31
	.xword 0

.global arg1t31
arg1t31:
	.skip 128

.global arg2t31
arg2t31:
	.skip 128

.global arg3t31
arg3t31:
	.skip 128

.global arg4t31
arg4t31:
	.skip 128

.global arg5t31
arg5t31:
	.skip 128

.global arg6t31
arg6t31:
	.skip 128

.global arg7t31
arg7t31:
	.skip 128

.global hs31
hs31:
	.skip 128


.global arg0
arg0:
	.ascii "mycmain"
	.byte 0
.global shm_sync
shm_sync:
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
!----------------------------------------------------------------------------------------------
