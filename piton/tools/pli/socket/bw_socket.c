// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bw_socket.c
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
/*******************************************************************************
    mon_pli.c
********************************************************************************
*
* Definition for tcp client/server program
*/

#include <sys/types.h>
#include <sys/socket.h>
#include <errno.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include "veriuser.h"
#include "acc_user.h"
#include <stdio.h>
#define CMD_BUFSIZE 10240
#define RCV_BUFSIZE 32768
#define SEND_MAX    500
#define STR_BUF     1024
//simics comands
#define PLI_QUIT                0x01    /* None */
#define PLI_SSTEP               0x02    /* %1 th id */
#define PLI_READ_TH_REG         0x03    /* %1 th id, %2 win num, %3 reg num */
#define PLI_READ_TH_CTL_REG     0x04    /* %1 th id, %2 reg num */
#define PLI_READ_TH_FP_REG_I    0x05    /* %1 th id, %2 reg num */
#define PLI_READ_TH_FP_REG_X    0x06    /* %1 th id, %2 reg num */
#define PLI_RTL_DATA            0x07    /* 436 bytes rtl data */
#define PLI_RTL_CYCLE           0x08
#define PLI_WRITE_TH_XCC_REG    0x09
#define PLI_WRITE_TH_REG_HI     10
#define PLI_WRITE_TH_REG        11
#define PLI_WRITE_TH_CTL_REG    0x0c    /* %1 th id, %2 reg num, %3-%10 value */
#define PLI_RETRY               30
#define PLI_FORCE_TRAP_TYPE     15
#define INTR_RECEIVE            106
#define PLI_RESET_TLB_ENTRY     16
#define PLI_INST_TTE            17
#define PLI_DATA_TTE            18
#define TIMESTAMP               19
#define ITLB_SLAM               20
#define DTLB_SLAM               21

#define VER                     88
#define TICK_CMPR               41
#define FPRS                    36
#define CCR                     35
#define TPC                     52
#define TNPC                    62
#define HINTP                   120
#define HPSTATE                 108
#define PSTATE                  44
#define MID                     122
#define CMD                     200
#define SFAR                    125
#define SOFTINT                 95
#define CWP                     89
#define PC                      32
#define     I_TAG_TARGET            143
#define     D_TAG_TARGET            144
#define     I_TSB_PTR_PS0           145
#define     D_TSB_PTR_PS0           146
#define     I_TSB_PTR_PS1           147
#define     D_TSB_PTR_PS1           148
#define     D_TSB_DIR_PTR           149
#define     SFP_REG                 130
#define     WRITE_REG               152
#define     FLOAT_X                 154
#define     FLOAT_I                 153

#define     HTSTATE1                   109
#define     HTSTATE2                   110
#define     HTSTATE3                   111
#define     HTSTATE4                   112
#define     HTSTATE5                   113
#define     HTSTATE6                   114
#define     ISFSR                      123
#define     DSFSR                      124
#define     SFAR                       125
#define     I_TAG_ACCESS               126
#define     D_TAG_ACCESS               127
#define     FSR                        37
#define     WARMRST                    500
//socket head
#include "list.h"
typedef struct sock_handle{
  fd_set fd_rd, fd_wr;
  int    sockfd;
  struct timeval tv;
  char   data[RCV_BUFSIZE+1];
  char   rerv[CMD_BUFSIZE];
  int    len, debug_socket_pli, hyper;
  int    num, dead, read;
  //defined thread context
  struct committed  context[32], context_sec[32], back[32];
  int    flag[32];
  int    max_count, max_recv;  
  buf_head_ptr active, heap, str_active;
  list_head_ptr regval_list, regval_heap, intr_val, phy_list;
  int    wait_val, intr_num[32];
  long long    stamp[32], ccr;
  int    max;
  int    step; 
  long long  intv[32],  drop_val[32], val, good_pc[32],  cwp_val[32], mul_val[32];
  char       intvf[32], cwp_vld[32],  cwp_win[32], float_vld[32];
  int    old[32], drop_which[32], drop_vld[32], drop_win[32], drop_addr[32];
  char   sent,    good_mask_array[32];
  int    val_check, cwp_type[32], float_val[32], float_reg[32];
  char   tpc[32], tnpc[32], pc_vld[32], good_vld[32];
  int    finish_mask, good_mask, sas_mask;
  long long regval[32], regfval[32], spcval[32];
  int    regreg[32], reg_vld[32], reg_win[32], inst_cnt[32], byte[32];
  struct committed  extra_reg[32], extra_sec[32];
  int    req, recv, eight;
  int    noresponse[32], good_mask_vld;   
  long long target_pc[32][2];
  int   drop_reg[32];
  int   softint_off;
  int   find_loop[32];
  int   mmu_reg_off;
  int   fprs;
  
} *sockPtr;
static sockPtr sock, tsock;
static char* symbolic [] = {
"PC",
"NPC",
"Y",
"CCR",
"FPRS",
"FSR",
"ASI",
"TICK",
"GSR",
"TICK_CMPR",
"STICK",
"STICK_CMPR",
"PSTATE",
"TL",
"PIL",
"TPC1",
"TPC2",
"TPC3",
"TPC4",
"TPC5",
"TPC6", "", "", "", "",
"TNPC1",
"TNPC2",
"TNPC3",
"TNPC4",
"TNPC5",
"TNPC6", "", "", "", "",
"TSTATE1",
"TSTATE2",
"TSTATE3",
"TSTATE4",
"TSTATE5",
"TSTATE6","", "", "", "",
"TT1",
"TT2",
"TT3",
"TT4",
"TT5",
"TT6", "", "", "", "",
"TBA",
"VER",
"CWP",
"CANSAVE",
"CANRESTORE",
"OTHERWIN",
"WSTATE",
"CLEANWIN",
"SOFTINT",
"ECACHE_ERROR_ENABLE",
"ASYNCHRONOUS_FAULT_STATUS",
"ASYNCHRONOUS_FAULT_ADDRESS",
"OUT_INTR_DATA0",
"OUT_INTR_DATA1",
"OUT_INTR_DATA2",
"INTR_DISPATCH_STATUS",
"IN_INTR_DATA0",
"IN_INTR_DATA1",
"IN_INTR_DATA2",
"INTR_RECEIVE",
"GL",
"HPSTATE",
"HTSTATE1",
"HTSTATE2",
"HTSTATE3",
"HTSTATE4",
"HTSTATE5",
"HTSTATE6",
"HTSTATE7",
"HTSTATE8",
"HTSTATE9",
"HTSTATE10",
"HTBA",
"HINTP",
"HSTICK_CMPR",
"MID",
"ISFSR",
"DSFSR",
"SFAR",
"I_TAG_ACCESS",
"D_TAG_ACCESS",
"CTXT_PRIM",
"CTXT_SEC",
"SFP_REG",
"I_CTXT_ZERO_PS0",
"D_CTXT_ZERO_PS0",
"I_CTXT_ZERO_PS1",
"D_CTXT_ZERO_PS1",
"I_CTXT_ZERO_CONFIG",
"D_CTXT_ZERO_CONFIG",
"I_CTXT_NONZERO_PS0",
"D_CTXT_NONZERO_PS0",
"I_CTXT_NONZERO_PS1",
"D_CTXT_NONZERO_PS1",
"I_CTXT_NONZERO_CONFIG",
"D_CTXT_NONZERO_CONFIG",
"I_TAG_TARGET",
"D_TAG_TARGET",
"I_TSB_PTR_PS0",
"D_TSB_PTR_PS0",
"I_TSB_PTR_PS1",
"D_TSB_PTR_PS1",
"D_TSB_DIR_PTR",
"VA_WP_ADDR",
"PID"};

//define routine prototype
int remove_dummy(int thread);
int clean_reg(int type, int thread);
int send_socket_nfd(char* send_buf, int len);
//This function is defined at mem.c file.
extern long long access_dram_call(long long addr);
extern long long access_sys_call(int thread, unsigned long long addr);
extern long long get_time();

/*-------------------------------------------------------------------------------
open tcp socket
--------------------------------------------------------------------------------*/
int bw_socket_init_call()
{
  struct sockaddr_in  sin;
  int   csocket, sockfd, status, i;
  char  *pargs;

  sock       = (sockPtr)malloc(sizeof(struct sock_handle));
  pargs      = mc_scan_plusargs ("csocket=");  
  csocket    = atoi(pargs); 
  if(csocket == 0){
    io_printf("Error: Not found socket\n");
    tf_dofinish();
  }
  if((sockfd = socket (AF_INET, SOCK_STREAM, 0)) < 0){
    perror ("client: Can't open stream socket"); 
    tf_dofinish();
  }
  bzero ((char *) &sin, sizeof (sin));
  sin.sin_family      = AF_INET;
  sin.sin_addr.s_addr = htonl (INADDR_ANY);
  sin.sin_port        = htons (csocket);
  if(connect (sockfd, (struct sockaddr *) &sin, sizeof (sin)) < 0){
     perror ("client: Can't connect to in server");
     tf_dofinish();
  }
  status = fcntl(sockfd, F_GETFL, 0);
  status |= O_NONBLOCK;
  fcntl(sockfd, F_SETFL, status);
  sock->sockfd     = sockfd;
  sock->tv.tv_sec  = 0;
  sock->tv.tv_usec = 0;
  sock->len        = 0;
  sock->data[0]    = '\0';
  sock->num        = 0;
  sock->dead       = 0; 
  sock->read       = 0;
  sock->max_count  = 0;
  sock->sent       = 0;
  sock->sas_mask   = 0;
  sock->mmu_reg_off = 0;
  //get the debug flag

  pargs = mc_scan_plusargs ("debug_socket_pli=");  
  if(pargs != (char *) 0) {
      sock->debug_socket_pli = atoi (pargs);
  }
  else sock->debug_socket_pli = 0;
  pargs = mc_scan_plusargs ("softint_off=");  
  sock->softint_off = 0;
  if(pargs != (char *) 0) {
      sock->softint_off = atoi (pargs);
  }
  pargs = mc_scan_plusargs ("max_count=");  
  if(pargs != (char *) 0) {
      sock->max = atoi (pargs);
  }
  pargs = mc_scan_plusargs ("mmu_fiveregs_off=");  
  if(pargs != (char *) 0) {
      sock->mmu_reg_off = atoi (pargs);
  }
  else sock->max = 0;

  pargs = mc_scan_plusargs ("fprs_comp_on=");  
  if(pargs != (char *) 0) {
      sock->fprs = atoi (pargs);
  }
  else sock->fprs = 0;

  sock->active     = (buf_head_ptr)malloc(sizeof(struct buf_head_node));
  sock->heap       = (buf_head_ptr)malloc(sizeof(struct buf_head_node));
  sock->str_active = (buf_head_ptr)malloc(sizeof(struct buf_head_node));
  sock->regval_list= (list_head_ptr)malloc(sizeof(struct list_head_node));
  sock->regval_heap= (list_head_ptr)malloc(sizeof(struct list_head_node));
  sock->intr_val   = (list_head_ptr)malloc(sizeof(struct list_head_node));
  sock->phy_list   = (list_head_ptr)malloc(sizeof(struct list_head_node));

  for(status = 0; status < 32; status++){
    for(i = 0; i < FLOAT_I;i++){
      sock->context[status].vld[i]     = 0;
      sock->context_sec[status].vld[i] = 0;
      sock->extra_reg[status].vld[i]   = 0;
    }
    for(i = 0; i < 64;i++){
      sock->context[status].fvld[i]     = 0;
      sock->context_sec[status].fvld[i] = 0;
      sock->extra_reg[status].fvld[i]   = 0;
      sock->back[status].fvld[i]        = 0;
      sock->extra_sec[status].fvld[i]   = 0; 
    }
    for(i = 0; i < 8;i++){
      sock->context[status].local_vld[i]     = 0;
      sock->context_sec[status].local_vld[i] = 0;
    }
    for(i = 0; i < 32;i++){
       sock->context[status].third_vld[i]     = 0;
       sock->context_sec[status].third_vld[i] = 0;
    }
    sock->back[status].num        = 0;
    sock->context[status].num     = 0;
    sock->context_sec[status].num = 0;
    sock->context[status].win_switch = 0;
    sock->context_sec[status].win_switch = 0;
    sock->flag[status]            = 0;    
    sock->intvf[status]           = 0;
    sock->str_active->vld[status] = 0;
    sock->drop_vld[status]        = 0;
    sock->intr_num[status]        = 0;
    sock->tpc[status]             = 0;
    sock->tnpc[status]            = 0;
    sock->pc_vld[status]          = 0;
    sock->good_vld[status]        = 0;
    sock->reg_vld[status]         = 0;
    sock->inst_cnt[status]        = 0; 
    sock->noresponse[status]      = 0;
    sock->cwp_vld[status]         = 0;
    sock->good_mask_array[status] = 0;
    sock->find_loop[status]       = 0;      
    sock->float_vld[status]       = 0;
  }

  sock->active->head_ptr     = 0;
  sock->active->tail_ptr     = 0;
  sock->heap->head_ptr       = 0;
  sock->heap->tail_ptr       = 0;
  sock->str_active->head_ptr = 0;
  sock->str_active->tail_ptr = 0;
  sock->step                 = 0;
  sock->val_check            = 0;
  sock->wait_val             = 0;
  sock->max_recv             = 0;
  sock->recv                 = 0;
  sock->req                  = 0;
  sock->eight                = 0;
  sock->good_mask_vld        = 0;
}
/*-------------------------------------------------------------------------------
  do the fron operation on the buffer list.
--------------------------------------------------------------------------------*/
buf_node_ptr buf_pop(buf_head_ptr handle)
{
  buf_node_ptr tmp_ptr;

  tmp_ptr          = handle->head_ptr;
  handle->head_ptr = tmp_ptr->next;
  return tmp_ptr;
}
/*-------------------------------------------------------------------------------
  push a node on the buffer list.
--------------------------------------------------------------------------------*/
void buf_push(buf_head_ptr handle, buf_node_ptr* item)
{
  (*item)->next  = 0;//indicates the last record.
  if(handle->head_ptr == 0)
    handle->head_ptr = *item;
  else 
    handle->tail_ptr->next = *item;
  handle->tail_ptr   = *item; 
}
/*-------------------------------------------------------------------------------
   remove leading space or tab.
   if found carriage return, return -1 to indicate anenpty string.
--------------------------------------------------------------------------------*/
int rm_leading_space(char* buf, int index, int max){
  while((index < max) && (buf[index] == ' '  || 
			  buf[index] == '\t' || 
			  buf[index] == ',' ))index++;
  return buf[index] == '\n' || buf[index] == '\0' ? -1 : index;
}
/*-------------------------------------------------------------------------------

--------------------------------------------------------------------------------*/
long long bw_get_value(char* buf, int* index)
{
  long long val = 0;

  while((buf[*index] != ' ') && (buf[*index] != '\0') && (buf[*index] != '\n')){
    val <<= 4;
    val  |= buf[*index] > '9' ? ((buf[*index] & 0xf) + 9) : buf[*index] & 0xf;
    (*index)++;
  }
  return val;
}
/*-------------------------------------------------------------------------------
change alpha to integer.
--------------------------------------------------------------------------------*/
int get_del(char* buf, int* index)
{
  char tmp[10];
  int i = 0;

  while((buf[*index] != ' ') && (buf[*index] != '\0') && (buf[*index] != '\n')){
    tmp[i] =  buf[*index];
    i++;
    (*index)++;
  }
  tmp[i] = '\0';
  return atoi(tmp);
}

