// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_l2cache_data_asld_cecc11.s
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

#define  H_HT0_Reserved_0x74 My_Modular_Arithmetic_interrupt
#define  H_HT0_Corrected_ECC_error_0x63 My_Corrected_ECC_error_trap

#define  MAIN_PAGE_HV_ALSO

#include "spu_diag.h"
#include "boot.s"
#include "err_defines.h"

! Bank address in this diag MUST depend on the address of label "AA1"
#define  L2_BANK_ADDR     0x40
#define  L2_ES_W1C_VALUE  0xc03ffff800000000
#define  INT_ENABLE         9

.text
.global  main
.global  My_Modular_Arithmetic_interrupt
.global  My_Corrected_ECC_error_trap 

main:

  clr   %o7

#ifdef  RUN_TH1
  mov   0x1, %o7
#endif
#ifdef  RUN_TH2
  mov   0x2, %o7
#endif
#ifdef  RUN_TH3
  mov   0x3, %o7
#endif

  ta    %icc, T_RD_THID
  cmp   %o1, %o7
  bne   test_pass
  nop

  nop
  ta      T_CHANGE_HPRIV
  nop

  wr    %g0, SPU_ASI, %asi                 ! set up the asi register to contain SPU asi

  setx  AA1, %l0, %g1
  setx  L2_ES_W1C_VALUE, %l0, %g4

  ! Load data into L2
  ldx   [%g1], %l0

  ! Now access L2 control and status registers

disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

disable_l2:
  setx  L2CS_PA1, %l1, %l0
  mov   0x1, %l2
  stx   %l2, [%l0+L2_BANK_ADDR]

  ! Write 1 to clear L2 Error status registers
  setx  L2ES_PA1, %l3, %l4
  add   %l4, L2_BANK_ADDR, %l4

clear_l2_ESR:
  stx   %g4, [%l4]
  nop

  ! Generate L2 VD Diag read address
  ! Addressing: [39:32] See PRM, [22] 1 for V/D, [17:8] set, [7:6] bank, [2:0] = 0
  setx  0x3ffc0, %l0, %l2       ! Mask for extracting [17:6]
  and   %g1, %l2, %l7

  mov   0xa7, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %l7, %l0, %l7

  mov   0x1, %l0
  sllx  %l0, 22, %l0            ! Bit [22]
  or    %l7, %l0, %l7
 
read_l2_VD_diag:
  ldx   [%l7], %l6

  ! Now find out which ways are valid
  setx  0xffffff, %l0, %l2      ! Mask for [23:0]
  and   %l6, %l2, %l6
  srlx  %l6, 12, %l6            ! Valid bits at [23:12]

  clr   %g2                     ! %g2 will store the "way"
  
  ! Start a loop of 12 ways
next_way:
  srlx  %l6, %g2, %l1 
  and   %l1, 0x1, %l1
  brz   %l1, this_way_done
  nop

  ! Read L2 Data Diag - %g2 has the "way"
  ! Addressing: [39:32] See PRM, [22] odd/even word, [21:18] way, [17:8] set, [7:6] bank, [5:3] D-word, [2:0] = 0
  setx  0x3fff8, %l0, %l2       ! Mask for extracting [17:3]
  and   %g1, %l2, %g5

  sllx  %g2, 18, %l0            ! Position Way
  or    %g5, %l0, %g5

  mov   0xa3, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %g5, %l0, %g5           ! %g5 has L2 Data Diag addressing

read_l2_data_diag:
  ldx   [%g5], %g6

  ! Flip one bit from the data field
  xor   %g6, 0x80, %g6
write_back_with_error:
  stx   %g6, [%g5]

this_way_done:
  inc   %g2
  cmp   %g2, 12
  bne   next_way
  nop

enable_l2:
  setx  L2CS_PA0, %l1, %l0
  sllx  %o7, 15, %l1                       ! set error steering thread
  stx   %l1, [%l0+L2_BANK_ADDR]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

set_up_addresses:
  setpa (AA1, %l0, %l1, %l6)               ! set the PA to %l6 using %l0 and %l1 as temp regs
  stxa  %l6, [%g0+REG_MPA_ADDR] %asi
  stxa  %g0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set MAMEM offset (0x0)
  add   %g0, 9, %i0                        ! #of xwords to load to MAMEM
  sub   %i0, 1,  %i0                       ! minus 1

