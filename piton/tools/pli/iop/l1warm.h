// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: l1warm.h
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

#ifndef _L1WARM_H_
#define _L1WARM_H_
#include "global.h"
#include "list.h"
#define  BANK 4
#define  BANK_NUM 16
#define  ROW_NUM  4
#define  COL_NUM  4
#define  ICACHE_ARG 193
#define  DCACHE_ARG 1
class l1warm{
 //start private funcs and variable here
private:
  //argment holder.
  long long low_ibound, up_ibound,
            low_dbound, up_dbound;
  int bank, row, pair, tag, itag, dtag, check_irange, check_drange,
      panel, col, way, cpu, entry, cache;
  int cpu_status, cpu_num;
  int cpu_ptr[8], cpu_chose[8];
  s_tfnodeinfo node_info;
  char *avalPtr, *bvalPtr;
  int l1_debug;
  //l2 directory array.
  int       idir_num, ddir_num;
  int       icache, idone;
  int       dcache, ddone;
  long long temp_val;

  char      *dir_iarray[16 * BANK];
  long long  dir_ivalid[16 * BANK];
  long long  dir_iparity[16* BANK];
  
  char      *dir_darray[16 * BANK];
  long long dir_dvalid[16 * BANK];
  long long dir_dparity[16* BANK];
  
  //dcache info.
  int  dcache_num, dtag_num, dvalid_num;
  char *dcache_w[4][8];
  char *dcache_tag[8];
  int  dcache_vld[8];

  int  icache_num, itag_num, ivalid_num;
  char *icache_data[8];
  char *icache_tag[8];
  int  icache_vld[8];
  //routines
  long long get_long(int loc);
  int  which_cache();
  int  which_way(KeyType addr);  
  int  howmany_cpu();
  void core(int num);
  int  even_parity(int data, int num);
  int  even_parity(long long data, int num);
  void slam_idirectory(KeyType addr);
  void slam_ddirectory(KeyType addr);
  void slam_tag(int word, int size);
  void slam_data(long long  word, int size);
  void slam_data(char* word, int size);
  long long make_icache_data(int word);
  int  predecoder(int inst);
  int  get_word(char*data, int num);
  void slam_dcache(KeyType addr,char* data, int num);
  void slam_icache(KeyType addr,char* data, int num);
  void find_location(int idx, int* vld);
  int  copy(char* buf, char* cbuf, int idx);
  long long getEight(char *buf);
  void slam_l1idata(KeyType addr, char* data, int num);
  void slam_l1ddata(KeyType addr, char* data, int num);
  void slam_ionly(KeyType addr, char* data);
  void slam_donly(KeyType addr, char* data);
  int  islam(KeyType addr, char* data);
  int  dslam(KeyType addr, char* data);
public:
  l1warm();
  void option();
  void set();
  void set_cpu(int stat);
  int  slam(KeyType addr, char* data);
  void store_valid(); 
  void store_parity();
};
#endif