/*-------------------------------------------------------------------------------
move secondata to first area.
--------------------------------------------------------------------------------*/
void moveContent(int thread)
{
 
  int i = 0;
  for(i = 0; i < FLOAT_I;i++){
    if(sock->context_sec[thread].vld[i]){
      sock->context[thread].val[i] = sock->context_sec[thread].val[i];
      sock->context[thread].vld[i] = sock->context_sec[thread].vld[i];
      sock->context[thread].win[i] = sock->context_sec[thread].win[i];
      sock->context_sec[thread].vld[i] = 0;
    }
  }
  for(i = 0; i < 8;i++){//secondary local register when restore or cansave is executed.
    if(sock->context_sec[thread].local_vld[i]){
      sock->context[thread].local_val[i] = sock->context_sec[thread].local_val[i];
      sock->context[thread].local_vld[i] = sock->context_sec[thread].local_vld[i];
      sock->context[thread].local_win[i] = sock->context_sec[thread].local_win[i];
      sock->context_sec[thread].local_vld[i] = 0;
    }
  }
  for(i = 0; i < 32;i++){
    sock->context[thread].third_val[i] = sock->context_sec[thread].third_val[i];
    sock->context[thread].third_vld[i] = sock->context_sec[thread].third_vld[i];
    sock->context[thread].third_win[i] = sock->context_sec[thread].third_win[i];
    sock->context_sec[thread].third_vld[i] = 0;
  }
  for(i = 0; i < 64;i++){
    if(sock->context_sec[thread].fvld[i]){
      sock->context[thread].fp[i]   = sock->context_sec[thread].fp[i];
      sock->context[thread].fvld[i] = sock->context_sec[thread].fvld[i];
      sock->context[thread].win[i]  = sock->context_sec[thread].win[i];
      sock->context_sec[thread].fvld[i] = 0;
    }
    if(sock->back[thread].fvld[i] &&
       sock->back[thread].num ){
      sock->back[thread].fvld[i] = 0;
      sock->back[thread].num--;
    }
  }
  sock->context[thread].num        = sock->context_sec[thread].num;
  sock->context_sec[thread].num    = 0;
  sock->context[thread].win_switch = sock->context_sec[thread].win_switch;
}
/*-------------------------------------------------------------------------------
remove dummy muls data.
--------------------------------------------------------------------------------*/
int remove_muls(int thread,
		int type,
		int win,
		long long val)
{


  if(sock->drop_vld[thread] == 0)return 0;  
  type         = sock->drop_addr[thread];
  win          = sock->drop_win[thread];

  if(sock->context[thread].vld[type]          && 
     (win == sock->context[thread].win[type]) && 
     (val == sock->mul_val[thread]) &&
     (type > 0) && (type < 32)) {
    sock->context[thread].vld[type] = 0;
    sock->drop_vld[thread]          = 0;
    sock->context[thread].num--;
    io_printf("(%0lld):Info: removed speculted muls data thread(%d) reg(%d) val(%llx)\n", 
	      get_time(), thread, type, sock->context[thread].val[type] );
    return 1;
  }
  return 0;
}
/*-------------------------------------------------------------------------------
save drop data. it is called by list file.
--------------------------------------------------------------------------------*/
void  mul_data(int thread, int loc)
{
  int val0, val1;
  long long vall, valh;
  val0   = tf_getlongp(&val1, loc);
  vall = val0;
  valh = val1;
  valh <<= 32;
  valh  &= 0xffffffff00000000;
  vall  &= 0x00000000ffffffff;
  sock->mul_val[thread]   = valh | vall;
}
/*-------------------------------------------------------------------------------
extract the updated data from simisc.
--------------------------------------------------------------------------------*/
void what_trigger(char* buf, int len)
{
  long long val;
  int      thread, index, begin, reg, win, fp, i, flag, pc, t_val;
  list_node_ptr node;
  index = 0;
  begin = 1;  
  flag  = 1;

  io_printf("InFo(%0lld):STEP: %s", get_time(), buf);
  while(len > index){
    index  = rm_leading_space(buf, index, len);
    thread = get_del(buf, &index);//get_value(buf, &index);
    index  = rm_leading_space(buf, index, len);
    if(begin && sock->context[thread].num){
      flag = 0;
      if(sock->context_sec[thread].num){//here, need to fix.
	moveContent(thread);
	if((sock->context[thread].vld[SOFTINT] == 0) && 
	   (remove_dummy(thread) == 0)){//no leftover
	  sock->flag[thread] = 1; 
	  return;
	} 
      }
    }
    else if((sock->context[thread].num == 0) && 
	    sock->context_sec[thread].num    && 
	    begin){
      flag = 0;
      moveContent(thread);
    }
    if(begin){
      sock->context[thread].more                = 0;	
      if(flag)sock->context[thread].win_switch  = 0;
      else sock->context_sec[thread].win_switch = 0;
    }
    begin      = 0;
    fp         = 0;
    switch(buf[index]){
    case('G') : {
      index++;
      index         = rm_leading_space(buf, index, len);
      win           = get_del(buf, &index);
      index         = rm_leading_space(buf, index, len); 
      reg           = get_del(buf, &index);
      index         = rm_leading_space(buf, index, len); 
      val           = bw_get_value(buf, &index);
      //num++;
      break;
    }
    case('C') : {
      index++;
      index         = rm_leading_space(buf, index, len); 
      reg           = get_del(buf, &index);
      index         = rm_leading_space(buf, index, len); 
      val           = bw_get_value(buf, &index);
      break;
    }  
    case('F') : {
      fp            = 1;
      index++;
      index         = rm_leading_space(buf, index, len); 
      reg           = get_del(buf, &index);
      index         = rm_leading_space(buf, index, len); 
      val           = bw_get_value(buf, &index);
      break;
    }
    case('W') : {
      index++;
      index         = rm_leading_space(buf, index, len);
      win           = get_del(buf, &index);
      index         = rm_leading_space(buf, index, len); 
      reg           = get_del(buf, &index);
      index         = rm_leading_space(buf, index, len); 
      val           = bw_get_value(buf, &index);
      //num++;
      if(sock->context[thread].more && (reg < 16)){
	for(i = 8; i < 16; i++){
	  if(flag){
	    if(sock->context[thread].vld[i]         && 
	      (win > sock->context[thread].win[i])  &&
	      (reg == i)){
	      if(sock->context[thread].vld[i+16]){
		sock->context[thread].third_vld[i] = 1;
		sock->context[thread].third_win[i] = sock->context[thread].win[i+16];
		sock->context[thread].third_val[i] = sock->context[thread].val[i+16];
	      }
	      sock->context[thread].vld[i]    = 0;
	      sock->context[thread].vld[i+16] = 1;
	      sock->context[thread].win[i+16] = sock->context[thread].win[i] == 7 ? 0 : sock->context[thread].win[i] + 1;
	      sock->context[thread].val[i+16] = sock->context[thread].val[i];
	    }
	  }
	  else{
	    if(sock->context_sec[thread].vld[i] && 
	      (win > sock->context_sec[thread].win[i]) &&
	      (reg == i)){
	      if(sock->context_sec[thread].vld[i+16]){
		sock->context_sec[thread].third_vld[i] = 1;
		sock->context_sec[thread].third_win[i] = sock->context_sec[thread].win[i+16];
		sock->context_sec[thread].third_val[i] = sock->context_sec[thread].val[i+16];
	      }
	      sock->context_sec[thread].vld[i]    = 0;
	      sock->context_sec[thread].vld[i+16] = 1;
	      sock->context_sec[thread].win[i+16] = sock->context_sec[thread].win[i] == 7 ? 0 : sock->context_sec[thread].win[i] + 1;
	      sock->context_sec[thread].val[i+16] = sock->context_sec[thread].val[i];
	    } 
	  } 
	}//for
      }//sock->context[thread].more && (reg < 16)
      sock->context[thread].more++;
      break;
    }
    default:{
      io_printf("Error(%0lld): undefined type->%s %d %d\n", get_time(), buf, index, len);
      tf_dofinish();
      break;
    }
    }//end of switch
    if(fp){
      if(flag){
	t_val = val & 0xffffffff;
	if(sock->extra_reg[thread].fvld[reg] &&
	  (sock->extra_reg[thread].fp[reg] == t_val)){
	  sock->extra_reg[thread].fvld[reg] = 0;
	  sock->back[thread].fvld[reg]      = 1;
	  sock->back[thread].fp[reg]        = t_val;
	  sock->back[thread].win[reg]       = win;
	  sock->back[thread].num++;
	  io_printf("Info(%0lld):removed float thread(%d) val(%llx) reg(%d)\n", get_time(), thread, val, reg);
	}
	else{
	  sock->context[thread].fp[reg]   = t_val;
	  sock->context[thread].fvld[reg] = 1;
	  sock->context[thread].win[reg]  = win;
	  sock->context[thread].num++;

	  if(sock->back[thread].fvld[reg] &&
	     sock->back[thread].num ){
	    sock->back[thread].fvld[reg] = 0;
	    sock->back[thread].num--;
	  }
	}
      }
      else{
	t_val = val & 0xffffffff;
	sock->context_sec[thread].fp[reg]   = t_val;
	sock->context_sec[thread].fvld[reg] = 1;
	sock->context_sec[thread].win[reg]  = win;      
	sock->context_sec[thread].num++;
      }
    }//fp
    else if(!(reg == VER  || 
	      //reg == FPRS && (sock->fprs == 0)|| 
	      reg == FPRS ||
	      reg == 39   || //TICK
	      reg == CCR  || 
	      reg == MID  ||
	      reg == SOFTINT && sock->softint_off ||
	      reg == I_TAG_TARGET ||
	      reg == D_TAG_TARGET ||
	      reg == I_TSB_PTR_PS0||
	      reg == D_TSB_PTR_PS0||
	      reg == I_TSB_PTR_PS1||
	      reg == D_TSB_PTR_PS1||
	      reg == D_TSB_DIR_PTR||
	      reg == SFP_REG      ||
	      reg == HINTP        ||
	      reg ==INTR_RECEIVE  ||
	      sock->mmu_reg_off && 
	      (ISFSR || DSFSR || SFAR || I_TAG_ACCESS || D_TAG_ACCESS))){

      if(reg == INTR_RECEIVE){
	if(sock->regval_heap->head_ptr)node = pop(sock->regval_heap);
	else node = (list_node_ptr)malloc(sizeof(struct list_node));
	node->val    = val;
	node->thread = thread;
	push(sock->intr_val, &node);
	sock->intr_num[thread]++;
      }
      else {
	/*if((reg == TPC) && (sock->tpc[thread]  == 0)){
	  sock->tpc[thread]  = 1; 
	  index  = rm_leading_space(buf, index, len); 
	  if(index < 0)return;
	  index += 5;
	  continue;
	}
	if((reg == TNPC) && (sock->tnpc[thread] == 0)){
	  sock->tnpc[thread] = 1; 
	  index  = rm_leading_space(buf, index, len); 
	  if(index < 0)return;
	  index += 5;
	  continue; 
	  }*/
	if(flag){//when cansave and muls instruction happen b2b,
	  if(sock->context[thread].vld[reg]                &&
	     ((reg > 7) && (reg < 16))                     &&
	     (win > sock->context[thread].win[reg])        &&
	     ((win - sock->context[thread].win[reg]) != 1) &&
	     (sock->context[thread].vld[reg+16] == 0)){
	    sock->context[thread].val[reg+16] = val;
	    sock->context[thread].vld[reg+16] = 1;
	    sock->context[thread].win[reg+16] = win+1;
	  }
	  else {
	    if(sock->context[thread].vld[reg] &&
	       ((reg > 15) && (reg < 24))){//local register more than 1 on step list.
	      reg -= 16;
	      sock->context[thread].local_val[reg] = val;
	      sock->context[thread].local_vld[reg] = 1;
	      sock->context[thread].local_win[reg] = win;
	    } 
	    else {
	      sock->context[thread].val[reg] = val;
	      sock->context[thread].vld[reg] = 1;
	      sock->context[thread].win[reg] = win;
	    }
	  }
	  sock->context[thread].num++;
	  if(reg == CWP)sock->context[thread].win_switch = 1;
	}
	else{
	  if(sock->context_sec[thread].vld[reg]                &&
	     ((reg > 7) && (reg < 16))                         &&
	     (win > sock->context_sec[thread].win[reg])        &&
	     ((win - sock->context_sec[thread].win[reg]) != 1) &&
	     (sock->context_sec[thread].vld[reg+16] == 0)){
	    sock->context_sec[thread].val[reg+16] = val;
	    sock->context_sec[thread].vld[reg+16] = 1;
	    sock->context_sec[thread].win[reg+16] = win+1;
	  }
	  else{
	    if(sock->context_sec[thread].vld[reg] &&
	       ((reg > 15) && (reg < 24))){//local register more than 1 on step list.
	      reg -= 16;
	      sock->context_sec[thread].local_val[reg] = val;
	      sock->context_sec[thread].local_vld[reg] = 1;
	      sock->context_sec[thread].local_win[reg] = win;//io_printf("LOCAL %d %llx\n", thread, val);
	    } 
	    else {
	      sock->context_sec[thread].val[reg] = val;
	      sock->context_sec[thread].vld[reg] = 1;
	      sock->context_sec[thread].win[reg] = win;
	    }
	  }
	  sock->context_sec[thread].num++;
	  if(reg == CWP)sock->context_sec[thread].win_switch = 1;
	}
      }
     }
    index  = rm_leading_space(buf, index, len); 
    if(index < 0)return;
    index += 5;
  }
  //if(num < 2)clean_reg(thread);
}
/*-------------------------------------------------------------------------------
convert string number  to hexdecial of size 64 bits.
and  push number into verilog.
--------------------------------------------------------------------------------*/
long long  convert(char* buf,
		   int   pos,
		   int   num,
		   int   ok){
  long long hex;
  int                i;
  char               ch;
  hex = 0;
  for(i = 0; i < num;i++){
    hex  <<= 4;
    ch     = buf[i] > '9' ? (buf[i] & 0xf) + 9 :  buf[i] & 0xf;
    hex   |= ch;
  }
  // sock->regval[thread] = hex;
  sock->eight = num;
  if(ok)tf_putlongp(pos, hex, hex >> 32);
  return hex;
}
/*-------------------------------------------------------------------------------
deceide whether thread matches or not.
if not match, push into the list.
--------------------------------------------------------------------------------*/
int thread_match(char* buf, int len, int thrid, int cmd)
{
  buf_node_ptr node;
  int thread, idx;

  idx    = rm_leading_space(buf, 6, len); 
  thread = get_del(buf, &idx);
  if((thread == thrid) && !(sock->context[thread].num && sock->context_sec[thread].num))return 1;
  if(sock->heap->head_ptr)node = buf_pop(sock->heap);
  else node = (buf_node_ptr)malloc(sizeof(struct buf_node));
  node->thrid = thread;  
  node->count = len;
  strcpy(node->data, buf);
  buf_push(sock->str_active, &node);
  sock->str_active->vld[thread]++;
  return 0;
}
/*-------------------------------------------------------------------------------
search for an element with the thread in a list object.
--------------------------------------------------------------------------------*/
int data_in_list(int thread)
{
  buf_node_ptr node, p_ptr;

  node = sock->str_active->head_ptr;
  p_ptr= sock->str_active->head_ptr;
  while(node){
    if(node->thrid == thread){//match
      if(node == sock->str_active->head_ptr){
	if(sock->str_active->head_ptr == sock->str_active->tail_ptr)
	  sock->str_active->tail_ptr = node->next;
	sock->str_active->head_ptr = node->next;
	break;
      }
      if(node == sock->str_active->tail_ptr){
	p_ptr->next                = 0;
	sock->str_active->tail_ptr = p_ptr;
	break;
      }
      p_ptr->next = node->next;
      break;
    } 
    p_ptr = node;
    node  = node->next;
  }
  what_trigger(node->data + 6, node->count - 6);
  sock->str_active->vld[thread]--; 
  buf_push(sock->heap, &node);
}
/*-------------------------------------------------------------------------------
  convert ascii to hex array.
--------------------------------------------------------------------------------*/
void copy(char* buf, int* idx,  char* cbuf)
{
  int ind;
  ind = 0;
  while((buf[*idx] != '\0') && 
	(buf[*idx] != '\n') &&
	(buf[*idx] != ' ')){
    cbuf[ind++] = buf[*idx];
    (*idx)++;
  }
  cbuf[ind] = '\0';
}
/*-------------------------------------------------------------------------------
extract the physical pc from sas instrcuction for each stepping.
The format is  like
1). "3: [th00] <v:0xfffffffff000002c> <p:0x000000fff000002c> or %g2, 0, %g2"
2). "[th00] <v:0x00000000000400b4> <p:0x00000000000400b4> mov 3, %l"
[the command did not complete properly; interrupting script]
--------------------------------------------------------------------------------*/
int  get_physical_pc(char* buf)
{
  char cbuf[STR_BUF];
  int   idx;
  list_node_ptr node;
  
  //dummy
  idx = rm_leading_space(buf, 0, STR_BUF);
  copy(buf, &idx, cbuf);//remove number
  if(strncmp(cbuf, "[th", 3)){//process the second type
  //extract thread id.  
    idx = rm_leading_space(buf, idx, STR_BUF); 
    copy(buf, &idx, cbuf);//get_thread
  }
  
  if(sock->regval_heap->head_ptr)node = pop(sock->regval_heap);
  else node = (list_node_ptr)malloc(sizeof(struct list_node));
  cbuf[5]      = '\0';
  node->thread = atoi(cbuf+3);
  
  //virtual pc
  idx = rm_leading_space(buf, idx, STR_BUF);
  copy(buf, &idx, cbuf);//remove number
  node->vir_pc = convert(cbuf+5, 1, 16, 0);
  //physical pc
  idx = rm_leading_space(buf, idx, STR_BUF);
  copy(buf, &idx, cbuf);//remove number
  if(strncmp(cbuf, "<p:0x", 5) == 0){//process the second type
    node->phy_pc = convert(cbuf+5, 1, 16, 0);
    node->val    = access_sys_call(node->thread, node->phy_pc);
  }
  else node->phy_pc = 0;
  //io_printf("PCGOT %d %llx\n", node->thread, node->phy_pc);
  if((sock->sas_mask   & (1 << node->thread)) && 
     !(sock->good_mask & (1 << node->thread))){
    push(sock->phy_list, &node);
    sock->inst_cnt[node->thread]++;
    return 1;  
  }
  else {
    sock->sas_mask |=  1 <<  node->thread;
    push(sock->regval_heap, &node);
    return 0;
  }
}
/*-------------------------------------------------------------------------------
return instruction.
--------------------------------------------------------------------------------*/
int get_inst(int thread){
  list_node_ptr node;
  if(sock->inst_cnt[thread] == 0)return 0;
  if(list_empty(sock->phy_list)){
    node = (list_node_ptr)search(thread, sock->phy_list);
    if(node){
      if(node->phy_pc & 0x4)tf_putp(1,  node->val & 0xffffffff);
      else tf_putp(1, (node->val >> 32) & 0xffffffff);
      tf_putlongp(10, node->phy_pc,  node->phy_pc >> 32);//push phsical pc
      push(sock->regval_heap, &node);
      sock->inst_cnt[thread]--;
      return 1;
    }
  }
  return 0;
}

