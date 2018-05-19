// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: DC_ASI-46-47_test_1.s
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
#define  THREAD_COUNT 4
#include "boot.s"

!
!       Test direct reading and writing of the D$ tags & data via ASIs 0047 & 0x46
!
#define  LSU_CONTROL_REG_ASI  0x45
#define  DCACHE_DATA_REG_ASI  0x46
!
!
!               Address Format for stores
!               63:21   -res 0
!               20:13   PErr ctrl, must be 0's
!               12:11   way
!               10:04   line in set     
!                 03    64b word select
!               02:00   -res 0
!
!                       word range:     0x07f0
!                       Loop range:     0x0800  (allows for line 0)
!                       decr amount:    0x0010   do two data stores per line  
!
!       
!               Address Format for Loads
!                   63:39   -res 0
!                   38:11   PA must match a valid tag in the D$
!               10:04   line in set     
!                 03    64b word select
!               02:00   -res 0              
!
!       
!               Thus the tags must first be written with known PA values
!               only then can the data values be reterived and checked
!       
!                       
!                   23 "vbl"  bits in the tag:   bits 38:20                          
!               
!                   333 3333 3322 2222 2222 1111 1111 1100 0000 0000
!                   876 5432 1098 7654 3210 9876 5432 1098 7654 3210
!                                           cccc cccw wccc cccc n000
!                                           
!                   100 0000 0000 0000 0001 ---- ---0 0---              Tag Way 0 fixed bits
!               hex   4    0    0    0    1    0    0    0
!
!                   000 1001 0000 0000 0010 ---- ---0 1---              Tag Way 1 fixed bits
!               hex   0    9    0    0    2    0    0    8
!
!                   000 0000 1010 0000 0100 ---- ---1 0---              Tag Way 2 fixed bits
!               hex   0    0    a    0    4    0    1    0
!
!                   000 0000 0000 1011 1000 ---- ---1 1---              Tag Way 3 fixed bits
!               hex   0    0    0    b    8    0    1    8
!
!
!                   Where ccccccc is the 7 bit loop counter value and ww is the way bits and 
!                       n is the DW (0 or 1) 
!
!
!               NOTE: All 64 data bit's are useable
!
!               Data format
!                  63:60        1101
!                  59:56        1100
!                  55:52        1011
!                  51:48        1010
!                  47:44        1001
!                  43:40        1000
!                  39:36        0111
!                  35:32        0110
!                  31:28        0101
!                  27:24        0100
!                  23:20        0011
!                  19:16        0010
!                  15:12        0001
!                  12:00        wwcc cccc c00n  n is DW 0 or 1
!
!
!               this is:  0xDCBA987654321--- where --- is wwcc cccc c00n
!
!
#define  DCACHE_TAG_REG_ASI  0x47
!
!
!               Address Format
!                   63:13   -res 0
!                   12:11   way
!               10:04   line in set     
!               03:00   -res 0              
!
!
!               Tag data format
!
!                  22 2222 2222 1111 1111 1100 0000 0000
!                  98 7654 3210 9876 5432 1098 7654 3210
!                                           cc cccc cww1                bit 0 is the valid bit
!                                           
!                  01 0000 0000 0000 0000 01-- ---- -001                Tag Way 0 fixed bits
!             hex   1    0    0    0    0    4    0    1
!
!                  00 0010 0100 0000 0000 10-- ---- -011                Tag Way 1 fixed bits
!             hex   0    2    4    0    0    8    0    3
!
!                  00 0000 0010 1000 0001 00-- ---- -101                Tag Way 2 fixed bits
!             hex   0    0    2    8    0    0    0    5
!
!                  00 0000 0000 0010 1110 00-- ---- -111                Tag Way 3 fixed bits
!             hex   0    0    0    2    e    0    0    7
!
!
!                   Where ccccccc is the 7 bit loop counter value and ww is the way bits 
!
!
!
!
!
!-----------------------------------------------------------------------------
!
!
!   First pass values written for tags
!                          00000000000fe7f0   index value: cccc cccw wccc cccc
!            address       data       ----
!   00000000000007f0  =>   00000000100007f9   Way 0
!   0000000000000ff0  =>   0000000002400bfb   Way 1
!   00000000000017f0  =>   00000000002803fd   Way 2
!   0000000000001ff0  =>   000000000002e3ff   Way 3
!   
!
!   First pass values written for data
!
!            address       data       
!   00000000000007f0  =>   dcba9876543213f8   DW 0, Way 0
!   0000000000000ff0  =>   dcba9876543217f8   DW 0, Way 1
!   00000000000017f0  =>   dcba987654321bf8   DW 0, Way 2
!   0000000000001ff0  =>   dcba987654321ff8   DW 0, Way 3
!
!   00000000000007f8  =>   dcba9876543213f9   DW 1, Way 0
!   0000000000000ff8  =>   dcba9876543217f9   DW 1, Way 1
!   00000000000017f8  =>   dcba987654321bf9   DW 1, Way 2
!   0000000000001ff8  =>   dcba987654321ff9   DW 1, Way 3
!    
!


    .text
    .global main

    main:                   !  test enters here from boot in user mode
	
