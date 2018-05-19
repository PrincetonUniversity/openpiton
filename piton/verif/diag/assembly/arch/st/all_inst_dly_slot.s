// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: all_inst_dly_slot.s
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

#define H_T0_Tag_Overflow 
#define My_T0_Tag_Overflow set 0x4893fca1, %l3; done; nop            

#include "boot.s"

.text
.global main

        
main:
/*
 *****************************************************
 *
 *  This diag will test the functionality of the delay
 *  slot and anullment        
 *****************************************************
 */
!! CASE 1: Conditional branch not taken, no annull
        set 0xdeadbeef, %g1     !! operands to use
        set 0xaaddcafe, %g2
        orcc %g0, %g0, %g0 !! clear ccr
        
        !! Group 1: integer instructions
        bne diag_fail
        addcc %g1, %g2, %g3     !! ALU w/ ccs
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bne diag_fail
        sllx %g1, 3, %g3        !! shft
        bne diag_fail
        smulcc %g1, %g2, %g3    !! MUL w/ ccr and y
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bne diag_fail
        sdivcc %g1, %g2, %g3    !! DIV w/ ccr
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bne diag_fail
        sethi 0x54, %g4

        !! Group 2: priv/state registers
        !! Turn on privilege mode so we can write to prs
        ta T_CHANGE_PRIV
        nop               
        bne diag_fail
        wr %g1, 0, %y        
        bne diag_fail
        rd %y, %g3
        bne diag_fail
        wrpr %g0, 5, %cansave        
        bne diag_fail
        rdpr %cansave, %g3

        !! Group 3: LD/ST
        setx DATA_START, %g4, %g3
        stx %g1, [%g3]
        bne diag_fail
        ldx [%g3], %g4
        bne diag_fail
        stx %g2, [%g3]
        ldx [%g3], %g4

        !! Group 4: window management
        bne diag_fail
        save
        bne diag_fail
        restore
        bne diag_fail
        saved
        bne diag_fail
        restored

        !! Group 5: control transfer covered in dcti diag
        !! Group 6: trap in delay slot
        bne diag_fail
        taddcctv %g1, %g2, %g3
        

!! CASE 2: Conditional branch not taken, anull
        set 0xdeadbeef, %g1     !! operands to use
        set 0xaaddcafe, %g2
        orcc %g0, %g0, %g0 !! clear ccr
        
        !! Group 1: integer instructions
        bne,a diag_fail
        addcc %g1, %g2, %g3     !! ALU w/ ccs
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bne,a diag_fail
        sllx %g1, 3, %g3        !! shft
        bne,a diag_fail
        smulcc %g1, %g2, %g3    !! MUL w/ ccr and y
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bne,a diag_fail
        sdivcc %g1, %g2, %g3    !! DIV w/ ccr
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bne,a diag_fail
        sethi 0x54, %g4

        !! Group 2: priv/state registers
        !! Turn on privilege mode so we can write to prs
        ta T_CHANGE_PRIV
        nop               
        bne,a diag_fail
        wr %g1, 0, %y        
        bne,a diag_fail
        rd %y, %g3
        bne,a diag_fail
        wrpr %g0, 5, %cansave        
        bne,a diag_fail
        rdpr %cansave, %g3

        !! Group 3: LD/ST
        setx DATA_START,  %g4, %g3
        stx %g1, [%g3]
        bne,a diag_fail
        ldx [%g3], %g4
        bne,a diag_fail
        stx %g2, [%g3]
        ldx [%g3], %g4

        !! Group 4: window management
        bne,a diag_fail
        save
        bne,a diag_fail
        restore
        bne,a diag_fail
        saved
        bne,a diag_fail
        restored
        bne,a diag_fail
        flushw

        !! Group 5: control transfer covered in dcti diag
        !! Group 6: trap in delay slot
        bne,a diag_fail
        taddcctv %g1, %g2, %g3
                

!! CASE 3: unconditional branch not taken, anull
        set 0xdeadbeef, %g1     !! operands to use
        set 0xaaddcafe, %g2
        orcc %g0, %g0, %g0 !! clear ccr
        
        !! Group 1: integer instructions
        bn,a diag_fail
        addcc %g1, %g2, %g3     !! ALU w/ ccs
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bn,a diag_fail
        sllx %g1, 3, %g3        !! shft
        bn,a diag_fail
        smulcc %g1, %g2, %g3    !! MUL w/ ccr and y
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bn,a diag_fail
        sdivcc %g1, %g2, %g3    !! DIV w/ ccr
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bn,a diag_fail
        sethi 0x54, %g4

        !! Group 2: priv/state registers
        !! Turn on privilege mode so we can write to prs
        ta T_CHANGE_PRIV
        nop               
        bn,a diag_fail
        wr %g1, 0, %y        
        bn,a diag_fail
        rd %y, %g3
        bn,a diag_fail
        wrpr %g0, 5, %cansave        
        bn,a diag_fail
        rdpr %cansave, %g3

        !! Group 3: LD/ST
        setx DATA_START,  %g4, %g3
        stx %g1, [%g3]
        bn,a diag_fail
        ldx [%g3], %g4
        bn,a diag_fail
        stx %g2, [%g3]
        ldx [%g3], %g4

        !! Group 4: window management
        bn,a diag_fail
        save
        bn,a diag_fail
        restore
        bn,a diag_fail
        saved
        bn,a diag_fail
        restored
        bn,a diag_fail
        flushw

        !! Group 5: control transfer covered in dcti diag
        !! Group 6: trap in delay slot
        bn,a diag_fail
        taddcctv %g1, %g2, %g3

