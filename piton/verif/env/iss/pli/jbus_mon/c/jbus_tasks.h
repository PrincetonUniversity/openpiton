// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: jbus_tasks.h
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
***  Program File:  @(#)jbus_tasks.h
***
***  Version Date:  01/17/01
***
***
****************************************************************************
****************************************************************************/
#ifndef JBUS_TASKS_H
#define JBUS_TASKS_H
// #include "threaded_pli_interface.h"
struct long_long_long_int{
  unsigned long long lo;
  unsigned long long hi;
};
typedef long_long_long_int BIT128;
typedef BITS BIT64;
extern void dprintf(...);
#undef dispmon
#define dispmon dprintf
#undef writemon
#define writemon dprintf
#undef DISPMON_TAG_ERROR
#define DISPMON_TAG_ERROR  49
#undef DISPMON_TAG_WARNING
#define DISPMON_TAG_WARNING  48
#undef DISPMON_FLAG
#define DISPMON_FLAG 0
#undef WRITEMON_FLAG
#define WRITEMON_FLAG 8
#define FORCE_FLAG 4
//extern class global_sim_info sim_info;
#define TIMEOUT_VALUE  100
#define MAX_RESET_TIME 10000
#define task static void
typedef unsigned char BIT;
typedef unsigned long long int BITS;
typedef unsigned char bit;
typedef unsigned int integer;
//extern "C" char             *mc_scan_plusargs(char *);

#define MAX_TRANS_ENTRIES 4
#define MAX_BUS_MASTERS 16

enum trans_types_enum { TTYPE_RES_0, TTYPE_RES_1, TTYPE_RD, TTYPE_RDD,
			TTYPE_RDS, TTYPE_RDSA, TTYPE_RDO, TTYPE_OWN,
                        TTYPE_INV, /*TTYPE_CWR*/ TTYPE_RES_9, TTYPE_NCWRC, 
			/*TTYPE_RES_11,*/ TTYPE_WRM,  /*Niagara support*/
			TTYPE_WRB, TTYPE_WRBC, TTYPE_WRI, TTYPE_WRIS,
			TTYPE_NCRD, TTYPE_NCBR, TTYPE_NCWR, TTYPE_NCBWR,
			TTYPE_INT, TTYPE_INTACK, TTYPE_INTNACK, TTYPE_XIR,
			TTYPE_FREEZE, TTYPE_FREEZEACK, TTYPE_CHANGE, TTYPE_RES_27,
			TTYPE_RES_28, TTYPE_RES_29, TTYPE_RES_30, TTYPE_IDLE,
			TTYPE_RET_16, TTYPE_RET_64, TTYPE_RET_ERR, TTYPE_INVALID};
enum j_pack_types { P_IDLE, P_COHACK, P_COHACKS, P_COHACKD,
                      P_AOK_OFF, P_AOK_ON, P_DOK_OFF, P_DOK_ON, P_INVALID};
#define P_PRESENT P_IDLE
#define P_NOT_PRESENT P_DOK_ON
extern char *j_pack_string[];

class port_stat{
  public:
  int valid;
  unsigned long long int max, min, total;
  int max_valid, min_valid;
  int id_a, id_b;
  unsigned long long int misc_a, misc_b;
  port_stat(void){
    valid = 0;
    max_valid = 0;
    min_valid = 0;
    misc_a = 0;
    misc_b = 0;
    total = 0;
  }
};

class jbus_stats {

  port_stat *snoop[MAX_BUS_MASTERS], *data[MAX_BUS_MASTERS], *aok[MAX_BUS_MASTERS], *dok[MAX_BUS_MASTERS];
  public:
  int snoop_delay(int port, unsigned long long int delay);
  int data_delay(int resource_port, int request_port, unsigned long long int delay);
  int aok_off(int port, unsigned long long int cycle);
  int dok_off(int port, unsigned long long int cycle);
  int aok_on (int port, unsigned long long int cycle);
  int dok_on (int port, unsigned long long int cycle);
  int report(void);
  jbus_stats (void){
    int i;
    for (i=0; i< MAX_BUS_MASTERS; i++)
      snoop[i] = NULL;
    for (i=0; i< MAX_BUS_MASTERS; i++)
      data[i] = NULL;
    for (i=0; i< MAX_BUS_MASTERS; i++)
      aok[i] = NULL;
    for (i=0; i< MAX_BUS_MASTERS; i++)
      dok[i] = NULL;
  }
};

class transaction_types{
  public:
  //bit [200:0] long_string;
  //bit [100:0] short_string;
  char * long_string;
  char * short_string;
  bit snoop;
  bit valid;
  bit split_transaction;
  bit memory_operation;
  bit byte_mask;
  bit read;
  bit write;
  bit read_return;
  integer length;
  transaction_types(void);
  long int number_executed;
  void init(bit r, bit w, bit rr, int l, bit v, bit sn, bit sp,
       bit mem, bit by, char *lo, char *sh);
};

class transaction_class{
  public:
  //bit [42:0] address;
  //bit [15:0] byteenables;
  //bit [127:0] data[4];
  unsigned long long int transaction_count;
  BIT64 address;
  BIT byteenables[16];
  BIT128 data[4];
  integer type;
  bit valid;
  bit possibly_cancelled_read;
  bit snoop_result_known;
  integer snoop_q_ptr;
  integer time_lo;
  integer returning_id;
  integer returning_id_valid;
  transaction_class();
} ;

class snoop_fifo_class{
  #define FIFO_DEPTH 128
  #define FIFO_ENTRY_VALID_BIT 7
  #define ALL_SET 0xff
  //6 port ids plus one valid bit for fifo entry
  #define AOK_RETIME 3
  #define DOK_RETIME 3
  #define MAX_ADOK_RETIME (DOK_RETIME+2) //Need this as Bell repeater can add in two cycles of latency
  BITS dok_retime[MAX_ADOK_RETIME];
  BITS aok_retime[MAX_ADOK_RETIME];
  BITS dok_off;
  BITS aok_off;
  BITS valid[FIFO_DEPTH];
  BITS share[FIFO_DEPTH];
  BITS dirty[FIFO_DEPTH];
  BITS split_transaction[FIFO_DEPTH];
  transaction_class *transactions[FIFO_DEPTH];
  unsigned long long int cycle_count[FIFO_DEPTH];
  integer port_id[FIFO_DEPTH];
  integer req_port_id[FIFO_DEPTH];
  integer trans_q_id[FIFO_DEPTH];
  integer cancelled_own[FIFO_DEPTH];
  integer read;
  integer write;
  int quiet;
  jbus_stats stats;
  public:
  void report_statistics(void);
  unsigned int valid_masters_mask;
  BITS get_valid(int id);
  void set_valid(int id, BITS value);
  snoop_fifo_class();
  integer add_pack(integer id, BITS ack, integer *dirty_port, integer *share_port,
    integer *req_id, integer *resp_id, integer *trans_id, int *is_split_transaction, integer *no_copyback, unsigned long long int cycle_no);
  void add_transation(integer id, integer class_id, int is_split_transaction, transaction_class *transaction, unsigned long long int time);
  void close_snoop_entry(transaction_class *transaction);
  void get_present_master(int id, BITS ack);
  int search_snoop_queue(unsigned long long int addr);
  int check_ack(int id, BITS ack);
  int is_present(int id);
  int is_snoop(BITS ack);
  int is_flow_control(BITS ack);
  void flow_control_sample_and_delay(void);
  void update_flow_control(int id, BITS ack, unsigned long long int cycle_no, int local_ports_mask);
  int aok_disabled(void);
  void reset(int local_ports);
  int dok_disabled(int id);
  void check_snoop_timing(unsigned long long int cycle_count, int max);
};

BIT get_bit(BITS val, int position);
BITS set_bit(BITS val, int to, int position);
void check_bits_valid(bit * bits, integer finish, integer start);
BITS get_address_owner(BITS address);
int current_driver(BIT req[7], int last_port_driver);
// int agent_id;
void init_routine(transaction_types *trans_types);
int is_cacheable_address(BITS address);
BITS get_agent_id (int current_driver);
BITS get_agent_mask (int current_driver);
BITS get_agent_id_alt (int current_driver);
BITS get_agent_mask_alt (int current_driver);
int agent_to_id (BITS agent_id);
int get_new_estar_div(int old_div, int old_old_div);
int get_estar_delay(void);
#endif
