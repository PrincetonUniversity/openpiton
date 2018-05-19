// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_subs.s
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
/***********************************************************************
 * Name:   iob_subs.s
 * Date:   
 *
 *
 *  Description: Subroutines used in iob diags.
 *
 **********************************************************************/
        
.text
.align 64
        
! Write and then read register.        
sub_rw_reg:
        mov     %i5,    %l5
        
sub_rw_reg_0:
        and     0x1,    %l5,    %l6
        srl     %l5,    0x1,    %l5
        cmp     %g0,    %l6
        bne     sub_rw_reg_5
        nop
        setx    0x0000000000000000,     %l0,    %l1     ! Write value.
        and     %l1,    %i4,    %l4     ! Write masked value.
        stx     %l4,    [%i0]
        ldx     [%i0],  %l0
        and     %l0,    %i3,    %l2     ! Observed value anded with read mask.
        and     %l4,    %i3,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   subs_diag_fail
        nop
        
sub_rw_reg_5:
        and     0x1,    %l5,    %l6
        srl     %l5,    0x1,    %l5
        cmp     %g0,    %l6
        bne     sub_rw_reg_a
        nop
        setx    0x5555555555555555,     %l0,    %l1     ! Write value.
        and     %l1,    %i4,    %l4     ! Write masked value.
        stx     %l4,    [%i0]
        ldx     [%i0],  %l0
        and     %l0,    %i3,    %l2     ! Observed value anded with read mask.
        and     %l4,    %i3,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   subs_diag_fail
        nop
        
sub_rw_reg_a:
        and     0x1,    %l5,    %l6
        srl     %l5,    0x1,    %l5
        cmp     %g0,    %l6
        bne     sub_rw_reg_f
        nop
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write value.
        and     %l1,    %i4,    %l4     ! Write masked value.
        stx     %l4,    [%i0]
        ldx     [%i0],  %l0
        and     %l0,    %i3,    %l2     ! Observed value anded with read mask.
        and     %l4,    %i3,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   subs_diag_fail
        nop
        
sub_rw_reg_f:
        and     0x1,    %l5,    %l6
        srl     %l5,    0x1,    %l5
        cmp     %g0,    %l6
        bne     sub_rw_reg_123
        nop
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write value.
        and     %l1,    %i4,    %l4     ! Write masked value.
        stx     %l4,    [%i0]
        ldx     [%i0],  %l0
        and     %l0,    %i3,    %l2     ! Observed value anded with read mask.
        and     %l4,    %i3,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   subs_diag_fail
        nop
        
sub_rw_reg_123:
        and     0x1,    %l5,    %l6
        srl     %l5,    0x1,    %l5
        cmp     %g0,    %l6
        bne     sub_rw_reg_0fe
        nop
        setx    0x123456789abcdef0,     %l0,    %l1     ! Write value.
        and     %l1,    %i4,    %l4     ! Write masked value.
        stx     %l4,    [%i0]
        ldx     [%i0],  %l0
        and     %l0,    %i3,    %l2     ! Observed value anded with read mask.
        and     %l4,    %i3,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   subs_diag_fail
        nop
        
sub_rw_reg_0fe:
        and     0x1,    %l5,    %l6
        srl     %l5,    0x1,    %l5
        cmp     %g0,    %l6
        bne     sub_rw_reg_cnt
        nop
        setx    0x0fedcba987654321,     %l0,    %l1     ! Write value.
        and     %l1,    %i4,    %l4     ! Write masked value.
        stx     %l4,    [%i0]
        ldx     [%i0],  %l0
        and     %l0,    %i3,    %l2     ! Observed value anded with read mask.
        and     %l4,    %i3,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   subs_diag_fail
        nop
        
sub_rw_reg_cnt:
        add     %i0,    %i2,    %i0
        dec     %i1
        cmp     %i1,    %g0
        bne     %xcc,   sub_rw_reg
        nop
        
        ret
        restore
        
! Write and then read non existent register.        
sub_rw_inv_reg:
        mov     0x0,    %o0
        mov     0x0,    %o1
        ldx     [%i0],  %l1     ! Read from invalid addr.
        
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %o0,    %l0
        bne     subs_diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x32,   %l0
        cmp     %o1,    %l0
        bne     subs_diag_fail
        nop

        mov     0x0,    %o0
        mov     0x0,    %o1
        stx     %l1,    [%i0]   ! Write to invalid addr.
        
        ! Check if data access error trap happened. It should not.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %o0,    %l0
        be      subs_diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x32,   %l0
        cmp     %o1,    %l0
        be      subs_diag_fail
        nop
        
        ret
        restore

