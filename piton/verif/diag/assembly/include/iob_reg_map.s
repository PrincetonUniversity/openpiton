// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_reg_map.s
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
 * Name:   iob_defines.h
 * Date:   
 *
 *
 *  Description: Definitons used in iob diags.
 *
 **********************************************************************/
        
.data
.align 64
.global iob_reg_map
iob_reg_map:

        ! tap registers
! TO DO - ctu has not been instantiated        
!       .word   0x0000009e,     0x10000000
!       .word   0x00000000,     0x00000008
!       .word   0x00000000,     0x02000000
!       .word   0x00000000,     0x00000000
        
!       .word   0x0000009e,     0x20000000
!       .word   0x00000000,     0x00000008
!       .word   0x00000000,     0x02000000
!       .word   0x1f1f1f1f,     0xffffffff
        
!       .word   0x0000009e,     0x30000000
!       .word   0x00000000,     0x00000020
!       .word   0x00000000,     0x00800000
!       .word   0x1f1f1f1f,     0xffffffff
        
!       .word   0x0000009e,     0x00000000
!       .word   0x00000000,     0x00000020
!       .word   0x00000000,     0x00800000
!       .word   0x00000000,     0x00000000
                        
        ! ctu registers
! TO DO - ctu has not been instantiated        
!        .word   0x00000096,     0x00000000
!        .word   0x00000000,     0x00000001
!        .word   0x00000000,     0x00000000
!        .word   0x000001ff,     0xf61f1f1f                
                
!        .word   0x00000096,     0x00000008
!        .word   0x00000000,     0x00000001
!        .word   0x00000000,     0x00000000
!        .word   0xe0000007,     0xfeffffff                
                
        ! jbi registers
        .word   0x00000080,     0x00000000
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000000
        .word   0x0003f0c0,     0xffc00003                
        
! TO DO - figure out why diag fails due to "jbus_monitor(jbus_tasks): AOK disabled by port 1"
!        .word   0x00000080,     0x00000008
!        .word   0x00000000,     0x00000001
!        .word   0x00000000,     0x00000000
!        .word   0x00000000,     0x7733ff0f                
        
        ! spi registers
! TO DO - figure out why diag fails due to "34204262:Info: Wrong run happen thread(0)"
!        .word   0x000000ff,     0x00010088
!        .word   0x00000000,     0x00000001
!        .word   0x00000000,     0x00000000
!        .word   0x00000000,     0x01ffffff
        
        ! dram registers
        .word   0x00000097,     0x00000000
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        
        
        .word   0x00000097,     0x00000008
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        

! TO DO - figure out why time out happens.                
!        .word   0x00000097,     0x00000010
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000007        
        
        .word   0x00000097,     0x00000018
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x00000fff        
        
        .word   0x00000097,     0x00000020
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x00001fff        
        
        .word   0x00000097,     0x00000028
        .word   0x00000000,     0x00000002
        .word   0x00000000,     0x00002000
        .word   0x00000000,     0x0001ffff        
        
! TO DO - figure out why diag fails.                
!        .word   0x00000097,     0x00000038
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00001fff        
        
        .word   0x00000097,     0x00000040
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x00000001        
        
        .word   0x00000097,     0x00000048
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000ffff        
        
        .word   0x00000097,     0x00000080
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        
        
        .word   0x00000097,     0x00000088
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        
        
        .word   0x00000097,     0x00000090
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        
        
        .word   0x00000097,     0x00000098
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        
        
        .word   0x00000097,     0x000000a0
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        
        
! TO DO - figure out why diag fails.                
!        .word   0x00000097,     0x000000a8
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x0000000f        
        
        .word   0x00000097,     0x000000b0
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        
        
        .word   0x00000097,     0x000000b8
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        
        
        .word   0x00000097,     0x000000c0
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000000f        
        
        .word   0x00000097,     0x000000c8
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x0000007f        
        
        .word   0x00000097,     0x000000d0
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x00000003        
        
        .word   0x00000097,     0x000000e0
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x00000003        
        
        .word   0x00000097,     0x000000e8
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00001000
        .word   0x00000000,     0x000000ff        
        
! TO DO - figure out why diag fails.                
!        .word   0x00000097,     0x00000108
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x00000110
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x000007ff        
        
!        .word   0x00000097,     0x00000118
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x000007ff        
        
!        .word   0x00000097,     0x00000120
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x000007ff        
        
!        .word   0x00000097,     0x00000128
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x00000130
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x00000138
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x00000140
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x000001a0
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x000001a8
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x000001b0
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000003        
        
