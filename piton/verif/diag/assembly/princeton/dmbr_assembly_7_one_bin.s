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
 * Description: Test configuration registers enable/disable.
 *  These config regs are en/dis by a read/write to specific ASI address
 *
 ****************************************************************/


#include "boot.s"

! dmbr configuration
#define     TEST_CRED_BIN_0             0
#define     TEST_CRED_BIN_1             0
#define     TEST_CRED_BIN_2             0
#define     TEST_CRED_BIN_3             0
#define     TEST_CRED_BIN_4             0
#define     TEST_CRED_BIN_5             0
#define     TEST_CRED_BIN_6             0
#define     TEST_CRED_BIN_7             38
#define     TEST_CRED_BIN_8             0
#define     TEST_CRED_BIN_9             0
#define     TEST_BIN_SCALE              3
#define     TEST_REPL_INTERVAL          6384

#define     TEST_EXPECTED_INTERV_AVG    168


#define LOOP_ITERATIONS 2048

.text
.global main

main:                   !  test enters here from boot in user mode
    setx active_thread, %l1, %o5   
    jmpl    %o5, %o7
    nop

!
!       Note that to simplify ASI cache accesses this segment should be mapped VA==PA==RA
!
SECTION .ACTIVE_THREAD_SEC TEXT_VA=0x0000000040008000
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        VA= 0x0000000040008000,
        PA= ra2pa(0x0000000040008000,0),
        RA= 0x0000000040008000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        hypervisor
        }
!





.text
.global active_thread
active_thread:  
    ta      T_CHANGE_HPRIV          ! enter Hyper mode
    ba  TEST_MAIN
    nop

    .align  1024

TEST_MAIN:
    setx 0xDEADBEE0, %g1, %g3           ! DEBUG: point0
    setx DMBR_REG2_FULL_ADDRESS, %g1, %g2
    setx TEST_REPL_INTERVAL, %g1, %l1
    add %g0, TEST_BIN_SCALE, %l2
    sllx %l2, DMBR_BIN_SCALE_SHIFT, %l2
    or %l2, %l1, %l1                    ! set bin scale
    stx %l1, [%g2]                      ! write a config register
    ! check if we wrote correct values
    setx 0xDEADBEE1, %g1, %g3           ! DEBUG: point1
    ldx [%g2], %l1
    setx 0xffff, %g1, %l3               ! 16 bits! hardwired
    and %l1, %l3, %l2
    setx TEST_REPL_INTERVAL, %g1, %l3                
    cmp %l2, %l3
    bne bad_end
    nop
    setx 0xDEADBEE2, %g1, %g3           ! DEBUG: point2
    srlx %l1, DMBR_BIN_SCALE_SHIFT, %l2
    and %l2, 0x3ff, %l2                 ! 10 bits! hardwired
    cmp %l2, TEST_BIN_SCALE
    bne bad_end
    nop


    ! enabling DMBR: set config -> func_en -> proc_ld (0-1-0) -> stall_en 
    !
    ! check the default value of DMBR_FUNC_EN
    !
    setx 0xDEADBEE3, %g1, %g3           ! DEBUG: point3
    setx DMBR_REG1_FULL_ADDRESS, %g1, %g2
    ldx [%g2], %l0
    and %l0, 0x1, %l0                   ! DMBR_FUNC_EN is 0s bit
    cmp %l0, %g0                        ! by default should be off
    be set_config
    nop
    ! switch off FUNC_EN
    add %g0, 1, %l1
    sllx %l1, DMBR_FUNC_EN_SHIFT, %l1
    add %g0, -1, %l2
    xor %l1, %l2, %l1
    and %l1, %l0, %l0                   ! clear func_en
    stx %l0, [%g2]                      ! write configuration register

