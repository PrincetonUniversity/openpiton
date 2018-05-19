// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: event.cc
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
#include "event.h"
/*--------------------------------------
 set initial value to variables
----------------------------------------*/
void event::clear()
{
  //variable for warm reset.
  warmrst        = 0;
  warmrst_delay  = 0;
  extint         = 0;
  extint_delay   = 0;
  temptrig       = 0;
  temptrig_delay = 0;
  cpxstall        = 0;
  cpxstall_ready  = 0;
  pcxstall        = 0;
  pcxstall_ready  = 0;
  clkstretch       = 0;
  clkstretch_ready = 0;
  clkstretch_delay = 0;
  cpx_done  = 0;
  pcx_done  = 0;
}
/*--------------------------------------
 constructor.
----------------------------------------*/
event::event(char* str)
{
  read_evfile(str);
  clear();  
}
/*--------------------------------------
 constructor.
----------------------------------------*/
event::event()
{
  clear();  
}
/*--------------------------------------
 set event varable
----------------------------------------*/
void event::set_warm()
{
  warmrst       = 1;
  warm_ready    = 0;
  warmrst_delay = random() & 3;
}
/*--------------------------------------
 set event varable
----------------------------------------*/
void event::set_extint(int wait)
{
  extint       = 1;
  extint_ready = 0;
  extint_delay = wait;
}
/*--------------------------------------
 set event varable
----------------------------------------*/
void event::set_temptrig(int wait)
{
  temptrig       = 1;
  temptrig_ready = 0;
  temptrig_delay = wait;
}
/*--------------------------------------
 set event varable
----------------------------------------*/
void event::set_clkstretch(int wait)
{
  clkstretch       = 1;
  clkstretch_ready = 0;
  clkstretch_delay = wait;
}
/*--------------------------------------
 set cpx event
----------------------------------------*/
void event::set_cpxstall(int wait, int cpu)
{
  int pos;
  pos             = 1 << cpu;
  cpxstall       |= pos;
  cpxstall_ready |= pos;
  cpxstall_ready ^= pos;
  cpxstall_delay[cpu] = wait;
  //io_printf("info: CPX_STALL is set bank(%d) wait(%d)\n", cpu, cpxstall_delay[cpu]);
}
/*--------------------------------------
 set cpx event
----------------------------------------*/
void event::set_pcxstall(int wait, int cpu)
{
  int pos;
  pos             = 1 << cpu;
  pcxstall       |= pos;
  pcxstall_ready |= pos;
  pcxstall_ready ^= pos;
  pcxstall_delay[cpu] = wait;
}
/*--------------------------------------
  translate to pcx packet format.
----------------------------------------*/
void event::xlation(event_record* src, pcx* pcx_pkt)
{
  switch(src->event_type){
  case INT_TYPE:
    pcx_pkt->clean();
    pcx_pkt->rqtype  = INT_RQ;
    pcx_pkt->nc      = 0;
    pcx_pkt->cpu_id  = src->cpu_id;
    pcx_pkt->thrid   = src->thrid;
    pcx_pkt->way     = 0;
    pcx_pkt->pkt[3]  = src->type  << 16;
    pcx_pkt->pkt[2] |= 1 << 31;
    pcx_pkt->pkt[3] |= (src->true_id & 0x3fff) << 18;
    pcx_pkt->pkt[2] |= (src->true_id >> 16) & 0xffff;
    pcx_pkt->pkt[3] |= (src->cpu_id & 7) << 10;
    pcx_pkt->pkt[3] |= (src->thrid & 3) << 8;
    pcx_pkt->pkt[3] |= src->vec;
    pcx_pkt->bf_id   = 0;
    pcx_pkt->pa_10_6 = 0;
    pcx_pkt->addr    = 0;
    pcx_pkt->size    = 0;
    pcx_pkt->io_wait = 0;
    pcx_pkt->set_dev();
    pcx_pkt->wait   = 3;
    break;
  }
}
/*--------------------------------------
  remove hexa indicator
  ---------------------------------------*/