!! CASE 4: unconditional branch not taken, no anull
        set 0xdeadbeef, %g1     !! operands to use
        set 0xaaddcafe, %g2
        orcc %g0, %g0, %g0 !! clear ccr
        
        !! Group 1: integer instructions
        bn diag_fail
        addcc %g1, %g2, %g3     !! ALU w/ ccs
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bn diag_fail
        sllx %g1, 3, %g3        !! shft
        bn diag_fail
        smulcc %g1, %g2, %g3    !! MUL w/ ccr and y
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bn diag_fail
        sdivcc %g1, %g2, %g3    !! DIV w/ ccr
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        bn diag_fail
        sethi 0x54, %g4

        !! Group 2: priv/state registers
        !! Turn on privilege mode so we can write to prs
        ta T_CHANGE_PRIV
        nop               
        bn diag_fail
        wr %g1, 0, %y        
        bn diag_fail
        rd %y, %g3
        bn diag_fail
        wrpr %g0, 5, %cansave        
        bn diag_fail
        rdpr %cansave, %g3

        !! Group 3: LD/ST
        setx DATA_START, %g4,  %g3
        stx %g1, [%g3]
        bn diag_fail
        ldx [%g3], %g4
        bn diag_fail
        stx %g2, [%g3]
        ldx [%g3], %g4

        !! Group 4: window management
        bn diag_fail
        save
        bn diag_fail
        restore
        bn diag_fail
        saved
        bn diag_fail
        restored

        !! Group 5: control transfer covered in dcti diag
        !! Group 6: trap in delay slot
        bn diag_fail
        taddcctv %g1, %g2, %g3

!! CASE 5: unconditional branch taken, no anull
        set 0xdeadbeef, %g1     !! operands to use
        set 0xaaddcafe, %g2
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x10800002
        
        !! Group 1: integer instructions
        .word 0x10800002
        addcc %g1, %g2, %g3     !! ALU w/ ccs
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x10800002
        sllx %g1, 3, %g3        !! shft
        .word 0x10800002
        smulcc %g1, %g2, %g3    !! MUL w/ ccr and y
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x10800002
        sdivcc %g1, %g2, %g3    !! DIV w/ ccr
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x10800002
        sethi 0x54, %g4

        !! Group 2: priv/state registers
        !! Turn on privilege mode so we can write to prs
        ta T_CHANGE_PRIV
        nop               
        .word 0x10800002
        wr %g1, 0, %y        
        .word 0x10800002
        rd %y, %g3
        .word 0x10800002
        wrpr %g0, 5, %cansave        
        .word 0x10800002
        rdpr %cansave, %g3

        !! Group 3: LD/ST
        setx DATA_START,  %g4, %g3
        stx %g1, [%g3]
        .word 0x10800002
        ldx [%g3], %g4
        .word 0x10800002
        stx %g2, [%g3]
        ldx [%g3], %g4

        !! Group 4: window management
        .word 0x10800002
        save
        .word 0x10800002
        restore
        .word 0x10800002
        saved
        .word 0x10800002
        restored

        !! Group 5: control transfer covered in dcti diag
        !! Group 6: trap in delay slot
        .word 0x10800002
        taddcctv %g1, %g2, %g3
        

!! CASE 6: unconditional branch taken, anull
        set 0xdeadbeef, %g1     !! operands to use
        set 0xaaddcafe, %g2
        orcc %g0, %g0, %g0 !! clear ccr
        
        !! Group 1: integer instructions
        .word 0x30800002
        addcc %g1, %g2, %g3     !! ALU w/ ccs
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x30800002
        sllx %g1, 3, %g3        !! shft
        .word 0x30800002
        smulcc %g1, %g2, %g3    !! MUL w/ ccr and y
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x30800002
        sdivcc %g1, %g2, %g3    !! DIV w/ ccr
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x30800002
        sethi 0x54, %g4

        !! Group 2: priv/state registers
        !! Turn on privilege mode so we can write to prs
        ta T_CHANGE_PRIV
        nop               
        .word 0x30800002
        wr %g1, 0, %y        
        .word 0x30800002
        rd %y, %g3
        .word 0x30800002
        wrpr %g0, 5, %cansave        
        .word 0x30800002
        rdpr %cansave, %g3

        !! Group 3: LD/ST
        setx DATA_START,  %g4, %g3
        stx %g1, [%g3]
        .word 0x30800002
        ldx [%g3], %g4
        .word 0x30800002
        stx %g2, [%g3]
        ldx [%g3], %g4

        !! Group 4: window management
        .word 0x30800002
        save
        .word 0x30800002
        restore
        .word 0x30800002
        saved
        .word 0x30800002
        restored

        !! Group 5: control transfer covered in dcti diag
        !! Group 6: trap in delay slot
        .word 0x30800002
        taddcctv %g1, %g2, %g3
        