enable_completion_interrupt:
  mov   0x1, %l0
  sllx  %l0, INT_ENABLE, %l0
  or    %i0, %l0, %i0
  sllx  %o7, 11, %l0                       ! set THREAD_ID field
  or    %i0, %l0, %i0

load_MA_MEM:
  stxa  %i0, [%g0+REG_MA_CTL_ADDR] %asi    ! store to the MA_CTL register to load 9 bytes to MAMEM
  ldxa  [%g0+MASync_ADDR] %asi, %l7
  cmp     %l7, %g0
  bne,pn  %xcc,    diag_fail
  nop

  add   %g0, 1,  %i0
  stxa  %i0, [%g0+REG_NP_ADDR] %asi        ! set NP to 1
  setx  0x0c09060300, %l0, %i0
  stxa  %i0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set offsets
  set   0x80, %i0
  add   %i0, 2, %i0
  sllx  %o7, 11, %l0                       ! set THREAD_ID field
  or    %i0, %l0, %i0

MA_Multiply:
  stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi  ! set MA_CTL register to do MA_MULIPLY with len 3
  ldxa    [%g0+MASync_ADDR] %asi, %l7
  cmp     %l7, %g0
  bne,pn  %xcc,    diag_fail
  nop
  setpa   (OBUF, %l0, %l1, %l6)  ! set the PA of OBUF to %l6 using %l0 and %l1 as temp regs
  stxa    %l6, [%g0+REG_MPA_ADDR] %asi
  set     0xc, %i0
  stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi 
  set     0x40, %i0
  add     %i0, 2, %i0
  sllx    %o7, 11, %l0                      ! set THREAD_ID field
  or      %i0, %l0, %i0
store_out_result:
  stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out 3 words of MAMEM
  ldxa    [%g0+MASync_ADDR] %asi, %l7
  cmp     %l7, %g0
  bne,pn  %xcc,    diag_fail
  nop

  set  OBUF, %i0
  set  RES1, %i1
  add  %g0, 3, %i2

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_2:
  ldx  [%i0], %l3    
  ldx  [%i1], %l4    
  cmp  %l3, %l4
  bne,pn  %xcc,diag_fail
  nop
  add  %i0, 8, %i0
  add  %i1, 8, %i1
  sub  %i2, 1, %i2
  cmp  %i2, 0
  bne  scmp_label_2
  nop

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAC, %l0
  sllx  %l1, L2ES_VEC, %l3       ! VEC (any valid CE) not in PRM, but set by RTL
  or    %l0, %l3, %l0
  sllx  %l1, L2ES_ASYN, %l3      ! ASYN bit set for asynchronous load operation
  or    %l0, %l3, %l0
  mov   0x43, %l1                ! 7-bit Syndrome (for single bit error in data field)
  sllx  %l1, 21, %l3             ! Syndrome for [127:96] at [27:21]
  or    %l0, %l3, %l0            ! %l0 has expected value

  setx  L2ES_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_ESR:
  ldx   [%l3], %l4

  cmp   %l4, %l0
  bne   %xcc, test_fail
  nop

  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR:
  ldx   [%l3], %l4

  ! Error address is the physical address of the cache line (PA[5:0] 0)
  andn  %g1, 0x3f, %l1
  cmp   %l4, %l1
  bne   %xcc, test_fail
  nop

check_MA_interrupt:
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_MA_Interrupt, %l1
  cmp   %o1, %l1
  bne   test_fail
  nop

check_Corrected_ECC_trap:
  cmp   %o2, %l0
  bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l1
  cmp   %o3, %l1
  bne   test_fail
  nop

  ba  test_pass
  nop

My_Modular_Arithmetic_interrupt:
  set   EXECUTED, %o0
  ! save trap type value
  rdpr  %tt, %o1
  retry

My_Corrected_ECC_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o2
  ! save trap type value
  rdpr  %tt, %o3
  retry

test_pass:
diag_pass:
        set     0xc001dea1,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */

test_fail:
diag_fail:
        set     0xdeadcafe,     %l7
        ta T_BAD_TRAP
        nop
  .data
.align 64
DATA1:
  .word  0xdeadbeef
.align  64
AA1:
  .xword  0x1
  .xword  0x2
  .xword  0x0
BB1:
  .xword  0x0
  .xword  0x4
  .xword  0x0
NN1:
  .xword  0xffffffffffffffff
  .xword  0xffffffffffffffff
  .xword  0x0
