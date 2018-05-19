/*
* Copyright (c) 2016 Princeton University
* All rights reserved.
* 
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of Princeton University nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
* 
* THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/****************************************************************
 * Name: princeton-test-test.s
 * Date: December 17, 2013
 *
 * Description: Test adding a test to the OpenSPARC T1 regressions
 *
 ****************************************************************/

! Number of loop iterations
#define LOOP_ITERATIONS 10
#define EXPECTED_SUM 45

/*********************************************************/


#include "boot.s"


.global main
main:
th_fork(th_main, %l0)       ! Start up to four threads.
                            ! All threads do the same thing.  No need to run
                            ! more than one core and no need to differentiate
                            ! the threads because nobody stores anything
th_main_0:
th_main_1:
th_main_2:
th_main_3:
th_main_4:
th_main_5:
th_main_6:
th_main_7:

    !********************************
    ! Loop that just adds some stuff
    !********************************
    set loop_array, %g1             ! Loop starting address
    add %g0, LOOP_ITERATIONS, %g2   ! Loop iterations
    sll %g2, 0x3, %g2               ! Multiply loop iterations by 8 (shift left by 3)
    add %g0, %g0, %g3               ! Loop counter
    add %g0, %g0, %g4               ! Sum variable
loop:
    cmp %g2, %g3
    be done                         ! Done if %g2 == %g3
    add %g1, %g3, %g5               ! Get the current address to load
    ldx [%g5], %l0                  ! Load array data for this iteration 
    add %g4, %l0, %g4               ! Sum array
    ba loop                         ! Loop around
    add %g3, 0x8, %g3               ! Increment loop counter (delay slot)
done:
    add %g0, EXPECTED_SUM, %g1      ! Check result
    cmp %g1, %g4
    be good_end
    nop                             ! Delay slot
bad_end:
    ta T_BAD_TRAP
    ba end
    nop                             ! Delay slot
good_end:
    ta T_GOOD_TRAP
end:
    nop
    nop

!==========================
.data
.align 0x1fff+1

.global test_data
loop_array:
    .word 0x00000000, 0x00000000
    .word 0x00000000, 0x00000001
    .word 0x00000000, 0x00000002
    .word 0x00000000, 0x00000003
    .word 0x00000000, 0x00000004
    .word 0x00000000, 0x00000005
    .word 0x00000000, 0x00000006
    .word 0x00000000, 0x00000007
    .word 0x00000000, 0x00000008
    .word 0x00000000, 0x00000009
    .word 0x00000000, 0x0000000a
    .word 0x00000000, 0x0000000b
    .word 0x00000000, 0x0000000c
    .word 0x00000000, 0x0000000d
    .word 0x00000000, 0x0000000e
    .word 0x00000000, 0x0000000f

.end
