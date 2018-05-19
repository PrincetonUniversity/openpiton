// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: iob_main.cc
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
//------------------------------------------------------------------------------
//
// Program File: @(#)main.cc
// Version Date: 08/29/02
//
// Date:         5/14/2003
//
//------------------------------------------------------------------------------
#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <inttypes.h>
#include "global.h"
#include "bw_lib.h"
#include "list.h"
#include "cpx.h"
#include "pcx.h"
#include "b_ary.h"
#include "iob.h"
#include "bw_sys.h"
#include "l2warm.h"
#include "l1warm.h"
#include "slam.h"

// Routines called by the verilog code.
extern "C" void iob_jdrive_call();
extern "C" void iob_cdrive_call();
extern "C" void init_jbus_model_call();
extern "C" void l2_snoop_call();
extern "C" void jbus_snoop_call();
extern "C" void init_iob_model_call();
extern "C" void ssi_drive_call();
extern "C" void bw_sys_call();
extern "C" void l2_warm_call();
extern "C" void l1_warm_call();
extern "C" void l2_error_call();
extern "C" void pc_trigger_call();
extern "C" void stale_dram_call();
extern "C" long long access_sys_call(int thread, KeyType key);
extern "C" void slam_call();

extern "C" void read_64b_call();
extern "C" void write_64b_call();

extern "C" void init_oram_call();

//define global variable
static jbus_node_ptr jbus_root;
//This memory is common for all devices.
static b_tree_node_ptr sysMem;//b_try for memory
static iob iob_inst; //("diag.ev");
//instantiate system level.
static bw_sys bw_io; //(&sysMem);
//file used for oram init
static FILE *oram_fp = NULL;

//static event  pc_event("diag.ev");