/*-------------------------------------------------------------------------------
process the receiving data from simics site.
--------------------------------------------------------------------------------*/
int which_data(int thread, int type, int kind, int reg, int cmd)
{
  char* found, tmp_buf[STR_BUF];
  int   num, sw, thrid;
  list_node_ptr node;

  if((type == 0) && list_empty(sock->regval_list)){//get reg value.
    node = (list_node_ptr)pop(sock->regval_list);
    tf_putlongp(1, node->val, node->val >> 32);
    push(sock->regval_heap, &node);
    if(type == CCR)sock->ccr = node->val;
    if(cmd == WRITE_REG)sock->regval[thread] = node->val;
    else if(cmd > WRITE_REG){
      sock->regfval[thread] = node->val;
      sock->byte[thread]    = node->bound;
    }
    else if((cmd > 31) && (cmd < WRITE_REG))sock->spcval[thread] = node->val;
    if(sock->debug_socket_pli){
      io_printf("(%0lld):Info->Push regval = %llx received(%d)\n", get_time(), node->val, node->bound);
    }
    return 1;
  }
  //extract data from list.
  if(sock->str_active->vld[thread] &&
     !(sock->context[thread].num   && 
       sock->context_sec[thread].num)){
    data_in_list(thread);
    return type;
  }
  num             = 0;
  sw              = 0;
  sock->val_check = 0;
  while(sock->len > num){
    tmp_buf[num] =  sock->data[num];
    //find the physical address from sas instrution statement.
    if((tmp_buf[num] == '<') && (strncmp(sock->data+num, "<v:0x", 5) == 0))sw = 1;
    if(tmp_buf[num] == '\n'){
      tmp_buf[++num] = '\0';
      sock->len     -= num;
      //error happen
      if(strncmp (tmp_buf, "sas:info> SAS-MEM: ASSERT", 25) == 0){
	io_printf("Error(%0lld): %s-> see sas.log\n", get_time(), tmp_buf);
	tmp_buf[0] = PLI_QUIT;
	send_socket_nfd(tmp_buf, 1);
	tf_dofinish();
      }
      //extract step data.
      if(strncmp (tmp_buf, "STEP: ", 6) == 0){
	strcpy(sock->data, sock->data + num);
        if(thread_match(tmp_buf, num, thread, cmd)){
	  what_trigger(tmp_buf + 6, num - 6);
	  return type;
	} 
	num = 0;
	continue;
      }
      if(strncmp (tmp_buf, "regval", 6) != 0){	
	if(sw){
	  get_physical_pc(tmp_buf);
	  io_printf("(%0lld):sas> %s", sock->stamp[thread], tmp_buf);
	}
	//else io_printf("(%d):sas> ignore %s", sock->stamp[thread], tmp_buf);	
	strcpy(sock->data, sock->data + num);
	num = 0;
	sw  = 0;
	continue;
      }
      else {
	if(type){
	  if(sock->regval_heap->head_ptr)node = pop(sock->regval_heap);
	  else node = (list_node_ptr)malloc(sizeof(struct list_node));
	  node->val   = convert(tmp_buf+7, 1, (num - 8), 0);
	  node->bound = sock->eight;
	  push(sock->regval_list, &node);
	  strcpy(sock->data, sock->data + num);
	  if(sock->debug_socket_pli){
	    sock->recv++;
	    io_printf("(%0lld)Info: received-number(%d) type(%d) cmd(%d) push_value(%llx) %s", get_time(),
		      sock->recv, type, kind, node->val, tmp_buf);
	    node->bound = sock->recv;
	  }
	  num = 0;
	  continue;
	}
	if(cmd == WRITE_REG) sock->regval[thread]  = convert(tmp_buf+7, 1, (num - 8), 1);
	else if(cmd > WRITE_REG){
	  sock->regfval[thread] = convert(tmp_buf+7, 1, (num - 8), 1);
	  sock->byte[thread]    = sock->eight;
	  if(cmd == FLOAT_I){
	    if((kind & 1) == 0){
	      if(sock->eight > 8)tf_putlongp(1, sock->regfval[thread] >> 32, sock->regfval[thread] >> 32);
	    }
	    else if(sock->eight > 8)tf_putlongp(1, sock->regfval[thread], sock->regfval[thread]);
	  }
	}
	else if((cmd > 31) && (cmd < WRITE_REG))sock->spcval[thread] = convert(tmp_buf+7, 1, (num - 8), 1);
	else convert(tmp_buf+7, 1, (num - 8), 1);
	strcpy(sock->data, sock->data + num);
	if(sock->debug_socket_pli){
	  sock->recv++;
	  io_printf("(%0lld)Info: received-number(%d) type(%d) cmd(%d) get_value(%llx) %s", get_time(),
		    sock->recv, type, kind, sock->regval[thread], tmp_buf);
	}
	return 1;
      }
    }
    num++;
  }
  return 0;
}
/*-------------------------------------------------------------------------------
get data from socket.
--------------------------------------------------------------------------------*/
int read_socket_nfd()
{
  char read_buf[RCV_BUFSIZE+1];
  int  len, status, ind;
 
  len = RCV_BUFSIZE - sock->len;
  len = read(sock->sockfd, read_buf, len);
  sock->max_recv++;
  if(len == -1){
    if (errno != EAGAIN && errno != EINTR) {
      perror ("Socket read error");
      io_printf("Error(%0lld): socket have problem in reading\n", get_time());
      read_buf[0] = PLI_QUIT;
      send_socket_nfd(read_buf, 1);
      tf_dofinish();
    }
    return 0;
  }
  sock->len      += len;
  read_buf[len]   = '\0';  
  sock->max_count = 0;
  strcat(sock->data, read_buf);
  if(sock->debug_socket_pli && len){
    read_buf[len - 1] != '\n' ? io_printf("debug-> %s\n", read_buf) : 
                                io_printf("debug-> %s",   read_buf);
  }
  sock->max_recv = 0;
  return len;
}