set_config:
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! SET CREDIT CONFIGURATION FOR BINS
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    setx 0xDEADBEE4, %g1, %g3           ! DEBUG: point4
    add %g0, %g0, %l1                   ! nullify %l1
    add %g0, TEST_CRED_BIN_0, %l0
    sllx %l0, DMBR_BIN_0_SHIFT, %l0
    or  %l0, %l1, %l1                   ! set credits for bin0 in %l1
    add %g0, TEST_CRED_BIN_1, %l0
    sllx %l0, DMBR_BIN_1_SHIFT, %l0
    or  %l0, %l1, %l1
    add %g0, TEST_CRED_BIN_2, %l0
    sllx %l0, DMBR_BIN_2_SHIFT, %l0
    or  %l0, %l1, %l1
    add %g0, TEST_CRED_BIN_3, %l0
    sllx %l0, DMBR_BIN_3_SHIFT, %l0
    or  %l0, %l1, %l1
    add %g0, TEST_CRED_BIN_4, %l0
    sllx %l0, DMBR_BIN_4_SHIFT, %l0
    or  %l0, %l1, %l1
    add %g0, TEST_CRED_BIN_5, %l0
    sllx %l0, DMBR_BIN_5_SHIFT, %l0
    or  %l0, %l1, %l1
    add %g0, TEST_CRED_BIN_6, %l0
    sllx %l0, DMBR_BIN_6_SHIFT, %l0
    or  %l0, %l1, %l1
    add %g0, TEST_CRED_BIN_7, %l0
    sllx %l0, DMBR_BIN_7_SHIFT, %l0
    or  %l0, %l1, %l1
    add %g0, TEST_CRED_BIN_8, %l0
    sllx %l0, DMBR_BIN_8_SHIFT, %l0
    or  %l0, %l1, %l1
    add %g0, TEST_CRED_BIN_9, %l0
    sllx %l0, DMBR_BIN_9_SHIFT, %l0
    or  %l0, %l1, %l1
    ! set fun_en
    add %g0, 1, %l0
    sllx %l0, DMBR_FUNC_EN_SHIFT, %l0
    or  %l0, %l1, %l1
    ! write a configuration register
    stx %l1, [%g2]
    ldx [%g2], %l0
    and %l0, 0x1, %l0 
    cmp %l0, 0x1                        ! check that DMBR_FUNC_EN is on
    bne bad_end
    nop
    ! load bin credits configuration in DMBR
    setx 0xDEADBEE5, %g1, %g3           ! DEBUG: point5
    add %g0, 1, %l0
    sllx %l0, DMBR_PROC_LD_SHIFT, %l0        ! make a mask for setting 'proc_ld'
    or %l0, %l1, %l1                    ! set 'proc_ld'
    stx %l1, [%g2]                      ! write a configuration register
    add %g0, -1, %l3
    xor %l3, %l0, %l0                   ! make a mask for clearing 'proc_ld'
    and %l0, %l1, %l1                   ! clear proc_ld
    stx %l1, [%g2]                      ! write a configuration register


    ! check the default value of DMBR_STALL_EN
    setx 0xDEADBEE6, %g1, %g3           ! DEBUG: point6
    add %g0, 1, %l0
    sllx %l0, DMBR_STALL_EN_SHIFT, %l0
    or %l0, %l1, %l1
    stx %l1, [%g2]                      ! switch on DMBR_STALL_EN
    ldx [%g2], %l3
    and %l0, %l3, %l4                   ! extract stall_en bit
    cmp %l0, %l4                        ! mast and extracted bit must be the same
    bne bad_end
    nop

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! start of the test section
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    setx 0xBADFACE0, %g1, %g5
    set data_label, %g1             ! staring address for copying
    add %g0, LOOP_ITERATIONS, %g2
    sllx %g2, 0x6, %g5              ! number of cash lines
    add %g1, %g5, %g3               ! starting address for destination
    add %g0, 1, %g4                 ! iteration counter, always at leat 1 iteration
    rd  %tick, %g6
loop:
    setx 0xBADFACE1, %g1, %g5
    cmp %g2, %g4
    be loop_done
    ldx [%g1], %l0
    nop
    nop
    nop
    stx %l0, [%g3]
    add %g4, 0x1, %g4
    add %g1, 0x40, %g1
    ba loop
    add %g3, 0x40, %g3
loop_done:
    setx 0xBADFACE2, %g1, %g5
    rd %tick, %l0
    sub %l0, %g6, %l0               ! calcuater cycles for a test
    add %g0, LOOP_ITERATIONS, %g2
    mulx %g2, 0x2, %g2               ! TODO: 2 memory accesses per iteration ???
    udiv %l0, %g2, %l0              ! test_time / req_num
    add %g0, %l0, %g6
    
    wr  %g0, 0x4, %fprs         /* make sure fef is 1 */
    set data_label, %g1
    add %g0, TEST_EXPECTED_INTERV_AVG, %l0
    st %l0, [%g1]
    ld [%g1], %f0                   ! interv_avg
    fitod %f0, %f0
    add %g0, 90, %l0
    st %l0, [%g1]
    ld [%g1], %f2
    fitod %f2, %f2
    fmuld %f2, %f0, %f0
    add %g0, 100, %l0
    st %l0, [%g1]
    ld [%g1], %f2
    fitod %f2, %f2
    fdivd %f0, %f2, %f0
    fdtoi %f0, %f0
    st %f0, [%g1]
    setx 0xBADFACE3, %g1, %g5
    ld [%g1], %l0
    cmp %g6, %l0            ! compare average inter-time to test and 0.9*EXPECTED
    bl bad_end

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! end of the test section
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    ! switch off DMBR
    setx 0xDEADBEE7, %g1, %g3           ! DEBUG: point7
    setx DMBR_REG1_FULL_ADDRESS, %g1, %g2
    ldx [%g2], %l0
    add %g0, 1, %l1
    sllx %l1, DMBR_FUNC_EN_SHIFT, %l1
    add %g0, -1, %l2
    xor %l1, %l2, %l1
    and %l1, %l0, %l0                   ! clear func_en
    stx %l0, [%g2]                      ! write configuration register
    
    ! save state
    setx 0xDEADBEE8, %g1, %g3           ! DEBUG: point8
    add %g0, 1, %l1
    sllx %l1, DMBR_RD_CUR_VAL_SHIFT, %l1
    or %l1, %l0, %l0                    ! set rd_cur_state bit
    stx %l0, [%g2]
    ldx [%g2], %l0                      ! now we must read internal state of bins in DMBR
good_end:
    ta T_GOOD_TRAP
    ba end
    nop
bad_end:
    ta T_BAD_TRAP
end:
    nop
    nop

.data
.align 0x1fff+1

.global test_data
data_label:

