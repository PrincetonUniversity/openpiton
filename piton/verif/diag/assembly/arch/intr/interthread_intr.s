// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: interthread_intr.s
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
/*
 *  Description: This diag tests the thread-to-thread interrupts.
 *      Every thread issues an interrupt to every other thread, including
 *      itself.  The diag sends every interrupt with every combination of issuing/receiving
        thread in the following states: RED mode, TL=1/P=1, TL=0/P=1, TL=0/P=0.
        The interrupts are issued by writing the vector to ASI_UDB_INTR_W (asi 0x73).
        In order to switch issuing threads, all threads receive a POR.  The TID of the 
        next issuing thread is stored in memory and is checked by each thread on reset.  
        If the current thread is not the issuing thread, it checks what state it should
        enter (also stored in memory), enters that state, and loops while waiting for an interrupt.
 */

#define H_HT0_Privileged_Action_0x37 nop_trap_handler        
#define H_HT0_Interrupt_0x60 interrupt_handler

#define H_HT0_HTrap_Instruction_0
#define My_HT0_HTrap_Instruction_0 \
        stxa  %l3, [ %g0 ] 0x73; done; \
        nop; nop; nop; nop; nop; nop;

.global Power_On_Reset
.global curr_thr
.global intr_test 
.global reset_threads 
.global start_th0                     
.global start_th1                     
.global start_th2                     
.global start_th3

#include "boot.s"

!! Parameters for number of threads      
#define NUM_THR 4        
#define BARRIER_MET NUM_THR    !! can be changed for debug
#define NUM_INT 1        

!! Offsets into memory
#define ISSUE_TID_OFFSET 0x0        
#define MODE_OFFSET 0x8        
#define BARRIER_OFFSET 0x10
#define RED_INT_OFFSET 0x18 
        
!! Mode definitions
#define NUM_MODES 4        
#define MODE_RED 0
#define MODE_TRAP 1
#define MODE_PRIV 2
#define MODE_NONPRIV 3

.text
.global main

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_VA,
        RA=MAIN_BASE_TEXT_RA,
        tsbonly,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_data {
        Name = .MAIN,
        VA=MAIN_BASE_DATA_VA,
        RA=MAIN_BASE_DATA_RA,
        tsbonly,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

main:
!! Determing thread ID
	ta T_RD_THID
        mov %o1, %g1
        
        setx red_int_data, %l1, %g5
        setx barrier_count, %l1, %g6

!! Check to see if current thread is active
        ldx [%g5+ISSUE_TID_OFFSET], %l3
        cmp %g1, %l3
        be launch_resets
        nop

loop_wait_for_reinit:
        setx wait_for_reinit, %i0, %i1  ! if we are here because of reinit
        ldub [%i1], %i0                 ! then wait till the time real reset.
        cmp  %i0, 0x1
        be   loop_wait_for_reinit
        nop

        ldx [%g5+MODE_OFFSET], %l3
        cmp %l3, MODE_RED
        be target_red
        cmp %l3, MODE_TRAP
        be target_trap
        cmp %l3, MODE_PRIV
        be target_priv
        nop
        ba target_nonpriv
        nop
        
launch_resets: 
!! Reset/launch all other threads
        call reset_threads
        nop                     
!! RED Mode call test loop
        call intr_test
        nop

	ta T_CHANGE_PRIV

!! Shift to TL = 1 and call loop
        wrpr %g0, 0x2, %tl !! TL = 1 after done
        wrpr %g0, 0x2, %gl !! GL = 1 after done
        setx issue_non_red, %l1, %l0
        wrpr %l0, %g0, %tpc
        wrpr %l0, %g0, %tnpc
        set 0x600, %l0  !! priv, interrupt enabled
        wrpr %l0, %g0, %tstate
        done
        nop
issue_non_red:          
        call intr_test
        nop
!! Shift to TL = 0 and Priv and call loop
        wrpr 0, %tl
        wrpr 0, %gl
        wrpr 6, %pstate
        call intr_test
        nop
!! Shift to TL = 0 and NonPriv and call loop
        wrpr 0, %tl
        wrpr 0, %gl
        wrpr 2, %pstate
        call intr_test
        nop

!! Invalidate current thread number so reset will reset all the threads
        mov -1, %g1        
!! When done increment active thread counter (in memory).
        ldx [%g5+ISSUE_TID_OFFSET], %l3
        add %l3, 0x1, %l3
!! If last thread, then change state of target threads
        set NUM_THR, %l4
        cmp %l3, %l4
        move %xcc, %g0, %l3 !! reset thread counter for loop
        stx %l3, [%g5+ISSUE_TID_OFFSET]
        be change_mode
        nop
        call reset_all
        nop
        ba thr_idle
        nop
        
change_mode:    
        ldx [%g5+MODE_OFFSET], %l3
        add %l3, 0x1, %l3
        stx %l3, [%g5+MODE_OFFSET]
!! If all modes have been exercised then done, otherwise reset all        
        cmp %l3, NUM_MODES
        be diag_pass
        nop
        call reset_all
        nop
        ba thr_idle
        nop



/**************************************
        Code for non-issuing threads   
        ----------------------------
        Sets up state and branches to idle loop
 ***************************************/             
target_red:
        ba thr_idle
        nop
target_trap:
        ta T_CHANGE_PRIV
        wrpr %g0, 0x2, %tl !! TL = 1 after done
        wrpr %g0, 0x2, %gl !! TL = 1 after done
        set 0x600, %l2  !! priv, interrupt enabled
        ba target_exit_red
        nop
target_priv:
        ta T_CHANGE_PRIV
        wrpr %g0, 0x1, %tl !! TL = 0 after done
        wrpr %g0, 0x1, %gl !! TL = 0 after done
        set 0x600, %l2 !! priv, interrupt enabled
        nop
        ba target_exit_red
        nop
target_nonpriv: 
        ta T_CHANGE_PRIV
        set 0x200, %l2 !! interrupt enabled
        wrpr %g0, 0x1, %tl !! TL = 0 after done
        wrpr %g0, 0x1, %gl !! TL = 0 after done
        ba target_exit_red
        nop

target_exit_red:        
        setx thr_idle, %l0, %l1
        wrpr %l1, %g0, %tpc
        wrpr %l1, %g0, %tnpc
        wrpr %l2, %g0, %tstate
        done
        nop
                
        
thr_idle:
        !! mark thread as active                       
        ldstub [%g6], %l3
        cmp %l3, 0xff
        be  thr_idle
        nop
        add %l3, 0x1, %l3 !! increment counter
        stub %l3, [%g6]
        
        mov 0x1, %l5
idle_loop:            
        add %l5, 0x1, %l5
        ba idle_loop
        nop

        
reset_all:        
       setx wait_for_reinit, %i0, %i1
       mov  0x1, %i0
       stub %i0, [%i1]
       membar #Sync

       setx which_round, %i0, %i1

       ta T_RD_THID
       mov %o1, %g1

chk_thid0:
       cmp %g1, 0x0
       bne chk_thid1
       nop
       ldub [%i1], %i0
       mov %i0, %i2
       inc %i0
       stub %i0, [%i1]
       membar #Sync
       cmp %i2, 0x0
       be R0_th0r1
       nop
       cmp %i2, 0x1
       be R1_th0r1
       nop
       cmp %i2, 0x2
       be R2_th0r1
       nop
       cmp %i2, 0x3
       be R3_th0r1
       nop

chk_thid1:
       cmp %g1, 0x1
       bne chk_thid2
       nop
       ldub [%i1+1], %i0
       mov %i0, %i2
       inc %i0
       stub %i0, [%i1+1]
       membar #Sync
       cmp %i2, 0x0
       be R0_th1r2
       nop
       cmp %i2, 0x1
       be R1_th1r2
       nop
       cmp %i2, 0x2
       be R2_th1r2
       nop
       cmp %i2, 0x3
       be R3_th1r2
       nop


chk_thid2:
       cmp %g1, 0x2
       bne chk_thid3
       nop
       ldub [%i1+2], %i0
       mov %i0, %i2
       inc %i0
       stub %i0, [%i1+2]
       membar #Sync
       cmp %i2, 0x0
       be R0_th2r3
       nop
       cmp %i2, 0x1
       be R1_th2r3
       nop
       cmp %i2, 0x2
       be R2_th2r3
       nop
       cmp %i2, 0x3
       be R3_th2r3
       nop


chk_thid3:
       cmp %g1, 0x3
       bne chk_thid3
       nop
       ldub [%i1+3], %i0
       mov %i0, %i2
       inc %i0
       stub %i0, [%i1+3]
       membar #Sync
       cmp %i2, 0x0
       be R0_th3r0
       nop
       cmp %i2, 0x1
       be R1_th3r0
       nop
       cmp %i2, 0x2
       be R2_th3r0
       nop
       cmp %i2, 0x3
       be R3_th3r0
       nop



R0_th0r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th0r1)) -> intp(1, 1, 1)
R0_th0r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th0r2)) -> intp(2, 1, 1)
R0_th0r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th0r3)) -> intp(3, 1, 1)
R0_th0r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th0r0)) -> intp(0, 1, 1)
       ba wait_for_death
       nop

R1_th0r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th0r1)) -> intp(1, 1, 1)
R1_th0r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th0r2)) -> intp(2, 1, 1)
R1_th0r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th0r3)) -> intp(3, 1, 1)
R1_th0r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th0r0)) -> intp(0, 1, 1)
       ba wait_for_death
       nop

