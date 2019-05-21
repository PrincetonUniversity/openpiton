// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: decoder.c
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
#include "veriuser.h"
#include "acc_user.h"
#ifdef __ICARUS__
#include "icarus-compat.h"
#endif
// for strcat
#include <string.h>
// for sprintf
#include <stdio.h>
void mra_entry();
/*-------------------------------------------------------------------------------
 dummy = $bw_decoder(30, cpu_id[2:0], rd_idx, 1, dtlb_entry_vld);
--------------------------------------------------------------------------------*/
int bw_tlb_reset_vld_call()
{
 switch(tf_getp(1)){
 case 2:
   mra_entry();
   break;
 }
 return 0;
}

/*-------------------------------------------------------------------------------
$bw_decoder(40, `DTLBPATH0.tlb_entry_vld, cpu, 1);
--------------------------------------------------------------------------------*/
void mra_entry()
{
   s_tfnodeinfo node_info, node_info4;
   char *avalPtr, *bvalPtr;
   int   groups, ind, i, num, aval[10], bval[10];
#ifdef USE_ACC
   s_tfexprinfo expr_info4;
  s_setval_delay delay_s;
  s_setval_value value_s;
  handle tmphandle;
  char outdata[50];
  char tmpdata[10];
  delay_s.model = accNoDelay;
  outdata[0] = '\0';
#endif

   tf_nodeinfo(3, &node_info);
   tf_nodeinfo(4, &node_info4);
   avalPtr  = node_info.node_value.memoryval_p + tf_getp(2) * node_info.node_ngroups * 2;
   bvalPtr  = avalPtr + node_info.node_ngroups;
   groups   = 0;
   for(ind = 0; ind < node_info4.node_ngroups; ind++){
     aval[ind] = 0;
     bval[ind] = 0;
     for(i = 0; i < 4; i++){
       num = i * 8;
       aval[ind] |= ((avalPtr[groups] & 0xff) << num);
       bval[ind] |= ((bvalPtr[groups] & 0xff) << num);
       groups++;
     }
   }
#ifdef USE_ACC
   for(ind = node_info4.node_ngroups-1; ind >= 0; ind--){
	sprintf(tmpdata,"%0.8x",aval[ind] & 0xffffffff);
	strcat(outdata,tmpdata);
   }
    acc_initialize();
    tmphandle = acc_handle_tfarg(4);
    value_s.format = accHexStrVal;
    value_s.value.str = outdata;
    acc_set_value(tmphandle, &value_s, &delay_s);
#else
   for(groups = 0; groups < node_info4.node_ngroups ; groups++){
      node_info4.node_value.vecval_p[groups].avalbits = aval[groups] & 0xffffffff;
      node_info4.node_value.vecval_p[groups].bvalbits = bval[groups] & 0xffffffff;
    }
   tf_propagatep(4);
#endif

}
