// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: 4thl2flush.s
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
/*************************************************/
/*SECTION .L2_FLUSH TEXT_VA=0x7fff800000, DATA_VA=0x7fffc00000

attr_text {
    Name = .L2_FLUSH,
    hypervisor,
}
attr_data {
    Name = .L2_FLUSH,
    hypervisor,
}*/

.text
#include "state_checkpoint.s"

#ifndef TESTER_DUMP_DIRTY_L2
    done
    nop
#endif

l2_dump:
    sync_threads
thread_jump:
    th_fork(run_th)
    nop
    ba	   bad_trap
    nop


/* This code only supports C0T0, C0T1, C0T2, and C0T3 flushing     */
/* cache lines belonging to L2 banks 0, 1, 2, and 3, respectively. */

run_th_0:
    /* %l0 must contain thread_id, to be used as bank number */
    mov   0, %l0
    ba    flush_l2
    nop

run_th_1:
    /* %l0 must contain thread_id, to be used as bank number */
    mov   1, %l0
    ba    flush_l2
    nop

run_th_2:
    /* %l0 must contain thread_id, to be used as bank number */
    mov   2, %l0
    ba    flush_l2
    nop

run_th_3:
    /* %l0 must contain thread_id, to be used as bank number */
    mov   3, %l0
    ba    flush_l2
    nop


/*************************************************/
/* FLUSH L2 CACHE LINES THAT ARE VALID AND DIRTY */

flush_l2:
    /* %l0 must contain thread_id, to be used as bank number, N */
    sll   %l0, 6, %l7

    /* switch the L2 bank N to direct mapped mode */
    setx  0xa900000000, %l6, %l1
    add   %l1, %l7, %l0
    mov   0x2, %l6
    stx   %l6, [%l0]

    /* set address for accessing the valid/dirty bits of L2 bank N */
    setx  0xa600400000, %l6, %l1
    add   %l1, %l7, %l0

    /* set address for 4M-aligned, 3M-large scratch data region */
    setx  scratch, %l6, %l1

    /* initialize cache index loop: for(l2=0; */
    mov   0, %l2

    index_loop: 
        sub   %l2, 1024, %l7           /* l2<1024; */
        brz   %l7, index_loop_exit
        nop

        /* compute (valid & dirty) for each cache set */
        sll   %l2, 8, %l7
        add   %l0, %l7, %l7
        ldx   [%l7], %l6       /* valid/dirty load: {v_par, d_par, v[11:0], d[11:0]} */
        srl   %l6, 12, %l5
        and   %l6, %l5, %l6
        and   %l6, 0xfff, %l6  /* %l6 = (valid & dirty) */

        /* if all cache ways are clean, bypass way loop */
        brz   %l6, way_loop_exit
        nop
        
        /* else form addr[17:0] */
        set   0x3ffff, %l5
        and   %l7, %l5, %l7            

        /* initialize cache way loop variable: for(l3=0; */
        mov   0, %l3
    
        way_loop:
            sub   %l3, 12, %l5             /* l3<12; */
            brz   %l5, way_loop_exit
            nop

            /* check if L2 cache line is valid and dirty */
            and   %l6, 0x1, %l5
            brz   %l5, line_flushed
            nop
            /* issue blkinitst to displace L2 cache line if it is valid and dirty */
            sll   %l3, 18, %l5             /* way << 18 */
            add   %l7, %l5, %l5            /* form addr[21:0] */
            add   %l5, %l1, %l5            /* form full addr */
            /* blkinitst has addr[5:0] = 0 and will miss L2, therefore causing */
            /* dummy read request to DRAM, which eliminates DRAM read latency  */
            stxa  %g0, [%l5] ASI_BLK_INIT_ST_QUAD_LDD_P
            
        line_flushed:
            srl   %l6, 1, %l6
            /* if remaining cache ways are clean, exit way loop */
            brz   %l6, way_loop_exit
            nop
        
            add   %l3, 1, %l3              /* l3++) */

            ba    way_loop
            nop
    
        way_loop_exit:
            add   %l2, 1, %l2              /* l2++) */

        ba    index_loop
        nop
    
    index_loop_exit:

    done
    nop

/*************************************************/

.data
.global scratch

/* this section of data must be 4MB aligned */
scratch:

/* 1M of data */
    .word 0x00000000
.align 1048576

/* 1M of data */
    .word 0x00000000
.align 1048576

/* 1M of data */
    .word 0x00000000
.align 1048576




/*
/############################################/
/# FLUSH ALL L2 CACHE LINES, CLEAN OR DIRTY #/

flush_l2:
    ta    T_CHANGE_HPRIV
    nop

    /# %l0 must contain thread_id, to be used as bank #/
    sll   %l0, 6, %l7

    /# switch to direct mapped mode #/
    setx  0xa900000000, %l6, %l0
    add   %l0, %l7, %l0
    mov   0x2, %l6
    stx   %l6, [%l0]

    /# set address for 3M scratch data region #/
    setx  scratch, %l6, %l0
    add   %l0, %l7, %l0  /# scratch + addr[7:6] #/

    /# initialize index loop: for(l2=0; #/
    mov   0, %l2

    index_loop: 
        sub   %l2, 1024, %l7           /# l2<1024; #/
        brz   %l7, index_loop_exit
        nop

        sll   %l2, 8, %l7
        add   %l0, %l7, %l1  /# scratch + addr[17:6] #/

        /# initialize way loop variable: for(l3=0; #/
        mov   0, %l3
    
        way_loop:
            sub   %l3, 12, %l7             /# l3<12; #/
            brz   %l7, way_loop_exit
            nop

            sll   %l3, 18, %l7             /# way << 18 #/
            add   %l1, %l7, %l7            /# scratch + addr[21:0] #/
            /# blkinitst has addr[5:0] = 0 and will miss L2, therefore causing #/
            /# dummy read request to DRAM, which eliminates DRAM read latency  #/
            stxa  %g0, [%l7] ASI_BLK_INIT_ST_QUAD_LDD_P
            
            add   %l3, 1, %l3              /# l3++) #/

            ba    way_loop
            nop
    
        way_loop_exit:
            add   %l2, 1, %l2              /# l2++) #/

        ba    index_loop
        nop
    
    index_loop_exit:

    ta    T_CHANGE_NONHPRIV
    nop
    ba    diag_pass
    nop

/#################################################/
*/
