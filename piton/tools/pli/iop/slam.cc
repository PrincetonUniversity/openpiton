// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: slam.cc
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
#include "slam.h"

/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
slam::slam()
{
  
}
/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
void slam::l1arg(int arg)
{
  int idx, i;
  /* 
  //get dcache directory pointer
  for(bank = 0; bank < 4;bank++){
    for(row = 0; row < 4;row++){
      for(pair = 0; pair < 2; pair++){
	for(panel = 0; panel < 2; panel++){
	  tf_nodeinfo(arg, &node_info);
	  ddir_num = node_info.node_ngroups;
	  dir_darray[idx]  = node_info.node_value.memoryval_p;
	  arg += 3;
	  idx++;
	}
      }
    }
  }
  //icache directory
  //64for each memory
  idx = 0;
  for(bank = 0; bank < 4;bank++){
    for(row = 0; row < 4;row++){
      for(pair = 0; pair < 2; pair++){
	for(panel = 0; panel < 2; panel++){
	  tf_nodeinfo(arg, &node_info);
	  dir_num = node_info.node_ngroups;
	  dir_iarray[idx]  = node_info.node_value.memoryval_p;
	  arg += 3;
	  idx++;
	}
      }
    }
  }
  */
  for(idx = 0;idx < 8;idx++){
    if(cpu_status & (1 << idx)){//if instantiate, do it.
      //get the dcache pointer.
      for(i = 0; i < 4;i++){
	tf_nodeinfo(arg++, &node_info);
	dcache_w[i][idx] = node_info.node_value.memoryval_p;//way and core
	if(dcache_num == 0)dcache_num  = node_info.node_ngroups;
      }
      //tag
      tf_nodeinfo(arg++, &node_info);
      dtag_num  = node_info.node_ngroups;
      dcache_tag[idx] = node_info.node_value.memoryval_p;
      //valid
      //slam valid to zero.
      dcache_vld[idx] = arg++;

      //get icache pointer
      //icache data
      tf_nodeinfo(arg++, &node_info);
      icache_num = node_info.node_ngroups;
      icache_data[idx] = node_info.node_value.memoryval_p;
      
      //icache tag
      tf_nodeinfo(arg++, &node_info);
      icache_tag[idx] = node_info.node_value.memoryval_p;
      itag_num  = node_info.node_ngroups;
      //slam valid to zero.
      icache_vld[idx] = arg;
      tf_nodeinfo(arg++, &node_info);
    }
  }
}
/*--------------------------------------------
slam data into cache.
--------------------------------------------*/
void slam::slam_data(char* word, int size)
{
  for(int groups = 0; groups < size;groups++){
    avalPtr[groups] = word[groups] & 0xff;
    bvalPtr[groups] = 0;
  }
}
/*--------------------------------------------
slam data into cache.
--------------------------------------------*/
void slam::slam_data(long long word, int size)
{
 
  for(int groups = 0; groups < size;groups++){
    avalPtr[groups] = word & 0xff;
    bvalPtr[groups] = 0;
    word          >>= 8;
  }
}
/*--------------------------------------------
set valid bit.
--------------------------------------------*/
void slam::find_location(int *vld)
{
  s_tfexprinfo expr_info;

  //tf_nodeinfo(vld[cpu], &node_info);
  tf_exprinfo(vld[cpu], &expr_info);
  int gidx = index / 32;
  int sidx = index % 32;
  // int word = node_info.node_value.vecval_p[gidx].avalbits;
  int word = expr_info.expr_value_p[gidx].avalbits;
  word    |= (1 << sidx);
  // node_info.expr_value_p[gidx].avalbits = word;
  expr_info.expr_value_p[gidx].avalbits = word;
  tf_propagatep(vld[cpu]);
}
/*--------------------------------------------
slam data inti icm.
index for dcm_array:dcache_rwaddr_e[10:4]
--------------------------------------------*/
void slam::slam_l1ddata(char* data)
{  

  avalPtr = dcache_w[way][cpu] + index * dcache_num * 2;
  bvalPtr = avalPtr + dcache_num;
  slam_data(data, dcache_num);
}
/*--------------------------------------------
tag: lmq_ld_addr[39:11];
76 75 74 73 72 71 70 69 68 67 66 65 64
12 11 10  9  8  7  6  5  4  3  2  1  0
--------------------------------------------*/
void slam::slam_dcache(char* data, int num)
{
  int addr_idx;
  long long lword;
  //slam l1 dcache
  slam_l1ddata(data);
  //tag
  avalPtr    = dcache_tag[cpu] + index * dtag_num * 2;
  bvalPtr    = avalPtr + dtag_num;
  slam_data(tag, dtag_num);
  //valid
  find_location(dcache_vld);
}
/*--------------------------------------------
main routine of l1 slam
format l1 cache
 `SPCPATH0.lsu.dcache.w0,
 `SPCPATH0.lsu.dcache.w1,
 `SPCPATH0.lsu.dcache.w2,
 `SPCPATH0.lsu.dcache.w3,
 `SPCPATH0.lsu.dtag.ictag_ary,//bw_r_idct.v
 `SPCPATH0.lsu.dva.idcv_ary,//bw_r_rf16x32.v
  //icache
 `SPCPATH0.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
 `SPCPATH0.ifu.ict.ictag_ary,//bw_r_idct.v
 `SPCPATH0.ifu.icv.idcv_ary, //bw_r_rf16x32.v

dcache:format
dcache way index tag  data
--------------------------------------------*/
void slam::l1slam(char* file)
{

  if((fp = fopen(file, "r")) == 0){
    io_printf("Error -> can not open the file(%s) to slam l1 cache!!\n", file);
    tf_dofinish();
  }
  
  cpu_status = tf_getp(2);//how many core is on.
  l1arg(3);
  fclose(fp);
}
/*--------------------------------------------
main routine of l2 slam
--------------------------------------------*/
void slam::l2slam(char* file)
{ 

  if((fp = fopen(file, "r")) == 0){
     io_printf("Error -> can not open the file(%s) to slam l2 cache!!\n", file);
     tf_dofinish();
  }
  fclose(fp);
}