th_fork(th_main)
	
th_main_1:
        setx active_thread, %l1, %o5     !  the active_thread code needs to be non-cachable
        jmpl    %o5, %o7
        nop

th_main_0:
        ta      T_GOOD_TRAP
        nop

th_main_2:
        ta      T_GOOD_TRAP
        nop


th_main_3:
        ta      T_GOOD_TRAP
        nop





    SECTION .ACTIVE_THREAD_SEC TEXT_VA=0x0000000040004000
    attr_text {
            Name = .ACTIVE_THREAD_SEC,
            VA= 0x0000000040004000,
            PA= ra2pa(0x0000000040004000,0),
            RA= 0x0000000040004000,
            part_0_i_ctx_nonzero_ps0_tsb,
            part_0_d_ctx_nonzero_ps0_tsb,
            TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
            TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
            TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
            }
     attr_text {
            Name = .ACTIVE_THREAD_SEC,
            hypervisor
            }

    .text
    .global active_thread

    active_thread:          ! This is the thread doing the writing of the D$
            ta      T_CHANGE_HPRIV          ! enter Hyper mode

            add     %g0,3,%g2               ! D$ + I$ enable bits
            ldxa    [%g0]LSU_CONTROL_REG_ASI,%g1
            or      %g2,%g1,%g1
            xor     %g2,%g1,%g1             ! insure I$ & D$ are disabled
            stxa    %g1,[%g0]LSU_CONTROL_REG_ASI

            setx    0x00000800,%g1,%l0      ! load loop counter
        
            setx    0x10000401,%g1,%i0      ! make way 0 tag data fixed bits

            setx    0x02400803,%g1,%i1      ! make way 1 tag data fixed bits

            setx    0x00280005,%g1,%i2      ! make way 2 tag data fixed bits

            setx    0x0002e007,%g1,%i3      ! make way 3 tag data fixed bits

            setx    0xdcba9876,%g1,%g6
            sllx    %g6,32,%g6
            setx    0x54321000,%g1,%g7  
            or      %g6,%g7,%g7             ! make the data high order bits


    Write_Loop_start:
    !       Note: Loop counter value selects D$ line in the line

            ! Make D$ tag address and data values for this line
            sub     %l0,16,%g5              ! make cccccc value                    
            srl     %g5,1,%g6               ! adjust ccc cccc 0000 to cc cccc c000

            or      %g5,%g0,%l4             ! address for way 0
            add     %l4,0x800,%l5           ! address for way 1 has bits 12:11 = 01
            add     %l5,0x800,%l6           ! address for way 2 has bits 12:11 = 10
            add     %l6,0x800,%l7           ! address for way 3 has bits 12:11 = 11
        
            or      %g6,%i0,%o4             ! make tag data value for way 0
            or      %g6,%i1,%o5             ! make tag data value for way 1
            or      %g6,%i2,%o6             ! make tag data value for way 2
            or      %g6,%i3,%o7             ! make tag data value for way 3

            ! Now write the D$ TAGS for this line 
    Write_tags: 
            stxa    %o4,[%l4]DCACHE_TAG_REG_ASI         ! write to way 0
            stxa    %o5,[%l5]DCACHE_TAG_REG_ASI         ! write to way 1
            stxa    %o6,[%l6]DCACHE_TAG_REG_ASI         ! write to way 2
            stxa    %o7,[%l7]DCACHE_TAG_REG_ASI         ! write to way 3

            ! Now build D$ data table data,  reuse the addresses
            srl     %l4,1,%o4               ! adjust w wccc cccc 0000 to wwcc cccc c000
            or      %o4,%g7,%o4             ! make way 0 DW 0 data 
            srl     %l5,1,%o5
            or      %o5,%g7,%o5             ! make way 1 DW 0 data                                
            srl     %l6,1,%o6
            or      %o6,%g7,%o6             ! make way 2 DW 0 data                 
            srl     %l7,1,%o7
            or      %o7,%g7,%o7             ! make way 3 DW 0 data         

            ! Now write the D$ data table DW 0s for this line
    Write_data0:        
            stxa    %o4,[%l4]DCACHE_DATA_REG_ASI         ! write to way 0
            stxa    %o5,[%l5]DCACHE_DATA_REG_ASI         ! write to way 1
            stxa    %o6,[%l6]DCACHE_DATA_REG_ASI         ! write to way 2
            stxa    %o7,[%l7]DCACHE_DATA_REG_ASI         ! write to way 3

            ! Adjust addresses and data for writing DW 1s
            add     %l4,8,%l4               ! address word 1
            add     %l5,8,%l5               
            add     %l6,8,%l6               
            add     %l7,8,%l7               

            add     %o4,1,%o4               ! word 1 data
            add     %o5,1,%o5              
            add     %o6,1,%o6              
            add     %o7,1,%o7              

            ! Now write the D$ data table DW 1s for this line 
    Write_data1:
            stxa    %o4,[%l4]DCACHE_DATA_REG_ASI         ! write to way 0
            stxa    %o5,[%l5]DCACHE_DATA_REG_ASI         ! write to way 1
            stxa    %o6,[%l6]DCACHE_DATA_REG_ASI         ! write to way 2
            stxa    %o7,[%l7]DCACHE_DATA_REG_ASI         ! write to way 3

        

            subcc   %l0,16,%l0               ! decr adjusted loop counter by 1
            bnz     Write_Loop_start
            nop

    !----------------------------------------------------------------
    !
    ! cache now written with a unique pattern in all entries
    ! so, read it back out and check the values

        
            setx    0x00000800,%g1,%l0      ! load loop counter

            setx    tags_result_area,  %g1, %g3
            setx    data_results_area, %g1, %g4

            xor     %l1,%l1,%l1             ! clear error counter
        
            setx    0x3fffffff,%g1,%l2      ! clear mask for tag data (get rid of parity)          
            
        
    Read_Loop_start:

            ! Remake D$ tag address and data values for this line
            sub     %l0,16,%g5              ! make cccccc value                    
            srl     %g5,1,%g6               ! adjust ccc cccc 0000 to cc cccc c000

            or      %g5,%g0,%l4             ! address for way 0
            add     %l4,0x800,%l5           ! address for way 1 has bits 12:11 = 01
            add     %l5,0x800,%l6           ! address for way 2 has bits 12:11 = 10
            add     %l6,0x800,%l7           ! address for way 3 has bits 12:11 = 11
        
            or      %g6,%i0,%o4             ! make tag data value for way 0
            or      %g6,%i1,%o5             ! make tag data value for way 1
            or      %g6,%i2,%o6             ! make tag data value for way 2
            or      %g6,%i3,%o7             ! make tag data value for way 3

