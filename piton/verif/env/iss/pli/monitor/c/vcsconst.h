// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: vcsconst.h
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
#define VERIUSER_H
#define PLI_EXTRAS             1
#define true                   1
#define TRUE                   1
#define false                  0
#define FALSE                  0
#define bool                   int
#define ERR_MESSAGE            1
#define ERR_WARNING            2
#define ERR_ERROR              3
#define ERR_INTERNAL           4
#define ERR_SYSTEM             5
#define reason_checktf         1
#define REASON_CHECKTF         reason_checktf
#define reason_sizetf          2
#define REASON_SIZETF          reason_sizetf
#define reason_calltf          3
#define REASON_CALLTF          reason_calltf
#define reason_save            4
#define REASON_SAVE            reason_save
#define reason_restart         5
#define REASON_RESTART         reason_restart
#define reason_disable         6
#define REASON_DISABLE         reason_disable
#define reason_paramvc         7
#define REASON_PARAMVC         reason_paramvc
#define reason_synch           8
#define REASON_SYNCH           reason_synch
#define reason_finish          9
#define REASON_FINISH          reason_finish
#define reason_reactivate     10
#define REASON_REACTIVATE      reason_reactivate
#define reason_rosynch        11
#define REASON_ROSYNCH         reason_rosynch
#define reason_paramdrc       15
#define REASON_PARAMDRC        reason_paramdrc
#define reason_endofcompile   16
#define REASON_ENDOFCOMPILE    reason_endofcompile
#define reason_scope          17
#define REASON_SCOPE          reason_scope
#define reason_interactive    18
#define REASON_INTERACTIVE     reason_interactive
#define reason_reset          19
#define REASON_RESET           reason_reset
#define reason_endofreset     20
#define REASON_ENDOFRESET      reason_endofreset
#define reason_force          21
#define REASON_FORCE           reason_force
#define reason_release        22
#define REASON_RELEASE         reason_release
#define reason_startofsave    27
#define reason_startofrestart 28
#define REASON_MAX            28
#define tf_nullparam           0
#define TF_NULLPARAM           tf_nullparam
#define tf_string              1
#define TF_STRING              tf_string
#define tf_specialparam        2
#define TF_SPECIALPARAM        tf_specialparam
#define tf_readonly           10
#define TF_READONLY            tf_readonly
#define tf_readwrite          11
#define TF_READWRITE           tf_readwrite
#define tf_rwbitselect        12
#define TF_RWBITSELECT         tf_rwbitselect
#define tf_rwpartselect       13
#define TF_RWPARTSELECT        tf_rwpartselect
#define tf_rwmemselect        14
#define TF_RWMEMSELECT         tf_rwmemselect
#define tf_readonlyreal       15
#define TF_READONLYREAL        tf_readonlyreal
#define tf_readwritereal      16
#define TF_READWRITEREAL       tf_readwritereal
#define tf_null_node         100
#define TF_NULL_NODE           tf_null_node
#define tf_reg_node          101
#define TF_REG_NODE            tf_reg_node
#define tf_integer_node      102
#define TF_INTEGER_NODE        tf_integer_node
#define tf_time_node         103
#define TF_TIME_NODE           tf_time_node
#define tf_netvector_node    104
#define TF_NETVECTOR_NODE      tf_netvector_node
#define tf_netscalar_node    105
#define TF_NETSCALAR_NODE      tf_netscalar_node
#define tf_memory_node       106
#define TF_MEMORY_NODE         tf_memory_node
#define tf_real_node         107
#define TF_REAL_NODE           tf_real_node
#define tf_mda_node	     108     
#define TF_MDA_NODE         tf_mda_node
#define tf_wiremda_node      109
#define TF_WIREMDA_NODE        tf_wiremda_node
#define PROTO_PARAMS(params) params
#define DEFINED_PROTO_PARAMS
#define EXTERN
#define DEFINED_EXTERN
#define PROTO_PARAMS(params) (/* nothing */)
#define DEFINED_PROTO_PARAMS
#define EXTERN extern
#define DEFINED_EXTERN
#define _LP64 1
# define LP64BIT long           /* a 64-bit object */
# define LP64BIT int            /* a 32-bit object */