/*-------------------------------------------------------------------------------
get data from socket.
--------------------------------------------------------------------------------*/
int read_socket()
{
  char read_buf[RCV_BUFSIZE+1];
  int  len, status, ind;

  FD_ZERO(&sock->fd_rd);FD_SET(sock->sockfd, &sock->fd_rd);
  if((status = select(sock->sockfd + 1, &sock->fd_rd, NULL, NULL, &sock->tv)) > 0){
    len   = RCV_BUFSIZE - sock->len;
    if((len == 0) && sock->dead){
      ind = 0;
      io_printf("Error(%0lld):recv buffer is full.\n", get_time());
      for(len = 0; len < 2048;len++){
	for(status = 0; status < 32; status++){
	  io_printf("%c", sock->data[ind]);
	  ind++;
	}
	io_printf("\n");
      }
      tf_dofinish();
    }
    len           = read(sock->sockfd, read_buf, len);
    read_buf[len] = '\0';
    if(sock->debug_socket_pli){
      read_buf[len - 1] != '\n' ? io_printf("debug-> %s\n", read_buf) : 
	                          io_printf("debug-> %s",   read_buf);
    }
    sock->len    += len;
    if(len)strcat(sock->data, read_buf);
    return 1;
  }
  else if(status == -1){
    io_printf("Error(%0lld): socket(select) have problem in reading\n",  get_time());
    tf_dofinish();
  }
  return 0;
}
/*-------------------------------------------------------------------------------
mask value according to register num.
layout for hpstate
 sas_sps_val[4:0] = {sas_sps_val[10], sas_sps_val[11], sas_sps_val[5], sas_sps_val[2], sas_sps_val[0]};


 rtl_reg_val[22] = 0;//mask ns
 rtl_reg_val[13] = 0;//mask gne
--------------------------------------------------------------------------------*/
long long mask_for_spc(int type, long long val)
{
  int temp_val;
  if(type == HTSTATE1 ||
     type == HTSTATE2 ||
     type == HTSTATE3 ||
     type == HTSTATE4 ||
     type == HTSTATE5 ||
     type == HTSTATE6){
    val &= 0x7;
  }
  else if(type == HPSTATE){
    temp_val = val & 0xfff;
    val      = (temp_val >> 6) & 0x10 | 
               (temp_val >> 8) & 0x08 | 
               (temp_val >> 3) & 0x04 |
               (temp_val >> 1) & 0x02 | 
               (temp_val)      & 0x01;
  }
  else if(type == FSR){
    val = val & 0x7fffbfdfff;
  }
  return val;
}
/*-------------------------------------------------------------------------------
For mulit thread it will remove an extra register.
--------------------------------------------------------------------------------*/
int clean_reg(int type, int thread)
{
  int win, index;
  long long val, cval;

  cval = mask_for_spc(type, sock->context[thread].val[type]);
  //if(!sock->reg_vld[thread])return 1;
  for(index = 1; index < 32;index++){
    type = index;
    if(sock->extra_reg[thread].vld[type]){
      win  = sock->extra_reg[thread].win[type];
      val  = sock->extra_reg[thread].val[type];
      if(sock->context[thread].vld[type]          && 
	 (win == sock->context[thread].win[type]) && 
	 (type > 0) && (type < 32) &&
	 (val == cval) ){
	sock->context[thread].num--;
	sock->context[thread].vld[type]    = 0;
	sock->extra_reg[thread].vld[index] = 0;
	io_printf("(%0lld):Info->remove extra thread(%d) win(%d) reg(%d) val(%llx)\n", 
		  get_time(), thread, win, type, sock->context[thread].val[type]); 
	return 0;
      }
      else if((type  > 23) && (type < 32)){
	type = type - 16;
	win  = win == 0 ?  7 : win - 1;
	if(sock->context[thread].vld[type] && 
	   (win == sock->context[thread].win[type]) &&
	   (val == sock->context[thread].val[type]) ){
	  sock->context[thread].num--;
	  sock->context[thread].vld[type]    = 0;
	  sock->extra_reg[thread].vld[index] = 0;
	  io_printf("(%0lld):Info->remove extra thread(%d) win(%d) reg(%d) val(%llx)\n", 
		    get_time(), thread, win, type, sock->context[thread].val[type]); 
	  return 0;
	} 
      }
      else  if(type  < 16){
	type = type + 16;
	win  = win == 7 ?  0 : win + 1;
	if(sock->context[thread].vld[type] && 
	   (win == sock->context[thread].win[type]) &&
	   (val == sock->context[thread].val[type]) ){
	  sock->context[thread].num--;
	  sock->context[thread].vld[type]    = 0;
	  sock->extra_reg[thread].vld[index] = 0;
	  io_printf("(%0lld):Info->remove extra thread(%d) win(%d) reg(%d) val(%llx)\n", 
		    get_time(), thread, win, type, sock->context[thread].val[type]); 
	  return 0;
	}
      }
    }
  }
  return 1;
}
/*-------------------------------------------------------------------------------
removed the register value on the step statement.
--------------------------------------------------------------------------------*/
void cleanup(int thread, int type, int win, int which_command, int req)
{
  int type_b, win_b;
  long long val, cval;

  if((which_command == 32 || which_command == 33) 
     && (req != 15))return;
  type_b = type;
  win_b  = win;
  
  if(sock->context[thread].vld[type]          && 
     (win == sock->context[thread].win[type]) && 
     (type > 0) && (type < 32)                && 
     (which_command == WRITE_REG) ||                //special registers
     sock->context[thread].vld[type] && (type < 8  || type > 31) && (which_command < FLOAT_I)){
    if(type == HPSTATE ||
       type == PSTATE){
      val = mask_for_spc(type, sock->spcval[thread]);
      if(val !=  mask_for_spc(type, sock->context[thread].val[type]))return;
    }
    if(which_command == WRITE_REG){
      //is it the force value happen.
      if((req != 15) && (sock->context[thread].val[type] != sock->extra_reg[thread].val[type]))return;
    }
    sock->context[thread].num--;
    sock->context[thread].vld[type] = 0; 
    io_printf("info(%0lld): removed spc clean data thread(%d) type(%d) value(%llx)\n", 
	      get_time(), thread, type, sock->context[thread].val[type]);
    return;
  }
  else if((which_command == WRITE_REG ) && (type  > 23) && (type < 32)){
      type = type - 16;
      win  = win == 0 ?  7 : win - 1;
      if(sock->context[thread].vld[type]          && 
	 (win == sock->context[thread].win[type]) && 
	 (which_command < FLOAT_I)){
	sock->context[thread].num--;
	sock->context[thread].vld[type] = 0;
	io_printf("info(%0lld): removed win clean data thread(%d) type(%d) value(%llx)\n", 
		  get_time(), thread, type, sock->context[thread].val[type]);
	return;
      } 
  }
  else  if((which_command  == WRITE_REG) && (type  < 16)){
    type = type + 16;
    win  = win == 7 ?  0 : win + 1;
    if(sock->context[thread].vld[type] && 
       (win == sock->context[thread].win[type]) && (which_command < FLOAT_I)){
      sock->context[thread].num--;
      sock->context[thread].vld[type] = 0;
      io_printf("info(%0lld): removed clean data thread(%d) type(%d) value(%llx)\n", 
		  get_time(), thread, type, sock->context[thread].val[type]);
      return;
    }
  }
  type = type_b;
  win  = win_b;
 
  //compare secondary 
  val  = which_command == WRITE_REG ? sock->regval[thread] : mask_for_spc(type, sock->spcval[thread]);
  cval = mask_for_spc(type, sock->context_sec[thread].val[type]);

  if(sock->context_sec[thread].num){
    if(sock->context_sec[thread].vld[type]          && 
       (win == sock->context_sec[thread].win[type]) && 
       (type > 0) && (type < 32)                    && 
       (which_command == WRITE_REG) ||                //special registers
       sock->context_sec[thread].vld[type] && (type < 8  || type > 31) && (which_command < FLOAT_I)){
      if(val == cval){
	sock->context_sec[thread].num--;
	sock->context_sec[thread].vld[type] = 0; 
	io_printf("info(%0lld): removed secondary data thread(%d) type(%d) value(%llx)\n", 
		  get_time(), thread, type, sock->context_sec[thread].val[type]);
      }
    }
    else if((which_command == WRITE_REG) && (type  > 23) && (type < 32)){
      type = type - 16;
      win  = win == 0 ?  7 : win - 1;
      if(sock->context_sec[thread].vld[type] && 
	 (win == sock->context_sec[thread].win[type]) && 
	 (which_command < FLOAT_I)){
	if(val == sock->context_sec[thread].val[type]){
	  sock->context_sec[thread].num--;
	  sock->context_sec[thread].vld[type] = 0;
	  io_printf("info(%0lld): removed clean second thread(%d) type(%d) value(%llx)\n", 
		  get_time(), thread, type, sock->context_sec[thread].val[type]);
	}
      } 
    }
    else  if((which_command  == WRITE_REG) && (type  < 16) && (type > 7)){
      type = type + 16;
      win  = win == 7 ?  0 : win + 1;
      if(sock->context_sec[thread].vld[type] && 
	 (win == sock->context[thread].win[type]) && (which_command < FLOAT_I)){
	if(val == sock->context_sec[thread].val[type]){
	  sock->context_sec[thread].num--;
	  sock->context_sec[thread].vld[type] = 0;
	  io_printf("info(%0lld): removed clean second thread(%d) type(%d) value(%llx)\n", 
		  get_time(), thread, type, sock->context_sec[thread].val[type]); 
	}
      }
    }
  }
}
/*-------------------------------------------------------------------------------
check max try for socket read.
--------------------------------------------------------------------------------*/
void check_max()
{
  //if(sock->max){tf_putp(0, 0);return;}
  if(sock->max_count > 20000)tf_putp(0, 4);
  else tf_putp(0, 0);
  if(sock->sent)sock->max_count++;
  if(sock->max_recv > 5000)tf_putp(0, 8);
}
/*-------------------------------------------------------------------------------
pass value to rtl.
--------------------------------------------------------------------------------*/
void slam_val(int thread, unsigned int aval0, unsigned int aval1)
{
  tf_putlongp(1, aval0, aval1);
  tf_putp(0, 1);
  sock->context[thread].num--;
}
/*-------------------------------------------------------------------------------
print error message for debug.
--------------------------------------------------------------------------------*/
void out_error(int thread, int type)
{
  int len;
  io_printf("Leftover DATA from the previous STEP num(%d)\n", sock->context[thread].num);
  for(len = 0; len < WRITE_REG;len++){
     if(sock->context[thread].vld[len]){ 
       if(len < 8)       io_printf("    global reg(g%0d) data->%llx\n", len & 7, sock->context[thread].val[len]);
       else if(len < 16) io_printf("    out    reg(o%0d) data->%llx\n", len & 7, sock->context[thread].val[len]);
       else if(len < 24) io_printf("    local  reg(l%0d) data->%llx\n", len & 7, sock->context[thread].val[len]);
       else if(len < 32) io_printf("    in     reg(i%0d) data->%llx\n", len & 7, sock->context[thread].val[len]);
       else if(len >= 32)io_printf("    type(%s) data->%llx\n", symbolic[len-32], sock->context[thread].val[len]);
     }
  }
  for(len = 0; len < 64;len++){
    if(sock->context[thread].fvld[len]){
      io_printf("    float(%d) data->%llx\n", len, sock->context[thread].fp[len]);
    }
  }
}
/*-------------------------------------------------------------------------------
print error message for debug.
--------------------------------------------------------------------------------*/
int find_candidate(int thread)
{
  int len;
  for(len = 32; len < WRITE_REG;len++)if(sock->context[thread].vld[len])return len;
  return 0;
}
/*-------------------------------------------------------------------------------
print error message for debug.
--------------------------------------------------------------------------------*/
int find_wrong(int thread)
{ 
  int type;
  
  for(type = 1; type < 32;type++){
    if(sock->context[thread].vld[type]          && 
       (sock->extra_reg[thread].win[type] == sock->context[thread].win[type]) && 
       (sock->extra_reg[thread].val[type] == sock->context[thread].val[type])){
      
      sock->context[thread].num--;
      sock->context[thread].vld[type]   = 0;
      sock->extra_reg[thread].vld[type] = 0;
      io_printf("(%0lld):Info->remove wrong thread(%d) win(%d) reg(%d) val(%llx)\n", 
		get_time(), thread, sock->extra_reg[thread].win[type] , 
		type, sock->context[thread].val[type]); 
      return 1;
    }
  }
  return 0;
}
/*-------------------------------------------------------------------------------
print error message for debug.
--------------------------------------------------------------------------------*/
int find_candidate_reg(int thread)
{
  long long val, lval;
  int low, high, win, len, type;

  low   = tf_getlongp(&high, 10);
  lval  = low;
  lval &= 0xffffffff;
  val   = high;
  val <<= 32;
  val  &= 0xffffffff00000000;
  val  |= lval;
 
  type  = tf_getp(11);
  win   = tf_getp(12);

  if(sock->context[thread].vld[type]          && 
     (win == sock->context[thread].win[type]) && 
     (type > 0) && (type < 32) &&
     (val == sock->context[thread].val[type]) ){
    sock->context[thread].num--;
    sock->context[thread].vld[type]    = 0;
    io_printf("(%0lld):Info->remove extra thread(%d) win(%d) reg(%d) val(%llx)\n", 
	      get_time(), thread, win, type, sock->context[thread].val[type]); 
    return 1;
  }
  else if((type  > 23) && (type < 32)){
    type = type - 16;
    win  = win == 0 ?  7 : win - 1;
    if(sock->context[thread].vld[type] && 
       (win == sock->context[thread].win[type]) &&
       (val == sock->context[thread].val[type]) ){
      sock->context[thread].num--;
      sock->context[thread].vld[type] = 0;
      io_printf("(%0lld):Info->remove extra thread(%d) win(%d) reg(%d) val(%llx)\n", 
		get_time(), thread, win, type, sock->context[thread].val[type]); 
      return 1;
    } 
  }
  else  if(type  < 16){
    type = type + 16;
    win  = win == 7 ?  0 : win + 1;
    if(sock->context[thread].vld[type] && 
       (win == sock->context[thread].win[type]) &&
       (val == sock->context[thread].val[type]) ){
      sock->context[thread].num--;
      sock->context[thread].vld[type] = 0;
      io_printf("(%0lld):Info->remove extra thread(%d) win(%d) reg(%d) val(%llx)\n", 
		get_time(), thread, win, type, sock->context[thread].val[type]); 
      return 1;
    }
  }
  return 0;
}
/*-------------------------------------------------------------------------------
shift sec to first
--------------------------------------------------------------------------------*/
void shift_sec(int thread, int type){
  if(sock->context_sec[thread].vld[type]){
    sock->context[thread].vld[type]     = 1;
    sock->context[thread].val[type]     = sock->context_sec[thread].val[type];
    sock->context[thread].win[type]     = sock->context_sec[thread].win[type]; 
    sock->context_sec[thread].vld[type] =0;
  }
}
/*-------------------------------------------------------------------------------
shift sec to first
--------------------------------------------------------------------------------*/
void shift_fsec(int thread, int type){

  if(sock->context_sec[thread].fvld[type]){
    sock->context[thread].fp[type]   = sock->context_sec[thread].fp[type];
    sock->context[thread].fvld[type] = 1;
    sock->context[thread].win[type]  = sock->context[thread].win[type];
    sock->context_sec[thread].fvld[type] = 0;
  }
}
/*-------------------------------------------------------------------------------
remove dummy muls data.
--------------------------------------------------------------------------------*/
int remove_dummy(int thread)
{
  int type, win, which_command;

  if(sock->drop_vld[thread] == 0)return 0;  
  type         = sock->drop_addr[thread];
  win          = sock->drop_win[thread];
  which_command= sock->drop_which[thread];
  if(sock->context[thread].vld[type]          && 
     (win == sock->context[thread].win[type]) && 
     (type > 0) && (type < 32)                && 
     (which_command == WRITE_REG)){
    sock->context[thread].vld[type] = 0;
    sock->drop_vld[thread]          = 0;
    sock->context[thread].num--;
    io_printf("(%0lld):Info: removed speculted muls data thread(%d) reg(%d) val(%llx)\n", 
	      get_time(), thread, type, sock->context[thread].val[type] );
    return 1;
  }
  else{
    if((which_command == WRITE_REG) && (type  > 23) && (type < 32)){//out register
      type = type - 16;
      win  = win == 0 ?  7 : win - 1;
      if(sock->context[thread].vld[type]          && 
	(win == sock->context[thread].win[type])){
	sock->context[thread].vld[type] = 0;
	sock->drop_vld[thread]          = 0;
	sock->context[thread].num--;
	io_printf("(%0lld):Info: removed speculted muls data thread(%d) out-reg(%d) val(%llx)\n", 
		  get_time(), thread, type,sock->context[thread].val[type] );
	return 1;
      }
    }
    if((which_command  == WRITE_REG ) && (type  < 16)){//in tegister
      type = type + 16;
      win  = win == 7 ?  0 : win + 1;
      if(sock->context[thread].vld[type] && 
	(win == sock->context[thread].win[type])){
	sock->context[thread].vld[type] = 0;
	sock->drop_vld[thread]          = 0;
	sock->context[thread].num--;
	io_printf("(%0lld):Info: removed speculted muls data thread(%d) in-reg(%d) val(%llx)\n", 
		  get_time(), thread, type,sock->context[thread].val[type]);
	return 1;
      }
    }
  }
  return 0;
}
/*-------------------------------------------------------------------------------
For mulit thread it will remove an extra register.
--------------------------------------------------------------------------------*/
int is_it_leftspc(int thread, int type)
{

  long long cval;
  if(sock->extra_reg[thread].vld[type] == 0)return 0;
  cval   = mask_for_spc(type, sock->context[thread].val[type]);
  if((sock->extra_reg[thread].val[type] == cval)){
    sock->context[thread].num--;
    sock->context[thread].vld[type]   = 0;
    sock->extra_reg[thread].vld[type] = 0;
    io_printf("(%0lld):Info->remove special leftover thread(%d) reg(%d) val(%llx) normal\n", 
	      get_time(), thread,  type, sock->context[thread].val[type]); 
    return 1;
  }
  return 0;
}/*-------------------------------------------------------------------------------
For mulit thread it will remove an extra register.
--------------------------------------------------------------------------------*/
int no_change(int thread, int type, int win)
{

  long long cval;
  if(sock->extra_reg[thread].vld[type] == 0)return 0;
  cval = mask_for_spc(type, sock->context[thread].val[type]);
  if(sock->extra_reg[thread].val[type] == cval){
    sock->extra_reg[thread].vld[type] = 0;
    return 1;
  }
  return 0;
}
/*-------------------------------------------------------------------------------
  For multi thread it will remove an extra register.
--------------------------------------------------------------------------------*/
int is_it_leftover_spc(int thread, int type){
  long long cval;
  cval = mask_for_spc(type, sock->context[thread].val[type]);
  if((type >= 109) && (type <= 118))return 0;
  if((type > 33) && (type < WRITE_REG) &&
     sock->context[thread].vld[type]   &&
     sock->extra_reg[thread].vld[type] &&
     (sock->extra_reg[thread].val[type] == cval) ){
    sock->context[thread].num--;
    sock->context[thread].vld[type]   = 0;
    sock->extra_reg[thread].vld[type] = 0;
    io_printf("(%0lld):Info->remove left spc register thread(%d) reg(%d) val(%llx)\n", 
	      get_time(), thread, type, cval); 
    return 1;
  }
  return 0;
}
/*-------------------------------------------------------------------------------
For multi thread it will remove an extra register.
--------------------------------------------------------------------------------*/
int is_it_leftover(int thread, int type, int win)
{

  long long cval;
  int l_win, l_type;

  if(win != sock->extra_reg[thread].win[type] || 
     sock->extra_reg[thread].vld[type] == 0){/*
    if((type > 0) && (type < 32)){
      if(type  < 16){//in tegister
	l_type  = type + 16;
	l_win   = win == 7 ?  0 : win + 1;
      }
      else if((type  > 23) && (type < 32)){//out register
	l_type = type - 16;
	l_win  = win == 0 ?  7 : win - 1;
      }
      else{
	l_type = type;l_win = win;
      }
      //io_printf("INFORMATION thread = %d reg =%d win = %d %llx %llx\n", 
      //	thread, l_type, l_win, sock->context[thread].val[l_type],
      //	sock->extra_reg[thread].val[l_type]); 
     
      if(sock->context[thread].vld[l_type]            && 
	 (l_win == sock->context[thread].win[l_type]) &&
	 sock->extra_reg[thread].vld[l_type]          &&
	 (sock->extra_reg[thread].val[l_type] == sock->context[thread].val[l_type])){
	sock->context[thread].num--;
	sock->context[thread].vld[l_type]   = 0;
	sock->extra_reg[thread].vld[l_type] = 0;
	sock->cwp_vld[thread]  = 1;
	sock->cwp_val[thread]  = sock->context[thread].val[l_type];
	sock->cwp_win[thread]  = l_win;
	sock->cwp_type[thread] = l_type;
	io_printf("(%0d):Info->remove leftover changed win thread(%d) win(%d) reg(%d) val(%llx) normal\n", 
		  tf_gettime(), thread, l_win, l_type, sock->context[thread].val[l_type]);
	return 1;
      }
      }*/
    return 0;
  }

  cval = mask_for_spc(type, sock->context[thread].val[type]);
  if(sock->context[thread].vld[type]          && 
     (win == sock->context[thread].win[type]) && 
     (type > 0)  && (type < 32)               &&
     (type >= 16 && type <= 23 || !sock->context[thread].win_switch) &&
     (sock->extra_reg[thread].val[type] == cval)){
    sock->context[thread].num--;
    sock->context[thread].vld[type]   = 0;
    sock->extra_reg[thread].vld[type] = 0;
    sock->cwp_vld[thread]  = 1;
    sock->cwp_val[thread]  = sock->context[thread].val[type];
    sock->cwp_win[thread]  = win;
    sock->cwp_type[thread] = type;
    io_printf("(%0lld):Info->remove leftover thread(%d) win(%d) reg(%d) val(%llx)\n", 
	      get_time(), thread, win, type, cval); 
    return 1;
  }

  if(type  < 16){//in tegister
    l_type  = type + 16;
    l_win   = win == 7 ?  0 : win + 1;
  }
  else if((type  > 23) && (type < 32)){//out register
    l_type = type - 16;
    l_win  = win == 0 ?  7 : win - 1;
  }
  else 
    return 0;
  
  if(sock->context[thread].vld[l_type]            && 
     (l_win == sock->context[thread].win[l_type]) &&
     sock->extra_reg[thread].vld[type]            &&
     (sock->extra_reg[thread].val[type] == sock->context[thread].val[l_type])){
    sock->context[thread].num--;
    sock->context[thread].vld[l_type] = 0;
    sock->extra_reg[thread].vld[type] = 0;

    sock->cwp_vld[thread]  = 1;
    sock->cwp_val[thread]  = sock->context[thread].val[l_type];
    sock->cwp_win[thread]  = l_win;
    sock->cwp_type[thread] = l_type;
    io_printf("(%0lld):Info->remove leftover changed thread(%d) win(%d) reg(%d) val(%llx) win(%d) reg(%d)\n", 
	      get_time(), thread, l_win, l_type, sock->context[thread].val[l_type], win, type); 
    return 1;
  }
  return 0;
}
/*-------------------------------------------------------------------------------
For multi-thread, extra data will be removed here.
--------------------------------------------------------------------------------*/
int check_float(int thread)
{
  int type;

  for(type = 0; type < 64;type++){
    if(sock->extra_reg[thread].fvld[type]  && 
       sock->context[thread].fvld[type]    &&
       (sock->extra_reg[thread].fp[type] == sock->context[thread].fp[type])){
      sock->context[thread].fvld[type]   = 0;
      sock->context[thread].num--;
      sock->extra_reg[thread].fvld[type] = 0;
      io_printf("(%0lld):Info->remove float thread(%d) reg(%d) val(%x)\n", 
		get_time(), thread, type, sock->context[thread].fp[type]); 
      return 1;
    }
  }
  return 0;
} 
/*-------------------------------------------------------------------------------
  clean up the floatin point data on the STEP statement 
  if there are some extra data.
  layout of floating register :
  reg odd : [63:32]
  reg even: [31:0]
  case 1). 64 bits update, but only received 32 bits.
--------------------------------------------------------------------------------*/
void process_request(int thread, int type, int win, int which_command, int req)
{
  int val, even, etype, done;
  
  if(which_command > WRITE_REG){//process floating point data.
    done = 1;
    even = type & 1;
    val  = sock->byte[thread] > 8 ? (sock->regfval[thread] >> 32) & 0xffffffff : sock->regfval[thread] & 0xffffffff;
    if(sock->context[thread].fvld[type] &&
      (sock->context[thread].fp[type] == val)){
      sock->context[thread].num--;
      sock->context[thread].fvld[type]   = 0;
      sock->extra_reg[thread].fvld[type] = 0;
      io_printf("info(%0lld) remove first float thread(%d) reg(%d) %x\n", get_time(),
		thread, type,sock->context[thread].fp[type] );
      sock->float_val[thread] = val;
      sock->float_vld[thread] = 1;
      sock->float_reg[thread] = type; 
    }
    else if(sock->context_sec[thread].fvld[type] && (even == 0) &&
	   (sock->context_sec[thread].fp[type] == val)){
      sock->context_sec[thread].num--;
      sock->context_sec[thread].fvld[type]  = 0;
      sock->extra_reg[thread].fvld[type]    = 0; 
      done                                  = 0;
      io_printf("info(%0lld) remove first float thread(%d) reg(%d) val(%x)\n", get_time(), thread, type, val);
      sock->float_val[thread] = val;
      sock->float_vld[thread] = 1;
      sock->float_reg[thread] = type; 
    }
    else if(which_command != FLOAT_X || (which_command == FLOAT_X) && (even == 0)){
      sock->extra_reg[thread].fvld[type] = 1;
      sock->extra_reg[thread].fp[type]   = (sock->byte[thread] > 8) && (even == 0) ? 
	(sock->regfval[thread] >> 32) & 0xffffffff : sock->regfval[thread] & 0xffffffff;
      io_printf("Info:(%0lld) save_regval_even(%x) thread(%d) reg(%d)\n", get_time(), 
		sock->extra_reg[thread].fp[type] , thread, type);
    }
    //odd number
    etype = even ? type-1 : type;
    val   = sock->regfval[thread] & 0xffffffff;

    if(sock->context[thread].fvld[etype+1] && 
       done                                &&
       (sock->context[thread].fp[etype+1] == val)){
      sock->context[thread].num--;
      sock->context[thread].fvld[etype+1]   = 0;
      sock->extra_reg[thread].fvld[etype+1] = 0;
      io_printf("info(%0lld) remove second part float thread(%d) reg(%d)\n", get_time(), thread, etype+1);
      sock->float_val[thread] = val;
      sock->float_vld[thread] = 1;
      sock->float_reg[thread] = type; 
    }
    else if(sock->context_sec[thread].fvld[etype+1] && 
	   (val == sock->context_sec[thread].fp[etype+1]) &&
	   (even == 0) &&
	   (which_command == FLOAT_X))
      {
	sock->context_sec[thread].num--;
	sock->context_sec[thread].fvld[etype+1] = 0;
	sock->extra_reg[thread].fvld[etype+1]   = 0;
	io_printf("info(%0lld) remove secondary float thread(%d) reg(%d) val(%x) val(%x)\n", get_time(), thread, etype+1,
		  val, sock->context_sec[thread].fp[etype+1]);
	sock->float_val[thread] = val;
	sock->float_vld[thread] = 1;
	sock->float_reg[thread] = etype+1; 
    }
    else if(which_command == FLOAT_X){
      sock->extra_reg[thread].fvld[etype+1]  = 1;
      sock->extra_reg[thread].fp[etype+1]    = val;
      io_printf("Info:(%0lld) save_regval_odd(%x) thread(%d) reg(%d)\n", 
		get_time(), sock->extra_reg[thread].fp[type] , thread, etype+1);
    }
  }
  else {//special or general registers
    if(which_command == WRITE_REG){//for multi thread
      if((sock->context[thread].vld[type] == 0)   && 
	 sock->context_sec[thread].vld[type]      &&
	 (win == sock->context[thread].win[type]) &&
	 (req == 15)){
	 sock->context_sec[thread].num--;
	 sock->context_sec[thread].vld[type] = 0;
      }
      else{
	sock->extra_reg[thread].val[type] = sock->regval[thread];
	sock->extra_reg[thread].vld[type] = 1;
	sock->extra_reg[thread].win[type] = win;
	cleanup(thread, type, win, which_command, req);
      }
      
      sock->regreg[thread]  = type;
      sock->reg_win[thread] = win;
      sock->reg_vld[thread] = 1;
      sock->extra_reg[thread].val[type] = sock->regval[thread];
      sock->extra_reg[thread].vld[type] = 1;
      sock->extra_reg[thread].win[type] = win;
      io_printf("Info:(%0lld) save_regval_integer thread(%d) win(%d) reg(%d) val(%llx) %d\n", get_time(), 
      		thread, win, type, sock->regval[thread], req);
    }
    else if((which_command > 31) && (which_command < WRITE_REG)){//special register
      cleanup(thread, type, win, which_command, req);
      sock->extra_reg[thread].val[type] = mask_for_spc(type, sock->spcval[thread]);
      sock->extra_reg[thread].vld[type] = 1;
      sock->extra_reg[thread].win[type] = win;
      io_printf("Info:(%0lld) save_special_register thread(%d)  reg(%d) val(%llx)\n", get_time(), 
      		thread,  type, sock->extra_reg[thread].val[type]);
    }
  }
  sock->max_count = 0;
}
/*-------------------------------------------------------------------------------
  The current and previous data are the same, so it is requested by rtl.
--------------------------------------------------------------------------------*/
int request_value(int thread, int type, int win, int reg_num, int which_command, int req)
{
  int len = 0;

  if(sock->len || sock->regval_list->head_ptr){
    len = which_data(thread, 0, type, reg_num, which_command);
    /*if(type == CCR){   
      io_printf("DATA %d %x\n", sock->context[thread].vld[type],  sock->context[thread].val[type]);
      if(sock->context[thread].vld[type] &&
	 (sock->ccr !=(sock->context[thread].val[type])))
	tf_putlongp(1, sock->context[thread].val[type], sock->context[thread].val[type] >> 32);
	}*/
  } 
  if(len){ 
    tf_putp(0, len); 
    process_request(thread, type, win, which_command, req);
    return  1;
  }
  if((sock->read < 30) && (sock->len < 40)){
    sock->read++;
    check_max();
    return 0;
  }
  sock->read = 0;
  if(read_socket_nfd() && sock->len || sock->regval_list->head_ptr)
    len = which_data(thread, 0, type, reg_num, which_command); 
  tf_putp(0, len);
  /*if(len){
    if(type == CCR){
      io_printf("DATA %d %x\n", sock->context[thread].vld[type],  sock->context[thread].val[type]);
      if(sock->context[thread].vld[type] &&
	 (sock->ccr !=(sock->context[thread].val[type])))
	tf_putlongp(1, sock->context[thread].val[type], sock->context[thread].val[type] >> 32);
    }
    }*/
  if(len)process_request(thread, type, win, which_command, req);
  return len;
}
/*-------------------------------------------------------------------------------
remove the special register if the current and previous value are the same.
--------------------------------------------------------------------------------*/
int clean_spc(int thread)
{
  int type;

  for(type = 32; type < WRITE_REG;type++){
    if(sock->extra_reg[thread].vld[type]){
      if(sock->context[thread].vld[type]          && 
	 (sock->extra_reg[thread].val[type] == sock->context[thread].val[type])){
	sock->context[thread].num--;
	sock->context[thread].vld[type]   = 0;
	sock->extra_reg[thread].vld[type] = 0;
	io_printf("(%0lld):Info->removed special thread(%d) reg(%d) val(%llx)\n", 
		  get_time(), thread,  type, sock->context[thread].val[type]); 
	return 0;
      }
    }
  }
  return 1;
}
/*-------------------------------------------------------------------------------
save drop data. it is called by list file.
--------------------------------------------------------------------------------*/
void  drop_data(int val1, int val0, int reg, int thread)
{
  long long val, vall;
  val    = val0;
  vall   = val1;
  vall <<= 32;
  vall  &= 0xffffffff00000000;
  val   &= 0xffffffff;
  sock->drop_val[thread]   = val | vall;
  sock->drop_reg[thread]   = reg;
}