//define dummy structure for static variable.
typedef struct static_for_pli{
  b_tree_atom_ptr data[32];
  KeyType      last_addr[32];
  l1warm l1;//instantiate l1 warm class here
  //flag for warm
  int          l2_warm, l1_warm;
  //indicates what l2 has.
  List<addr_record> addr_list;
  List<addr_record> l2_list;
  l2warm l2;//slam class for l2 cache.
  event  pc_event;
};
static static_for_pli pli_var;
/*------------------------------------------
initialize all variable to be used in this env.
-------------------------------------------*/
void init_jbus_model_call(){
  char  *str;
  char  buf[BUFFER];
  int   idx;
  int   oram;
  set_random();

  iob_inst.manual_init("diag.ev");
  bw_io.manual_init(&sysMem);

  str       = tf_getcstringp(1);  // a get file name.
  oram      = tf_getp(2); //whether to use oram or not
  jbus_root = (jbus_node_ptr)malloc(sizeof(struct jbus_node));
  //intitialize jbus variable to z.
  strcpy(jbus_root->ad_idle,   "zzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz");
  strcpy(jbus_root->j4_adtype, "zz");//8 bits
  strcpy(jbus_root->j5_adtype, "zz");
  strcpy(jbus_root->j_pack4, "z");
  strcpy(jbus_root->j_pack5, "z");
  jbus_root->active_4 = 0;
  jbus_root->active_5 = 0;
  sysMem              = b_create();//create
  if (!oram)
          read_mem(str, &sysMem, &pli_var.addr_list);//read memory
  iob_inst.sys_mem(&sysMem, &pli_var.pc_event);//set sysMem in iob class
  bw_io.option("diag.ev");
  pli_var.pc_event.read_evfile("diag.ev");
  for(idx = 0; idx < 32; idx++)pli_var.last_addr[idx] = oram ? -1 : 0;
}
/*------------------------------------------
 initiliaze iob handle.
-------------------------------------------*/
void init_iob_model_call(){

}
/*------------------------------------------
 model the jbus operations.
1). j_adtype[7:6] = 0x3 address cycle
2). j_adtype[5:2] agent id.
3). j_adtype[1:0] read transactio 0thru 3.
-------------------------------------------*/
void jbus_snoop_call()
{
  int          j_id, j_adtype, j_req_in, which_cycle,
               agent_id;

  j_id        = tf_getp(J_ID);
  j_req_in    = tf_getp(J_REQ_IN_L) & 0x3f;
  j_adtype    = tf_getp(J_ADTYPE)   & 0xff;

  which_cycle = (j_adtype >> 6) & 3;//get_cycle
  agent_id    = (j_adtype >> 2) & 7;//agenet_id

  if((j_req_in != 0x3f) &           //there is some request
     (which_cycle == 3))addr_cycle();
  jbus_output(j_id, jbus_root);     //drive jbus with their bus data.
}
/*------------------------------------------
monitor L2 cache.
-------------------------------------------*/
void l2_snoop_call(){

  int idx, bank;

}
/*------------------------------------------
handle the cmp clock domain jobs.
-------------------------------------------*/
void iob_cdrive_call()
{
  iob_inst.do_iob();//do iob operations.
  iob_inst.drive_cpx(CPX_LOC);
  iob_inst.drive_req(CPX_REQ);
}
/*------------------------------------------
handle the jbus clock domain jobs.
-------------------------------------------*/
void iob_jdrive_call()
{
  iob_inst.do_jiob();
  iob_inst.drive_jbi(JBUS_LOC);
  //read ucb from dram
  iob_inst.read_pio();
  //drive ucb to dram
  iob_inst.drive_dram(DRAM_IOB02_STALL, 0 );
  iob_inst.drive_dram(DRAM_IOB13_STALL, 1);
  //read ucb from dram
  iob_inst.read_dram(DRAM_IOB02_VLD, 0);
  iob_inst.read_dram(DRAM_IOB13_VLD, 1);

}
/*------------------------------------------
Here We do the system level operation.
-------------------------------------------*/
void ssi_drive_call()
{
  bw_io.ssi(SSI_MOSI);
  bw_io.sso(SSI_MISO);
}
/*------------------------------------------
send external interrupt.
-------------------------------------------*/
void bw_sys_call()
{
  // bw_io.ext_int(EXT_INT);
}
/*------------------------------------------
do l2 warming here.
-------------------------------------------*/
void l2_warm_call()
{

  char*  pargs;
  b_tree_atom_ptr  data;//b-tree node.
  addr_record_ptr  addr_ptr;
  KeyType          mask_addr;

  //set argment
  pli_var.l2.set();
  // for(int bank = 0; bank < 4;bank++)pli_var.l2.l2_clear_vuad(bank);  //clear vuad array.
  //get option for cache warm
  pli_var.l2.option();
  pli_var.l2_warm = 0;
  pli_var.l1_warm = 0;
  //get option for l2warm
  pargs = mc_scan_plusargs ("l2warm=");
  if(pargs != (char *) 0)pli_var.l2_warm = atoi(pargs);
  //get option for l1warm
  pargs = mc_scan_plusargs ("l1warm=");
  if(pargs != (char *) 0)pli_var.l1_warm = atoi(pargs);
  //io_printf("info:L2Warm start\n");
  if(pli_var.l2_warm){
    for(int bank = 0; bank < 4;bank++)pli_var.l2.l2_clear_vuad(bank);  //clear vuad array.
    //warm start
    addr_ptr = pli_var.addr_list.shift();
    while(addr_ptr){
      //here we can slam l2 randomly.
      mask_addr = (addr_ptr->addr >> 6) & 0x3ffffffff;
      data      = b_Find(&sysMem, &mask_addr);
      //if(data &&
      //  pli_var.l2.slam(addr_ptr->addr, data->data))pli_var.l2_list.append(addr_ptr);
      if(data){
	pli_var.l2.slam(addr_ptr->addr, data->data);
	if(pli_var.l1_warm)pli_var.l2_list.append(addr_ptr);
      }
      addr_ptr = pli_var.addr_list.shift();
    }
    //warm all the cache line if there is.
    if(pli_var.l2.warm_all)pli_var.l2.warm_all_cache(&sysMem);
  }
  else if(pli_var.l1_warm == 0)pli_var.addr_list.destroy();
}
/*------------------------------------------
do l1 warming here.
-------------------------------------------*/
void l1_warm_call()
{
  int    dev;
  char*  pargs;
  b_tree_atom_ptr  data;//b-tree node.
  addr_record_ptr  addr_ptr;
  KeyType          mask_addr;

  switch(tf_getp(1)){
  case 1 : //set argment
    pli_var.l1.option();
    pli_var.l1.set_cpu(tf_getp(1));//get the infomation how many core is on.
    if(pli_var.l1_warm)tf_putp(3, 1);
    break;
  case 2 :
    pli_var.l1.store_valid();
    break;
  case 3 :
    // pli_var.l1.set(); //get argments.
    if(pli_var.l1_warm){
       pli_var.l1.set(); //get argments.
      //warm start
      addr_ptr = pli_var.l2_warm ? pli_var.l2_list.shift() : pli_var.addr_list.shift();
      while(addr_ptr){
	//here we can slam l1 randomly.
	mask_addr = (addr_ptr->addr >> 6) & 0x3ffffffff;
	data      = b_Find(&sysMem, &mask_addr);
	if(data)pli_var.l1.slam(addr_ptr->addr, data->data);
	addr_ptr = pli_var.l2_warm ?  pli_var.l2_list.shift() : pli_var.addr_list.shift();
      }
      pli_var.l1.store_parity();
    }
    else pli_var.l2_list.destroy();
  }
}
/*------------------------------------------
enject error into l2 during run time.
-------------------------------------------*/
void l2_error_call()
{
  if(pli_var.l2.l2run_error)pli_var.l2.error_enject();//run time error enjection.
}
/*------------------------------------------
Here, we handle the events.

-------------------------------------------*/
void pc_trigger_call()
{
  switch(tf_getp(PC_TRIG_TY)){
  case 1 :// check for event
    int low, high;
    long long pc;
    low  = tf_getlongp(&high, PC_TRIG_PC);
    pc   = high;
    pc <<= 32;
    pc  |= low;
    if(pli_var.pc_event.hit_pc(pc)){
      while(pli_var.pc_event.which_event()){
	switch(pli_var.pc_event.one_event->type){
	case 1 :
	  pli_var.pc_event.print(PC_TRIG_TH, PC_TRIG_WD);
	  break;
	case 2 :
	  pli_var.pc_event.print(PC_TRIG_TH, PC_TRIG_WD);
	  break;
	case 3 :
	  pli_var.l2.vld_counter  = pli_var.pc_event.one_event->wait;
	  pli_var.l2.cpu          = tf_getp(PC_TRIG_CP);
	  pli_var.l2.cpu_invalid  = 0;
	  pli_var.l2.l2_bank      = 0xf;//set four bank
	  pli_var.l2.cpu_invalid  = 0xff;//8 cpu
	  pli_var.l2.cpu_invalid ^= tf_getp(PC_TRIG_AT);
	  tf_putp(PC_TRIG_ST, 1);//start counter
	  break;
	case WARMRST :
	  pli_var.pc_event.set_warm();
	  break;
	case EXTINT :
	  pli_var.pc_event.set_extint(pli_var.pc_event.one_event->wait);
	  break;
	case TEMPTRIG :
	  pli_var.pc_event.set_temptrig(pli_var.pc_event.one_event->wait);
	  break;
	case CPX_STALL :
	  pli_var.pc_event.set_cpxstall(pli_var.pc_event.one_event->num,
					pli_var.pc_event.one_event->bank);
	  break;
	case PCX_STALL :
	  pli_var.pc_event.set_pcxstall(pli_var.pc_event.one_event->num,
					pli_var.pc_event.one_event->bank);
	  break;
	case CLK_STRETCH :
	  pli_var.pc_event.set_clkstretch(pli_var.pc_event.one_event->wait);
	  break;
	}
      }
    }//if pc hit
    break;
  case 2://cache invalid here
    if(pli_var.l2.vld_counter)pli_var.l2.vld_counter--;
    else{
      int idx, cpu;
      if(pli_var.l2.cpu_invalid){//invalid l1 cache
	idx = INVLD_STB;
	for(cpu = 0; cpu < 8; cpu++){
	  if((pli_var.l2.cpu_invalid & (1 << cpu)) &&
	     (tf_getp(idx) == 0))pli_var.l2.l1_invalidate(idx+1, idx+2, cpu);
	  idx += INVLD_STB_NEXT;
	}
      }
      else if(pli_var.l2.l2_bank){//l2 invalidate
	int loc = INVLD_MB0;
	for(idx = 0; idx < 4; idx++){
	  if(tf_getp(loc) == 0){
	    pli_var.l2.l2_bank ^= 1 << idx;
	    pli_var.l2.l2_invalidate(idx);
	  }
	  loc++;
	}
      }
      if((pli_var.l2.l2_bank == 0) &&
	 (pli_var.l2.cpu_invalid == 0))tf_putp(INVLD_ST, 0);//start counter
    }
    break;
  case 3 :
    pli_var.pc_event.checker();
    break;
  case 4 :
    //cpx or pcx stall and release here.
    pli_var.pc_event.cpx_checker();
    break;
  }
}
/*------------------------------------------
enject error into l2 during run time.
-------------------------------------------*/
void stale_dram_call()
{
  if(pli_var.l2.warm)pli_var.l2.stale_data(STALE_CALL);
}
/*------------------------------------------
It return 8 junk bytes to caller.
-------------------------------------------*/
long long get_eight_byte(char* data, KeyType key)
{
  long long  val;
  int mask  = key & 0x38;
  val       = 0;

  for(int i = 0; i < 8; i++){
    val <<= 8;
    val  |= data[mask+i] & 0xff;
  }
  return val;
}