! Initialize the jbi and sjm.
sub_init_jbi:
        setx    0x03fb303e00000001,     %g1,    %g2
        setx    0x8000000000,   %g1,    %g3
        stx     %g2,    [%g3]
        
        setx    0x000000007033fe0f,     %g1,    %g2
        setx    0x8000000008,   %g1,    %g3
        stx     %g2,    [%g3]
        
        setx    0x0000003fc0000000,     %g1,    %g2
        setx    0x80000100a0,   %g1,    %g3
        stx     %g2,    [%g3]
        
        setx    0x00000000fe0003ff,     %g1,    %g2
        setx    0x8000004100,   %g1,    %g3
        stx     %g2,    [%g3]

        ! IOSYNC cycles to start sjm_4
        setx    0xdeadbeefdeadbeef,     %g1,    %g2
        setx    0xcf00beef00,   %g1,    %g3
        stx     %g2,    [%g3]
        
        ! IOSYNC cycles to start sjm_5
!        setx    0xdeadbeefdeadbeef,     %g1,    %g2
!        setx    0xef00beef00,   %g1,    %g3
!        stx     %g2,    [%g3]
        
        ret
        restore

! Initialize the jbi.
sub_init_jbi_no_sjm:
        setx    0x03fb303e00000001,     %g1,    %g2
        setx    0x8000000000,   %g1,    %g3
        stx     %g2,    [%g3]
        
        setx    0x000000007033fe0f,     %g1,    %g2
        setx    0x8000000008,   %g1,    %g3
        stx     %g2,    [%g3]
        
        setx    0x0000003fc0000000,     %g1,    %g2
        setx    0x80000100a0,   %g1,    %g3
        stx     %g2,    [%g3]
        
        setx    0x00000000fe0003ff,     %g1,    %g2
        setx    0x8000004100,   %g1,    %g3
        stx     %g2,    [%g3]
        
        ret
        restore

! Generate iob debug data.
sub_gen_iob_dbg_data:        
        mov     %i0,    %l3
        
sub_sel_iob_dec_hdr:
        and     0x1,    %l3,    %l4
        srl     %l3,    0x1,    %l3
        cmp     %g0,    %l4
        bne     sub_sel_iob_jbus_lo
        nop

        setx    0x0000009800002000,     %l0,    %l2     ! Read from db enet control register address.
        ldx     [%l2],  %l7
        setx    0xfffffffffffffeff,     %l0,    %l1
        and     %l7, %l1, %l1
        stx     %l1,    [%l2]				! Disable db enet control register.

        setx    0x0000009800002100,     %l0,    %l2     ! Read from dbg portb
        ldx     [%l2],  %l6
        setx    0xfffffffffffeffff,     %l0,    %l1
        and     %l6, %l1, %l1
        stx     %l1,    [%l2]                           ! Disable dbg portb.

        setx    0x0000000000000000,     %l0,    %l1     ! Write to iob vis select control register.
        setx    0x0000009800001000,     %l0,    %l2     ! Set iob vis select control register address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1

        setx    0x0000009800002000,     %l0,    %l2     ! Write to db enet control register address.
        stx     %l7,    [%l2]				! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        setx    0x0000009800002100,     %l0,    %l2     ! Write to dbg portb register address.
        stx     %l6,    [%l2]                           ! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        ! ld/st to IOB registers.
        setx    0x0000009800000000,     %l0,    %o0     ! Register address.
        setx    0x0000000000000004,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000008,     %l0,    %o2     ! Step.
        setx    0x0000000000001f3f,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
                
sub_sel_iob_jbus_lo:
        and     0x1,    %l3,    %l4
        srl     %l3,    0x1,    %l3
        cmp     %g0,    %l4
        bne     sub_sel_iob_jbus_hi
        nop

        setx    0x0000009800002000,     %l0,    %l2     ! Read from db enet control register address.
        ldx     [%l2],  %l7
        setx    0xfffffffffffffeff,     %l0,    %l1
        and     %l7, %l1, %l1
        stx     %l1,    [%l2]				! Disable db enet control register.

        setx    0x0000009800002100,     %l0,    %l2     ! Read from dbg portb
        ldx     [%l2],  %l6
        setx    0xfffffffffffeffff,     %l0,    %l1
        and     %l6, %l1, %l1
        stx     %l1,    [%l2]                           ! Disable dbg portb.

 
        setx    0x0000000000000001,     %l0,    %l1     ! Write to iob vis select control register.
        setx    0x0000009800001000,     %l0,    %l2     ! Set iob vis select control register address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        setx    0x0000009800002000,     %l0,    %l2     ! Write to db enet control register address.
        stx     %l7,    [%l2]				! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        setx    0x0000009800002100,     %l0,    %l2     ! Write to dbg portb register address.
        stx     %l6,    [%l2]                           ! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        
        ! ld/st to JBI.
        setx    0x000000c000000008,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0xffffffffffffffff,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
                