/*-------------------------------------------------------------------------------
remove mulcc.
--------------------------------------------------------------------------------*/
int  drop_check(int thread)
{
  int reg = sock->drop_reg[thread];

  if((reg > 0) && (reg < 32) &&
     sock->context[thread].vld[reg] &&
     sock->drop_val[thread] ==  sock->context[thread].val[reg] 
     ){
     sock->context[thread].num--;
     sock->context[thread].vld[reg] = 0;
     return 1;
  }
  if((reg > 7) && (reg < 16) &&
     sock->context[thread].vld[reg+16] &&
     sock->drop_val[thread] ==  sock->context[thread].val[reg+16] 
     ){
     sock->context[thread].num--;
     sock->context[thread].vld[reg+16] = 0;
     return 1;
  }
  if((reg > 23) && (reg < 32) &&
     sock->context[thread].vld[reg-16] &&
     sock->drop_val[thread] ==  sock->context[thread].val[reg-16] 
     ){
     sock->context[thread].num--;
     sock->context[thread].vld[reg-16] = 0;
     return 1;
  }
  //  io_printf("DROPV %llx %llx %d %d thread=%d\n", sock->drop_val[thread],  sock->context[thread].val[reg], reg,
  //	    sock->context[thread].vld[reg], thread);

  return 0;
}
/*-------------------------------------------------------------------------------
  handle the wrong trigger conditions.
--------------------------------------------------------------------------------*/
void check_wrong(int thread, int type, int step_list, int win, int cmd)
{
  int len, nt, pr;

  nt = (win + 1) & 0x7;
  pr = win == 0 ? 7 : win - 1;

  if(step_list == 5){
    tf_putp(0, 3);//try more for muls
  }
  else if(remove_dummy(thread))tf_putp(0, 0);//remove extra muls

  else {//find the candidate
    //already hit good trap.
    if(sock->good_mask & (1 << thread)){
      for(len = 1; len < WRITE_REG;len++)sock->context[thread].vld[len] = 0;
      sock->context[thread].num = 0;
      tf_putp(0, 0);
      return;
    }
    if(find_wrong(thread)){
      tf_putp(0, 0);
      return;
    }
    len = find_candidate(thread);
    if(len &&
      sock->find_loop[thread] != len ){
      if(is_it_leftspc(thread, len)){
	tf_putp(0, 0);
	return;
      }
      tf_putp(8, len);//command type
      tf_putp(0, 9);
      if(sock->context[thread].vld[FPRS] && (sock->context[thread].num == 1)){
	sock->context[thread].num--;
	sock->context[thread].vld[FPRS] = 0;
	tf_putp(0, 0); 
	io_printf("Info: fprs is droped(%llx) thread\n",  sock->context[thread].val[FPRS], thread);
      } 
      sock->find_loop[thread] = len;
      if(sock->context[thread].vld[HINTP] && (sock->context[thread].num == 1)){
	sock->context[thread].num--;
	sock->context[thread].vld[HINTP] = 0;
	tf_putp(0, 0); 
	io_printf("Info: hintp is droped(%llx) thread\n",  sock->context[thread].val[HINTP], thread);
      } 
    }
    else {
      if(tf_getp(9) && find_candidate_reg(thread) || check_float(thread))tf_putp(0, 0);
      else if(clean_reg(type, thread) && clean_spc(thread) || (cmd >= FLOAT_I) ){
	if((cmd == REG_WRITE_BACK)          &&
	   sock->cwp_vld[thread]            &&
	   ((sock->cwp_type[thread] == type) &&
	    (sock->cwp_win[thread]  == win) || 
	    (type > 7) && (type < 16) && 
	    (sock->cwp_type[thread] == type + 16) &&
	    (sock->cwp_win[thread]  == nt) ||

	    (type > 23) && (type < 31) && 
	    (sock->cwp_type[thread] == type - 16) &&
	    (sock->cwp_win[thread]  == pr)
	     )){
	  sock->cwp_vld[thread] = 0;
	  tf_putlongp(1, sock->cwp_val[thread], sock->cwp_val[thread] >> 32);
	  tf_putp(0, 1);
	}
	else if((cmd >= FLOAT_I) &&
		(sock->float_reg[thread] == type) && 
		sock->float_vld[thread]){
	  sock->float_vld[thread] = 0;
	  tf_putlongp(1, sock->float_val[thread], sock->float_val[thread]);
	  tf_putp(0, 1);
	}
	else {
	  if(sock->context[thread].vld[TPC]){
	    sock->context[thread].vld[TPC] = 0;
	    sock->context[thread].num--;
	  } 
	  if(sock->context[thread].vld[TNPC]){
	    sock->context[thread].vld[TNPC] = 0;
	    sock->context[thread].num--;
	  } 
	  if(sock->context[thread].num){
	    //remove leftover data
	    for(len = 0; len < 8;len++){
	      if(sock->context[thread].local_vld[len]){
		sock->context[thread].num--;
		sock->context[thread].local_vld[len] = 0;
		sock->extra_reg[thread].val[len+16]  = sock->context[thread].local_val[len];
		io_printf("Info: Mulcc extra local thread(%d) reg(%d) val(%llx)\n",
			  thread, len+16,  sock->context[thread].local_val[len]);
	      }
	    }

	    if(sock->context[thread].num == 0)tf_putp(0, 0); 
	    else{
	      if(sock->context[thread].vld[HINTP] && (sock->context[thread].num == 1)){
		sock->context[thread].num--;
		sock->context[thread].vld[HINTP] = 0;
		tf_putp(0, 0); 
	      } 
	      else  if(sock->context[thread].vld[FPRS] ){//fprs register
		sock->context[thread].num--;
		sock->context[thread].vld[FPRS] = 0;
		tf_putp(0, 0);
	      } 
	      else{//remove special regs
		for(len = 32; len < WRITE_REG;len++){
		  if(sock->context[thread].vld[len]  &&
		    sock->extra_reg[thread].vld[len] &&
		    (sock->extra_reg[thread].vld[len] == sock->context[thread].val[len])){
		    sock->context[thread].num--;
		    sock->context[thread].vld[len] = 0;
		  }
		}
		if(sock->context[thread].num == 0)tf_putp(0, 0);  
		else{
		  nt = 0;
		  for(len = 1; len < WRITE_REG;len++){
		    if(sock->context[thread].vld[len]){
		      nt = 1;
		      break;
		    }  
		  }
		  if(nt == 0){
		    sock->context[thread].num = 0;
		    tf_putp(0, 0);  
		  }
		  else {
		    //remove mulcc register
		    for(len = 32; len < WRITE_REG;len++){
		      //for(len = 32; len < WRITE_REG;len++){
		      if(sock->context[thread].vld[len]  &&
			 sock->drop_val[thread] == sock->context[thread].val[len]){
			sock->context[thread].num--;
			sock->context[thread].vld[len] = 0;
		      }
		      
		    }
		    if(sock->context[thread].num == 0 || drop_check(thread))tf_putp(0, 0);  
		    else {
		      //check third location 
		      if(sock->context[thread].third_vld[type]){
			slam_val(thread, sock->context[thread].third_val[type],
				 (sock->context[thread].third_val[type] >> 32));
			sock->context[thread].third_vld[type] = 0;
		      }
		      else if(sock->context[thread].third_vld[type+16]){
			slam_val(thread, sock->context[thread].third_val[type+16], 
				 (sock->context[thread].third_val[type+16] >> 32));
			sock->context[thread].third_vld[type+16] = 0;
		      }
		      else {
			if(step_list < 2 ){
			  io_printf("============= Wrong Trigger(%d) ============\n", thread);
			  out_error(thread, type);
			}
			tf_putp(0, 3);
		      }//else
		    }
		  }
		}
	      }
	    }
	  }
	  else tf_putp(0, 0);
	}
      }
      else tf_putp(0, 0);
    }
  }
}
/*-------------------------------------------------------------------------------
receiving data from server.
$bw_sas_recv(sas_val, next_thread, sas_win, sas_addr, which, ready, sas_time, next_w
step_list : 15 --> sas force happen.
--------------------------------------------------------------------------------*/
void bw_sas_recv_call()
{
  int len, thread, win, reg_num, step_list, which_command, type, b_type, s_win, low, high;
  unsigned int aval[2];
  long long time;

  list_node_ptr node;
  thread              = tf_getp(2);
  which_command       = tf_getp(5);

  if((which_command == CMD)){//get an instruction word.
    if(get_inst(thread))tf_putp(0, 1);
    else tf_putp(0, 0);
    return;
  }
 
 // get the rest of arguments
  win                 = tf_getp(3);
  reg_num             = tf_getp(4);
  step_list           = tf_getp(6);
  //sock->stamp[thread] = tf_getp(7); 
  low                   = tf_getlongp(&high, 7);
  time                  = low;
  time                 &= 0xffffffff;
  sock->stamp[thread]   = high;
  sock->stamp[thread] <<= 32;
  sock->stamp[thread]  &= 0xffffffff00000000;
  sock->stamp[thread]  |= time;

  type     = which_command >= REG_WRITE_BACK ? reg_num : which_command;

  if((type == INTR_RECEIVE) && (step_list != 1)){
    if(sock->intr_num[thread] && list_empty(sock->intr_val)){
      node = (list_node_ptr)search(thread, sock->intr_val);
      if(node){
	push(sock->regval_heap, &node); 
	sock->intr_num[thread]--; 
	sock->context[thread].num++;
	sock->val = node->val;
	slam_val(thread, node->val, (node->val >> 32));
	return ;
      }
    }
  }
  if(which_command == 254){ //recover dummy
    if(step_list == 11 || sock->noresponse[thread]){
       if(sock->context[thread].vld[HINTP] && (sock->context[thread].num == 1)){
	 sock->context[thread].num--;
	 sock->context[thread].vld[HINTP] = 0;
	 tf_putp(0, 0); 
	 return;
       }
       if(sock->context[thread].vld[FPRS]){
	 sock->context[thread].num--;
	 sock->context[thread].vld[FPRS] = 0;
	 tf_putp(0, 0); 
	 return;
       }
       if(sock->context[thread].num){
	 io_printf("============= Wrong Trigger(%d) ============\n", thread);
	 out_error(thread, type);
	 tf_putp(0, 3);
	 return;
       }
    }
    if(step_list == 77){
      //io_printf("HERE %x %llx\n", sock->drop_vld[thread], sock->mul_val[thread]);
      tf_putlongp(8, sock->mul_val[thread], sock->mul_val[thread] >> 32);
      sock->drop_vld[thread] ? tf_putp(0, 1) : tf_putp(0, 0);
      sock->drop_vld[thread] = 0;
      return;
    }
    if(step_list == 12){
      type = tf_getp(7);//get type
      sock->noresponse[thread] = 1;
      if(no_change(thread, type, win)){
	sock->context[thread].vld[type] = 0;
	sock->context[thread].num--; 
	io_printf("(%0lld):Info->removed type(%d) thread(%d) step_list(%d)\n", get_time(), type, thread, step_list); 
	sock->noresponse[thread] = 0;
      }
      tf_putp(0, 0);   
      return;
    }
    else if(step_list == 10){
      which_command            = tf_getp(7);
      type                     = which_command >= REG_WRITE_BACK ? reg_num : which_command;
      sock->drop_addr[thread]  = type;
      sock->drop_vld[thread]   = 1;
      sock->drop_win[thread]   = win;
      sock->drop_which[thread] = which_command;
      mul_data(thread, 8);
    }
    else if(step_list == 9){
      if(sock->regval_heap->head_ptr)node = pop(sock->regval_heap);
      else node = (list_node_ptr)malloc(sizeof(struct list_node));
      node->val    = sock->val;
      node->thread = thread;
      front(sock->intr_val, &node);
      sock->intr_num[thread]++; 
      return;
    }
    else if(step_list != 15){
      sock->context[thread].num++; 
      sock->context[thread].vld[sock->old[thread]] = 1;
    }
    if(step_list != 15)io_printf("(%0lld):Info->recover(%d) thread(%d) step_list(%d)\n", get_time(), type, thread, step_list);
    tf_putp(0, 0);   
    return;
  }
  if(sock->flag[thread]){  //missed trigger.
    io_printf("============= MISSING Trigger ==============\n");
    if(which_command == WRITE_REG)  //generatl registers
      if(reg_num < 8)
	io_printf("    thread(%0lld) Target-general-reg(%d), time(%d)\n", thread, reg_num, sock->stamp[thread]);
      else if(reg_num < 16)
	io_printf("    thread(%0lld) Target-Out-reg(%d), time(%d)\n", thread, reg_num, sock->stamp[thread]);
      else if(reg_num < 24)
	io_printf("    thread(%0lld) Target-Local-reg(%d), time(%d)\n", thread, reg_num, sock->stamp[thread]);
      else 
	io_printf("    thread(%0lld) Target-In-reg(%d), time(%d)\n", thread, reg_num, sock->stamp[thread]);
    
    else if((which_command < WRITE_REG) && (which_command > 31))                 //special registers
      io_printf("    thread(%0lld) Target-type(%s) time(%d)\n", thread, symbolic[which_command-32], sock->stamp[thread]);
    else 
      io_printf("    thread(%0lld) Target-floating-point(%d)\n", thread, type);
    out_error(thread, type); 
    tf_putp(0, 2);          //push error
    return;
  }
  if(sock->good_mask_array[thread] && 
     (step_list == 0)){//already hit the good trap.
    tf_putp(0, 10);
    return;
  }
  sock->noresponse[thread] = 0;
  
  //  if(which_command == WRITE_REG && thread == 19){
  //io_printf("%0d LEFT  vld(%d) number(%d) rtlwin(%d) saswin(%d) reg(%d) req(%d) val(%llx)\n",tf_gettime(),
  //      sock->context[thread].vld[type] , sock->context[thread].num, win, sock->context[thread].win[type],
  //      type, step_list,
  //      sock->context[thread].val[type]);
  //}
  
  if(step_list == 0 || (step_list >= 2) && (step_list != 15)){
    if((which_command == WRITE_REG) && is_it_leftover(thread, type, win) || 
       is_it_leftover_spc(thread, type)){
      tf_putp(0, 0);
      return;
    }
 
    //return general, local, and special register value.
    if(sock->context[thread].num){//local
      // if(which_command == WRITE_REG && thread == 19)io_printf("HERE\n");
      if(sock->context[thread].vld[type]           && 
	  (win == sock->context[thread].win[type]) &&
	 (type > 7) && (type < 32)                 && 
	 (which_command == WRITE_REG) ||//special registers
	 sock->context[thread].vld[type] && ((type < 8) &&  (win == sock->context[thread].win[type])  || type > 31) && (which_command < FLOAT_I)){
	if(type == PC){
	  sock->target_pc[thread][0] = sock->target_pc[thread][1];
	  sock->target_pc[thread][1] = sock->context[thread].val[PC];
	}
	slam_val(thread, sock->context[thread].val[type], (sock->context[thread].val[type] >> 32));
	sock->context[thread].vld[type] = 0;
	sock->max_count   = 0;
	if((which_command == WRITE_REG) && (step_list >= 2))sock->old[thread] = type;
	if(which_command  == WRITE_REG || (which_command > 31) && (which_command < WRITE_REG)){
	  if(which_command == WRITE_REG)sock->reg_vld[thread] = 0;//clean previous regvalue.
	  sock->extra_reg[thread].vld[type] = 0;
	}
	sock->find_loop[thread] = 0;
	if(which_command  == WRITE_REG){
	  if((type  > 23) && (type < 32)){
	    b_type   = type - 16;
	    if(sock->extra_reg[thread].vld[b_type])sock->extra_reg[thread].vld[b_type] = 0;
	  }
	  else if((7 < type) && (type  < 16)){
	     b_type   = type + 16;
	    if(sock->extra_reg[thread].vld[b_type])sock->extra_reg[thread].vld[b_type] = 0;
	  }
	}
	//	if(which_command == WRITE_REG && thread == 19)io_printf("HERE2\n");
	return;
      }//sock->context[thread].vld[type]    
      else if((type > 15) && (type < 24)                        &&
	      sock->context[thread].local_vld[type-16]          && 
	      (win == sock->context[thread].local_win[type-16]) && 
	      (which_command == WRITE_REG)){

	slam_val(thread, sock->context[thread].local_val[type-16], (sock->context[thread].local_val[type-16] >> 32));
	sock->context[thread].local_vld[type-16] = 0;
	sock->max_count   = 0;
	if(sock->context[thread].vld[type] &&
	   sock->context[thread].local_val[type-16] == sock->context[thread].val[type]){
	  sock->context[thread].vld[type] = 0;
	 if(sock->context[thread].num)sock->context[thread].num--;
	}
	//	io_printf("MULDATA0 thread=%d reg=%d win= %d %llx %llx\n", thread, type, sock->extra_reg[thread].win[type],
	//	  sock->context[thread].local_val[type], sock->context[thread].val[type]);

	//if(//sock->extra_reg[thread].vld[type] &&
	// sock->extra_reg[thread].win[type] == sock->context[thread].local_win[type])
	  sock->extra_reg[thread].val[type] =  sock->context[thread].val[type];
	return;
      }
      else if(sock->context[thread].fvld[type] && (which_command > WRITE_REG)){//floating point
	aval[0] =  sock->context[thread].fp[type];
	aval[1] = 0;
	if(which_command == FLOAT_X){
	  aval[1] = sock->context[thread].fp[type];
	  aval[0] = sock->context[thread].fp[type+1];
	  sock->context[thread].fvld[type+1]   = 0;
	  sock->context[thread].num--;
	  sock->extra_reg[thread].fvld[type+1] = 0;
	}
	tf_putlongp(1, aval[0], aval[1]);
	tf_putp(0, 1);
	sock->context[thread].num--;
	sock->context[thread].fvld[type]   = 0;
	sock->extra_reg[thread].fvld[type] = 0;
	sock->max_count = 0;
	return;
      }
      else{
	if((which_command == WRITE_REG ) && (type  > 23) && (type < 32)){//out register
	  b_type = type;
	  s_win  = win;
	  type   = type - 16;
	  win    = win == 0 ?  7 : win - 1;
	  if(sock->context[thread].vld[type]          && 
	     (win == sock->context[thread].win[type]) && 
	     (which_command < FLOAT_I)){
	    slam_val(thread, sock->context[thread].val[type], (sock->context[thread].val[type] >> 32));
	    sock->context[thread].vld[type] = 0;
	    sock->max_count   = 0;
	    if(step_list >= 2)sock->old[thread] = type;
	    if(which_command == WRITE_REG){
	      sock->reg_vld[thread] = 0; 
	      if(sock->extra_reg[thread].vld[b_type])sock->extra_reg[thread].vld[b_type] = 0;
	      if(sock->extra_reg[thread].vld[type])  sock->extra_reg[thread].vld[type]   = 0;
	    }
	    return;
	  }
	}
	if((which_command  == WRITE_REG) && (type  < 16) && (type  > 7)){//in tegister
	  s_win = win; 
	  b_type= type;
	  type  = type + 16;
	  win   = win == 7 ?  0 : win + 1;
	  if(sock->context[thread].vld[type]          && 
	     (win == sock->context[thread].win[type]) && (which_command < FLOAT_I)){
	    slam_val(thread, sock->context[thread].val[type], (sock->context[thread].val[type] >> 32));
	    sock->context[thread].vld[type]     = 0;
	    sock->max_count = 0;
	    if(step_list >= 2)sock->old[thread] = type;
	    if(which_command == WRITE_REG){
	      sock->reg_vld[thread] = 0; 
	      win = win == 0 ? 7 : win - 1;
	      if(sock->extra_reg[thread].vld[b_type])sock->extra_reg[thread].vld[b_type] = 0;
	      if(sock->extra_reg[thread].vld[type])  sock->extra_reg[thread].vld[type]= 0;
	    }
	    return;
	  }
	}
	if(sock->context[thread].vld[CCR] && (type == CCR)){//if muls ccr happen, ignore that.
	  sock->context[thread].vld[type] = 0;
	  sock->context[thread].num--; 
	  tf_putp(0, 0);
	  return;
	}
	if(type == INTR_RECEIVE   || type == HINTP || ((step_list >= 2) && (step_list <= 4))){
	  if(type == INTR_RECEIVE || type == HINTP)sock->extra_reg[thread].vld[type] = 0;
	  tf_putp(0, 5);
	  return;
	}
	else {
	  check_wrong(thread, type, step_list, win, which_command);
	  return;
	}
      }
    }
    else{
      if((sock->read < 30) && (sock->len < 40)){
	sock->read++;
	check_max();
	return;
      } 
      sock->read = 0;
      if(sock->str_active->vld[thread])which_data(thread, 1, type, reg_num, which_command);
      else if(((sock->len && which_data(thread, 1, type, reg_num, which_command)) == 0) && 
	      read_socket_nfd())which_data(thread, 1, type, reg_num, which_command);
      if((sock->context[thread].num == 0) &&
	 sock->context_sec[thread].num)moveContent(thread);

      if(sock->context[thread].vld[type]          && 
	 (win == sock->context[thread].win[type]) && 
	 (type > 7) && (type < 32) && 
	 (which_command == WRITE_REG) ||//special registers
	 sock->context[thread].vld[type] && ((type < 8) &&  (win == sock->context[thread].win[type])  ||
					     type > 31) && (which_command < FLOAT_I)){
	//save pc for comparsion.
	if(type == PC){
	  sock->target_pc[thread][0] = sock->target_pc[thread][1];
	  sock->target_pc[thread][1] = sock->context[thread].val[PC];
	}
	slam_val(thread, sock->context[thread].val[type], (sock->context[thread].val[type] >> 32));
	sock->context[thread].vld[type] = 0; 
	sock->max_count = 0;
	if((which_command == WRITE_REG) && (step_list >= 2))sock->old[thread] = type;	
	//if there is regval case, check it whether leftover or not.
	if(which_command == WRITE_REG || (which_command > 31) && (which_command < WRITE_REG)){
	  if(which_command == WRITE_REG)sock->reg_vld[thread] = 0; 
	  sock->extra_reg[thread].vld[type] = 0;
	  if(which_command  == WRITE_REG){
	    if((type  > 23) && (type < 32)){
	      b_type   = type - 16;
	      if(sock->extra_reg[thread].vld[b_type])sock->extra_reg[thread].vld[b_type] = 0;
	    }
	    else if((7 < type) && (type  < 16)){
	      b_type   = type + 16;
	      if(sock->extra_reg[thread].vld[b_type])sock->extra_reg[thread].vld[b_type] = 0;
	    }
	  }
	}
	//	io_printf("%0d SECSLAM %llx\n", sock->context[thread].val[type]);
	if(thread == 0 && which_command ==WRITE_REG)sock->find_loop[thread] = 0;
	return;
      }
      else if((type > 15) && (type < 24) && 
	      sock->context[thread].local_vld[type-16]          && 
	      (win == sock->context[thread].local_win[type-16]) && 
	      (which_command == WRITE_REG)){
	slam_val(thread, sock->context[thread].local_val[type-16], (sock->context[thread].local_val[type-16] >> 32));
	sock->context[thread].local_vld[type-16] = 0; 
	sock->max_count = 0;
	if((which_command == WRITE_REG) && (step_list >= 2))sock->old[thread] = type;
	if(sock->context[thread].vld[type] &&
	   sock->context[thread].local_val[type-16] == sock->context[thread].val[type]){
	  sock->context[thread].vld[type] = 0;
	  if(sock->context[thread].num)sock->context[thread].num--;
	}
	//if(//sock->extra_reg[thread].vld[type] &&
	// sock->extra_reg[thread].win[type] == sock->context[thread].local_win[type])
	  sock->extra_reg[thread].val[type] =  sock->context[thread].val[type];
	return;
      }
      else if(sock->context[thread].fvld[type] && (which_command > WRITE_REG)){
	aval[0] =  sock->context[thread].fp[type];
	aval[1] = 0;
	if(which_command == FLOAT_X){
	  aval[1] = sock->context[thread].fp[type];
	  aval[0] = sock->context[thread].fp[type+1];
	  sock->context[thread].fvld[type+1]   = 0;
	  sock->context[thread].num--;
	  sock->extra_reg[thread].fvld[type+1] = 0;
	}
	tf_putlongp(1, aval[0], aval[1]);
	tf_putp(0, 1);
	sock->context[thread].num--;
	sock->context[thread].fvld[type]   = 0;
	sock->extra_reg[thread].fvld[type] = 0;
	sock->max_count                    = 0;
	return;
      }
    }      
    check_max();
  }
  //get data from an input stream of simics.
  else request_value(thread, type, win, reg_num, which_command, step_list);
}
/*-------------------------------------------------------------------------------
send request.
--------------------------------------------------------------------------------*/
int send_socket_nfd(char* send_buf, int len)
{
  int   status, slen, counter, i;

  slen = send(sock->sockfd, send_buf, len, 0);
  if(slen == -1){
    //io_printf("Info:Try, but can't send data. length(%d)\n", len);
    return 0;
  }
  else if(slen == len){
    sock->num = 0;
    sock->sent= 1;
    return 1;
  }
  else if(slen < len){
    counter = 0;
    for(i = slen; i < len;i++)send_buf[counter++] =  send_buf[i];
    sock->num -= slen;
    sock->sent= 1;
    return 0; 
  }
}

