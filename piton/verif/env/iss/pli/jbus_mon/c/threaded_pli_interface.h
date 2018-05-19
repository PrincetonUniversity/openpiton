// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: threaded_pli_interface.h
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
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)threaded_pli_interface.h
***
***  Version Date:  04/22/99
***
****************************************************************************
****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <thread.h>
typedef unsigned char BIT;
typedef unsigned long long int BIT64;
typedef unsigned int BITS     ;
#define LO 0
#define HI 1
#define SIZEOF_BITS   32
#define SIZEOF_BIT64  64
/*{{{  class*/
enum port_ids {j_req, j_pack5, j_pack4, j_pack3, j_pack2, j_pack1, j_pack0,
               j_adp, j_adtype, j_ad_hi, j_ad_lo, j_rst, j_par, j_ad, INVALID_PORT_ID};

const int sizes[] = {6, 3, 3, 3, 3, 3, 3, 1, 8, 64, 64, 1, 1, 128};
#define MAX_BITS_IN_INT 64
#define MAX_BIT_SIZE 128
struct long_long_long_int{
  unsigned long long lo;
  unsigned long long hi;
};
typedef long_long_long_int BIT128;
class thread_state {
  public:
  thread_t thread_id;
  int new_thread;
  int first_cycle;
  sem_t sem;
  sem_t sem_ack;
  class thread_state *next;
  class jbus_cycle_info *parent;
  void wait_next_cycle(void) ;
  void wait_next_cycle(char *unit, enum port_ids id, int top_bit, int bottom_bit, BIT64 expected) ;
  thread_state(void) {
    next = NULL;
    new_thread = 1;
    first_cycle = 1;
    parent = NULL;
  }
};

class jbus_cycle_info {
    private:
    int return_status;
    int inited;
    class thread_state *t_state;
    BITS req, req_valid;
    //BIT64 ad_hi, ad_hi_valid;
    //BIT64 ad_lo, ad_lo_valid;
    BIT128 ad, ad_valid;
    BITS ad_type, ad_type_valid;
    BIT adp, adp_valid;
    BITS pack[6], pack_valid[6];
    BIT reset, reset_valid;
    BIT par, par_valid;
  BITS get_bits_and_valid(enum port_ids id, BITS *val, BITS *mask);

  //BIT *get_bits_and_valid(enum port_ids id, BITS *val, BITS *mask, int split_longs);
  BIT64  get_bits_and_valid(enum port_ids id, BIT64 *val, BIT64 *mask);
  BIT128 get_bits_and_valid(enum port_ids id, BIT128 *val, BIT128 *mask);
  //BIT *resize_bits(enum port_ids id, BITS *val);
 // BIT64 resize_bits(enum port_ids id, BIT64 *val);

public:
  BIT64 intf_sig_long(enum port_ids id);
  BIT64    intf_sig(enum port_ids id);
  char *intf_sig_name(enum port_ids id);
  BIT64    checked_intf_sig(enum port_ids id, int invalid);
  BIT64    checked_intf_sig(enum port_ids id, int top_bit, int bottom_bit);
  BIT64    intf_sig(enum port_ids id, int top_bit);
  BIT64    intf_sig(enum port_ids id, int top_bit, int bottom_bit);
  BIT128  intf_sig_l(enum port_ids id);
  BIT    *intf_sig_v(enum port_ids id, BIT *sp);
  BIT    *intf_sig_v(enum port_ids id, BIT *sp, int top_bit);
  BIT    *intf_sig_v(enum port_ids id, BIT *sp, int top_bit, int bottom_bit);

  void reset_change(void);

  void wait_next_cycle(void) ;
  void wait_next_cycle(char *unit, enum port_ids id, int top_bit, int bottom_bit, BIT64 expected) ;
  void wait_to_exit(int status) ;
  void wait_for_event(enum port_ids id, BIT value, int timeout) ;
  void wait_for_event(enum port_ids id, BIT *value, int timeout) ;
  jbus_cycle_info(void) ;
  int init(thread_t **id);
  int new_cycle(void);
  void print_raw(void);
  void fork(void *(fn)(void *));
};
/*}}}  */
#define MAX_INST_NAME_SIZE 100
class global_sim_info{
  char inst_name[MAX_INST_NAME_SIZE+1];
  unsigned long long sim_time;
  int thread_exit_status;
  public:
  void set_inst_name(char *name);
  char *get_inst_name(void);
  void set_sim_time(unsigned long long time);
  void set_sim_time(unsigned int time);
  unsigned int get_sim_time(void);
  unsigned long long int get_long_sim_time(void);
  void set_exit(void);
  int get_exit(void);
  global_sim_info(void){
    inst_name[0] = '\0';
    sim_time = 0;
    thread_exit_status = 0;
  }
};

extern int get_time (int x);
#define CHECK 1
extern int get_plus_arg(int check, char *arg);
extern "C" char             *mc_scan_plusargs(char *);

#define terminate sim_info.set_exit();
extern void C_dispmon(char *unit, int indx, char *fmt, ...)  ;
extern void C_writemon(char *unit, int indx, char *fmt, ...) ;
#undef dispmon
#define dispmon C_dispmon
#undef writemon
#define writemon C_writemon
//Demote errors to warnings for the time being as the commandline options do
//not exist to disable errors
  #define DISPMON_TAG_ERROR  48
  #define DISPMON_TAG_WARNING  48
extern class global_sim_info sim_info;


