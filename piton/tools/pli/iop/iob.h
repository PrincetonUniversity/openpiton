// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob.h
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

#ifndef _IOB_H_
#define _IOB_H_
#include "global.h"
#include "pcx.h"
#include "cpx.h"
#include "list.h"
#include "bw_lib.h"
#include "event.h"
#include "device.h"
#include <string.h>
#include "strclass.h"
#ifdef __ICARUS__
#include "icarus-compat.h"
#endif
//do iob operations

class iob : public strclass<KeyType> {
  //start private funcs and variable here
private:
  //event flag
  bool repeat;
  char  *pargs;// argument variable
  b_tree_node_ptr* sysMem; 
  b_tree_atom_ptr data;
  //pc event variables
  event_record_ptr         one_event; 
  List<event_record>*      event_list;
  avl<List<event_record> > inst_event;
  event pc_event;
  
  //cpx request variable
  //no request zero. One hot
  int wake_status, zero_delay;
  int available;
  char req, thrid;
  int  content[5];
  char *tmp_data;
  //flag for cpx packet.
  int pkt_vld, next_req, next_cpx;
  // ccx qsel
  int Qsel[8];
  //index 
  int groups, idx;
  KeyType addr, mask_addr;
  //low and high byte for tf_getlongp
  int low, high; 
  //event key
  KeyType pc, key;
  //keep pcx packet in the pcx list.
  int pcx_pkt[4];
  List<pcx> pcx_list;
  List<pcx> pcx_heap;
  List<cpx> cpx_list;
  List<cpx> cpx_heap;
  //temporary pcx packet.
  List<pcx>  pcx_load[32], jpcx_load[32];
  pcx pcx_inst, *p_pkt;
  cpx cpx_inst, *c_pkt;
  //io device
  List<device> dram0_list; //ucb data bank 0
  List<device> dram1_list; //ucb data bank 1
  List<device> dev_list;
  List<device> dev_heap;
  
  device *d_pkt;
  //tf variable for cpx packet.
  s_tfnodeinfo node_info;
  //ucb dram buffer
  union {
    int  itype[4];
    char ctype[16];
  } dram_pkt0;
  union {
    int  itype[4];
    char ctype[16];
  }dram_pkt1 ;
  int dcnt0, dnible0, dcnt1, dnible1, n_num0, n_num1;
  int *ptr;
  //jbi pio data
  int jbi_pio_data[PIO_SIZE];
  int pio_idx;
  //interrupt register

  //routines
  void boot();
  void get_event(char* ev);
  void read_pcx();  
  void handle_pcx();  
  void handle_cpx();  
  void gen_event();
  void grant_check();
  //drive signals, which is less than 32 bits.
  void trig_pc_event();
  bool read_ucb(int loc, int *dram_pkt, int *dcnt, int *dnible, int *num);
  void read_core();
public:
  //constructor
  int manual_init(char *ev);
  //iob functions
  void sys_mem(b_tree_node_ptr* mem, event* iob_event);
  void do_iob();
  void do_jiob();
  void drive_cpx(int loc);
  void drive_req(int loc);
  void drive_jbi(int loc);
  void drive_dram(int loc, int bank);
  void read_dram(int loc, int bank);
  void read_pio();
};
#endif
