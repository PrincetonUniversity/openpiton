// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_stb2b_trap_30.s
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
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Diag: tlu_stb2b_trap_30.s
!! No. Threads: 1
!! Description: 
!! This diag tests the stb2b lsu-asynchronous trap followed by
!! spill (by save) trap
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO


#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
	add	%o4, 0x32, %o4; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define SPILL_TRAP_RETRY

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
! Register init code

	setx 0xbea0901d1d5e9160, %g1, %g0
	setx 0x53e6cdca4f8cc3a7, %g1, %g1
	setx 0x5abd462ea285756c, %g1, %g2
	setx 0xe4306bc9b777b985, %g1, %g3
	setx 0x9d09c51a9f19c0a0, %g1, %g4
	setx 0x35a0676dc7bf19eb, %g1, %g5
	setx 0x74adad255e1d9971, %g1, %g6
	setx 0x3b20167987a77666, %g1, %g7
	setx 0x2f563f65035dafea, %g1, %r16
	setx 0x119f3a5c142f16cb, %g1, %r17
	setx 0x235a094b4a99ca81, %g1, %r18
	setx 0xf424aa3056feedec, %g1, %r19
	setx 0x4e3e1e187c96dfec, %g1, %r20
	setx 0xfb0223011544978f, %g1, %r21
	setx 0xac55822d33cca3d6, %g1, %r22
	setx 0xc962cb337e007df7, %g1, %r23
	setx 0x2541d90b39f6a80f, %g1, %r24
	setx 0xd96657c4d8f5b2f6, %g1, %r25
	setx 0x2b6e21b2a6ce7ce6, %g1, %r26
	setx 0xde8ebabfeb1734dc, %g1, %r27
	setx 0x25dd6515bd3c45a4, %g1, %r28
	setx 0x8f0e76c5bb4812f5, %g1, %r29
	setx 0x9895504243fb0832, %g1, %r30
	setx 0x4c47c7dc8bfc3c77, %g1, %r31
	save
	setx 0x1d3955255951ae72, %g1, %r16
	setx 0x71ee50949a6cc521, %g1, %r17
	setx 0x61efbf95b7947c77, %g1, %r18
	setx 0x1dcd265a8498e46d, %g1, %r19
	setx 0x2fdaaa50485d780b, %g1, %r20
	setx 0xbe540b5df40cc680, %g1, %r21
	setx 0x0f76f6e8f3906ba4, %g1, %r22
	setx 0x1171f0e7df161d0c, %g1, %r23
	setx 0x67d04b87f5af3365, %g1, %r24
	setx 0xe5f917d793b33b1d, %g1, %r25
	setx 0xe84fc478fb95011a, %g1, %r26
	setx 0x8767bcd8a5396223, %g1, %r27
	setx 0x5dd01e32bdbcf249, %g1, %r28
	setx 0x3610690616148513, %g1, %r29
	setx 0x5a761ab620935640, %g1, %r30
	setx 0xa0aa55e4450e0dbb, %g1, %r31
	save
	setx 0xb5799af30f3654cb, %g1, %r16
	setx 0xccaceee2534f35ac, %g1, %r17
	setx 0x507f4ddcf82a7f6a, %g1, %r18
	setx 0x9b3bbe5087a0dbfe, %g1, %r19
	setx 0x65a6ec786a5a0227, %g1, %r20
	setx 0x33336712f0292a01, %g1, %r21
	setx 0xba760e0d76fd3fae, %g1, %r22
	setx 0x2e664d4130e1dcc3, %g1, %r23
	setx 0x6be227bdc28be0bb, %g1, %r24
	setx 0x0c9e516a1d875286, %g1, %r25
	setx 0xaf862fc966a49805, %g1, %r26
	setx 0x5e818bc0016e4de6, %g1, %r27
	setx 0x95855214e0862dcb, %g1, %r28
	setx 0x7527e4438a87128a, %g1, %r29
	setx 0xf8a3cc8d6e7c7004, %g1, %r30
	setx 0x2ee0eccf8f428d1e, %g1, %r31
	save
	setx 0x73553679fddf5341, %g1, %r16
	setx 0x5449ec61d0090ed6, %g1, %r17
	setx 0xebc23b9fc96d1ad1, %g1, %r18
	setx 0x0992da7d95b887ea, %g1, %r19
	setx 0x563ed5ea014cedf8, %g1, %r20
	setx 0x9eaff8da0032d823, %g1, %r21
	setx 0x9cd8fd56f05731c2, %g1, %r22
	setx 0xf4d74ff9104e0fc7, %g1, %r23
	setx 0x39d286eb041be9ec, %g1, %r24
	setx 0xd6e2f529096a6804, %g1, %r25
	setx 0x5d1213c79f56517e, %g1, %r26
	setx 0x0cf1b34b9ea402e1, %g1, %r27
	setx 0x93047398322b9c3d, %g1, %r28
	setx 0xc6b508c2eaceae68, %g1, %r29
	setx 0x1076b307997a363d, %g1, %r30
	setx 0x6c2d4e9041db1b67, %g1, %r31
	save
	setx 0x60c8db76f5c8c8a8, %g1, %r16
	setx 0x3d273fde2112dfb3, %g1, %r17
	setx 0x3aaf42b7d4ea4a87, %g1, %r18
	setx 0x7db9477511963979, %g1, %r19
	setx 0x7703975f827bf37f, %g1, %r20
	setx 0x08fd96e24d5f0d7c, %g1, %r21
	setx 0xc147ac7c05a5b906, %g1, %r22
	setx 0xeb8fddfedeb775ca, %g1, %r23
	setx 0xf8c5fef923a7e1f4, %g1, %r24
	setx 0x5e66e3935471401c, %g1, %r25
	setx 0x11ebf64b65e4f779, %g1, %r26
	setx 0x6f3b0415e71299c9, %g1, %r27
	setx 0xea5360ab6b9feea5, %g1, %r28
	setx 0xc9a6ece8ce4b7b6d, %g1, %r29
	setx 0x29986c6cd7b5173d, %g1, %r30
	setx 0x4c10aa21df24ae2b, %g1, %r31
	save
	setx 0xa5ae9bdcdcb4e0fd, %g1, %r16
	setx 0xc61a4411f7327b97, %g1, %r17
	setx 0x3c293395517c3ff4, %g1, %r18
	setx 0x66d5f861e8dc1873, %g1, %r19
	setx 0x8b417d311c9e9f86, %g1, %r20
	setx 0x03e194aa8819a39b, %g1, %r21
	setx 0xdb3afd3227205f18, %g1, %r22
	setx 0xde78c353c6ee2f62, %g1, %r23
	setx 0xfbc7743ad9d11deb, %g1, %r24
	setx 0x6583ba144dafdd83, %g1, %r25
	setx 0x77f3c4b8879aec4d, %g1, %r26
	setx 0x1b42ea07dd8e58d0, %g1, %r27
	setx 0x94951660ea5d2097, %g1, %r28
	setx 0x3aa19653d9b3cc7a, %g1, %r29
	setx 0xaf148cede058dd4c, %g1, %r30
	setx 0x2e454022bfd57804, %g1, %r31
	save
	setx 0x6b7830befbd666e7, %g1, %r16
	setx 0x658798575a11c9c5, %g1, %r17
	setx 0x0748ef56e3818400, %g1, %r18
	setx 0xdec4c3db028f0f43, %g1, %r19
	setx 0xa76a5b62c0df5037, %g1, %r20
	setx 0xb787ce5b5c063b53, %g1, %r21
	setx 0xccae4947f2c2dbe5, %g1, %r22
	setx 0x7e9f0d497651ead2, %g1, %r23
	setx 0x893bfbe958522cdc, %g1, %r24
	setx 0x12af4d8d9d0c9015, %g1, %r25
	setx 0x3834337623bc573d, %g1, %r26
	setx 0x94dc56cd0582ae67, %g1, %r27
	setx 0xeb3f95fca9165ddd, %g1, %r28
	setx 0x7e247a673c701a45, %g1, %r29
	setx 0x539840727ebef169, %g1, %r30
	setx 0x116766314a6274d8, %g1, %r31
	save
	setx 0x5c43185de794062e, %g1, %r16
	setx 0xd1d28823d7befe7d, %g1, %r17
	setx 0xe0959b3c77e29651, %g1, %r18
	setx 0x46937a577c6ee893, %g1, %r19
	setx 0x1bd8a01471d1d241, %g1, %r20
	setx 0xeb7bc1ec12962bc4, %g1, %r21
	setx 0x43da95249f119835, %g1, %r22
	setx 0xbe0f15dbac6406d7, %g1, %r23
	setx 0x90e70810b37ed519, %g1, %r24
	setx 0x362a61da75fe6c1d, %g1, %r25
	setx 0x413c8b6f42c095ed, %g1, %r26
	setx 0xcd0473f9425f56b7, %g1, %r27
	setx 0x288a0be23c38a451, %g1, %r28
	setx 0x3cab7a78466621e0, %g1, %r29
	setx 0x73beb4ac877104ab, %g1, %r30
	setx 0x83598878c30724af, %g1, %r31
	th_fork(main_th)