/*-------------------------------------------------------------------------------
send request.
--------------------------------------------------------------------------------*/
int send_socket(char* send_buf, int len)
{
  int   status, slen, counter, i;
 
  FD_ZERO(&sock->fd_wr);
  FD_SET(sock->sockfd, &sock->fd_wr);
  if((status = select(sock->sockfd+1,  NULL, &sock->fd_wr, NULL, &sock->tv)) > 0){
    slen = send(sock->sockfd, send_buf, len, 0);
    if(slen != len){
      io_printf("Error(%0lld): During sending message, error detected. -> command(%x) err(%d)\n", 
		get_time(), send_buf[0], slen);
      
      tf_dofinish();
    }
    return 1;
  }
  else if(status == -1){
    io_printf("Error(%0lld): socket has problem  -> %s!!\n", get_time(), send_buf);
    tf_dofinish();
  }
  else return 0;
}
/*-------------------------------------------------------------------------------
send a command to simics
--------------------------------------------------------------------------------*/
int bw_sas_send_scall()
{
  unsigned int word;
  char cmd_buf[CMD_BUFSIZE];
  int  groups, ind, args, num, cond;
  s_tfnodeinfo node_info;

  for(ind = 0; ind < tf_nump(); ind++)cmd_buf[ind] = tf_getp(ind+1);
  if(sock->debug_socket_pli){
    switch(cmd_buf[0]){
    case(PLI_QUIT) : 
      io_printf("sent(%d) quit\n", tf_gettime());
      break;
    case(PLI_SSTEP) :
      io_printf("sent(%d) step thread(%x)\n", tf_gettime(), cmd_buf[1]);
      break;
    case(PLI_READ_TH_REG) :
      io_printf("sent(%d) read thread(%x) win(%x) reg(%d)\n", tf_gettime(), cmd_buf[1], 
		cmd_buf[2], cmd_buf[3]);
      break;
    case(PLI_READ_TH_CTL_REG) :
      io_printf("sent(%d) read-special thread(%x) reg(%d)\n", tf_gettime(), cmd_buf[1], cmd_buf[2]);
      break;
    case(PLI_READ_TH_FP_REG_I) :
      io_printf("sent(%d) float-32 thread(%x) reg(%d)\n", tf_gettime(), cmd_buf[1], cmd_buf[2]);
      break;
    case(PLI_READ_TH_FP_REG_X) :
      io_printf("sent(%d) float-64 thread(%x) reg(%d)\n", tf_gettime(), cmd_buf[1], cmd_buf[2]);
      break;
    case(PLI_RTL_DATA) : io_printf("sent(%d) rtl-data\n", tf_gettime());
      break;
    case(PLI_WRITE_TH_XCC_REG) : io_printf("sent(%d) PLI_WRITE_TH_XCC_REG thread(%x) xcc(%x)\n", tf_gettime(),
					   cmd_buf[1], cmd_buf[2]);
      break; 
    case(PLI_RETRY) : io_printf("sent(%d) ReTry\n", tf_gettime());
      break;
    }
  }
  if(cmd_buf[0] == PLI_RTL_CYCLE){//send rtl cycle
    num = tf_getp(2);
    for(ind = 0; ind < num;ind++)cmd_buf[ind] = PLI_RTL_CYCLE;
  }
  if(cmd_buf[0] == PLI_RTL_DATA){
    tf_nodeinfo(2, &node_info);
    ind        = 1;
    for(groups = (node_info.node_ngroups - 1); groups >= 0; groups--){
      word   = node_info.node_value.vecval_p[groups].avalbits;
      cmd_buf[ind]   = (word >> 24) & 0xff;
      cmd_buf[ind+1] = (word >> 16) & 0xff;
      cmd_buf[ind+2] = (word >> 8)  & 0xff;
      cmd_buf[ind+3] = word & 0xff;
      ind += 4;
    }
  }
  if(cmd_buf[0] == PLI_RETRY)ind = 0;
  if(cmd_buf[0] == PLI_QUIT)sock->num = 0;

  if((cmd_buf[0] != PLI_RETRY) && 
     (cmd_buf[0] != PLI_QUIT)  &&
     (sock->num < SEND_MAX)){
     cond = sock->num;
     for(args = 0; args < ind; args++){
       sock->rerv[cond] = cmd_buf[args];
       cond++;
     }
     sock->num = cond;
  }
  else if(sock->num){
    cond = sock->num;
    for(args = 0; args < ind; args++){
      sock->rerv[cond] = cmd_buf[args];
      cond++;
    }
    sock->num = cond;
    if(send_socket_nfd(sock->rerv, sock->num)){
       sock->num     = 0;
       tf_putp(0, 0);
    }
    else {
     ((CMD_BUFSIZE - sock->num) == 0) ? tf_putp(0, CMD_BUFSIZE) : tf_putp(0, sock->num); 
    }
  }
  else{
    if(send_socket_nfd(cmd_buf, ind)){
      tf_putp(0, 0);
    }
    else{
      for(cond = 0; cond < ind; cond++)sock->rerv[cond] = cmd_buf[cond];
      sock->num = ind;
      ((CMD_BUFSIZE - sock->num) == 0) ? tf_putp(0, CMD_BUFSIZE) : tf_putp(0, sock->num);
    }
  }
}

