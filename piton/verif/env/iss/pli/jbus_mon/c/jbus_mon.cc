// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: jbus_mon.cc
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
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)jbus_mon.cc
***
***  Version Date:  02/06/02
***
****************************************************************************
****************************************************************************/

#ifdef LINUX
#else

#define DISPMON_TAG  9
#define DISPMON_CYCLE_TAG  11
#define DISPMON_TAG_DEBUG 16
#define DISPMON_TAG_DEBUG_DEBUG 15
#undef  DISPMON_UNIT
#define DISPMON_UNIT "jbus_mon"
#define DISPMON_UNIT_MEM "jbus_mon_mem"
#define DISPMON_UNIT_MEM_PORT "jbus_mon_mem_port"
#define DISPMON_UNIT_REUSE "jbus_mon_reused_read"
#define DISPMON_UNIT_INVALID_CODE "jbus_mon_bad_transaction"
#define DISPMON_UNIT_INSTALL "jbus_mon_bad_install"
#define DISPMON_UNIT_ECCERR  "jbus_mon_ecc_error"
#define DISPMON_UNIT_RDERR  "jbus_mon_read_error"
#define DISPMON_UNIT_UNEXP_DR "jbus_mon_unexpected_data_rtrn"
#define DISPMON_UNIT_WRBERR  "jbus_mon_wrb_error"
#define DISPMON_UNIT_IDLE  "jbus_mon_timeout"
#define DISPMON_UNIT_DBGCYC  "jbus_mon_dbgcyc"
#define DISPMON_UNIT_RD_SRCID  "jbus_mon_rd_srcid"

#include <stdlib.h>
#include "jbus.h"
#include "jbus_tasks.h"
#include "jbus_mon.h"

#define LOG_TO_FILE if (logfile_enabled && logfile_line_start) fprintf(logfileid, "=================================\nTime : %d\n", tf_gettime());\
		    if (logfile_enabled && logfile_line_start) logfile_line_start = 0; \
		    if (logfile_enabled) fprintf(logfileid,

//{{{  tasks
//{{{  handle_estar_change
void jbus_mon::handle_estar_change(void){

  int i, delay;
  if ((delay = get_estar_delay())){
    dispmon(DISPMON_UNIT, DISPMON_TAG,  DISPMON_FLAG, "Waiting for %d cycles for estar change to propagate", delay);
    for (i=0; i<delay; i++)
      next_cycle_POC();
  }
  dispmon(DISPMON_UNIT, DISPMON_TAG,  DISPMON_FLAG, "Waiting for four cycles to allow bus activity to halt");
  for (i=0; i<6; i++)
    next_cycle_POC();
  estar_change=1;
  dispmon(DISPMON_UNIT, DISPMON_TAG,  DISPMON_FLAG, "Waiting for 28 cycles for estar transistions - no bus activity allowed now");
  for (i=0; i<26; i++){
    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG,  DISPMON_FLAG, "%d cycles of change wait remaining", 28 - i);
    next_cycle_POC();
  }
  if (last_estar_div == -1){
    /*Signifies a reset happened since last estar, and we wish to go restart the sequence*/
    estar_div = 1;
    last_estar_div = 1 ;
  }
  i = estar_div;
  estar_div = get_new_estar_div(estar_div, last_estar_div);
  last_estar_div = i;
 // next_cycle_POC();
  dispmon(DISPMON_UNIT, DISPMON_TAG,  DISPMON_FLAG, "Clock change happening here - changed to %d division ratio", estar_div);
  estar_change=0;
}

//}}}  
char *jbus_mon::construct_data(char *ptr, unsigned char *byte_enables){
  int i;
  char *base = ptr;
  for (i=0; i<16; i++){
    if (byte_enables[i] == 1)
      sprintf(ptr, "%02llx", bus->j_ad->Value( 127 - i*8 , 120 - (i*8)));
    else
      sprintf(ptr, "--");
    ptr+=2;
  }
  return base;
}
int jbus_mon::compare_agent_to_jbus_id(int agent, int jid){
 if (((agent ^ get_agent_id(jid)) & get_agent_mask(jid)) == 0)
   return 1;
 else if (jid == 6 && (agent == 5))
   //This is a weird case for the 6th CPU being in the I/O slot
   return 1;

 // Niagara occupies port 0 on the jbus and drives out only j_req0_l,
 // but it can master transactions using agent IDs 0, 1, 2 or 3.
 if (((jid == 0) && (agent == 0)) ||
     ((jid == 0) && (agent == 1)) ||
     ((jid == 0) && (agent == 2)) ||
     ((jid == 0) && (agent == 3)) )
   return 1;

 return 0;
}
//{{{  print start of line
int jbus_mon::to_integer(bit * b, int invalid){
  if ((b[0] == 0) || (b[0] == 1) &&
      (b[1] == 0) || (b[1] == 1) &&
      (b[2] == 0) || (b[2] == 1))
    return b[2] << 2 | b[1] << 1 || b[0];
  else
    return invalid;
}
void jbus_mon::line_start(){
  dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "");
}