int event::get_reg(char* buf){
  int reg;
//get register number
  if(buf[0] == '%'){
    switch(buf[1]){
    case('g') :
      reg = buf[2] & 0x0f;
      break;
    case('o') :
      reg =  8 + buf[2] & 0x0f;
      break;
    case('l') : 
      reg = 16 + buf[2] & 0x0f;
      break;
    case('i') :
      reg = 24 + buf[2] & 0x0f;
      break;
    }
  }
  return reg;
}
/*--------------------------------------
 Here, process the following events.

1). printhexa and printdec
2). cache invalidate events

type:
 !$EV  trig_pc_d(1, 64'h900000)->invalid_cache(100)
 !$EV  trig_pc_d(1, 64'h0000000001834138) -> printhex("diagprinthex", %o2)
 !$EV  trig_pc_d(1, 64'h0000000001834140) -> printdec("diagprintdec", %o2)
 !$EV  trig_pc_d(1, 64'h0000000001834140) -> warmrst()
 !$EV  trig_pc_d(1, 64'h0000000001834140) -> extint()
----------------------------------------*/
void event::read_evfile(char* str)
{
  char  buf [BUFFER];
  char  cbuf[BUFFER];//temp variavle for intermiate data
  FILE *fp;
  
  if((fp = fopen(str, "r")) == NULL){
    tf_error("Error: cannot open the file %s for reading\n", str);
    tf_dofinish();
  } 
  //read a file by eof
  while(fgets(buf, BUFFER, fp)){
    idx = rmSpace(buf, 0, BUFFER);//remove leading spaces
    replace(buf);
    if(strncmp(buf, "trig_pc_d ", 10))continue;//comment or space line.
    idx = rmSpace(buf, 10, BUFFER);   
    copy(buf, &idx, cbuf);kind = atoi(cbuf);//which
    idx = rmSpace(buf, idx, BUFFER);   
    copy(buf, &idx, cbuf);//pc value
    rmhexa(cbuf);
    key = getEight(cbuf);
    idx = rmSpace(buf, idx, BUFFER);   
    //get event type here.
    copy(buf, &idx, cbuf);
    //events
    if     (strncmp(cbuf, "printhex", 8)       == 0){
      event_type = 1;//key = 0x40294;event_type  =TEMPTRIG;}
      //key = 0x400d0;event_type = CPX_STALL;
    }
    else if(strncmp(cbuf, "printdec", 8)       == 0){
      event_type = 2;//key = 0x80c80;event_type = WARMRST;
      // key = 0x400d4;event_type = PCX_STALL;
    }
    else if(strncmp(cbuf, "invalid_cache", 13) == 0)event_type = 3;
    else if(strncmp(cbuf, "warmrst", 7)        == 0)event_type = WARMRST;
    else if(strncmp(cbuf, "extint", 6)         == 0)event_type = EXTINT;
    else if(strncmp(cbuf, "temptrig", 8)       == 0)event_type = TEMPTRIG;
    else if(strncmp(cbuf, "cpx_stall", 9)      == 0)event_type = CPX_STALL;
    else if(strncmp(cbuf, "pcx_stall", 9)      == 0)event_type = PCX_STALL;
    else if(strncmp(cbuf, "clk_stretch", 11)   == 0)event_type = CLK_STRETCH;
    else continue;
   
    idx             = rmSpace(buf, idx, BUFFER);   
    one_event       = new event_record;      
    one_event->type = event_type;
    
    //process command for each event.
    copy(buf, &idx, cbuf);
    one_event->comment = 0;
    switch(event_type){
    case 1 :
      if(strlen(cbuf)){
	one_event->comment = (char*) malloc(strlen(cbuf)+1);
	strcpy(one_event->comment, cbuf);
      } 
      idx = rmSpace(buf, idx, BUFFER);
      copy(buf, &idx, cbuf);
      one_event->reg = get_reg(cbuf);
      one_event->ch  = cbuf[1]; 
      //one_event->num = 10;one_event->wait = 1; one_event->bank = 0;
      break;
    case 2 :
      if(strlen(cbuf)){
	one_event->comment = (char*) malloc(strlen(cbuf)+1);
	strcpy(one_event->comment, cbuf);
      } 
      idx = rmSpace(buf, idx, BUFFER);
      copy(buf, &idx, cbuf);
      one_event->reg = get_reg(cbuf);
      one_event->ch  = cbuf[1];
      //one_event->num = 10;one_event->wait = 1; one_event->bank = 0;
      break;
    case 3 :
      one_event->wait = atoi(cbuf); 
      break;
    case EXTINT:
      if(strlen(cbuf) == 0)one_event->wait = 1;
      else one_event->wait = atoi(cbuf);
      break;
    case TEMPTRIG:
      if(strlen(cbuf) == 0)one_event->wait = 1;
      else one_event->wait = atoi(cbuf);
      break;
      //appends cpx & pcx stall events
    case CLK_STRETCH:
      if(strlen(cbuf) == 0)one_event->wait = 1;
      else one_event->wait = atoi(cbuf);
      break;
      //appends cpx & pcx stall events 
    case CPX_STALL:
      one_event->bank = atoi(cbuf);
      idx = rmSpace(buf, idx, BUFFER);
      copy(buf, &idx, cbuf);
      one_event->num  = atoi(cbuf);
      one_event->wait = 1;
      io_printf("info:CPX EXTRACT target pc(%llx) num(%d)\n", key, one_event->num);
      break;
    case PCX_STALL:
      one_event->bank = atoi(cbuf);
      idx = rmSpace(buf, idx, BUFFER);
      copy(buf, &idx, cbuf);
      one_event->num  = atoi(cbuf);
      one_event->wait = 1;
      break;  
    }
    //save an event on the event tree.
    if(event_list = pc_event.search(key))event_list->append(one_event);
    else{//push event on the list
      event_list = new List<event_record>;
      event_list->append(one_event);
      pc_event.insert(event_list, key);
    }
  }
  fclose(fp);
}
/*----------------------------------
  Is it hit?
  -----------------------------------*/