!        .word   0x00000097,     0x000001b8
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x000001c0
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x00000208
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000000        
        
!        .word   0x00000097,     0x00000210
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000000        
        
!        .word   0x00000097,     0x00000218
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x0000000f        
        
!        .word   0x00000097,     0x00000220
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000001        
        
!        .word   0x00000097,     0x00000228
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000003,     0xffffffff        
        
!        .word   0x00000097,     0x00000230
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x000000fc        
        
!        .word   0x00000097,     0x00000280
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x0000ffff        
        
!        .word   0x00000097,     0x00000288
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x000000ff,     0xfffffff0        
        
!        .word   0x00000097,     0x00000290
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0xc000ffff        
        
!        .word   0x00000097,     0x00000298
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x0003ffff        
        
!        .word   0x00000097,     0x000002a0
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x0000000f,     0xffffffff        
        
!        .word   0x00000097,     0x00000400
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0x00000000,     0x00000000        
        
!        .word   0x00000097,     0x00000408
!        .word   0x00000000,     0x00000004
!        .word   0x00000000,     0x00001000
!        .word   0xffffffff,     0xffffffff        
        
        ! iobint registers
        .word   0x0000009f,     0x00000400
        .word   0x00000000,     0x00000020
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000000
        
        .word   0x0000009f,     0x00000500
        .word   0x00000000,     0x00000020
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000000
        
        .word   0x0000009f,     0x00000600
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000000
        
        .word   0x0000009f,     0x00000700
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000000
        
        .word   0x0000009f,     0x00000900
        .word   0x00000000,     0x00000020
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000020
        
        .word   0x0000009f,     0x00000b00
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000020
        
        ! iobman registers
        .word   0x00000098,     0x00000000
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00001f3f

        .word   0x00000098,     0x00000400
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000000

        .word   0x00000098,     0x00000408
        .word   0x00000000,     0x00000003
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000004

! TO DO - figure out why write to int disp vec register fails.
!         This is done in iob_int_disp.s.
!        .word   0x00000098,     0x00000800
!        .word   0x00000000,     0x00000001
!        .word   0x00000000,     0x00000008
!        .word   0x00000000,     0x00000000

        .word   0x00000098,     0x00000a00
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x0000003f

        .word   0x00000098,     0x00000810
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000000

        .word   0x00000098,     0x00000820
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000000

        .word   0x00000098,     0x00000828
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0xffffffff

        .word   0x00000098,     0x00000830
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000000

        .word   0x00000098,     0x00000840
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000000

! TO DO - figure out why diag fails due to "cmp_top.iop.iobdg.mondo_data1_hi: margin is not set to the default value"
!        .word   0x00000098,     0x00000850
!        .word   0x00000000,     0x00000001
!        .word   0x00000000,     0x00000008
!        .word   0x00000000,     0x00000007

        ! iob visibility control registers
        .word   0x00000098,     0x00001800
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00000004

        .word   0x00000098,     0x00001820
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x000f1f03,     0xffffff3c

        .word   0x00000098,     0x00001828
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x000f1f03,     0xffffff3c

        .word   0x00000098,     0x00001830
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x000f1f03,     0xffffff3c

        .word   0x00000098,     0x00001838
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x000f1f03,     0xffffff3c

        .word   0x00000098,     0x00001840
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0xffffffff

        .word   0x00000098,     0x00001000
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x0000000f

        ! iob debug control registers
        .word   0x00000098,     0x00002000
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x0000016f

        .word   0x00000098,     0x00002008
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x000000ff,     0xffffffff

        .word   0x00000098,     0x00002100
        .word   0x00000000,     0x00000001
        .word   0x00000000,     0x00000008
        .word   0x00000000,     0x00010077
        
        .word   0x00000098,     0x00002140
        .word   0x00000000,     0x00000004
        .word   0x00000000,     0x00000020
        .word   0x00003fff,     0xffffffff
        
! TO DO - figure out why diag fails due to "ERROR: cmp_top.iop.jbi.u_dbg.u_dbg_buf.u_dbg_lo_buf0: conflict between read: 0 and write: 0 pointers"
!       .word   0x00000098,     0x00002148
!       .word   0x00000000,     0x00000004
!       .word   0x00000000,     0x00000020
!       .word   0x00000fff,     0xffffffff
        
!       .word   0x00000098,     0x00002150
!       .word   0x00000000,     0x00000004
!       .word   0x00000000,     0x00000020
!       .word   0x00000000,     0x000001ff
        
        ! end of map
        .word   0x01234567,     0x89abcdef