do_tag_read:	
            ! Now read the D$ tag values
            ldxa    [%l4]DCACHE_TAG_REG_ASI,%o0           
            ldxa    [%l5]DCACHE_TAG_REG_ASI,%o1           
            ldxa    [%l6]DCACHE_TAG_REG_ASI,%o2           
            ldxa    [%l7]DCACHE_TAG_REG_ASI,%o3           

            ! Check results
            and     %o0,%l2,%o0             ! clear parity bit
            and     %o1,%l2,%o1             ! clear parity bit
            and     %o2,%l2,%o2             ! clear parity bit
            and     %o3,%l2,%o3             ! clear parity bit

        
            xor     %o0,%o4,%o4             ! check tag for way 0
            xor     %o1,%o5,%o5             ! check tag for way 1
            xor     %o2,%o6,%o6             ! check tag for way 2
            xor     %o3,%o7,%o7             ! check tag for way 3
        
            or      %o4,%o5,%o5
            or      %o6,%o7,%o7
            orcc    %o6,%o7,%o7
            bz      Tags_ok
            nop

            !  bad tags so save them off and don't bother to check the data
    Tags_bad:   
            add     %g3,%l0,%l3             ! address of QW to store data compare results in
            stw     %o0,[%l3 + 0]
            stw     %o1,[%l3 + 4]
            stw     %o2,[%l3 + 8]
            stw     %o3,[%l3 + 12]
            add     %l1,1,%l1               ! incr error count
            b       Line_ok                 ! skip data check section
            nop

            !  Tags are ok now check the associated data
    Tags_ok:
            b       Line_ok                 ! skip data check section
            nop

!!!!**********   skip data check even if line ok for now


        
            !  convert the tag data into D$ lookup tags
            xor     %o4,1,%o4               ! clear the valid bit
            sll     %o4,10,%o4              ! shift tag into 38:11  (from 29:01)
            or      %o4,%l4,%o4             ! OR in the way and set

            xor     %o5,1,%o5               ! clear the valid bit
            sll     %o5,10,%o5              ! shift tag into 38:11  (from 29:01)
            or      %o5,%l5,%o5             ! OR in the way and set

            xor     %o6,1,%o6               ! clear the valid bit
            sll     %o6,10,%o6              ! shift tag into 38:11  (from 29:01)
            or      %o6,%l6,%o6             ! OR in the way and set

            xor     %o7,1,%o7               ! clear the valid bit
            sll     %o7,10,%o7              ! shift tag into 38:11  (from 29:01)
            or      %o7,%l7,%o7             ! OR in the way and set

            ! Now read the D$ data values