int event::hit_pc(long long pc)
{
   if(event_list = pc_event.search(pc))return 1;
   else return 0;
}
/*----------------------------------
  remove hexa indicator
  -----------------------------------*/
int event::which_event()
{
  one_event = event_list->shift();
  if(one_event == 0)return 0;
}
/*-----------------------------------
monitor verilog even and do the proper 
action when it hits.
-------------------------------------*/
void event::print(int thr_loc, int wind_loc)
{
  //active window.
  size    = tf_getp(thr_loc) << 5 | one_event->reg & 0x1f;
  tf_nodeinfo(wind_loc, &node_info);
  avalPtr = node_info.node_value.memoryval_p + size * node_info.node_ngroups * 2;
  val     = 0;
  for(groups = node_info.node_ngroups - 2; groups >= 0;groups--){//ecc dropped.
    val <<= 8;
    val  |= avalPtr[groups] & 0xff;
  }
  switch(one_event->type){//type
  case 1 ://printhex
    if(one_event->comment)
      io_printf("%0d:Info: printhex %s reg(%c%d)->val(0x%llx)\n", tf_gettime(), 
		one_event->comment, one_event->ch, (one_event->reg & 7), val);
    else 
      io_printf("%0d:Info: printhex reg(%c%d)->val(0x%llx)\n", tf_gettime(),  
		one_event->ch, one_event->reg & 7,  val); 
    break;
  case 2 ://printdec
    if(one_event->comment)
      io_printf("%0d:Info: printdec %s reg(%c%d)->val(0x%lld)\n", tf_gettime(), 
		one_event->comment, one_event->ch, (one_event->reg & 7), val);
    else 
      io_printf("%0d:Info: printdec reg(%c%d)->val(0x%lld)\n", tf_gettime(),  
		one_event->ch, one_event->reg & 7,  val); 
    break;
  }
}
/*-----------------------------------
  drive warm reset during one cycle.
------------------------------------*/
void event::drive_warmrst()
{
  if(warmrst){
    tf_putp(WARMRST_ARG, 0);
    warmrst    = 0;
    warm_ready = 1;
    io_printf("Info(%0d): Warm resest is driven by the event.\n", tf_gettime());
  }
  else if(warm_ready){
    tf_putp(WARMRST_ARG, 1);
    warm_ready = 0;
  }
}
/*-----------------------------------
  drive warm reset during one cycle.
------------------------------------*/
void event::drive_extint()
{
  if(extint){
    tf_putp(EXTINT_ARG, 0);
    extint       = 0;
    extint_ready = 1;
    io_printf("Info(%0d): EXT_INT_L is driven by the event.\n", tf_gettime());
  }
  else if(extint_ready){
    if(extint_delay == 0){
      tf_putp(EXTINT_ARG, 1);
      extint_ready = 0;
    }
    else extint_delay--;
  }
}
/*-----------------------------------
  drive temp_trig
------------------------------------*/
void event::drive_temptrig()
{
  if(temptrig){
    tf_putp(TEMPTRIG_ARG, 1);
    temptrig    = 0;
    temptrig_ready = 1;
    io_printf("Info(%0d): TEMP_TRIG is driven by the event.\n", tf_gettime());
  }
  else if(temptrig_ready){
    if(temptrig_delay == 0){
      tf_putp(TEMPTRIG_ARG, 0);
      temptrig_ready = 0;
    }
    else temptrig_delay--;
  }
}
/*-----------------------------------
  drive temp_trig
------------------------------------*/
void event::drive_clkstretch()
{
  if(clkstretch){
    tf_putp(CLKSTRETCH_ARG, 1);
    clkstretch    = 0;
    clkstretch_ready = 1;
    io_printf("Info(%0d): CLK_STRETCH is driven by the event.\n", tf_gettime());
  }
  else if(clkstretch_ready){
    if(clkstretch_delay == 0){
      tf_putp(CLKSTRETCH_ARG, 0);
      clkstretch_ready = 0;
    }
    else clkstretch_delay--;
  }
}