R2_th0r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th0r1)) -> intp(1, 1, 1)
R2_th0r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th0r2)) -> intp(2, 1, 1)
R2_th0r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th0r3)) -> intp(3, 1, 1)
R2_th0r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th0r0)) -> intp(0, 1, 1)
       ba wait_for_death
       nop

R3_th0r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th0r1)) -> intp(1, 1, 1)
R3_th0r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th0r2)) -> intp(2, 1, 1)
R3_th0r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th0r3)) -> intp(3, 1, 1)
R3_th0r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th0r0)) -> intp(0, 1, 1)
       ba wait_for_death
       nop



R0_th1r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th1r2)) -> intp(2, 1, 1)
R0_th1r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th1r3)) -> intp(3, 1, 1)
R0_th1r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th1r0)) -> intp(0, 1, 1)
R0_th1r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th1r1)) -> intp(1, 1, 1)
       ba wait_for_death
       nop

R1_th1r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th1r2)) -> intp(2, 1, 1)
R1_th1r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th1r3)) -> intp(3, 1, 1)
R1_th1r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th1r0)) -> intp(0, 1, 1)
R1_th1r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th1r1)) -> intp(1, 1, 1)
       ba wait_for_death
       nop

R2_th1r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th1r2)) -> intp(2, 1, 1)
R2_th1r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th1r3)) -> intp(3, 1, 1)
R2_th1r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th1r0)) -> intp(0, 1, 1)
R2_th1r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th1r1)) -> intp(1, 1, 1)
       ba wait_for_death
       nop

R3_th1r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th1r2)) -> intp(2, 1, 1)
R3_th1r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th1r3)) -> intp(3, 1, 1)
R3_th1r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th1r0)) -> intp(0, 1, 1)
R3_th1r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th1r1)) -> intp(1, 1, 1)
       ba wait_for_death
       nop



R0_th2r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th2r3)) -> intp(3, 1, 1)
R0_th2r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th2r0)) -> intp(0, 1, 1)
R0_th2r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th2r1)) -> intp(1, 1, 1)
R0_th2r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th2r2)) -> intp(2, 1, 1)
       ba wait_for_death
       nop

R1_th2r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th2r3)) -> intp(3, 1, 1)
R1_th2r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th2r0)) -> intp(0, 1, 1)
R1_th2r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th2r1)) -> intp(1, 1, 1)
R1_th2r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th2r2)) -> intp(2, 1, 1)
       ba wait_for_death
       nop

R2_th2r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th2r3)) -> intp(3, 1, 1)
R2_th2r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th2r0)) -> intp(0, 1, 1)
R2_th2r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th2r1)) -> intp(1, 1, 1)
R2_th2r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th2r2)) -> intp(2, 1, 1)
       ba wait_for_death
       nop

R3_th2r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th2r3)) -> intp(3, 1, 1)
R3_th2r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th2r0)) -> intp(0, 1, 1)
R3_th2r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th2r1)) -> intp(1, 1, 1)
R3_th2r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th2r2)) -> intp(2, 1, 1)
       ba wait_for_death
       nop



R0_th3r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th3r0)) -> intp(0, 1, 1)
R0_th3r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th3r1)) -> intp(1, 1, 1)
R0_th3r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th3r2)) -> intp(2, 1, 1)
R0_th3r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R0_th3r3)) -> intp(3, 1, 1)
       ba wait_for_death
       nop

R1_th3r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th3r0)) -> intp(0, 1, 1)
R1_th3r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th3r1)) -> intp(1, 1, 1)
R1_th3r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th3r2)) -> intp(2, 1, 1)
R1_th3r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R1_th3r3)) -> intp(3, 1, 1)
       ba wait_for_death
       nop

R2_th3r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th3r0)) -> intp(0, 1, 1)
R2_th3r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th3r1)) -> intp(1, 1, 1)
R2_th3r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th3r2)) -> intp(2, 1, 1)
R2_th3r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R2_th3r3)) -> intp(3, 1, 1)
       ba wait_for_death
       nop

R3_th3r0: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th3r0)) -> intp(0, 1, 1)
R3_th3r1: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th3r1)) -> intp(1, 1, 1)
R3_th3r2: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th3r2)) -> intp(2, 1, 1)
R3_th3r3: nop  ! $EV trig_pc_d (1,@VA(.MAIN.R3_th3r3)) -> intp(3, 1, 1)
       ba wait_for_death
       nop


wait_for_death:
       ba wait_for_death
       nop
                        
/**********************************************************
 *      POR for all other threadds
 *        %g1 Issuing (current) thread ID
 **********************************************************/                           