do_data_read:	
            ldxa    [%o4]DCACHE_DATA_REG_ASI,%o0           
            ldxa    [%o5]DCACHE_DATA_REG_ASI,%o1           
            ldxa    [%o6]DCACHE_DATA_REG_ASI,%o2           
            ldxa    [%o7]DCACHE_DATA_REG_ASI,%o3                

            ! Now rebuild D$ data table data
            srl     %l4,1,%i4               ! adjust w wccc cccc 0000 to wwcc cccc c000
            or      %i4,%g7,%i4             ! make way 0 DW 0 data 
            srl     %l5,1,%i5
            or      %i5,%g7,%i5             ! make way 1 DW 0 data                                
            srl     %l6,1,%i6
            or      %i6,%g7,%i6             ! make way 2 DW 0 data                 
            srl     %l7,1,%i7
            or      %i7,%g7,%i7             ! make way 3 DW 0 data         

            ! Check results
            xor     %o0,%i4,%o0             ! check tag for way 0
            xor     %o1,%i5,%o1             ! check tag for way 1
            xor     %o2,%i6,%o2             ! check tag for way 2
            xor     %o3,%i7,%o3             ! check tag for way 3
            or      %o0,%o1,%o0
            or      %o3,%o2,%o3
            orcc    %o0,%o3,%o0
            bz      DW0_ok
            nop
    DW0_bad:
            sll     %l0,4,%g1   
            add     %g4,%g1,%l3             ! address of 64B block to store data compare results in
            stx     %o0,[%l3 + 0]
            stx     %o1,[%l3 + 8]
            stx     %o2,[%l3 + 16]
            stx     %o3,[%l3 + 24]
            add     %l1,1,%l1               ! incr error count 
        
    DW0_ok: 
            ! Adjust addresses to word 1       
            add     %o4,8,%o4   
            add     %o5,8,%o5   
            add     %o6,8,%o6   
            add     %o7,8,%o7   

            ! Adjust expected data to word 1
            add     %i4,1,%i4
            add     %i5,1,%i5
            add     %i6,1,%i6
            add     %i7,1,%i7

            ! Now read the D$ data values for word 1
            ldxa    [%o4]DCACHE_DATA_REG_ASI,%o0           
            ldxa    [%o5]DCACHE_DATA_REG_ASI,%o1           
            ldxa    [%o6]DCACHE_DATA_REG_ASI,%o2           
            ldxa    [%o7]DCACHE_DATA_REG_ASI,%o3                

            ! Check results
            xor     %o0,%i4,%o0             ! check tag for way 0
            xor     %o1,%i5,%o1             ! check tag for way 1
            xor     %o2,%i6,%o2             ! check tag for way 2
            xor     %o3,%i7,%o3             ! check tag for way 3
            or      %o0,%o1,%o0
            or      %o3,%o2,%o3
            orcc    %o0,%o3,%o0
            bz      Line_ok
            nop
    DW1_bad:    
            sll     %l0,4,%g1   
            add     %g4,%g1,%l3             ! address of 64B block to store data compare results in             
            stx     %o0,[%l3 + 32]
            stx     %o1,[%l3 + 40]
            stx     %o2,[%l3 + 48]
            stx     %o3,[%l3 + 56]
            add     %l1,1,%l1               ! incr error count         

    Line_ok:
            subcc   %l0,16,%l0               ! decr adjusted loop counter by 1
            bnz     Read_Loop_start
            nop

            sub     %g3,4,%l3               ! store total error count at results_area-4
            stw     %l1,[%l3 + 0]

            orcc    %l1,%l1,%l1             ! check for no errors
            bz      passed
            nop

    failed:
            ta              T_BAD_TRAP

    passed:
            ta              T_GOOD_TRAP













    SECTION .DATA_AREA_SEC DATA_VA=0x0000000040008000
    attr_data {
            Name = .DATA_AREA_SEC,
            hypervisor
            }
    .data
    .global data_area
    .global tags_result_area
    .global data_results_area

            .word   0               ! not used

    !  final error indication stored below
            .word   0

    tags_result_area:
            .word   0               ! need to generate 1024 words of 0's
            .skip   4096
            .word   0
    data_results_area:
            .word   0               ! need to generate 1024 words of 0's
            .skip   4096
            .word   0


