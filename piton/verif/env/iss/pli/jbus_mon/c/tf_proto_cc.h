// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tf_proto_cc.h
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
extern "C" char * tf_getcstringp(int);
extern "C" char * tf_strgetp(int, char);
extern "C" char *tf_mipname();
extern "C" char *tf_strgettime();
extern "C" int tf_getp(int);
extern "C" int tf_putp(int, int);
extern "C" int tf_typep(int);
extern "C" int tf_nump();
extern "C" int io_printf(...);
extern "C" int tf_gettime();
extern "C" int tf_dostop();
extern "C" int tf_dofinish();
extern "C" int tf_getlongp(int *, int);
extern "C" p_tfexprinfo     tf_exprinfo(int, p_tfexprinfo);

