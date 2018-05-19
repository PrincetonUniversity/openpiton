// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


hboot_dmbr_init:

#ifdef DMBR_ENABLE

rdth_id_h       ! returns thread id in %g3
cmp %g3, 0
bne dmbr_conf_done
nop

! dmbr configuration
#define     DMBR_CRED_BIN_0             3
#define     DMBR_CRED_BIN_1             2
#define     DMBR_CRED_BIN_2             2
#define     DMBR_CRED_BIN_3             3
#define     DMBR_CRED_BIN_4             4
#define     DMBR_CRED_BIN_5             3
#define     DMBR_CRED_BIN_6             4
#define     DMBR_CRED_BIN_7             5
#define     DMBR_CRED_BIN_8             6
#define     DMBR_CRED_BIN_9             7
#define     DMBR_BIN_SCALE              1
#define     DMBR_REPL_INTERVAL          1033
! shift amounts
#define     DMBR_BIN_0_SHIFT            4
#define     DMBR_BIN_1_SHIFT            10
#define     DMBR_BIN_2_SHIFT            16
#define     DMBR_BIN_3_SHIFT            22
#define     DMBR_BIN_4_SHIFT            28
#define     DMBR_BIN_5_SHIFT            34
#define     DMBR_BIN_6_SHIFT            40
#define     DMBR_BIN_7_SHIFT            46
#define     DMBR_BIN_8_SHIFT            52
#define     DMBR_BIN_9_SHIFT            58
#define     DMBR_FUNC_EN_SHIFT          0
#define     DMBR_STALL_EN_SHIFT         1
#define     DMBR_PROC_LD_SHIFT          2
#define     DMBR_RD_CUR_VAL_SHIFT       3
#define     DMBR_BIN_SCALE_SHIFT        16
#define     DMBR_REG1_FULL_ADDRESS      0xba00000200
#define     DMBR_REG2_FULL_ADDRESS      0xba00000500

setx DMBR_REG2_FULL_ADDRESS, %g1, %g2
setx DMBR_REPL_INTERVAL, %g1, %l1
add %g0, DMBR_BIN_SCALE, %l2
sllx %l2, DMBR_BIN_SCALE_SHIFT, %l2
or %l2, %l1, %l1                    ! set bin scale
stx %l1, [%g2]                      ! write a config register
! check if we wrote correct values
ldx [%g2], %l1
setx 0xffff, %g1, %l3
and %l1, %l3, %l2
setx DMBR_REPL_INTERVAL, %g1, %l3 
cmp %l2, %l3
tne %xcc, T_BAD_TRAP
nop
srlx %l1, DMBR_BIN_SCALE_SHIFT, %l2
and %l2, 0x3ff, %l2
cmp %l2, DMBR_BIN_SCALE
tne %xcc, T_BAD_TRAP
nop

! enabling DMBR: set config -> func_en -> proc_ld (0-1-0) -> stall_en 
!
! check the default value of DMBR_FUNC_EN
!
setx DMBR_REG1_FULL_ADDRESS, %g1, %g2
ldx [%g2], %l0
and %l0, 0x1, %l0                   ! DMBR_FUNC_EN is 0s bit
cmp %l0, %g0                        ! by default should be off
bne dmbr_conf_done
nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! SET CREDIT CONFIGURATION FOR BINS
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
add %g0, %g0, %l1                   ! nullify %l1
add %g0, DMBR_CRED_BIN_0, %l0
sllx %l0, DMBR_BIN_0_SHIFT, %l0
or  %l0, %l1, %l1                   ! set credits for bin0 in %l1
add %g0, DMBR_CRED_BIN_1, %l0
sllx %l0, DMBR_BIN_1_SHIFT, %l0
or  %l0, %l1, %l1
add %g0, DMBR_CRED_BIN_2, %l0
sllx %l0, DMBR_BIN_2_SHIFT, %l0
or  %l0, %l1, %l1
add %g0, DMBR_CRED_BIN_3, %l0
sllx %l0, DMBR_BIN_3_SHIFT, %l0
or  %l0, %l1, %l1
add %g0, DMBR_CRED_BIN_4, %l0
sllx %l0, DMBR_BIN_4_SHIFT, %l0
or  %l0, %l1, %l1
add %g0, DMBR_CRED_BIN_5, %l0
sllx %l0, DMBR_BIN_5_SHIFT, %l0
or  %l0, %l1, %l1
add %g0, DMBR_CRED_BIN_6, %l0
sllx %l0, DMBR_BIN_6_SHIFT, %l0
or  %l0, %l1, %l1
add %g0, DMBR_CRED_BIN_7, %l0
sllx %l0, DMBR_BIN_7_SHIFT, %l0
or  %l0, %l1, %l1
add %g0, DMBR_CRED_BIN_8, %l0
sllx %l0, DMBR_BIN_8_SHIFT, %l0
or  %l0, %l1, %l1
add %g0, DMBR_CRED_BIN_9, %l0
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
tne %xcc, T_BAD_TRAP
nop

! load bin credits configuration in DMBR
add %g0, 1, %l0
sllx %l0, DMBR_PROC_LD_SHIFT, %l0        ! make a mask for setting 'proc_ld'
or %l0, %l1, %l1                    ! set 'proc_ld'
stx %l1, [%g2]                      ! write a configuration register
add %g0, -1, %l3
xor %l3, %l0, %l0                   ! make a mask for clearing 'proc_ld'
and %l0, %l1, %l1                   ! clear proc_ld
stx %l1, [%g2]                      ! write a configuration register


! check the default value of DMBR_STALL_EN
add %g0, 1, %l0
sllx %l0, DMBR_STALL_EN_SHIFT, %l0
or %l0, %l1, %l1
stx %l1, [%g2]                      ! switch on DMBR_STALL_EN
ldx [%g2], %l3
and %l0, %l3, %l4                   ! extract stall_en bit
cmp %l0, %l4                        ! mast and extracted bit must be the same
tne %xcc, T_BAD_TRAP
nop

dmbr_conf_done:

#endif