sub_sel_iob_jbus_hi:
        and     0x1,    %l3,    %l4
        srl     %l3,    0x1,    %l3
        cmp     %g0,    %l4
        bne     sub_sel_iob_jbus_ack
        nop

        setx    0x0000009800002000,     %l0,    %l2     ! Read from db enet control register address.
        ldx     [%l2],  %l7
        setx    0xfffffffffffffeff,     %l0,    %l1
        and     %l7, %l1, %l1
        stx     %l1,    [%l2]				! Disable db enet control register.

        setx    0x0000009800002100,     %l0,    %l2     ! Read from dbg portb
        ldx     [%l2],  %l6
        setx    0xfffffffffffeffff,     %l0,    %l1
        and     %l6, %l1, %l1
        stx     %l1,    [%l2]                           ! Disable dbg portb.

 
        setx    0x0000000000000002,     %l0,    %l1     ! Write to iob vis select control register.
        setx    0x0000009800001000,     %l0,    %l2     ! Set iob vis select control register address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        setx    0x0000009800002000,     %l0,    %l2     ! Write to db enet control register address.
        stx     %l7,    [%l2]				! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        setx    0x0000009800002100,     %l0,    %l2     ! Write to dbg portb register address.
        stx     %l6,    [%l2]                           ! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        ! ld/st to JBI.
        setx    0x000000c000000008,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0xffffffffffffffff,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
                
sub_sel_iob_jbus_ack:
        and     0x1,    %l3,    %l4
        srl     %l3,    0x1,    %l3
        cmp     %g0,    %l4
        bne     sub_sel_iob_tap_clk
        nop

        setx    0x0000009800002000,     %l0,    %l2     ! Read from db enet control register address.
        ldx     [%l2],  %l7
        setx    0xfffffffffffffeff,     %l0,    %l1
        and     %l7, %l1, %l1
        stx     %l1,    [%l2]				! Disable db enet control register.

        setx    0x0000009800002100,     %l0,    %l2     ! Read from dbg portb
        ldx     [%l2],  %l6
        setx    0xfffffffffffeffff,     %l0,    %l1
        and     %l6, %l1, %l1
        stx     %l1,    [%l2]                           ! Disable dbg portb.

 
        setx    0x0000000000000003,     %l0,    %l1     ! Write to iob vis select control register.
        setx    0x0000009800001000,     %l0,    %l2     ! Set iob vis select control register address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        setx    0x0000009800002000,     %l0,    %l2     ! Write to db enet control register address.
        stx     %l7,    [%l2]				! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        setx    0x0000009800002100,     %l0,    %l2     ! Write to dbg portb register address.
        stx     %l6,    [%l2]                           ! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        ! ld/st to jbi space.
        setx    0x000000c000000008,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0xffffffffffffffff,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
                                
sub_sel_iob_tap_clk:
        and     0x1,    %l3,    %l4
        srl     %l3,    0x1,    %l3
        cmp     %g0,    %l4
        bne     sub_sel_iob_dram_ssi
        nop

        setx    0x0000009800002000,     %l0,    %l2     ! Read from db enet control register address.
        ldx     [%l2],  %l7
        setx    0xfffffffffffffeff,     %l0,    %l1
        and     %l7, %l1, %l1
        stx     %l1,    [%l2]				! Disable db enet control register.

        setx    0x0000009800002100,     %l0,    %l2     ! Read from dbg portb
        ldx     [%l2],  %l6
        setx    0xfffffffffffeffff,     %l0,    %l1
        and     %l6, %l1, %l1
        stx     %l1,    [%l2]                           ! Disable dbg portb.

 
        setx    0x0000000000000006,     %l0,    %l1     ! Write to iob vis select control register.
        setx    0x0000009800001000,     %l0,    %l2     ! Set iob vis select control register address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        setx    0x0000009800002000,     %l0,    %l2     ! Write to db enet control register address.
        stx     %l7,    [%l2]				! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        setx    0x0000009800002100,     %l0,    %l2     ! Write to dbg portb register address.
        stx     %l6,    [%l2]                           ! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        ! ld/st to ctu space.
        setx    0x0000009600000038,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0x3f003f003f003f00,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        