void write_eight_byte(char* data, KeyType key, unsigned long long val)
{
  unsigned first = val >> 32;
  unsigned second = val & 0xffff0000;
  //io_printf("iob_main.cc writing 0x%x%x to 0x%x\n", first, second, key);
  int mask  = key & 0x38;

  for(int i = 7; i >=0; i--){
    data[mask+i] = val & 0xff;
    val >>= 8;
  }
  // val = data[mask+i]
  // first = val >> 32;
  // second = val & 0xffff0000;
  // io_printf("iob_main.cc wrote 0x%x%x\n", val, key);
  return;
}
/*------------------------------------------
It return 8 junk bytes to caller.
-------------------------------------------*/
long long access_sys_call(int thread, KeyType key)
{
  b_tree_atom_ptr data;
  KeyType   mask_addr;
  mask_addr = (key >> 6) & 0x3ffffffff;


  if(pli_var.last_addr[thread] == mask_addr){

    return get_eight_byte(pli_var.data[thread]->data, key);
  }
  else {
    // trin
    io_printf("Accessing address %x\n", mask_addr);
    data = b_Find(&sysMem, &mask_addr);
    if(data){
      pli_var.data[thread]      = data;
      pli_var.last_addr[thread] = mask_addr;

      return get_eight_byte(pli_var.data[thread]->data, key);

    }
    else return 0;
  }
}