/*-------------------------------------------------------------------------------
 copy data to socket send buffer.
--------------------------------------------------------------------------------*/
void copyPacket(char* buf, int num)
{
  int idx;

  for(idx = 0; idx < num; idx++)sock->rerv[sock->num++] = buf[idx];
}
/*-------------------------------------------------------------------------------
 shift data in list to reserved buffer of send.
--------------------------------------------------------------------------------*/
int packed()
{
  int available, num;
  buf_node_ptr node;

  available = CMD_BUFSIZE - sock->num;
  while(sock->active->head_ptr && available){  
    node = sock->active->head_ptr;
    num  = node->count;
    if(num <= available){//move whole junk.
      node = (buf_node_ptr) buf_pop(sock->active);
      copyPacket(node->data+node->start, num);
      buf_push(sock->heap, &node);    
    }
    else {
      num = available;
      copyPacket(node->data+node->start, num);
      node->start += num;
      node->count -= num;
    }
    available -= num;
  }
}
/*-------------------------------------------------------------------------------
 add the new data to the end of send list.
--------------------------------------------------------------------------------*/
void add_node(char* buf, int index, int num)
{
  int idx, nidx, available;
  buf_node_ptr node;

  if(sock->active->head_ptr){//fill the last node if space is available.
    node      = sock->active->tail_ptr;
    nidx      = node->start + node->count;
    available = NODE_SIZE   - nidx;
    if(available){
      available    = available > num ? num : available; 
      num         -= available;   
      node->count += available;   
      for(idx   = nidx; idx < (nidx + available);idx++)node->data[idx] = buf[index++]; 
    }
  }
  while(num){
    if(sock->heap->head_ptr)node = buf_pop(sock->heap);
    else node = (buf_node_ptr)malloc(sizeof(struct buf_node));
    node->start = 0;     
    available   = NODE_SIZE > num ? num : NODE_SIZE; 
    for(idx = 0; idx < available; idx++)node->data[idx] = buf[index++];
    node->count  = available;
    num         -= available;
    buf_push(sock->active, &node);
  }
}
/*-------------------------------------------------------------------------------
 make the reusable buffer for socket send.
--------------------------------------------------------------------------------*/
void handle_buf(char *cmd_buf, int num)
{
  int available, idx;

  available = sock->num + num;
  if((cmd_buf[0] != PLI_RETRY) && 
     (cmd_buf[0] != PLI_QUIT)  &&
     (available  < SEND_MAX)){//not reach the minimum number to be sent.
     copyPacket(cmd_buf, num);
     sock->sent = 0;
     return;
  }
  //send data to simcs.  
  available = CMD_BUFSIZE - sock->num;
  available = available  > num ? num : available;
  copyPacket(cmd_buf, available);
  send_socket_nfd(sock->rerv, sock->num);
  num      -= available;
  idx       = available;
  //check list buffer
  if(sock->active->head_ptr)packed();
  available = CMD_BUFSIZE - sock->num;
  if(available && num && (sock->active->head_ptr == 0)){
  //move data on the send buffer if avaiable.
    available = available  > num ? num : available;
    copyPacket(cmd_buf+idx, available);
    num      -= available;
    idx      += available;
  }
  if(num)add_node(cmd_buf, idx, num);
}
/*-------------------------------------------------------------------------------
send a command to simics
--------------------------------------------------------------------------------*/
int bw_sas_send_call()
{
  unsigned int word;
  //char cmd_buf[CMD_BUFSIZE];
  char cmd_buf[2024];
  int  groups, ind, args, num, cond;
  s_tfnodeinfo node_info;

  for(ind = 0; ind < tf_nump(); ind++)cmd_buf[ind] = tf_getp(ind+1);
  if(sock->debug_socket_pli){
    switch(cmd_buf[0]){
    case(PLI_QUIT) : 
      io_printf("sent(%0lld) quit\n", get_time());
      break;
    case(PLI_SSTEP) :
      sock->step++;
      io_printf("sent(%0lld) step(%d) thread(%d)\n", get_time(), sock->step,  cmd_buf[1]);     
      break;
    case(PLI_READ_TH_REG) :
      sock->req++;
      io_printf("sent(%0lld) read thread(%d) win(%x) reg(%d) number(%d)\n", get_time(), cmd_buf[1], 
		cmd_buf[2], cmd_buf[3], sock->req);
      break;
    case(PLI_READ_TH_CTL_REG) :
      sock->req++;
      io_printf("sent(%0lld) read-special thread(%d) reg(%d) number(%d)\n", get_time(), cmd_buf[1], 
		cmd_buf[2], sock->req);
      break;
    case(PLI_READ_TH_FP_REG_I) :
      sock->req++;
      io_printf("sent(%0lld) float-32 thread(%d) reg(%d) number(%d)\n", get_time(), cmd_buf[1], 
		cmd_buf[2], sock->req);
      break;
    case(PLI_READ_TH_FP_REG_X) :
      sock->req++;
      io_printf("sent(%0lld) float-64 thread(%d) reg(%d) number(%d)\n", get_time(), cmd_buf[1], 
		cmd_buf[2], sock->req);
      break;
    case(PLI_RTL_DATA) : io_printf("sent(%0lld) rtl-data\n", get_time());
      break;
    case(PLI_WRITE_TH_XCC_REG) : io_printf("sent(%0lld) PLI_WRITE_TH_XCC_REG thread(%x) xcc(%x)\n", get_time(),
					   cmd_buf[1], cmd_buf[2]);
      break; 
    case(PLI_WRITE_TH_REG_HI) :
      io_printf("sent(%0lld) PLI_WRITE_TH_REG_HI thread(%x) win(%x) reg(%d) val(%x)\n", get_time(), 
		cmd_buf[1], cmd_buf[2], cmd_buf[3], cmd_buf[4]);
      break;  
    case(PLI_WRITE_TH_REG) :
      io_printf("sent(%0lld) PLI_WRITE_TH_REG-64bits thread(%x) win(%x) reg(%d) val(%x)\n", get_time(), 
		cmd_buf[1], cmd_buf[2], cmd_buf[3], cmd_buf[4]);
      break;  
    case(PLI_WRITE_TH_CTL_REG) :
      io_printf("sent(%0lld) PLI_WRITE_TH_CTL_REG thread(%d) reg(%d)\n", get_time(), cmd_buf[1], 
		cmd_buf[2]);
      break;
    case(PLI_RETRY) : io_printf("sent(%0lld) ReTry remained-data(%0d)\n", get_time(), sock->num);
      break;
    case(PLI_FORCE_TRAP_TYPE) :
       io_printf("sent(%0lld) PLI_FORCE_TRAP_TYPE  thread(%d) trap-type(%x)\n", 
		 get_time(), cmd_buf[1], cmd_buf[2]);
      break;
    case(PLI_RESET_TLB_ENTRY) :
       io_printf("sent(%0lld) PLI_RESET_TLB_ENTRYE  thread(%d) tlb(%x) index(%d)\n", 
		 get_time(), cmd_buf[1], cmd_buf[2], cmd_buf[3]);
      break;
    case(PLI_INST_TTE ) :
       io_printf("sent(%0lld) PLI_INST_TTE   thread(%d) %02x%02x%02x%02x%02x%02x%02x%02x\n", 
		 get_time(), cmd_buf[1], cmd_buf[2]& 0xff, cmd_buf[3]& 0xff, cmd_buf[4]& 0xff, cmd_buf[5]& 0xff, 
		                           cmd_buf[6]& 0xff, cmd_buf[7]& 0xff, cmd_buf[8]& 0xff, cmd_buf[9] & 0xff);
      break; 
    case(PLI_DATA_TTE ) :
       io_printf("sent(%0lld) PLI_DATA_TTE   thread(%d) %02x%02x%02x%02x%02x%02x%02x%02x\n", 
		 get_time(), cmd_buf[1], cmd_buf[2]& 0xff, cmd_buf[3]& 0xff, cmd_buf[4]& 0xff, cmd_buf[5]& 0xff, 
		                           cmd_buf[6]& 0xff, cmd_buf[7]& 0xff, cmd_buf[8]& 0xff, cmd_buf[9]& 0xff);
      break; 
    case(TIMESTAMP) :
       io_printf("sent(%0lld) TIMESTAMP    %02x%02x%02x%02x%02x%02x%02x%02x\n", 
		 get_time(),  cmd_buf[1]& 0xff, cmd_buf[2]& 0xff, cmd_buf[3]& 0xff, cmd_buf[4]& 0xff, 
		                cmd_buf[5]& 0xff, cmd_buf[6]& 0xff, cmd_buf[7]& 0xff, cmd_buf[8]& 0xff);
      break;   
    case(ITLB_SLAM) :
      io_printf("sent(%0lld) itlb data core(%d) way(%d) tag(%02x%02x%02x%02x%02x%02x%02x%02x) data(%02x%02x%02x%02x%02x%02x%02x%02x)\n",
		get_time(), cmd_buf[1] & 0xff,  cmd_buf[2] & 0xff, 
		cmd_buf[3] & 0xff, cmd_buf[4] & 0xff, cmd_buf[5]&0xff, cmd_buf[6]&0xff,
		cmd_buf[7] & 0xff, cmd_buf[8] & 0xff, cmd_buf[9]&0xff, cmd_buf[10]&0xf,
		cmd_buf[11]&0xff, cmd_buf[12]&0xff, cmd_buf[13]&0xff, cmd_buf[14]&0xff,
		cmd_buf[15]&0xff, cmd_buf[16]&0xff, cmd_buf[17]&0xff, cmd_buf[18]&0xff);
      break;
    case(DTLB_SLAM) :
      io_printf("sent(%0lld) dtlb data core(%d) way(%d) tag(%02x%02x%02x%02x%02x%02x%02x%02x) data(%02x%02x%02x%02x%02x%02x%02x%02x)\n",
		get_time(), cmd_buf[1] & 0xff,  cmd_buf[2] & 0xff, 
		cmd_buf[3]&0xff, cmd_buf[4]&0xff, cmd_buf[5]&0xff, cmd_buf[6]&0xff,
		cmd_buf[7]&0xff, cmd_buf[8]&0xff, cmd_buf[9]&0xff, cmd_buf[10]&0xf,
		cmd_buf[11]&0xff, cmd_buf[12]&0xff, cmd_buf[13]&0xff, cmd_buf[14]&0xff,
		cmd_buf[15]&0xff, cmd_buf[16]&0xff, cmd_buf[17]&0xff, cmd_buf[18]&0xff);
      break;
    }
  }
  if(cmd_buf[0] == ITLB_SLAM || cmd_buf[0] == DTLB_SLAM)return 0;
  if(cmd_buf[0] == PLI_RTL_CYCLE){//send rtl cycle
    num = tf_getp(2);
    for(ind = 0; ind < num;ind++)cmd_buf[ind] = PLI_RTL_CYCLE;
  }
  if(cmd_buf[0] == PLI_RTL_DATA){
    tf_nodeinfo(2, &node_info);
    ind        = 1;
    for(groups = (node_info.node_ngroups - 1); groups >= 0; groups--){
      word   = node_info.node_value.vecval_p[groups].avalbits;
      cmd_buf[ind]   = (word >> 24) & 0xff;
      cmd_buf[ind+1] = (word >> 16) & 0xff;
      cmd_buf[ind+2] = (word >> 8)  & 0xff;
      cmd_buf[ind+3] = word & 0xff;
      ind += 4;
    }
  }
  if(cmd_buf[0] == PLI_RETRY)ind = 0;
  if(cmd_buf[0] == PLI_QUIT){
    sock->num = 0;
    if(sock->active->head_ptr)sock->active->head_ptr = 0;
  }
  handle_buf(cmd_buf, ind);
}
/*-------------------------------------------------------------------------------
Is it is empty?
--------------------------------------------------------------------------------*/
int bw_is_empty_call(){

 tf_putp(0, sock->len || sock->regval_list->head_ptr );
 read_socket_nfd();

}
/*-------------------------------------------------------------------------------
Does it hit the good trap?
--------------------------------------------------------------------------------*/
void set_mask(int thread)//, long long pc, long long npc)
{
  long long mask;
  if(sock->finish_mask & ( 1 << thread)){
    if(
       sock->target_pc[thread][1] == sock->good_pc[thread] ||
       sock->target_pc[thread][0] == sock->good_pc[thread]){
      sock->good_mask              |= (1 << thread);
      sock->good_mask_array[thread] = 1;
    }
  }
}
/*-------------------------------------------------------------------------------
pli for the good trap checker.
--------------------------------------------------------------------------------*/
void check_good_trap_call()
{
  int low, high, thrid, mask;
  long long lpc;

  switch(tf_getp(1)){//get command
  case 1 ://set finish mask
    sock->finish_mask = tf_getp(2);
    sock->good_mask   = 0;
    break;
  case 2 ://get good trap pc.
    thrid = tf_getp(2);
    low   = tf_getlongp(&high, 3);
    lpc   = low;
    lpc  &= 0xffffffff;
    sock->good_pc[thrid]   = high;
    sock->good_pc[thrid] <<= 32;
    sock->good_pc[thrid]  &= 0xffffffff00000000;
    sock->good_pc[thrid]  |= lpc;
    sock->good_vld[thrid]  = 1;
    sock->good_mask_vld   |= (1 << thrid);
    io_printf("(%0lld)Info:good_trap for thread(%d) pc(%llx) finish_mask(%x) good_mask(%x) mask_vld(%x)\n", 
	      get_time(), thrid, sock->good_pc[thrid], 
	      sock->finish_mask, sock->good_mask, sock->good_mask_vld);
    break;
  case 3 :
    mask = 0;
    if(sock->good_mask_vld){
      for(thrid = 0; thrid < 32;thrid++){
	mask <<= 1;
	mask  |= 1;
	if(sock->good_vld[thrid])set_mask(thrid);
	if(sock->good_mask_vld == mask)break;
      }
    }
    tf_putp(0, (sock->finish_mask == sock->good_mask));
    break;
  }
}
/*--------------------------------
clean up all the buffers
----------------------------------*/
void bw_reset_buffer_call(){
  int status, i;
  list_node_ptr node;
  buf_node_ptr  bnode;
  /*
  for(status = 0; status < 32; status++){
    for(i = 0; i < FLOAT_I;i++){
      sock->context[status].vld[i]     = 0;
      sock->context_sec[status].vld[i] = 0;
      sock->extra_reg[status].vld[i]   = 0;
      //  sock->wrmrst[status]             = 0;
    }
    for(i = 0; i < 64;i++){
      sock->context[status].fvld[i]     = 0;
      sock->context_sec[status].fvld[i] = 0;
      sock->extra_reg[status].fvld[i]   = 0;
      sock->back[status].fvld[i]        = 0;
      sock->extra_sec[status].fvld[i]   = 0; 
    }
    for(i = 0; i < 8;i++){
      sock->context[status].local_vld[i] = 0;
      sock->context_sec[status].local_vld[i] = 0;
    }
    sock->back[status].num        = 0;
    sock->context[status].num     = 0;
    sock->context_sec[status].num = 0;
    sock->context[status].win_switch = 0;
    sock->context_sec[status].win_switch = 0;
    sock->intvf[status]           = 0;
    sock->str_active->vld[status] = 0;
    sock->drop_vld[status]        = 0;
    sock->intr_num[status]        = 0;
    sock->tpc[status]             = 0;
    sock->tnpc[status]            = 0;
    sock->pc_vld[status]          = 0;
    sock->good_vld[status]        = 0;
    sock->reg_vld[status]         = 0;
    sock->inst_cnt[status]        = 0; 
    sock->noresponse[status]      = 0;
    sock->cwp_vld[status]         = 0;
    sock->find_loop[status]       = 0;
  }
  while(list_empty(sock->regval_list)){
    node  = (list_node_ptr)pop(sock->regval_list);
    push(sock->regval_heap, &node);
  }
  while(list_empty(sock->intr_val)){
    node  = (list_node_ptr)pop(sock->intr_val);
    push(sock->regval_heap, &node);
  } 
  while(list_empty(sock->phy_list)){
    node  = (list_node_ptr)pop(sock->phy_list);
    push(sock->regval_heap, &node);
  }
  while(list_empty(sock->regval_list)){
    node  = (list_node_ptr)pop(sock->regval_list);
    push(sock->regval_heap, &node);
  }
  while(sock->active->head_ptr){
    bnode = (buf_node_ptr)buf_pop(sock->active);
    buf_push(sock->heap, &bnode);
  }
  while(sock->str_active->head_ptr){
    bnode = (buf_node_ptr)buf_pop(sock->str_active);
   buf_push(sock->heap, &bnode);
   }*/
}
/*--------------------------------
kill simulation.
---------------------------------*/
void bw_fail_call()
{
}