/*-----------------------------------
  drive cpx stall signal.
------------------------------------*/
void event::drive_cpxstall()
{
  int stall, release;
  release = 0;
  stall   = 0;
  int pos;
  for(int i = 0; i < 8; i++){
    pos = 1 << i;
    if(cpxstall & pos){
      stall          |= pos;
      cpxstall_ready |= pos;
      io_printf("Info(%0d): CPX_STALL(%d) is asserted by the event.\n", tf_gettime(), i);
      cpx_done = 0;
      continue;
    }
    if(cpxstall_ready & pos){
      if(cpxstall_delay[i] == 0){
	release        |= pos;
	cpxstall_ready ^= pos;
	io_printf("Info(%0d): CPX_STALL(%d) is released by the event.\n", tf_gettime(), i);
	cpx_done = 1;
      }
      else cpxstall_delay[i]--;
    }
  }
  cpxstall = 0;
  tf_putp(PCXSTALL_ARG, stall);
  tf_putp(PCXFREE_ARG,  release);
}
/*-----------------------------------
  drive temp_trig
------------------------------------*/
void event::drive_pcxstall()
{
  int stall, release;
  release = 0;
  stall   = 0;
  int pos;
  for(int i = 0; i < 8; i++){
    pos = 1 << i;
    if(pcxstall & pos){
      stall          |= pos;
      pcxstall_ready |= pos;
      io_printf("Info(%0d): PCX_STALL(%d) is asserted by the event.\n", tf_gettime(), i);
      pcx_done = 0;
      continue;
    }
    if(pcxstall_ready & pos){
      if(pcxstall_delay[i] == 0){
	release        |= pos;
	pcxstall_ready ^= pos;
	io_printf("Info(%0d): PCX_STALL(%d) is released by the event.\n", tf_gettime(), i);
	pcx_done = 1;
      }
      else pcxstall_delay[i]--;
    }
  }
  pcxstall = 0;
  tf_putp(PCXSTALL_ARG, stall);
  tf_putp(PCXFREE_ARG,  release);
}
/*-----------------------------------
  check pending request.
------------------------------------*/
void event::checker()
{
  if(warmrst    || warm_ready)drive_warmrst();
  if(extint     || extint_ready)drive_extint();
  if(temptrig   || temptrig_ready)drive_temptrig();
  if(clkstretch || clkstretch_ready)drive_clkstretch();
}
/*-----------------------------------
  check cpx & pcx pednding request.
------------------------------------*/
void event::cpx_checker()
{
  switch(tf_getp(2)){
  case 1 : 
    if(pcxstall || pcxstall_ready)drive_pcxstall();
    else if(pcx_done){
      pcx_done = 0;
      tf_putp(PCXFREE_ARG,  0);
    }
    break;
  case 2 : 
    if(cpxstall || cpxstall_ready)drive_cpxstall();
    else if(cpx_done){
      cpx_done = 0;
      tf_putp(PCXFREE_ARG,  0);
    }
    break;
  }
}