void jbus_mon::print_start_of_line (){
  int i, invalid_value;
  BITS reqs_l[7];
  BITS jpacks[7];

  jpacks[0] = bus->j_pack0->Value();
  jpacks[1] = bus->j_pack1->Value();
  jpacks[2] = bus->j_pack2->Value();
  jpacks[3] = bus->j_pack3->Value();
  jpacks[4] = bus->j_pack4->Value();
  jpacks[5] = bus->j_pack5->Value();
  jpacks[6] = bus->j_pack6->Value();
  reqs_l[0] =  bus->j_req_out_l_0->Value(0, 0);
  reqs_l[1] =  bus->j_req_out_l_1->Value(0, 0);
  reqs_l[2] =  bus->j_req_out_l_2->Value(0, 0);
  reqs_l[3] =  bus->j_req_out_l_3->Value(0, 0);
  reqs_l[4] =  bus->j_req_out_l_4->Value(0, 0);
  reqs_l[5] =  bus->j_req_out_l_5->Value(0, 0);
  reqs_l[6] =  bus->j_req_out_l_6->Value(0, 0);


  invalid_value = (int) P_INVALID;

  if (!(reqs_l[0] & reqs_l[1] & reqs_l[2] & reqs_l[3] & reqs_l[4] & reqs_l[5] & reqs_l[6])){
    LOG_TO_FILE "Jbus reqs : ");
    for (i=6; i>=0; i--){
      LOG_TO_FILE "%d", (unsigned int) reqs_l[i]);
    }
    LOG_TO_FILE "\n");
  }


  for (i=6; i>=0; i--){
    if (snoop_q.is_present(i)){
      if (jpacks[i] != 0){
	LOG_TO_FILE "JPACK%d : %s\n", i, j_pack_string[jpacks[i]]);
      }
    }
  }
}
//}}}  
//{{{  header
void jbus_mon::print_header(){

    //dispmon(DISPMON_UNIT, DISPMON_CYCLE_TAG, DISPMON_FLAG, "-req[5:0]-----pack[5:0]---command-------info----------------------address/data--------\n");
}
//}}}  
//{{{  sample_valid_masters
void jbus_mon::sample_valid_masters(void){
  snoop_q.get_present_master(0, bus->j_pack0->Value());
  snoop_q.get_present_master(1, bus->j_pack1->Value());
  snoop_q.get_present_master(2, bus->j_pack2->Value());
  snoop_q.get_present_master(3, bus->j_pack3->Value());
  snoop_q.get_present_master(4, bus->j_pack4->Value());
  snoop_q.get_present_master(5, bus->j_pack5->Value());
  snoop_q.get_present_master(6, bus->j_pack6->Value());
}
//}}}  
//{{{  handle packs
void jbus_mon::handle_packs(BITS *jpacks){
	      //   .transaction_class *transactions,
	      //   snoop_fifo_class *snoop_q){
  integer i, dirty, shared, owner_id, req_id, resp_id, trans_id, class_id, no_copyback;
  int is_split;

  //this is cos there's a four cycle delay between the jpacks on the bus and flow control state changing
  snoop_q.flow_control_sample_and_delay();
  for (i=0; i<7; i++){
    if (snoop_q.check_ack(i, jpacks[i])){
      if (snoop_q.is_snoop(jpacks[i])){
	if (estar_change)
	  dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "Snoop response sent during estar transition");
	//{{{  handle snoop
	if (snoop_q.add_pack(i, jpacks[i], &dirty, &shared, &req_id, &resp_id, &trans_id, &is_split, &no_copyback, cycle_count)){
	  //pack complete - alter transaction list entry
	  class_id = req_id * MAX_TRANS_ENTRIES + trans_id;
	  owner_id = get_address_owner(transactions[class_id].address);
	  if (shared){
	    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, WRITEMON_FLAG, "%6-s", trans_types[transactions[class_id].type].short_string);
	    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, WRITEMON_FLAG, " %011llx ", transactions[class_id].address);
	    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, WRITEMON_FLAG, " is being shared by other masters\n");
	  }
	  if (dirty){
	    //one ack was dirty - this master will return data
	    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "dirty ACK received from master id %d", resp_id);
	    if (is_split){
	      if (no_copyback){
		dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "necessary data already returned  - nothing more to do");
	      }else{
		dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%6-s", trans_types[transactions[class_id].type].short_string);
		dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " %011llx ", transactions[class_id].address);
		  dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " identifier=%lld", transactions[class_id].transaction_count);
		if (trans_types[transactions[class_id].type].read){
		  dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " will come from master %d - as it holds the cache line\n", resp_id);
		  dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, WRITEMON_FLAG, "requestor %d, responder %d\n", req_id, (int) get_agent_id(resp_id));
		  transactions[class_id].returning_id_valid = 1;
		  transactions[class_id].returning_id = resp_id;
		}else{
		  dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "\n");
		}
	      }
	    }else
	      dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "dirty ack received from port %d for an invalidate\n", resp_id);
	  }else{
	    if (is_split){
	      if (owner_id == req_id){
		//no dirty acks and originator has address locally - no further jbus activity
		dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "No dirty ACKs and owner id %d = requester id - no data to return", owner_id);
		// The sjm might drive data for itself on the bus, although the actual design doesn't - allow either
	      //  transactions[class_id].valid = 0;
		transactions[class_id].possibly_cancelled_read = 1;
		dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%6-s", trans_types[transactions[class_id].type].short_string);
		dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " %011llx ", transactions[class_id].address);
		dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " identifier=%lld", transactions[class_id].transaction_count);
		dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " snoops completed - data comes from local memory\n");
	      }else{
		//no dirty acks and another master has data - it will return it
		dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "No dirty ACKs returning from owner id %d", owner_id);
		transactions[class_id].returning_id_valid = 1;
		transactions[class_id].returning_id = agent_to_id(owner_id);
	      }
	    }else
	      dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "invalidate snoop completed\n");
	  }

	}
	//}}}  
      }else if (snoop_q.is_flow_control(jpacks[i])){
	if (estar_change)
	  dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "flow control token sent during estar transition");
	snoop_q.update_flow_control(i, jpacks[i], cycle_count, local_ports_mask);
	if (jpacks[i] == P_AOK_OFF || jpacks[i] == P_DOK_OFF){
	  /* Allow up to 8 cycles from AOK/DOK on to reqs going back to normal */
	  bus_stalled = 8;
	}
      }else if (jpacks[i] != P_IDLE)
	dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "Invalid jpack[%d] value - was %x", i, jpacks[i]);
    }
  }
  snoop_q.check_snoop_timing(cycle_count, snoop_timeout);
  if (snoop_q.aok_disabled() ||  snoop_q.dok_disabled(-1))
    bus_stalled = 8;
  if (bus_stalled > 0){
    bus_stalled --;
  }
}
//}}}  
//{{{  next cycle
//This bundles all the cycle based stuff into one place
void nessxt_cycle(){
//  if ((cycle_count % 30) == 0)
//    print_header();
//  cycle_count++;
//  bus->j_rst->wait_next_cycle();
  //@1 jbus->j_rst == void;
}
//}}}  
//{{{  next cycle POC
//This bundles all the cycle based stuff into one place
void jbus_mon::next_cycle_POC(int reset){
  BITS jpacks[7];
  int i, outstanding_transactions=0;
  for (i=0; i < MAX_TRANS_ENTRIES * MAX_BUS_MASTERS; i++)
    if (transactions[i].valid == 1 && !transactions[i].possibly_cancelled_read)
      outstanding_transactions++;
  bus->uncompleted_accesses->Update((BITS)outstanding_transactions!=0);
  next_driver_id = current_driver(reqs, current_driver_id_d);

  if (reqs[0] != (bus->j_req_out_l_0->Value(0, 0) == 0) && estar_change)
    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jreq[0] has changed during estar transition");
  if (reqs[1] != (bus->j_req_out_l_1->Value(0, 0) == 0) && estar_change)
    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jreq[1] has changed during estar transition");
  if (reqs[2] != (bus->j_req_out_l_2->Value(0, 0) == 0) && estar_change)
    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jreq[2] has changed during estar transition");
  if (reqs[3] != (bus->j_req_out_l_3->Value(0, 0) == 0) && estar_change)
    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jreq[3] has changed during estar transition");
  if (reqs[4] != (bus->j_req_out_l_4->Value(0, 0) == 0) && estar_change)
    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jreq[4] has changed during estar transition");
  if (reqs[5] != (bus->j_req_out_l_5->Value(0, 0) == 0) && estar_change)
    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jreq[5] has changed during estar transition");
  if (reqs[6] != (bus->j_req_out_l_6->Value(0, 0) == 0) && estar_change)
    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jreq[6] has changed during estar transition");
  reqs[6] = bus->j_req_out_l_6->Value(0, 0) == 0;
  reqs[5] = bus->j_req_out_l_5->Value(0, 0) == 0;
  reqs[4] = bus->j_req_out_l_4->Value(0, 0) == 0;
  reqs[3] = bus->j_req_out_l_3->Value(0, 0) == 0;
  reqs[2] = bus->j_req_out_l_2->Value(0, 0) == 0;
  reqs[1] = bus->j_req_out_l_1->Value(0, 0) == 0;
  reqs[0] = bus->j_req_out_l_0->Value(0, 0) == 0;

  if ((cycle_count % 30) == 0)
    print_header();
  cycle_count++;
  /* If in authur mode, then packets from other bus segments take a cycle longer than
  the reqs, so disable the next_driver signal to match data packet */
  // if (bus->valid_ports->Value(next_driver_id, next_driver_id) || !arthur_mode)
  if (!arthur_mode)
    current_driver_id = next_driver_id;
  else{
    if (current_driver_id != current_driver_id_d){
      current_driver_id = current_driver_id_d;
      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "using delayed req when changing  jids from %d to %d", current_driver_id, next_driver_id);
    }
  }
  current_driver_id_d = next_driver_id;
  for (i=0; i<estar_div; i++){
    bus->j_rst->wait_next_cycle();
    if (bus->j_por->Value() == 0)
      //get out of estar mode ASAP if hard reset
      estar_div = 1;
  }
  if (estar_div != 1)
    dispmon(DISPMON_UNIT      , DISPMON_TAG_DEBUG,       DISPMON_FLAG, "estar j_clk");
  logfile_line_start = 1;
  //@1 jbus->j_rst == void;
  jpacks[0] = bus->j_pack0->Value();
  jpacks[1] = bus->j_pack1->Value();
  jpacks[2] = bus->j_pack2->Value();
  jpacks[3] = bus->j_pack3->Value();
  jpacks[4] = bus->j_pack4->Value();
  jpacks[5] = bus->j_pack5->Value();
  jpacks[6] = bus->j_pack6->Value();
  if (!reset) handle_packs(jpacks);
}
//}}}  
//}}}  
void jbus_mon::jbus_monitor(void)
{  // start of top block
  //typedef class transaction_class;
  transaction_class w_transaction;
  //{{{  variables
  unsigned long long int timeout_base, timeout_top;
  long long int          consecutive_idles_count; //Used to end sim
  long long int idle_timeout;
  char *str;
  bit finished;
  integer src_id,  trans_id, class_id, i, type=TTYPE_IDLE, por_reset, last_type;
  char text_buffer[100];
  unsigned char  be_space[20];
  unsigned char  *byte_enables=be_space;
  BITS current_port_driver;    // Current Jbus master CPU ID
  BITS last_port_driver;       // Last Jbus master CPU ID
  unsigned long long int trans_count = 0;
  //}}}  
  //{{{  setup stuff
  //{{{  init outputs to z
{
  char z_128[129] = {"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
		     "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"};
  char z_8[9] = {"zzzzzzzz"};
  char z_4[5] = {"zzzz"};
  bus->j_ad_out->Update(z_128);
  bus->j_adtype_out->Update(z_8);
  bus->j_adp_out->Update(z_4);
}
//}}}  
 estar_change = 0;
 init_routine (trans_types);
 estar_div = 1;
 por_reset = 0;
 cycle_count = 0;
 snoop_timeout = 100;
 dead_cycles_enabled = 1;
 arthur_mode = 1;
 current_driver_id = 0;
 current_driver_id_d = 0;
 //@,MAX_RESET_TIME jbus->j_rst == 1;
 for (i=0; i<10; i++)
   bus->j_rst->wait_next_cycle();
 sample_valid_masters();
 bus->j_ad->set_display_mode(CHECK_NONE);
 bus->j_adtype->set_display_mode(CHECK_NONE);
 dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "jbus protocol monitor v%s", "1.98");
 consecutive_idles_count = 0;
 bus->bus_is_idle->Update(1);
 //}}}  
 //{{{  plusargs
 if ( mc_scan_plusargs((char *)"jbus_logfile") != NULL){
   logfileid = fopen("j_monitor.dat", "w");
   if (logfileid == NULL){
     logfile_enabled = 0;
     dispmon(DISPMON_UNIT, DISPMON_TAG_WARNING, DISPMON_FLAG, "Cannot open j_bus.dat for writing");
   }else
     logfile_enabled = 1;
 }
 if ((str = mc_scan_plusargs((char *)"jbus_snoop_timeout")) != NULL){
   if (mc_scan_plusargs((char *)"jbus_snoop_timeout_") != NULL){
     char buff[50];
     int a;
     for(i=0; i<10; i++){
       sprintf(buff, "jbus_snoop_timeout_%d_", i);
       if ((str = mc_scan_plusargs(buff)) != NULL){
	 a = atoi(str);
	 if (a > snoop_timeout){
	   snoop_timeout = a;
	   dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "setting snoop timeout to %d", snoop_timeout);
	 }
       }
     }
   }else{
     snoop_timeout = atoi(str);
     dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "set snoop timeout to %d", snoop_timeout);
   }
 }
 if ((str = mc_scan_plusargs((char *)"jbus_rd_timeout_base_")) != NULL){
   timeout_base = strtoll(str, NULL, 16);
   dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "setting allowed read timeout start address to %011llx", timeout_base);
 }
 if ((str = mc_scan_plusargs((char *)"jbus_rd_timeout_top_")) != NULL){
   timeout_top = strtoll(str, NULL, 16);
   dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "setting allowed read timeout end address to %011llx", timeout_top);
 }
 if ((str = mc_scan_plusargs((char *)"jbus_max_idle_cycles")) != NULL){
   idle_timeout = strtoll(str, NULL, 10);
   dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "will time out after %0lld idle cycles", idle_timeout);
 }else
   idle_timeout = -1;
 
 if (mc_scan_plusargs((char *)"estar_soft_reset") != NULL)
   reset_estar_on_soft_reset = 1;
 else
   reset_estar_on_soft_reset = 0;
 //}}}  
 while (1){
   if (consecutive_idles_count == idle_timeout && idle_timeout != -1)
     dispmon(DISPMON_UNIT_IDLE, DISPMON_TAG_ERROR,  DISPMON_FLAG, "%lld consecutive idle jbus cycles", consecutive_idles_count);
   //{{{  reset stuff
   while (bus->j_rst->Value() == 0){
     if (bus->j_por->Value() == 1){
       next_cycle_POC(1);
     }else{
       bus->j_rst->wait_next_cycle();
       dead_cycles_enabled = 1;
       arthur_mode = 1;
       estar_div = 1;
       por_reset = 1;
     }
     if (bus->j_rst->Value() == 1){
       if (!por_reset){
	 //{{{  work out dead cycle behavior
	 if (mc_scan_plusargs((char *)"default_dead") != NULL){
	   dead_cycles_enabled = 1;
	   arthur_mode = 1;
	 }
	 if (mc_scan_plusargs((char *)"default_nosample_dead") != NULL){
	   dead_cycles_enabled = 1;
	   arthur_mode = 0;
	 }
	 
	 // if (mc_scan_plusargs((char *)"default_nodead") != NULL){
	 //  dead_cycles_enabled = 0;
	 //  arthur_mode = 0;
	 // }
	 
	 // shasta_default behavior (default_nodead) occurs by default
	 dead_cycles_enabled = 0;
	 arthur_mode = 0;
	 
	 
	 if (mc_scan_plusargs((char *)"dead") != NULL){
	   dead_cycles_enabled = 1;
	   arthur_mode = 1;
	 }
	 if (mc_scan_plusargs((char *)"nosample_dead") != NULL){
	   dead_cycles_enabled = 1;
	   arthur_mode = 0;
	 }
	 if (mc_scan_plusargs((char *)"nodead") != NULL){
	   dead_cycles_enabled = 0;
	   arthur_mode = 0;
	 }
	 
	 //}}}  
	 if (reset_estar_on_soft_reset)
	   last_estar_div = -1;
	 dispmon(DISPMON_UNIT, 0, DISPMON_FLAG, "soft reset detected - bus mode is now : arthur mode=%d, dead cycles=%d, estar_div=%d", arthur_mode, dead_cycles_enabled, estar_div);
       }else{
	 last_estar_div = 1;
	 dispmon(DISPMON_UNIT, 0, DISPMON_FLAG, "hard reset detected - bus mode is now : arthur mode=%d, dead cycles=%d, estar_div=%d", arthur_mode, dead_cycles_enabled, estar_div);
       }
       consecutive_idles_count = 0;
       por_reset = 0;
       local_ports_mask = bus->valid_ports->Value(6, 0);
       snoop_q.reset(local_ports_mask);
       for (i=0; i < MAX_TRANS_ENTRIES * MAX_BUS_MASTERS; i++)
	 transactions[i].valid = 0;
       /*Workaround for sjm jpack delay stuff. Decide if ports are there or
	 not a bit later */
       if ( mc_scan_plusargs((char *)"delay_sjm_jpack_signal") == NULL)
	 sample_valid_masters();
       next_cycle_POC();
       if ( mc_scan_plusargs((char *)"delay_sjm_jpack_signal") != NULL){
	 next_cycle_POC();
	 sample_valid_masters();
       }
       current_driver_id = 0;
       current_driver_id_d = 0;
       type = TTYPE_IDLE;
       bus_stalled = 0;
     }
   }
   //}}}  
   //{{{  decode type
   print_start_of_line();
   if (bus->j_adtype->Value_c() == 'x' || bus->j_adtype->Value_c() == 'z')
     dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "invalid adtype in address cycle - %c", bus->j_adtype->Value_c());
   if (bus->j_adtype->Value( 7, 6) == 3){
     //{{{  address/write transaction
     /*Get transaction type out of address bus*/
     last_type = type;
     type = bus->j_ad->Value( 47, 43) & 0x1f;
     if (!trans_types[type].valid)
       dispmon(DISPMON_UNIT_INVALID_CODE, DISPMON_TAG_ERROR, DISPMON_FLAG, "invalid transaction code in address cycle - %d", type);
     if (type != TTYPE_IDLE){
       if(type == TTYPE_WRM){ //Niagara support
	 dispmon("jbus_mon_sjm_style", 9, DISPMON_FLAG, "Executing %s: address=0x%0llllx agent=0x%x orb=%d mask=0x%016llx",
		 trans_types[type].short_string, bus->j_ad->Value( 42, 0), (int) bus->j_adtype->Value( 5, 2), (int) bus->j_adtype->Value( 1, 0),  bus->j_ad->Value( 127, 64));
       }else{       
	 dispmon("jbus_mon_sjm_style", 9, DISPMON_FLAG, "Executing %s: address=0x%0llllx agent=0x%x orb=%d mask=0x%04x",
		 trans_types[type].short_string, bus->j_ad->Value( 42, 0), (int) bus->j_adtype->Value( 5, 2), (int) bus->j_adtype->Value( 1, 0),  (int) bus->j_ad->Value( 63, 48));
       }

       bus->bus_is_idle->Update((BITS)0);
       //{{{  get address info
       LOG_TO_FILE "Master id : %d\n", (int) bus->j_adtype->Value( 5, 2));
       LOG_TO_FILE "Trans  id: %d\n", (int) bus->j_adtype->Value( 1, 0));
       LOG_TO_FILE "Address : %011llx\n", bus->j_ad->Value( 42, 0));
       LOG_TO_FILE "Transaction : %s\n", trans_types[type].long_string);

       for (i=0; i<16; i++)
	 byte_enables[i] = bus->j_ad->Value(48+i, 48+i);
       
       src_id = (int) bus->j_adtype->Value( 5, 2);
       trans_id = (int) bus->j_adtype->Value( 1, 0);
       class_id = src_id * MAX_TRANS_ENTRIES + trans_id;
       if (trans_types[type].memory_operation){
	 if (snoop_q.aok_disabled()){
	   dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "Attempted to send an address when AOK is disabled");
	 }
	 if (trans_types[type].read){
	   if (transactions[class_id].possibly_cancelled_read == 0 && transactions[class_id].valid == 1){
	     if (timeout_base <= transactions[class_id].address && transactions[class_id].address < timeout_top){
	       dispmon(DISPMON_UNIT_REUSE, DISPMON_TAG, DISPMON_FLAG, "reusing a transaction id. Last access with this tid (to %011llx, id = %lld) assumed to have timed out", transactions[class_id].address, transactions[class_id].transaction_count);
	     }else{
	       if (!transactions[class_id].snoop_result_known && transactions[class_id].type == TTYPE_OWN){
		 dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "transaction id reused by jbus master (%d) before we are finished. OK because previous op was OWN", current_driver_id);
		 snoop_q.close_snoop_entry(&transactions[class_id]);
	       }else
		 dispmon(DISPMON_UNIT_REUSE, DISPMON_TAG_ERROR, DISPMON_FLAG, "reusing a transaction id which is still active port = %d, id = %d, identifier = %lld - could be due to a previous read timeout", src_id, trans_id, transactions[class_id].transaction_count);
	     }
	   }
	   //{{{  save split transaction data
	   /*Only store transaction info on read commands*/
	   transactions[class_id].address = bus->j_ad->Value( 42, 4) << 4; /* Don't store a[3:0] as they are debug bits */
	   for (i=0; i<16; i++)
	     transactions[class_id].byteenables[i] = byte_enables[i];
	   transactions[class_id].type = type;
	   transactions[class_id].time_lo = tf_gettime();
	   transactions[class_id].possibly_cancelled_read = 0;
	   transactions[class_id].valid = 1;
	   transactions[class_id].transaction_count = trans_count;
	   //}}}  
	   
	   if (!compare_agent_to_jbus_id(src_id, current_driver_id)){
	     dispmon(DISPMON_UNIT_RD_SRCID, DISPMON_TAG_ERROR, DISPMON_FLAG, "source id field of read transaction (%d) does not correspond to current driver (%d)", src_id, (int) get_agent_id(current_driver_id));
	   }
	 }
	 if (trans_types[type].write){
	   //{{{  not split - just hang on to the info
	   w_transaction.address = bus->j_ad->Value( 42, 4) << 4;
	   for (i=0; i<16; i++)
	     w_transaction.byteenables[i] = byte_enables[i];
	   w_transaction.type = type;
	   //}}}  
	   if (type == TTYPE_WRB || type == TTYPE_WRBC){
	     if ((last_type != TTYPE_RD && last_type != TTYPE_RDS && last_type != TTYPE_RDSA && last_type != TTYPE_RDO))
	       dispmon(DISPMON_UNIT_WRBERR, DISPMON_TAG_ERROR, DISPMON_FLAG, "%s is not following a cacheable read - last transaction was %s", trans_types[type].long_string, trans_types[last_type].long_string);
	     if (snoop_q.search_snoop_queue(w_transaction.address)){
	       dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "%s to a line with an active snoop on it", trans_types[type].long_string);
	     }
	     for (i=0; i<MAX_TRANS_ENTRIES * MAX_BUS_MASTERS; i++){
	       if ((w_transaction.address & ~0x3f) == (transactions[i].address & ~0x3f) && transactions[i].valid &&  transactions[i].snoop_result_known){
		 dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG,
			 "%s to a line which has a pending read to it, read was identifier=%lld", trans_types[type].long_string, transactions[i].transaction_count);
	       }
	     }
	   }
	 }
	 
	 if (trans_types[type].snoop){
	   snoop_q.add_transation(src_id, trans_id, trans_types[type].read, &transactions[class_id], cycle_count);
	 }
	 if (!trans_types[type].read && !trans_types[type].write && type != TTYPE_INV){
	   dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "Internal - attempted to start a memory transation which was neither a read or a write");
	 }
       }
       //}}}  
       //breakpoint;
       if (trans_types[type].split_transaction || trans_types[type].length > 1 || ! trans_types[type].memory_operation)
	 {
	   line_start();
	   dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "started %s agent_id=%0d, ", trans_types[type].long_string, src_id);
	   if (type != TTYPE_XIR && type != TTYPE_FREEZE && type != TTYPE_FREEZEACK && type != TTYPE_CHANGE){
	     if (type != TTYPE_INTACK && type != TTYPE_INTNACK)
	       dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "transaction_id=%0d ", trans_id);
	     dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "address=%010llx0, identifier=%lld, dbg=%x", bus->j_ad->Value( 42, 4), trans_count,  (int) bus->j_ad->Value( 3, 0));
	   }
	   dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "\n");
	 }
       if (type == TTYPE_INT || type == TTYPE_INTACK || type == TTYPE_INTNACK){
	 if (!compare_agent_to_jbus_id(src_id, current_driver_id)){
	   dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "source id field of interrupt transaction (%d) does not correspond to current driver (%d)", src_id, (int) get_agent_id(current_driver_id));
	 }
	 //For Niagara Support
	 //The new JBI ERS.0.5 specifies that any of the 32 cpus can be an INT target
	 // and an INT(N)ACK source.
	 if(type == TTYPE_INTACK || type == TTYPE_INTNACK){//For Niagara Support
	   if (!snoop_q.is_present(agent_to_id(bus->j_ad->Value( 40, 36))))
	     dispmon(DISPMON_UNIT_MEM, DISPMON_TAG_ERROR, DISPMON_FLAG, "interrupt target id %x maps to a nonexistent jbus agent", (int) bus->j_ad->Value( 40, 36));
	 }

	 if(type == TTYPE_INT){//For Niagara Support
	   if (!snoop_q.is_present(agent_to_id(bus->j_ad->Value( 35, 31))))
	     dispmon(DISPMON_UNIT_MEM, DISPMON_TAG_ERROR, DISPMON_FLAG, "interrupt src id %x maps to a nonexistent jbus agent", (int) bus->j_ad->Value( 35, 31));
	 }

	 w_transaction.address = bus->j_ad->Value( 42, 4) << 4;
       }else if (!snoop_q.is_present(agent_to_id(get_address_owner(bus->j_ad->Value( 42, 0)))))
	 dispmon(DISPMON_UNIT_MEM_PORT, DISPMON_TAG_ERROR, DISPMON_FLAG, "address %011llx maps to a nonexistent jbus port (%d)", bus->j_ad->Value( 42, 0), agent_to_id(get_address_owner(bus->j_ad->Value( 42, 0))) );
       if (trans_types[type].memory_operation && trans_types[type].write){
	 if (snoop_q.dok_disabled(agent_to_id(get_address_owner(w_transaction.address)))){
	   dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "Attempted to do a write transaction to id %d, when DOK was disabled", (int) get_address_owner(w_transaction.address) );
	 }
       }
       if (trans_types[type].memory_operation && trans_types[type].write || type == TTYPE_INT){
	 if (trans_types[type].length == 2){
	   //{{{  single cycle write
	   
	   next_cycle_POC();
	   print_start_of_line();
	   line_start();
	   LOG_TO_FILE "Data : %s\n", construct_data(text_buffer, byte_enables));
	 
	 dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%6-s ", trans_types[type].short_string);
	 dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " %011llx ", w_transaction.address);
	 dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, construct_data(text_buffer, byte_enables));
	 
	 //}}}  
	 dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "\n");
       }else if (trans_types[type].length == 5){
	 //{{{  cache writeback or block
	 int ue_ecc = 0;
	 for (i=0; i<4; i++){
	   next_cycle_POC();
	   print_start_of_line();
	   LOG_TO_FILE "Data : %016llx%016llx\n", bus->j_ad->Value(127, 64), bus->j_ad->Value(63, 0));
	 w_transaction.data[i].hi = bus->j_ad->Value(127, 64);
	 w_transaction.data[i].lo = bus->j_ad->Value(63, 0);
	 if (bus->j_adtype->Value(4, 4) == 1)
	   ue_ecc = i+1;
       }
       
       //line_start();
       dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%6-s", trans_types[type].short_string);
       dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " %011llx ", w_transaction.address);
       for (i=0; i<4; i++)
	 dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%016llx%016llx", w_transaction.data[i].hi, w_transaction.data[i].lo);
       if (ue_ecc)
	 dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " UE ECC %d", ue_ecc);
       dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "\n");
       if (ue_ecc)
	 dispmon(DISPMON_UNIT_ECCERR, DISPMON_TAG_ERROR, DISPMON_FLAG, "ECC error packet generated by agent id %d", current_driver_id);
       
       //}}}  
     }else{
       dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "attempted to do a write transaction of %d cycles", trans_types[type].length);
     }
   }else if (type == TTYPE_CHANGE){
     handle_estar_change();
   }
   trans_count++;
 }
 //}}}  
}else if (bus->j_adtype->Value( 7, 6) == 2){
  type = TTYPE_RET_16;
  bus->bus_is_idle->Update((BITS)0);
  //{{{  read 16
  LOG_TO_FILE "Master id : %d\n", current_driver_id);
  LOG_TO_FILE "Return id : %d\n", (int)bus->j_adtype->Value( 5, 2));
  LOG_TO_FILE "Trans id : %d\n", (int)bus->j_adtype->Value( 1, 0));
  LOG_TO_FILE "Data type : %s\n", trans_types[type].long_string);
  LOG_TO_FILE "Data : %016llx%016llx\n", bus->j_ad->Value(127, 64), bus->j_ad->Value(63, 0));

  src_id = bus->j_adtype->Value( 5, 2);
  trans_id = bus->j_adtype->Value( 1, 0);
  class_id = src_id * MAX_TRANS_ENTRIES + trans_id;
  if (transactions[class_id].valid == 1){
    if (transactions[class_id].type != TTYPE_NCRD)
	  dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, " RD1 packet from %0d <unknown address> the request transaction for this tid (%s) shouldn't get a 1 cycle read return", current_driver_id, trans_types[transactions[class_id].type].short_string);
	line_start();
	/*Get information from read request */
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%6-s", trans_types[transactions[class_id].type].short_string);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " %011llx ", transactions[class_id].address);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, construct_data(text_buffer, transactions[class_id].byteenables));
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " driver=%0d", current_driver_id);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " identifier=%lld", transactions[class_id].transaction_count);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " start time=%0d", transactions[class_id].time_lo);
      }else{
        if ((current_driver_id==0) && (trans_id==0) && (src_id==4)) {
	    dispmon(DISPMON_UNIT_DBGCYC, DISPMON_TAG_ERROR, DISPMON_FLAG, " JBI Debug Cycle (RD1 packet from %0d, trans_id=%d, to=%d - no corresponding read request for this data %016llx%016llx)",
	   current_driver_id, trans_id, src_id, bus->j_ad->Value(127, 64), bus->j_ad->Value(63, 0));
        } else {
	    dispmon(DISPMON_UNIT_UNEXP_DR, DISPMON_TAG_ERROR, DISPMON_FLAG, " RD1 packet from %0d, trans_id=%d, to=%d - no corresponding read request for this data %016llx%016llx",
	   current_driver_id, trans_id, src_id, bus->j_ad->Value(127, 64), bus->j_ad->Value(63, 0));
        }
      }
      transactions[class_id].valid = 0;


      //}}}  
      dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "\n");
    }else if (bus->j_adtype->Value( 7, 6) == 1){
      type = TTYPE_RET_64;
      bus->bus_is_idle->Update((BITS)0);
      //{{{  read 64
      {
      char install_state;
      int req_type, ue_ecc=0, ce_ecc=0, disable_driver_compare=0;
      src_id = bus->j_adtype->Value( 5, 2);
      trans_id = bus->j_adtype->Value( 1, 0);
      class_id = src_id * MAX_TRANS_ENTRIES + trans_id;
      transactions[class_id].data[0].hi = bus->j_ad->Value(127, 64);
      transactions[class_id].data[0].lo = bus->j_ad->Value(63, 0);
      LOG_TO_FILE "Master id : %d\n", current_driver_id);
      LOG_TO_FILE "Return to : %d\n", bus->j_adtype->Value( 5, 2));
      LOG_TO_FILE "Trans id : %d\n", bus->j_adtype->Value( 1, 0));
      LOG_TO_FILE "Data type : %s\n", trans_types[type].long_string);
      LOG_TO_FILE "Data : %016llx%016llx\n", bus->j_ad->Value(127, 64), bus->j_ad->Value(63, 0));
      req_type = transactions[class_id].type;
      if (transactions[class_id].valid == 1){
	if (!(trans_types[req_type].snoop && trans_types[req_type].read) && req_type != TTYPE_NCBR)
	  dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, " RD4 packet from %0d <unknown address> the request transaction for this tid (%s) shouldn't get a 4 cycle read return", current_driver_id, trans_types[req_type].short_string);
      }else{
	dispmon(DISPMON_UNIT_UNEXP_DR, DISPMON_TAG_ERROR, DISPMON_FLAG, " RD4 packet from %0d <unknown address> - no corresponding read request for this data", current_driver_id);
      }

      for (i=1; i<4; i++){
	next_cycle_POC();
	print_start_of_line();
	if (bus->j_adtype->Value( 7, 7) != 0)
	  dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "adtype[7] high during read data return cycle");
	if (bus->j_adtype->Value( 4, 3) != 0){
	  if (bus->j_adtype->Value( 4, 3) == 2)
	    ue_ecc = i+1;
	  if (bus->j_adtype->Value( 4, 3) == 1)
	    ce_ecc = i+1;
	  if ( bus->j_adtype->Value( 4, 3) == 3)
	    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "bad adtype[4:3] bits[%b]",  bus->j_adtype->Value( 4, 3));
	}
	if (i == 1){
	  if (bus->j_adtype->Value( 6, 5) != 0){
	    ue_ecc |= bus->j_adtype->Value( 6, 5) == 2;
	    ce_ecc |= bus->j_adtype->Value( 6, 5) == 1;
	    if (bus->j_adtype->Value( 6, 5) == 3)
	      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "bad adtype[6:5] bits[%b]",  bus->j_adtype->Value( 6, 5));
	    }
	  //{{{  cache state
	  LOG_TO_FILE" Cache state :");
	  switch (bus->j_adtype->Value( 2, 0)){
	    case 0:LOG_TO_FILE "I\n");
	      install_state = 'I';
	      // Niagara: ttype RD is now being aliased to RDD.  As a result, RD
	      // transactions will be installed in state I.
	      // if (req_type != TTYPE_RDD && req_type != TTYPE_NCBR)
	      if (req_type != TTYPE_RD && req_type != TTYPE_RDD && req_type != TTYPE_NCBR)
		dispmon(DISPMON_UNIT_INSTALL, DISPMON_TAG_ERROR, DISPMON_FLAG, "attempted to install %s transaction in state I. address %011llx, driver=%0d, identifier=%lld", trans_types[req_type].short_string, transactions[class_id].address, current_driver_id, transactions[class_id].transaction_count);
	    break;
	    case 1:LOG_TO_FILE "S\n");
	      install_state = 'S';
	      if (req_type != TTYPE_RDS && req_type != TTYPE_RDSA)
		dispmon(DISPMON_UNIT_INSTALL, DISPMON_TAG_ERROR, DISPMON_FLAG, "attempted to install %s transaction in state S. address %011llx, driver=%0d, identifier=%lld", trans_types[req_type].short_string, transactions[class_id].address, current_driver_id, transactions[class_id].transaction_count);
	    break;
	    case 3:LOG_TO_FILE "E\n");
	      install_state = 'E';
	      if (req_type != TTYPE_RDS && req_type != TTYPE_RD)
		dispmon(DISPMON_UNIT_INSTALL, DISPMON_TAG_ERROR, DISPMON_FLAG, "attempted to install %s transaction in state E. address %011llx, driver=%0d, identifier=%lld", trans_types[req_type].short_string, transactions[class_id].address, current_driver_id, transactions[class_id].transaction_count);
	    break;
	    case 7:LOG_TO_FILE "M\n");
	      install_state = 'M';
	      if (req_type != TTYPE_RDO && req_type != TTYPE_OWN)
		dispmon(DISPMON_UNIT_INSTALL, DISPMON_TAG_ERROR, DISPMON_FLAG, "attempted to install %s transaction in state M. address %011llx, driver=%0d, identifier=%lld", trans_types[req_type].short_string, transactions[class_id].address, current_driver_id, transactions[class_id].transaction_count);
	    break;
	    default:LOG_TO_FILE "%d?????????\n", (int)bus->j_adtype->Value( 2, 0));
	      dispmon(DISPMON_UNIT_INSTALL, DISPMON_TAG_ERROR, DISPMON_FLAG, "bad install state %d for %s transaction. address %011llx, driver=%0d, identifier=%lld",  (int)bus->j_adtype->Value( 2, 0), trans_types[req_type].short_string, transactions[class_id].address, current_driver_id, transactions[class_id].transaction_count);
	    break;
	  }


	  //}}}  
	}else{
	  if (bus->j_adtype->Value( 7, 5) != 0 || bus->j_adtype->Value( 2, 0) != 0)
	    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "adtype[7,6,5,2,1,0] must be zero during last two cycles of read data return");
	}
	LOG_TO_FILE "Data : %016llx%016llx\n", bus->j_ad->Value(127, 64), bus->j_ad->Value(63, 0));
	transactions[class_id].data[i].hi = bus->j_ad->Value(127, 64);
	transactions[class_id].data[i].lo = bus->j_ad->Value(63, 0);
      }

      line_start();
      if (transactions[class_id].valid == 1){
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%6-s", trans_types[req_type].short_string);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " %011llx ", transactions[class_id].address);
      }
      for (i=0; i<4; i++)
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%016llx%016llx", transactions[class_id].data[i].hi, transactions[class_id].data[i].lo);

      if (transactions[class_id].valid == 1){
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " driver=%0d", current_driver_id);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " state = %c", install_state);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " identifier=%lld", transactions[class_id].transaction_count);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " start time=%0d", transactions[class_id].time_lo);
	if (ue_ecc)
	  dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " UE ECC %d", ue_ecc);
	if (ce_ecc)
	  dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " CE ECC %d", ce_ecc);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "\n");
	if (trans_types[req_type].snoop){
	  if (!transactions[class_id].snoop_result_known && trans_types[req_type].snoop){
	    dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "return data from jbus master (%d) before we have all the snoop reponses", current_driver_id);
	    disable_driver_compare = 1;
	  }
	  snoop_q.close_snoop_entry(&transactions[class_id]);
	}
	if (transactions[class_id].possibly_cancelled_read){
	  dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "This readdata is not necessary - the driver is also the requester, so it will be routed internally");
	}else if (req_type == TTYPE_RD){
	  int owner_id = get_address_owner(transactions[class_id].address);
	  owner_id = agent_to_id(owner_id);
	  if (owner_id != current_driver_id){
	    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "read return for RD transaction must come from memory. This came from port %d", owner_id);
	  }else{
	    dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "read return for RD transaction coming from memory");
	  }
	}else if (transactions[class_id].returning_id != current_driver_id && trans_types[req_type].snoop){
	  if (!disable_driver_compare)
	    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "return data did not come correct jbus master - snoop (%d), arbitration (%d)", transactions[class_id].returning_id, current_driver_id);
	}
	transactions[class_id].valid = 0;
      }else
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "\n");
      if (ue_ecc || ce_ecc)
	dispmon(DISPMON_UNIT_ECCERR, DISPMON_TAG_ERROR, DISPMON_FLAG, "ECC error packet generated by agent id %d", current_driver_id);

      }
      //}}}  
    }else if (bus->j_adtype->Value( 7, 6) == 0){
      type = TTYPE_RET_ERR;
      bus->bus_is_idle->Update((BITS)0);
      //{{{  error
      line_start();
      src_id = bus->j_adtype->Value( 5, 2);
      trans_id = bus->j_adtype->Value( 1, 0);
      class_id = src_id * MAX_TRANS_ENTRIES + trans_id;
      dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%6-s", trans_types[type].short_string);
      if (transactions[class_id].valid == 1){
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " %011llx ", transactions[class_id].address);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " data:%016llx%016llx, source id:%d, trans no:%d",
	  bus->j_ad->Value(127, 64), bus->j_ad->Value(63, 0),  src_id, trans_id);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " driver=%0d", current_driver_id);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " identifier=%lld", transactions[class_id].transaction_count);
      }else{
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " identifier=???");
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " driver=%0d", current_driver_id);
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, " data:%016llx%016llx, source id:%d, trans no:%d",
	  bus->j_ad->Value(127, 64), bus->j_ad->Value(63, 0),  src_id, trans_id);
      }
      dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "\n");
      if (!transactions[class_id].valid ){
	dispmon(DISPMON_UNIT_RDERR, DISPMON_TAG_ERROR, DISPMON_FLAG, "read error packet does not match to an outstanding read access");
      }
      transactions[class_id].valid = 0;
      dispmon(DISPMON_UNIT_RDERR, DISPMON_TAG_ERROR, DISPMON_FLAG, "read error packet generated by agent id %d", current_driver_id);

      LOG_TO_FILE "Master id : %d\n", current_driver_id);
      LOG_TO_FILE "Return to : %d\n", bus->j_adtype->Value( 5, 2));
      LOG_TO_FILE "Trans id : %d\n", bus->j_adtype->Value( 1, 0));
      LOG_TO_FILE "Data type : %s\n", trans_types[type].long_string);
      LOG_TO_FILE "Data : %016llx%016llx\n", bus->j_ad->Value(127, 64), bus->j_ad->Value(63, 0));
      //}}}  
    }else{
      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "invalid adtype[7:6] in address cycle");
      type = TTYPE_IDLE;
    }
    trans_types[type].number_executed++;

    //}}}  
    next_cycle_POC();
    bus->bus_is_idle->Update(1);
    //{{{  stop if idle too long
    if (idle_timeout != -1){
      if (type == TTYPE_IDLE) {
	 consecutive_idles_count++;
      }else{
	 consecutive_idles_count = 0;
      }
    }
    //}}}  
    /* Allow multiple dead cycles if A/DOK off now, or was off at end of last transaction*/
    /*This happens because ports deassert their req without driving if they get blocked */
    if (!bus->j_ad->Valid() && !bus->j_adp->Valid() && !bus->j_adtype->Valid() && dead_cycles_enabled && !arthur_mode && (bus->j_por->Value() == 1) && bus->j_rst->Value() == 1){
      type = TTYPE_IDLE;
      //probably a dead cycle
      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "jbus dead cycle");
      next_cycle_POC();
      //extra dead cycles can occur when dead cycles get disabled and port deassert their reqs
      while (!bus->j_ad->Valid() && !bus->j_adp->Valid() && !bus->j_adtype->Valid() && bus_stalled){
	next_cycle_POC();
      }
    }
  }
  //terminate;
} // end of program jp_jbus_mon