/*--------------------------------
send request.
----------------------------------*/
int bw_tcl_write_call()
{
  FILE *fp;

  if((fp = fopen("sim2tcl.log", "w")) != 0){
    fprintf(fp, "%01x", tf_getp(1));
    fclose(fp);
  }
}
/*---------------------------------
send request.
----------------------------------*/
void sync_tcl(){
  FILE *fp;
  int done;

  //sync up with tcl.
  if((fp = fopen("done", "w")) != 0){
    done = tf_getp(3);
    done =  done ? 0 : 1;
    fprintf(fp, "%01x", done);
    fclose(fp);
    //keep next status
    tf_putp(3, done);
  }
}
/*-------------------------------------------------------------------------------
read tcl file.
--------------------------------------------------------------------------------*/
void bw_tcl_read_call()
{

  FILE *fp;
  long long low, offset;
  int high;
  char buf[3], ch;
  switch(tf_getp(4)){
  case 1 :
    if((fp = fopen("tcl2sim.log", "r")) != 0){
      low       = tf_getlongp(&high, 1);
      low      &= 0xffffffff;
      offset    = high;
      offset  <<= 32;
      offset   &= 0xffffffff00000000;
      offset   |= low;
      fseek(fp, offset, SEEK_SET);
      if((feof(fp) == 0) &&
	 fgets(buf, 3, fp)){
	ch   = buf[0] > '9' ? ((buf[0] & 0xf) + 9) : buf[0] & 0xf;
	ch <<= 4;
	ch  |= buf[1] > '9' ? ((buf[1] & 0xf) + 9) : buf[1] & 0xf;//(buf[1] & 0xf);
	tf_putp(2, ch);//command
	offset += 3;//always data with cariage return.
	tf_putlongp(1, offset, offset >> 32);
	tf_putp(0, 1);
	sync_tcl();//sync up.
      }
      else tf_putp(0, 0);//reach at the end of file.
      fclose(fp);
    }
    else tf_putp(0, 0);
    break;
  case 2 :
    sync_tcl();
    break;
  }
}