main_th_0:
main_th_1:
main_th_2:
main_th_3:
	nop
        mov     16, %g7
wait_y3:
        cmp     %g7, %g0
        bne     %xcc, wait_y3
        dec     %g7
	nop
	ta	T_CHANGE_HPRIV
	rdpr	%pstate, %l4
	rdhpr	%hpstate, %l6
	setx	0x88000000, %g1, %g2
	stxa	%g2, [%g0] 0x43
	ta	T_CHANGE_NONHPRIV
	save
	nop
	nop
	mov	0x55, %o4
	nop
	setx	%hi(data_start), %g1, %l0
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	sth	%l2, [%l0]
	save
	nop
	nop
	nop
	nop
	mov	0x55, %g1
	add	%g1, 0x32, %g1
	cmp	%g1, %i4
	be	diag_pass
	nop
	ta	T_BAD_TRAP
	nop
	nop
	nop
	nop
	.data
data_start:

	.xword	0x0000000000000000
	.xword	0x1111111111111111
	.xword	0x2222222222222222
	.xword	0x3333333333333333
	.xword	0x4444444444444444
	.xword	0x5555555555555555
	.xword	0x6666666666666666
	.xword	0x7777777777777777
	.xword	0x7777777777777777
	.xword	0x6666666666666666
	.xword	0x5555555555555555
	.xword	0x4444444444444444
	.xword	0x3333333333333333
	.xword	0x2222222222222222
	.xword	0x1111111111111111
	.xword	0x0000000000000000
.text
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321