// get 64b of data from memory
void read_64b_call()
{
  KeyType key;
  int low, high;
  low  = tf_getlongp(&high, 1);
  key   = high;
  key <<= 32;
  key  |= (unsigned)low;
  b_tree_atom_ptr data;
  KeyType   mask_addr;
  mask_addr = (((unsigned long long)key & 0x000000ffffffffffULL) >> 6);

  if(pli_var.last_addr[0] == mask_addr){
      int low, high;
      unsigned long long data = get_eight_byte(pli_var.data[0]->data, key);
      low = data & 0xffffffff;
      high = (data >> 32) & 0xffffffff;
      tf_putlongp(2, low, high);
    return;
  }
  else {
    // trin
    data = b_Find(&sysMem, &mask_addr);
    if(data){
      pli_var.data[0]      = data;
      pli_var.last_addr[0] = mask_addr;

      int low, high;
      unsigned long long data = get_eight_byte(pli_var.data[0]->data, key);
      low = data & 0xffffffff;
      high = (data >> 32) & 0xffffffff;
      tf_putlongp(2, low, high);
      return;
    }
    else{
      // io_printf("iob_main.cc: cache line not found at address 0x%llx\n", mask_addr << 6);
      // io_printf("iob_main.cc1: key was 0x%llx\n", key);
      // io_printf("iob_main.cc1: high was 0x%x\n", high);
      // io_printf("iob_main.cc1: low was 0x%x\n", low);
      tf_putlongp(2, 0, 0);
      return;
    }
  }
}