//{{{  startup/finish routines
void jbus_mon::finish(void){
  int i;
  long int invalid_ones=0, outstanding_transactions=0, first_id;
  for (i=0; i < MAX_TRANS_ENTRIES * MAX_BUS_MASTERS; i++)
    //read snoops may cause a transaction marked as valid to just disappear, so ignore them in this count.
    if (transactions[i].valid == 1 && !transactions[i].possibly_cancelled_read)
      outstanding_transactions++;
  if (outstanding_transactions){
    dispmon(DISPMON_UNIT, DISPMON_TAG_WARNING, DISPMON_FLAG, "there are still %d jbus transactions outstanding", outstanding_transactions);
    dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "there are still %d jbus transactions outstanding", outstanding_transactions);
    dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "identifiers of transactions : ");
    for (i=0; i < MAX_TRANS_ENTRIES * MAX_BUS_MASTERS; i++){
      if (transactions[i].valid == 1 && !transactions[i].possibly_cancelled_read){
	dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "%d ", (int) transactions[i].transaction_count);
	first_id = transactions[i].transaction_count;
      }
    }
    dispmon(DISPMON_UNIT, DISPMON_TAG, WRITEMON_FLAG, "\n");
    dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "you can find them by doing, for example : grep identifier=%d verilog.log", (int) first_id);
  }
  if (mc_scan_plusargs((char *)"jbus_mon_stats") != NULL){
    dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "statistics");
    for (i=0; i<40; i++){
      if (trans_types[i].valid){
	dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "%10s%30s      %d", trans_types[i].short_string, trans_types[i].long_string, trans_types[i].number_executed);
      }else
	invalid_ones += trans_types[i].number_executed;
    }
    dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "%40s      %d", "invalid transaction codes", invalid_ones);
    snoop_q.report_statistics();
  }else
    dispmon(DISPMON_UNIT, 0, DISPMON_FLAG, "not printing jbus statistics - use +jbus_mon_stats to enable them");
  if (logfile_enabled)
    fclose (logfileid);
}

void *j_mon_entry(void *arg){
  jbus_mon *info;
  info = (jbus_mon *)arg;
  info->jbus_monitor();
  return NULL;
}
//}}}  
#endif

