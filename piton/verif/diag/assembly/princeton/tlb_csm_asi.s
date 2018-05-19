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
/****************************************************************
 * Name: tlb_csm_asi.s
 * Date: 05/28/2014
 *
 * Description: Test adding some new ASIs into TLB
 *
 ****************************************************************/


/*********************************************************/
#include "enable_traps.h"
#include "boot.s"

.global main

.text

main:
	/* change to privileged mode to write DMMU reg */
	ta	T_CHANGE_PRIV
	nop

write_read_dtlb:
	mov	0x3d,	%l0
	mov	0x0,	%l1
	mov	0x28,	%l5	/* skip the first 5 entries */
	mov	0x0,	%o0	/* standard DMMU miss handler */

	/* adjust the timing between thread0 & thread 1 */
	nop;nop;nop;nop;nop;nop;
	setx	data_array,	%l1,	%l2
	setx	csm_array,	%l3,	%l4
preload_dtlb1:
	ldx	[%l2],		%g4
	ldx	[%l2+0x8], 	%g5	
	add	%l2,	0x10,	%l2	
    ldx [%l4],      %g6
	
	mov	0x30,	%l3
        stxa    %g4,    [%l3] 0x58	/* tag access reg */
        stxa    %g5,    [%l5] 0x5d	/* data access reg */
        stxa    %g6,    [%l5] 0x13  /* csm access reg */
	add	%l5,	0x8,	%l5


readout_dtlb1:
        /* read out one entry in D-TLB table to compare */
        set     0x0,    %l0
        set     0x40,   %l6
        set     0x28,    %l7	/* read out entry 3 , counting from 0 , the forth entry */
rdout_dtlb1_loop:
        ldxa    [%l7] 0x5d,     %l3
        ldxa    [%l7] 0x5e,     %l4
        ldxa    [%l7] 0x13,     %l8


done:
    cmp %g6, %l8
    be good_end
    nop                             ! Delay slot
bad_end:
    ta T_BAD_TRAP
    ba end
    nop                             ! Delay slot
good_end:
    ta T_GOOD_TRAP
end:
    nop
    nop

!==========================
.data

.global data_array
data_array:
	/*   nucleus context : L=0, size=64k, G=0  */
	.xword	0x00000000051a0000,	0xa0000001051a0002	
	.xword	0x00000000051b0000,	0x20000001051b0002	

.global csm_array
csm_array:
    /*.xword 0x0000000000000000, 0x0000000000000000*/
	.xword	0xa0000001051a0002,	0xa0000001051a0002


.end
