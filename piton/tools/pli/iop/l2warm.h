// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: l2warm.h
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

#ifndef _L2WARM_H_
#define _L2WARM_H_
#include "global.h"
#include "list.h"

//macro here.
#define TAG   12
#define VUAD  16
#define DDATA 48
#define BANK  4
#define SUBBANK 12
#define ERROR_ENJECT 5
#define WAY   12
#define INDEX 1024
#define IVLD_NUM 512
#define DVLD_NUM 512
#define CPU_NUM 8
#define SCRUB_WAIT 0
class l2warm{
 //start private funcs and variable here
private:
  //dynamic error injection
  int taken_d, taken_t, not_taken_d, not_taken_t;
  int  rcheck_range, l2run_percent ;
  int tag_pend, tag_pidx[4], tag_pos[4], tag_way[4];
  int data_pend, data_pidx[4], data_pos[4], data_way[4];
  int tag_pend_now, tag_pidx_now[4], tag_pos_now[4], tag_way_now[4];
  int data_pend_now, data_pidx_now[4], data_pos_now[4], data_way_now[4];
  //error inject table
  int tag_table[4][1024];
  int data_table[4][1024];
  int cycle;
  //keep address to slam data.
  List<addr_record> addr_list[4];
  addr_record_ptr addr_ptr;
  // variables for warm_all
  KeyType last_addr[4];
  long long mask_addr,low_bound, up_bound, temp_val, rlow_bound, rup_bound;
  //variables for dram write
  int stale_idx;

  char staledata[64];
  //random value for v&d
  int valid_bit, dirty_bit, turn_on_valid;
  int turn_on_dirty, turn_off_dirty;
  
  int err_enjection, replace, uncorrect_err, check_range;
  //black board
  char blackboard[4][12][1024];
  int round_robin[4];
  //argment holder.
  s_tfnodeinfo node_info;
  //pointers for verilog memory.
  char *tag_avalPtr [TAG*4]; 
  int   tag_num;//hold the size of memory for each index.
  char *vuad_avalPtr[VUAD*4];
  int   vuad_num;
  char *data_avalPtr[DDATA*4];
  int   data_num;

  //hold 13 vuad value.
  int up_vuad, low_vuad;
  //temp ptr.
  char *avalPtr, *bvalPtr;
  //address info
  int bank, index, tag,  way, subbank, warm_tag[4], wren;
  int tag_data;//hold l2 tag.
  //vuad temporay data.
  char slam_data[20], l1line[20], ecc[4];
  
  //keep one bit data.
  char vuad_unpk[108];
  //generate tag & data ecc.
  int tecc(int tag);
  int decc(int data);
  //slam tag, data, and vuad
  void slam_tag();
  void slam_real_data(char* data);
  void slam_vuad();
  void slam_value(int num);
  void extract_vuad(int vuad_idx);
  void integrate_vuad(int vuad_idx);
  void unpack();
  void pack();
  void adjust_data();
  void updated_ua(int idx, int vuadarray, int vuad);
  void updated_vd(int idx, int vuadarray, int vuad);
  
  //modify vuad bits
  int percent(int &, int &);
  int used(int vuad);
  int alloc(int vuad);
  //modify vuad bits
  int valid(int vuad);
  int dirty(int vuad);
  int even_parity(int data, int num); 
  void error_enject(char* data, int low, int high, int parity);
  void error_enject(int* data, int low, int high);
  int  error_enject(int);
  long long  error_enject(long long bits);
  int check_parity(long long bits, int num);  
  int check_parity();
  int range(int max);
  //do invalidate

  void clean_reg(int loc);
  
  void get_tag();
  void get_data();
  void gen_addr();
  void pack_data(char*);
  void pack_4bytes(int idx, char* unpk);
  int  copy(char* buf, char* cbuf, int idx);
  long long getEight(char *buf);
  void l2_tag_update(int loc);
  void slam_tag_error();
  void slam_data_error();
  void l2_data_update(int wren, int loc);
  long long get_long(int loc);

public:
  int warm;
  int warm_all;  
  int l2run_error;
  int cpu_invalid;
  int vld_counter;
  int cpu;
  int l2_bank;  
  int duty;
  //constructor
  l2warm();
  void set();
  //slam tag and data into memory.
  bool slam(KeyType addr, char* data);
  void l2_clear_vuad(int bank);
  void option();
  void warm_all_cache(b_tree_node_ptr* mem);
  //run time
  void error_enject();  
  void l2_invalidate(int bank);

  void l1_invalidate(int ivld, int dvld, int cp_loc);
  //when bypass is deasserted, slam ramdom data into dram.
  void stale_data(int loc);
};
#endif