// get 64b of data from memory
void write_64b_call()
{
  KeyType key;
  int low, high;
  low  = tf_getlongp(&high, 1);
  key   = high;
  key <<= 32;
  key  |= (unsigned)low;
  unsigned long long val;
  low  = tf_getlongp(&high, 2);
  val   = (unsigned)high;
  val <<= 32;
  val  |= (unsigned)low;
  b_tree_atom_ptr data;
  KeyType   mask_addr;
  mask_addr = (((unsigned long long)key & 0x000000ffffffffffULL) >> 6);


  if(pli_var.last_addr[0] == mask_addr){
    //io_printf("iob_main.cc: invaling cache\n");
    // invalidate cached data
    pli_var.last_addr[0] = 0;
  }

  data = b_Find(&sysMem, &mask_addr);
  if(data){
    // io_printf("iob_main.cc : writing %x_%x\n", high, low);
    // io_printf("iob_main.cc : writing %x_%x\n", val >> 32, val & 0x0000ffff);
    pli_var.data[0]      = data;
    pli_var.last_addr[0] = mask_addr;
    write_eight_byte(pli_var.data[0]->data, key, val);
    return;
  }
  else{
    // io_printf("iob_main.cc : writing %x_%x\n", high, low);
    // io_printf("iob_main.cc : writing %x_%x\n", val >> 32, val & 0x0000ffff);

    b_tree_atom_ptr atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
    for (int i = 0; i < ATOM_DATA_SIZE; i++)
      atom->data[i] = 0; // clear data

    write_eight_byte(atom->data, key, val);
    atom->key        = mask_addr;
    atom->size       = 64;

    b_insert(&sysMem, &atom);
    return;
  }
}

/*------------------------------------------
slam l1/l2 cache based on user's file.
pli argment 1: used as cache separator.
pli argment 2... : varilog memory
-------------------------------------------*/
void slam_call()
{

  slam slam_inst;
  char*  pargs;

  switch(tf_getp(1)){
  case(1) : //slam l1 cache
    //get option for l1slam
    pargs = mc_scan_plusargs ("l1slam_file=");
    if(pargs != (char *) 0)slam_inst.l1slam(pargs);
  case(2) : //slam l2 cahe
    //get option for l2slam
    pargs = mc_scan_plusargs ("l2slam_file=");
    if(pargs != (char *) 0)slam_inst.l2slam(pargs);
  }
}

/*------------------------------------------
repeatedly call this to get the queue
pli argument 1 : filename
pli argument 2 : done (output)
pli argument 3 : addr (output)
pli argument 4 : val0 (output)
pli argument 5 : val1 (output)
pli argument 6 : val2 (output)
pli argument 7 : val3 (output)
pli argument 8 : val4 (output)
pli argument 9 : val5 (output)
pli argument 10: val6 (output)
pli argument 11: val7 (output)
-------------------------------------------*/
void init_oram_call(){
  char  *fn;
  int   idx;

  size_t len = 0;
  size_t read;
  char *line = NULL;

  char buf[9][17];

  unsigned long long addr;
  unsigned long long val[8];

  int i;


  fn = tf_getcstringp(1);  // a get file name.
  if (oram_fp == NULL)
          oram_fp = fopen(fn, "r");

  if (oram_fp == NULL) {
          perror("open()");
          exit(1);
  }

  read = getline(&line, &len, oram_fp);

  if (read == -1) {
          tf_putp(2, 1); //done = 1
  } else {
          tf_putp(2, 0); //done = 0
          sscanf(line, "%s %s %s %s %s %s %s %s %s\n",
                 &buf[0], &buf[1], &buf[2], &buf[3], &buf[4],
                 &buf[5], &buf[6], &buf[7], &buf[8]);
          addr = strtoul(buf[0], NULL, 16);
          //io_printf("oram init. addr: %x\n", addr);
          tf_putlongp(3, addr & 0xffffffff, (addr >> 32) & 0xffffffff);
          for (i = 1; i < 9; i++)
                  val[i-1] = strtoul(buf[i], NULL, 16);
          for (i = 4; i < 4 + 8; i++)
                  tf_putlongp(i, val[i-4] & 0xffffffff,
                              (val[i-4] >> 32) & 0xffffffff);
  }
  free(line);
}