reset_threads:
        set 0x1, %l0
	membar #Sync
        stub %l0, [%g6] !! clear active counter except for current thread
        cmp %g1, 0
        be start_th1
        nop
start_th0:
	nop  ! $EV trig_pc_d (1,@VA(.MAIN.start_th0)) -> intp(0, 1, 1)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
        cmp %g1, 1
        be start_th2
        nop
start_th1:
	nop  ! $EV trig_pc_d (1,@VA(.MAIN.start_th1)) -> intp(1, 1, 1)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
        cmp %g1, 2
        be start_th3
        nop
start_th2:
	nop  ! $EV trig_pc_d (1,@VA(.MAIN.start_th2)) -> intp(2, 1, 1)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
        cmp %g1, 3
        be reset_barrier
        nop
start_th3:
	nop  ! $EV trig_pc_d (1,@VA(.MAIN.start_th3)) -> intp(3, 1, 1)
	nop
	nop
	nop
	nop
	nop
	nop
	nop

reset_barrier:
        setx wait_for_reinit, %i0, %i1  ! clear wait flag, since this is real reset.
        stub %g0, [%i1]
        membar #Sync

        ldub [%g6], %l2
        cmp %l2, BARRIER_MET
        bne reset_barrier
        nop
             
        retl
        nop
        
/**********************************************************
 *      Test set for interrupts with dispatcher in any mode
 *        %g1 Issuing (current) thread ID
 *        %g2 thrid loop index
 *        %g3 interrupt loop index
 *        %g4 interrupt vector
 *        %g5 address for red_int_data
 *        %g6 address for barrier_count
 **********************************************************/                           
intr_test:           
        set 0x0, %g3
        set 0x1, %l0
        stub %l0, [%g6] !! clear active counter except for current thread
reset_loop:
        set 0x0, %g2 !! clear thrid loop index
        sll %g3, 3, %l2 !! dword align offset
        add %l2, RED_INT_OFFSET, %l2
        ldx [%g5+%l2], %g4 !! load interrupt vector
thrid_loop:
        sll %g2, 8, %l3
        or %l3, %g4, %l3  !! include target tid in vector
        ta T_HTRAP_INST0  !! store interrupt vector to ASI_UDB_INTR_W
        
inc_tid:
        add %g2, 0x1, %g2
        add %g4, 0x3, %g4
        and %g4, 0x3F, %g4 !! change vector for interrupt
        cmp %g2, NUM_THR
        bne thrid_loop
        nop
        
inc_interrupt:   
        ldub [%g5+BARRIER_OFFSET], %l5
        cmp %l5, BARRIER_MET
        bne inc_interrupt
        nop
        stub %g0, [%g5+BARRIER_OFFSET] !! clear active counter 
        stx %g4, [%g5+%l2] !! store modified interrupt vector      
        add %g3, 0x1, %g3  
        !! return if all interrupt vectors have been executed   
        cmp %g3, NUM_INT
        bne reset_loop
        nop
        
done_int_test:               
        retl 
        nop  
  
        
        
/*
 ********************************
 *      Diag PASSED             *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop
              
        
.data
.global barrier_count        
.global red_int_data        
        .align 64
red_int_data:
!! issuing tid
        .word 0x00000000, 0x00000000
!! mode for target threads (0:  RED, 1: TL=1, 2: PRIV, 3: NONPRIV, 4: ERROR)
        .word 0x00000000, 0x00000000        
!! thread barrier                
        .word 0x00000000, 0x00000000 
!! interrupt vectors
        .word 0x00000000, 0x00000000    !! Interrupt with vector included         
barrier_count:  
        .word 0x00000000, 0x00000000
wait_for_reinit:
        .word 0x00000000, 0x00000000
which_round:
        .word 0x00000000, 0x00000000
.end                                
.end                                
        

/*
 ********************************
 *      trap handler            *
 ********************************
 */
              
SECTION .USER_TRAP_FOR_HYP TEXT_VA=0x3002000
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }

.text
.global nop_trap_handler
.global interrupt_handler
.global interrupt_idle

nop_trap_handler:       
        set 0xdeadbeef, %g7
        done
        nop        
                            
        
interrupt_handler:      
        ldxa  [ %g0 ] 0x74, %g3  !! read interrupt vector from ASI_UDB_INTR_R
        !! increment sync counter
        setx red_int_data, %g1, %g5
interrupt_idle: 
        !! mark thread as active                       
	wr %g0, 0x10, %asi
        ldstuba [%g5+BARRIER_OFFSET]%asi, %g1
        cmp %g1, 0xff
        be interrupt_idle 
        nop
        add %g1, 0x1, %g1 !! increment counter
        stuba %g1, [%g5+BARRIER_OFFSET]%asi
        retry
	nop

