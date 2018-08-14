! Copyright (c) 2017 Princeton University
! All rights reserved.
! 
! Redistribution and use in source and binary forms, with or without
! modification, are permitted provided that the following conditions are met:
!     * Redistributions of source code must retain the above copyright
!       notice, this list of conditions and the following disclaimer.
!     * Redistributions in binary form must reproduce the above copyright
!       notice, this list of conditions and the following disclaimer in the
!       documentation and/or other materials provided with the distribution.
!     * Neither the name of Princeton University nor the
!       names of its contributors may be used to endorse or promote products
!       derived from this software without specific prior written permission.
! 
! THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
! ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
! WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
! DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
! DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
! (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
! LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
! ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
! (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
! SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#include    "UART16550.h"   

#define     PITON_PUTS(label, tmp)      \
            setx    label, tmp, %o0;    \
            call    uart16550_puts;     \
            nop                     

#define     PITON_PUTREG(reg)           \
            call    uart16550_putreg;   \
            mov     reg, %o0

#define     PITON_PUTHEXDIG(reg)        \
            mov     reg, %o0;           \
            call    uart16550_putreg;   \
            add     %o0, 0x30, %o0

#define     PITON_PRINT_REG(reg)        \
            call    uart16550_printreg; \
            mov     reg, %o0

#define     PITON_PRINT_REG_NL(reg, tmp)   \
            call    uart16550_printreg;    \
            mov     reg, %o0;              \
            setx    nl_string, tmp, %o0;   \
            call    uart16550_puts;        \
            nop

#define     PITON_GET_LOCK(lock_addr, tmp)  \
            setx    lock_addr, tmp, %o0;    \
            call    lock_acquire;           \
            nop

#define     PITON_REL_LOCK(lock_addr, tmp)  \
            setx    lock_addr, tmp, %o0;    \
            call    lock_release;           \
            nop

#define     PITON_PRINT_EVENT_NUM(reg_before, reg_after)   \
            mov     reg_before, %o0;                       \
            call    print_event_num_hp;                    \
            mov     reg_after, %o1

! User Level defines
#define     PITON_UPUTS(label, tmp)     \
            setx    label, tmp, %o0;    \
            call    hp_puts;            \
            nop

#define     PITON_UPRINT_REG(reg)       \
            call    hp_print_reg;       \
            mov     reg, %o0

#define     PITON_UPRINT_REG_NL(reg, tmp)   \
            call    hp_print_reg;           \
            mov     reg, %o0;               \
            setx    nl_string, tmp, %o0;    \
            call    hp_puts;                \
            nop

#define     PITON_UGET_LOCK(lock_addr, tmp) \
            setx    lock_addr, tmp, %o0;    \
            call    hp_get_lock;            \
            nop

#define     PITON_UREL_LOCK(lock_addr, tmp) \
            setx    lock_addr, tmp, %o0;    \
            call    hp_rel_lock;            \
            nop

#define     PITON_UPRINT_EVENT_NUM(reg_before, reg_after)   \
            mov     reg_before, %o0;                        \
            call    print_event_num;                        \
            mov     reg_after, %o1

#define     PITON_UPRINT_CYCLE_NUM(tick_before, tick_after) \
            sub     tick_after, tick_before, tick_after;    \
            PITON_UPUTS(ticks_str, tick_before);            \
            PITON_UPRINT_REG_NL(tick_after, tick_before)

#define     PITON_GET_THREAD_ORDER(x, y, th)    \
            mov     x, %o0;                     \
            mov     y, %o1;                     \
            call    calc_thread_order;          \
            mov     th, %o2


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Description:
!   Sends msg to thread th at core at x,y
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#define     PITON_SEND_INT_MSG(msg, x, y, th, tmp)  \
            setx    msg, tmp, %o0;                  \
            mov     x, %o1;                         \
            mov     y, %o2;                         \
            mov     th, %o3;                        \
            call    send_int_msg;                   \
            nop


! Chip Parameters
#define     PITON_X_DIM             5
#define     PITON_Y_DIM             5
#define     PITON_TH_NUM            2

#define     PITON_CORE_MASK             0x0000001
#define     PITON_THREAD_MASK           0x0000001

#define     PITON_L1D_CL_SIZE           0x10
#define     PITON_L2_CL_SIZE            0x40

#define     PITON_L2_SLICE_SIZE         65536

#define     PITON_L1D_WAY_SIZE          0x800
#define     PITON_L2_WAY_SIZE           0x4000
#define     PITON_L2_LOW_SIZE           0x40
#define     PITON_L2_MID_SIZE           0x4000

#define     PITON_L2_HOME_ALLOC_REG     0xba00000600
#define     PITON_L2_HOME_LOW_BITS      0
#define     PITON_L2_HOME_MID_BITS      1
#define     PITON_L2_HOME_HIGH_BITS     2
#define     PITON_L2_HOME_MIX_BITS      3

! Register Addresses
#define     PITON_REG_COREID        0xba00000000
#define     PITON_INT_ADDR          0x9800000800

! Other
#define     PITON_INT_RST_MSG       0x8000000000010001
#define     PITON_INT_IDLE_MSG      0x8000000000020000

#define     PITON_VINT_TH_OFFSET    8
#define     PITON_VINT_X_OFFSET     18
#define     PITON_VINT_Y_OFFSET     26

#define     PITON_USER_L2_START     0xa8200000
#define     PITON_USER_MEM_START    0xa8202000

! Performance Counter Defines
#define     PCR_SL_OFFSET           4

#define     PERF_IC_MISS            2
#define     PERF_DC_MISS            3
#define     PERF_ITLB_MISS          4
#define     PERF_DTLB_MISS          5

#define     SPARC_PCR               %asr16
#define     SPARC_PIC               %asr17