!! CASE 6: conditional branch taken
        set 0xdeadbeef, %g1     !! operands to use
        set 0xaaddcafe, %g2
        orcc %g0, %g0, %g0 !! clear ccr
        
        !! Group 1: integer instructions
        .word 0x22800002
        addcc %g1, %g2, %g3     !! ALU w/ ccs
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x22800002
        sllx %g1, 3, %g3        !! shft
        .word 0x22800002
        smulcc %g1, %g2, %g3    !! MUL w/ ccr and y
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x22800002
        sdivcc %g1, %g2, %g3    !! DIV w/ ccr
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        .word 0x22800002
        sethi 0x54, %g4

        !! Group 2: priv/state registers
        !! Turn on privilege mode so we can write to prs
        ta T_CHANGE_PRIV
        nop               
        .word 0x22800002
        wr %g1, 0, %y        
        .word 0x22800002
        rd %y, %g3
        .word 0x22800002
        wrpr %g0, 5, %cansave        
        .word 0x22800002
        rdpr %cansave, %g3

        !! Group 3: LD/ST
        setx DATA_START,  %g4, %g3
        stx %g1, [%g3]
        .word 0x22800002
        ldx [%g3], %g4
        .word 0x22800002
        stx %g2, [%g3]
        ldx [%g3], %g4

        !! Group 4: window management
        .word 0x22800002
        save
        .word 0x22800002
        restore
        .word 0x22800002
        saved
        .word 0x22800002
        restored

        !! Group 5: control transfer covered in dcti diag
        !! Group 6: trap in delay slot
        .word 0x22800002
        taddcctv %g1, %g2, %g3

!! CASE 7: call instruction
        set 0xdeadbeef, %g1     !! operands to use
        set 0xaaddcafe, %g2
        orcc %g0, %g0, %g0 !! clear ccr
        
        !! Group 1: integer instructions
        call dummy
        addcc %g1, %g2, %g3     !! ALU w/ ccs
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        call dummy
        sllx %g1, 3, %g3        !! shft
        call dummy
        smulcc %g1, %g2, %g3    !! MUL w/ ccr and y
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        call dummy
        sdivcc %g1, %g2, %g3    !! DIV w/ ccr
        rd %ccr, %g4
        orcc %g0, %g0, %g0 !! clear ccr
        call dummy
        sethi 0x54, %g4

        !! Group 2: priv/state registers
        !! Turn on privilege mode so we can write to prs
        ta T_CHANGE_PRIV
        nop               
        call dummy
        wr %g1, 0, %y        
        call dummy
        rd %y, %g3
        call dummy
        wrpr %g0, 5, %cansave        
        call dummy
        rdpr %cansave, %g3

        !! Group 3: LD/ST
        setx DATA_START,  %g4, %g3
        stx %g1, [%g3]
        call dummy
        ldx [%g3], %g4
        call dummy
        stx %g2, [%g3]
        ldx [%g3], %g4

        !! Group 4: window management
        call dummy_save
        save
        save    !! so restore wont trap
        call dummy_restore
        restore
dummy_restore_return:           
        call dummy
        saved
        call dummy
        restored

        !! Group 5: control transfer covered in dcti diag
        !! Group 6: trap in delay slot
        call dummy
        taddcctv %g1, %g2, %g3
        
        ba diag_pass
        nop


!! Dummy functions for testing call
dummy:  nop
        save
        or %g0, 0x27, %g7
        return  %i7+8
        nop                

dummy_save:  nop
        or %g0, 0x27, %g7
        return  %i7+8
        nop                
                      
dummy_restore:
        nop
        save
        save
        or %g0, 0x27, %g7
        ba dummy_restore_return
        restore
        
                                               
/*
 ********************************
 *      Diag PASSED             *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
good_trap:              
        ta T_GOOD_TRAP
        nop

diag_fail:
        set     0xaaddcafe,     %l0
bad_trap:               
        ta T_BAD_TRAP
        nop

                
.data

.global DATA_START

DATA_START: 
	.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
.end
