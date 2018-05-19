// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_mamem_data.s
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

#define  H_HT0_Data_access_error_0x32 My_Data_Access_Error_Trap
#define  MAIN_PAGE_HV_ALSO

#include "spu_diag.h"
#include "boot.s"
#include "err_defines.h"

#define  MA_OPERATION  6
#define  PERR_INJ     13

.text
.global  main
.global  My_Data_Access_Error_Trap


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

  ! Sparc Error Status Register powers up X - Write 1 on each bit to clear
  setx  0xefffffff, %l1, %l2
  stxa  %l2, [%g0] ASI_SES
  ldxa  [%g0] ASI_SES, %l1
  setx  SES_INIT_VALUE, %l3, %l2
  cmp   %l1, %l2
  bne   test_fail
  nop

  ! Disable traps on errors
!  stxa  %g0, [%g0] ASI_SEE

  wr    %g0, SPU_ASI, %asi                 ! set up the asi register to contain SPU asi

set_up_addresses:
  setpa (AA1, %l0, %l1, %l6)               ! set the PA to %l6 using %l0 and %l1 as temp regs
  stxa  %l6, [%g0+REG_MPA_ADDR] %asi
  stxa  %g0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set MAMEM offset (0x0)
  add   %g0, 9, %i0                        ! #of xwords to load to MAMEM
  sub   %i0, 1,  %i0                       ! minus 1

  ! If trap level not 0, skip error injection
  rdpr  %tl, %l0
  brnz  %l0, load_MA_MEM
  nop

enable_error_injection:
  mov   0x1, %l0
  sllx  %l0, PERR_INJ, %l0
  or    %i0, %l0, %i0                      ! set parity error injection

load_MA_MEM:
  sllx  %o7, 11, %l0                       ! set THREAD_ID field
  or    %i0, %l0, %i0
  stxa  %i0, [%g0+REG_MA_CTL_ADDR] %asi    ! store to the MA_CTL register to load 9 bytes to MAMEM
  ldxa  [%g0+MASync_ADDR] %asi, %l7
  cmp     %l7, %g0
  bne,pn  %xcc,    diag_fail
  nop

  add   %g0, 1, %i0
  stxa  %i0, [%g0+REG_NP_ADDR] %asi        ! set NP to 1
  setx  0x0c09060300, %l0, %i0
  stxa  %i0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set offsets
  set   0x80, %i0
  add   %i0, 2, %i0

MA_Multiply:
  sllx  %o7, 11, %l0                       ! set THREAD_ID field
  or    %i0, %l0, %i0
  stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi  ! set MA_CTL register to do MA_MULIPLY with len 3
  ldxa    [%g0+MASync_ADDR] %asi, %l7
        cmp     %l7, %g0
        bne,pn  %xcc,    diag_fail
        nop
  setpa   (OBUF, %l0, %l1, %l6)  ! set the PA of OBUF to %l6 using %l0 and %l1 as temp regs
        stxa    %l6, [%g0+REG_MPA_ADDR] %asi
  set  0xc, %i0
  stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi 
  set  0x40, %i0
  add  %i0, 2, %i0
store_out_result:
  sllx  %o7, 11, %l0                       ! set THREAD_ID field
  or    %i0, %l0, %i0
  stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out 3 words of MAMEM
  ldxa    [%g0+MASync_ADDR] %asi, %l7
        cmp     %l7, %g0
        bne,pn  %xcc,    diag_fail
        nop

  ! Check Sparc Error Status Register
  mov   0x0, %o0   ! (MEU, MEC, PRIV)
  mov   SES_MAU, %o1
  call  sub_check_sparc_error_status
  save

  ! Check trap type
  mov   TT_Data_Access_Error, %l0
  cmp   %o6, %l0
  bne   test_fail
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

  ! If Data Access Error trap did not happen, this test wouldn't have passed

  ba  test_pass
  nop

My_Data_Access_Error_Trap:
  ! save trap type value
  rdpr  %tt, %o6
  ! Repeat MA operation without error injection
  ba    set_up_addresses
  nop

#include "err_subroutines.s"

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