RES1:
  .xword  0x4
  .xword  0x8
  .xword  0x0
! case of ACCUM = 0
N_prime:
  .xword  0x3c53382cf10eff1f
  .align  16
AA2:
  .xword  0x17c07f149c5fbe7
  .xword  0x1d3fa02f8c9668dc
  .xword  0x45a16f73049ccde
BB2:
  .xword  0x5a75c6f94143432c
  .xword  0x771c2f2cd244c515
  .xword  0xb390005c4ad05215
NN2:
  .xword  0x563db9e12344321
  .xword  0xdc15fdf3776a798b
  .xword  0xd663acd99426505f
RES2:
  .xword  0xc6170e73f5540f61
  .xword  0xa1abc5e6438cf9d4
  .xword  0xb15deb102bb002a1
! case of ACCUM = 1
AA3:
  .xword  0x5a75c6f94143432c
  .xword  0x771c2f2cd244c515
  .xword  0xb390005c4ad05215
BB3:
  .xword  0x5a75c6f94143432c
  .xword  0x771c2f2cd244c515
  .xword  0xb390005c4ad05215
NN3:
  .xword  0x563db9e12344321
  .xword  0xdc15fdf3776a798b
  .xword  0xd663acd99426505f
RES3:
  .xword  0x7b9b3b0e4ef16881
  .xword  0xe72c0fb79f5c72b8
  .xword  0x326d5eeea6ec8c1f
! a large case,  ACCUM = 0     len = 13
N_prime1:
  .xword  0x5b354991f10eff1f
  .align   16
AA4:
  .xword  0x7bc6332cb206b6fc
  .xword  0xd2254af93e2f9939
  .xword  0xde4b752744e69af1
  .xword  0x595f1eb29482932a
  .xword  0x1d16e55418be9b9d
  .xword  0x118effe8501a5f53
  .xword  0x2e7d2da1e08edd0b
  .xword  0x1efb4dd94aa4ec69
  .xword  0xc4b4c8753283f5a5
  .xword  0x49113fca0de548e6
  .xword  0x4dd9a01144f19daf
  .xword  0xacb65b452712a2e6
  .xword  0xb366b4b644af4ff0
  .xword  0xc8eacef70aab5698
BB4:
  .xword  0xb0a100e4f950d3c3
  .xword  0x2a262e576fb171c
  .xword  0x33fa5d12b7f11e47
  .xword  0xcbe2169ed45bfab2
  .xword  0xb8822391028cbe22
  .xword  0xd20314d86fc5bb64
  .xword  0xad7ba8ee7c04d600
  .xword  0x63ce89bb0bf306b2
  .xword  0x4ee79eda38fb4aa9
  .xword  0x4573be2a0d352da8
  .xword  0x6350178a4b593ce7
  .xword  0x7898ce840a85cc9d
  .xword  0x4f5665b7719dbe14
  .xword  0x94fbf5f0b76d077a
NN4:
  .xword  0x5f9b784312344321
  .xword  0x1bab82e0ec4f53ae
  .xword  0x7411677f2b1bd39d
  .xword  0xc3958cbef94facea
  .xword  0xc638585d60918d7f
  .xword  0x1ddfba512683375
  .xword  0x6e34f5dee879c98d
  .xword  0x985a2623fe75468a
  .xword  0x86a2b6fb3cd152c
  .xword  0xa7da84de04caaa87
  .xword  0x4ad43195aa20e5de
  .xword  0x36ddf9e84e193a
  .xword  0xaa83ae36c9a06937
  .xword  0xe9fbb39eee2fd5a1
RES4:
  .xword  0xc2c5f9503982d51c
  .xword  0xb1e3e6cfb69b748f
  .xword  0x1a45416d4bb01837
  .xword  0xae8f72e80af8ab0
  .xword  0xb1dd11e7ea00e8a0
  .xword  0x62ecba30ba93bb79
  .xword  0x70215fe71f32ab96
  .xword  0x5e161307e305788d
  .xword  0x7bca09db16a7bb70
  .xword  0x6dd238c4c383afd2
  .xword  0x80bfdcd12e1833f1
  .xword  0x68d98e229a476ebd
  .xword  0x8773e99135d93a34
  .xword  0x7e7d2a29beaf1fde
OBUF:
  .xword  0x8888888888888888  
.align 8192
  .section .bss
DATA4:
  .word  0x12345678

