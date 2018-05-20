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

/*********************************************************/
#include "boot.s"
#include "piton_def.h"

.text
.global main
main:
    setx    hp_start, %l1, %l0
    jmp     %l0
    nop

    .global return_from_hp
return_from_hp:
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! User space for text for all threads
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! %o0 has core X, %o1 has core Y
    ! calculate unique ID
    mulx    %o1, 5, %l4
    add     %l4, %o0, %l4

    ! Calulcate address offset
    mulx    %l4, 0x40, %l4

    setx    stx_data0, %l1, %l0
    add     %l0, %l4, %l0
    setx    stx_data1, %l2, %l1
    add     %l1, %l4, %l1
    setx    0x0000000000000000, %l3, %l2
    setx    0xffffffffffffffff, %l4, %l3
main_loop:
    stx     %l2, [%l0]
    stx     %l3, [%l1]
    stx     %l2, [%l0]
    stx     %l3, [%l1]
    stx     %l2, [%l0]
    stx     %l3, [%l1]
    stx     %l2, [%l0]
    stx     %l3, [%l1]
    stx     %l2, [%l0]
    stx     %l3, [%l1]
    stx     %l2, [%l0]
    stx     %l3, [%l1]
    stx     %l2, [%l0]
    stx     %l3, [%l1]
    stx     %l2, [%l0]
    stx     %l3, [%l1]
    stx     %l2, [%l0]
    stx     %l3, [%l1]
    stx     %l2, [%l0]
    ba      main_loop
    stx     %l3, [%l1]
    ba      test_good_end
    nop
    nop
test_good_end:
    ta      T_GOOD_TRAP
    ba      test_end    
    nop
test_bad_end:
    ta      T_BAD_TRAP
    ba      test_end
    nop
test_end:
    nop
    nop

    

!==========================
.data
.align 64
    .global stx_data0
stx_data0:
    .xword      0x0000000000000000
    .xword      0x0000000000000000
    .xword      0x0000000000000000
    .xword      0x0000000000000000

.align 64
    .xword      0xa6867a69319ce04d
    .xword      0xa6daa1a707dd1792
    .xword      0xb9cd9f379298805b
    .xword      0x936cde5f487f8eef

.align 64
    .xword      0x942701748cb33acc
    .xword      0xbd16f7bff3b95a92
    .xword      0x9042b39431cdeadb
    .xword      0x969dfb9be40d2f7b

.align 64
    .xword      0x88a99078634b1f19
    .xword      0xb88971e6e73c605e
    .xword      0x956d33601a663341
    .xword      0x80c06e7441daea04

.align 64
    .xword      0xbd5fca5760953911
    .xword      0x95addf543f8561b7
    .xword      0x94543f81d5818be2
    .xword      0x90462c7a6844f475

.align 64
    .xword      0xa764969f789dfb72
    .xword      0xb1799b684a113f66
    .xword      0xbb814500e77d4507
    .xword      0x8ba32c5a347a55b5

.align 64
    .xword      0xaf1d32b99cac0bc5
    .xword      0x94b12a1a370f4776
    .xword      0x922f3f9fe61e06d0
    .xword      0xa973ec7e052dba20

.align 64
    .xword      0x85dfb26cfb72236e
    .xword      0x982fa24d0f8abfbd
    .xword      0x805c603f9f41ce92
    .xword      0x978d0427e1fee446

.align 64
    .xword      0x800fef49f1f8229e
    .xword      0x9ec9f8ea95576e99
    .xword      0x9aa47be7cdab1c66
    .xword      0xbcc7f9585374c9fb

.align 64
    .xword      0xb9d7aa995413553e
    .xword      0xb6fd3b08eebafa04
    .xword      0xb1a771b808bc5824
    .xword      0x90d1575f53c96b29

.align 64
    .xword      0x98d1be7c9496e33d
    .xword      0x993bc8a0e826ea42
    .xword      0x833ba3a3ad5f695a
    .xword      0x83903e1b0ede0145

.align 64
    .xword      0xaebb0206a4bdd8a7
    .xword      0xbff5f28587117821
    .xword      0x80ae2a5ec81b5762
    .xword      0xa7871d0a6e9fc2b6

.align 64
    .xword      0x874cf544ea58ef15
    .xword      0x876541e482ccccbd
    .xword      0xa5490d503fd45f07
    .xword      0xb0bd5531aeac9d21

.align 64
    .xword      0x8b6f493b5bc2fb2f
    .xword      0x9a555af8464b5afa
    .xword      0xa93637cb0af0be2b
    .xword      0xad2e40dec01147fa

.align 64
    .xword      0x8f2f8f71a4569f7a
    .xword      0x91629f8f318e7a33
    .xword      0xb809debdfed224cd
    .xword      0xa8a059fb13785fc1

.align 64
    .xword      0x92873bc5e27572f2
    .xword      0xa9c165490db56fa3
    .xword      0xa182e583422034a4
    .xword      0xacbcbf8c79a7fc27

.align 64
    .xword      0xb94a48e689708337
    .xword      0x826b5d7b06c984ef
    .xword      0xb28046f2f8ba34b4
    .xword      0x942b221f5e3100c9

.align 64
    .xword      0x92cb8796bd106f9f
    .xword      0x91871790f7864300
    .xword      0x94d036a3c9f53ecf
    .xword      0xa7f5f634ba602228

.align 64
    .xword      0x9b00d9d9aec430a2
    .xword      0xb84edfb7124fd737
    .xword      0x8f906db2282e3fc3
    .xword      0x99d28b675f6270af

.align 64
    .xword      0x928de53bd7776310
    .xword      0xa4829470a784cdf7
    .xword      0xb361e5617e0d6d57
    .xword      0x8f1d359d0d52f308

.align 64
    .xword      0x9dd9a194df0d0475
    .xword      0x946f2446708536b8
    .xword      0x97f5676452c7a168
    .xword      0x8627f871c3b467a6

.align 64
    .xword      0x81231419321796ed
    .xword      0x8f6fdd6f68a3e21f
    .xword      0xbb5500d0d648126c
    .xword      0xa6944c3f4cf988db

.align 64
    .xword      0xaf20eb5056ceba2a
    .xword      0x9b027000dd968959
    .xword      0xbc78ddbee51539be
    .xword      0x831e72b66282da4d

.align 64
    .xword      0xa93cc2dcbae019d2
    .xword      0xb0c488d391a81764
    .xword      0xb4cadeee8c4c1c97
    .xword      0xbb9879c98f2bb3cf

.align 64
    .global  stx_data1
stx_data1:
    .xword      0xaf12b5418e52e754
    .xword      0xb1409b5a5d143f41
    .xword      0xbfdf71f62c8e24b5
    .xword      0xbcd9cad4553c275b
 
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

.text

    .global hp_start
hp_start:
    ta      T_CHANGE_HPRIV
    call    piton_multithread_init
    nop
    call    get_core_thread
    nop

    ! Jump back to user code
    ta      T_CHANGE_NONHPRIV
    setx    return_from_hp, %l0, %l1
    jmp %l1
    nop

#include "piton_common.s"
#include "piton_multithread_init.s"