sub_sel_iob_dram_ssi:
        and     0x1,    %l3,    %l4
        srl     %l3,    0x1,    %l3
        cmp     %g0,    %l4
        bne     sub_gen_iob_dbg_data_ret
        nop

        setx    0x0000009800002000,     %l0,    %l2     ! Read from db enet control register address.
        ldx     [%l2],  %l7
        setx    0xfffffffffffffeff,     %l0,    %l1
        and     %l7, %l1, %l1
        stx     %l1,    [%l2]				! Disable db enet control register.

        setx    0x0000009800002100,     %l0,    %l2     ! Read from dbg portb
        ldx     [%l2],  %l6
        setx    0xfffffffffffeffff,     %l0,    %l1
        and     %l6, %l1, %l1
        stx     %l1,    [%l2]                           ! Disable dbg portb.

 
        setx    0x0000000000000007,     %l0,    %l1     ! Write to iob vis select control register.
        setx    0x0000009800001000,     %l0,    %l2     ! Set iob vis select control register address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        setx    0x0000009800002000,     %l0,    %l2     ! Write to db enet control register address.
        stx     %l7,    [%l2]				! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        setx    0x0000009800002100,     %l0,    %l2     ! Write to dbg portb register address.
        stx     %l6,    [%l2]                           ! with value read earlier
        membar  #Sync
        ldx     [%l2],  %l1
        nop

        ! ld/st to ssi space.
        setx    0x000000fff0002000,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0xffffffffffffffff,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
                
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        
        ! ld/st to dram space.
        setx    0x0000009700000000,     %l0,    %o0     ! Register address.
        setx    0x0000000000000004,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000001000,     %l0,    %o2     ! Step.
        setx    0x000000000000000f,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save
        nop
        
sub_gen_iob_dbg_data_ret:
        ret
        restore

! Initialize the jbi and sjm.
sub_init_dbg_portb:
        setx    0x000020000000fff0,     %g3,    %g1     ! Write to debug mask a hi register.
        setx    0x0000009800002140,     %g3,    %g2     ! Set debug mask a hi register address.
        stx     %g1,    [%g2]
        
        setx    0x000020000000fff0,     %g3,    %g1     ! Write to debug mask b hi register.
        setx    0x0000009800002160,     %g3,    %g2     ! Set debug mask b hi register address.
        stx     %g1,    [%g2]
        
        setx    0x000020000000fff0,     %g3,    %g1     ! Write to debug mask a lo register.
        setx    0x0000009800002180,     %g3,    %g2     ! Set debug mask a lo register address.
        stx     %g1,    [%g2]
        
        setx    0x000020000000fff0,     %g3,    %g1     ! Write to debug mask b lo register.
        setx    0x00000098000021a0,     %g3,    %g2     ! Set debug mask b lo register address.
        stx     %g1,    [%g2]
        
        setx    0x0000000000003000,     %g3,    %g1     ! Write to debug compare a hi register.
        setx    0x0000009800002148,     %g3,    %g2     ! Set debug compare a hi register address.
        !or      %g3,    %g1,    %g4
        stx     %g1,    [%g2]
        
        setx    0x0000000000003000,     %g3,    %g1     ! Write to debug compare b hi register.
        setx    0x0000009800002168,     %g3,    %g2     ! Set debug compare b hi register address.
        !or      %g3,    %g1,    %g4
        stx     %g1,    [%g2]
        
        setx    0x0000000000003000,     %g3,    %g1     ! Write to debug compare a lo register.
        setx    0x0000009800002188,     %g3,    %g2     ! Set debug compare a lo register address.
        !or      %g3,    %g1,    %g4
        stx     %g1,    [%g2]
        
        setx    0x0000000000003000,     %g3,    %g1     ! Write to debug compare b lo register.
        setx    0x00000098000021a8,     %g3,    %g2     ! Set debug compare b lo register address.
        !or      %g3,    %g1,    %g4
        stx     %g1,    [%g2]
        
        setx    0x0000000000000000,     %g3,    %g1     ! Write to debug a hi count register.
        setx    0x0000009800002150,     %g3,    %g2     ! Set debug a hi register address.
        stx     %g1,    [%g2]
        
        setx    0x0000000000000000,     %g3,    %g1     ! Write to debug b hi count register.
        setx    0x0000009800002170,     %g3,    %g2     ! Set debug b hi register address.
        stx     %g1,    [%g2]
        
        setx    0x0000000000000000,     %g3,    %g1     ! Write to debug a lo count register.
        setx    0x0000009800002190,     %g3,    %g2     ! Set debug a lo register address.
        stx     %g1,    [%g2]
        
        setx    0x0000000000000000,     %g3,    %g1     ! Write to debug b lo count register.
        setx    0x00000098000021b0,     %g3,    %g2     ! Set debug a lo register address.
        stx     %g1,    [%g2]
        
        ret
        restore
        
subs_diag_fail:
        ta      T_BAD_TRAP
        nop

