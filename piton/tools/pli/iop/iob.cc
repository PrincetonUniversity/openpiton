// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: iob.cc
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
#include "iob.h"
/*-----------------------------------------------------------------------------
  constructor.
-----------------------------------------------------------------------------*/
int iob::manual_init(char* ev)
{
  
  //set qsel to zero, it means avaiable 2.
  for(idx = 0; idx < 8; idx++)Qsel[idx] = 0;
  //get iob event from event file.
  get_event(ev);
  //generate boot cpx packet.
  boot();
  req     = 0;//cpx request
  pkt_vld = 0;
  next_cpx= 0;//reset flag for cpx packet
  next_req= 0;//reset flag for request.
  pargs = mc_scan_plusargs ("zero_delay_int=");
  if(pargs != (char *) 0)zero_delay = atoi(pargs);
  else zero_delay = 0;
  available = 0xffffffff;
  // available = 0xffffffffffffffff;
  read_core();
  return 0;
}
/*-----------------------------------------------------------------------------
  deceide the bbot thread to start cmp.
-----------------------------------------------------------------------------*/
void iob::read_core()
{
  FILE *fp;//file pointer
  char  buf [BUFFER];
  char  cbuf[BUFFER];//temp variavle for intermiate data
  int   at, num, idx;

  at = 0;
  if((fp = fopen("efuse.img", "r")) != 0){//if not, assume 32 threads avaiable
    while(fgets(buf, BUFFER, fp)){
      idx = rmSpace(buf, 0, BUFFER);
      if(idx < 0)continue;
      if(!strncmp(buf, "@", 1)){
	at = 1;
	continue; 
      }
      if(at){
	copy(buf, &idx, cbuf);
	num       = (int)getEight(cbuf);
	available = 0;
	for(idx = 0; idx < 8; idx++){
	  if(num & 1)available |= (0xf << (idx * 4));
	  num >>= 1;
	}
	break;
      }
    }
  }
  io_printf("Info: Core available value = %x\n", available);
  fclose(fp);
}
/*-----------------------------------------------------------------------------
  deceide the bbot thread to start cmp.
-----------------------------------------------------------------------------*/
void iob::boot()
{
  char  *pargs;
  int mask, i;
  pargs = mc_scan_plusargs ("bootthread=");
  if(pargs != (char *) 0){
    mask = atoi(pargs);
  }
  else mask = 1;
//  for(i = 0; i < 32;i++){//deceide the boot thread.
  for(i = 0; i < 128;i++){//deceide the boot thread.
    if(mask & 1)break;
    mask >>= 1;
  }
  p_pkt = pcx_heap.empty() ? new pcx : pcx_heap.shift();//allocate memory
  (*p_pkt).set_delay();
  (*p_pkt).rqtype      = 0x9;//INT_RQ;
  (*p_pkt).nc          = 0;
  (*p_pkt).cpu_id      = (i >> 2) & 0x7;
  (*p_pkt).thrid       = i & 0x3;
  (*p_pkt).true_id     = i;
  (*p_pkt).way         = 0;  
  (*p_pkt).addr        = 0;
  (*p_pkt).clean();
  //make interrupt pcx packet
  (*p_pkt).pkt[3]  = 1 << 16;
  (*p_pkt).pkt[1] |= 1 << 31;
  (*p_pkt).pkt[3] |= ((i & 0x7f) << 18);
  (*p_pkt).pkt[3] |= ((i & 0x3) << 10);
  (*p_pkt).pkt[3] |= 1;
  pcx_list.append(p_pkt);
}
/*-----------------------------------------------------------------------------
  This routine only extract the pc event from diag.ev.

 $EV trig_pc_d(1, virtal)->intp(1 ,2, 3, source, number)
-----------------------------------------------------------------------------*/
void iob::get_event(char* str)
{
  FILE *fp;//file pointer
  char  buf [BUFFER];
  char  cbuf[BUFFER];//temp variavle for intermiate data
  int kind;
 
  if((fp = fopen(str, "r")) == 0){
    io_printf("Error:  can not open the event file %s for reading\n", str);
    tf_dofinish();
  }
  while(fgets(buf, BUFFER, fp)){
    idx = rmSpace(buf, 0, BUFFER);    
    replace(buf);
    if(strncmp(buf, "trig_pc_d ", 10))continue; 
    idx = rmSpace(buf, 10, BUFFER);   
    copy(buf, &idx, cbuf);kind = atoi(cbuf);//which
    idx = rmSpace(buf, idx, BUFFER);   
    copy(buf, &idx, cbuf);//pc value
    rmhexa(cbuf);
    key = getEight(cbuf);
    idx = rmSpace(buf, idx, BUFFER);   
    copy(buf, &idx, cbuf);
    if(strncmp(cbuf, "intp", 4))continue;//here only handle interrupt
    one_event = new event_record;
    //get thread id
    idx = rmSpace(buf, idx, BUFFER);   
    copy(buf, &idx, cbuf);
    one_event->thrid = (int)getEight(cbuf);
    one_event->cpu_id= (one_event->thrid >> 2) & 7;//cpu_id(3bits)
    one_event->true_id = (one_event->thrid >> 1);
    idx = rmSpace(buf, idx, BUFFER);
    copy(buf, &idx, cbuf); 
    one_event->type = (int)getEight(cbuf);//interrupt type
    idx = rmSpace(buf, idx, BUFFER);   
    copy(buf, &idx, cbuf);
    one_event->vec  = (int)getEight(cbuf);//vector
    one_event->wait = 0;
    one_event->src  = 33;//any thread
    //additional argments
    if(idx < strlen(buf)){
      idx = rmSpace(buf, idx, BUFFER);   
      copy(buf, &idx, cbuf);
      one_event->src = (int)getEight(cbuf);//get which thread looking for.
      idx = rmSpace(buf, idx, BUFFER);   
      copy(buf, &idx, cbuf);
      one_event->wait = (int)getEight(cbuf);//get which thread looking for.
    }
    one_event->wait       = one_event->wait > 0 ? one_event->wait : 1;
    one_event->kind       = kind;
    one_event->event_type = INT_TYPE;
    //save event on the event tree.
    if(event_list = inst_event.search(key))event_list->append(one_event);
    else{//push event on the list
      event_list = new List<event_record>;
      event_list->append(one_event);
      inst_event.insert(event_list, key);
    }
    io_printf("Info: intp(%llx) thread(%d) number(%d)\n", key, one_event->thrid, one_event->wait);
  }
  fclose(fp); 
}
/*-----------------------------------------------------------------------------
generate event.
source is in the list event_list.
-----------------------------------------------------------------------------*/
void iob::gen_event()
{  
  event_list->set_next();
  one_event = event_list->current();

  while(one_event){//get  events
    if(one_event->wait > 0){
      p_pkt = pcx_heap.empty() ? new pcx : pcx_heap.shift();//allocate memory
      // This switch was previous a xlation() function in event.cc
      switch(one_event->event_type){
      case INT_TYPE:
        p_pkt->clean();
        p_pkt->rqtype  = INT_RQ;
        p_pkt->nc      = 0;
        p_pkt->cpu_id  = one_event->cpu_id;
        p_pkt->thrid   = one_event->thrid;
        p_pkt->way     = 0;
        p_pkt->pkt[3]  = one_event->type  << 16;
        p_pkt->pkt[2] |= 1 << 31;
        p_pkt->pkt[3] |= (one_event->true_id & 0x3fff) << 18;
        p_pkt->pkt[2] |= (one_event->true_id >> 16) & 0xffff;
        p_pkt->pkt[3] |= (one_event->cpu_id & 7) << 10;
        p_pkt->pkt[3] |= (one_event->thrid & 3) << 8;
        p_pkt->pkt[3] |= one_event->vec;
        p_pkt->bf_id   = 0;
        p_pkt->pa_10_6 = 0;
        p_pkt->addr    = 0;
        p_pkt->size    = 0;
        p_pkt->wait   = 3;
        break;
      }
      if(zero_delay)p_pkt->wait = 1;
      pcx_list.append(p_pkt);
      io_printf("(%0d)Info:generating interrupt pcx packet thread(%d) many(%d)\n",
		tf_gettime(), p_pkt->thrid, one_event->wait);
      one_event->wait--;
      /* if(one_event->wait == 0){
	delete one_event;
	event_list->remove();
      }
      else event_list->nextQ();
      */
    }
    event_list->nextQ();
    one_event = event_list->current();
  }
}
/*-----------------------------------------------------------------------------
 do pc event for 8 cores.
layout:
1). inst_done 
2). phyical pc
-----------------------------------------------------------------------------*/
void iob::trig_pc_event()
{
  for(idx = PC_EVENT; idx < PC_EVENT + 8; idx += 2){
    if(tf_getp(idx)){//check instruction done
      low   = tf_getlongp(&high, idx+1);
      pc    = (KeyType) (((high & 0xffff) << 32) | low);
      if(event_list = inst_event.search(pc)){
	io_printf("(%0d)Info:generate interrupt events for this pc(%llx)\n", tf_gettime(), pc);
	gen_event();
      }
    }
  }
}
/*-------------------------------------------------------------------------------
 monitor grant signal. 
 -------------------------------------------------------------------------------*/
void iob::grant_check()
{
  char grant = tf_getp(GRANT_LOC);

  if(grant != 0){
    for(idx = 0; idx < 8; idx++){
      if(grant & 1)if(Qsel[idx])Qsel[idx]--;
      grant >>= 1;
    }
  }
}
/*-----------------------------------------------------------------------------
  process pcx packet.
  -----------------------------------------------------------------------------*/
void iob::handle_pcx()
{
  p_pkt = pcx_list.front();
  // io_printf("HERE I am %d\n", (*p_pkt).thrid);
  if((*p_pkt).get_delay() == 0){
    p_pkt  = pcx_list.shift();//remove a packet from the top of stack

    c_pkt = cpx_heap.empty() ? new cpx : cpx_heap.shift();;
    if(data)(*c_pkt).xlation(p_pkt, data->data);
    else (*c_pkt).xlation(p_pkt, (char*)0);
    cpx_list.append(c_pkt);//push cpx on list
    pcx_heap.append(p_pkt);//keep it on heap.
  }
}
/*-----------------------------------------------------------------------------
  send cpx packet.
  1). pkt_vld, send the valid cpx packet.
  2). next_cpx = 1, reset the valid bit.
-----------------------------------------------------------------------------*/
void iob::drive_cpx(int loc)
{
#ifdef USE_ACC
  s_setval_delay delay_s;
  s_setval_value value_s;
  handle tmphandle;
  delay_s.model = accNoDelay;
  char* outdata = new char[150];
  char* tmpdata = new char[33];
#endif

  if(!((pkt_vld == 0) && (next_cpx == 0))){//there is data to be sent.
    if(pkt_vld == 0)next_cpx = 0;
    else{
      c_pkt              = cpx_list.shift();//remove a packet from the top of stack
      ptr                = (*c_pkt).get_cpx();  
      pkt_vld            = 0;//clear wait for the next request.
      next_cpx           = 1;
      cpx_heap.append(c_pkt);//free memory
    }

#ifdef USE_ACC
    sprintf(outdata,"%x", next_cpx ? (ptr[0] & 0x1ffff) : 0);
    for(idx = 1; idx < 5;idx++) {
	sprintf(tmpdata,"%0.8lx", next_cpx ? ptr[idx] : 0);
	strcat(outdata,tmpdata);
    }
    acc_initialize();
    tmphandle = acc_handle_tfarg(loc);
    value_s.format = accHexStrVal;
    value_s.value.str = outdata;
    acc_set_value(tmphandle, &value_s, &delay_s);

#else
    tf_nodeinfo(loc, &node_info);
    idx = 0;
    for(groups = node_info.node_ngroups -1 ; groups >= 0; groups--){
      node_info.node_value.vecval_p[groups].avalbits = next_cpx ? ptr[idx++] : 0;
      node_info.node_value.vecval_p[groups].bvalbits = 0;
    }
    tf_propagatep(loc);
#endif
  }
}
/*-----------------------------------------------------------------------------
 drive the valid. At the next cycle, reset request.
-----------------------------------------------------------------------------*/
void iob::drive_req(int loc)
{
  if(next_req){
    io_printf("Info(%0d):%d cpx request %x\n", tf_gettime(), loc, req & 0xff);
    tf_putp(loc, req);//push data into verilog 
    next_req = req ? 1 : 0;
    req      = 0;
  }
}
/*-----------------------------------------------------------------------------
 generate the next cpx and request based on pcx packet.
-----------------------------------------------------------------------------*/
void iob::handle_cpx()
{
  c_pkt = cpx_list.front();
  (*c_pkt).dec_wait();//decrement delay
  if((*c_pkt).get_req_wait() && (Qsel[(*c_pkt).cpu_id] != 2)){//send request
    req     = (*c_pkt).get_req();
    next_req= 1;   
    io_printf("Info(%d): Qsel value(%d)\n", tf_gettime(), Qsel[(*c_pkt).cpu_id]);
    Qsel[(*c_pkt).cpu_id]++;
  }
  if((*c_pkt).get_cpx_wait())pkt_vld = 1;
}
/*-----------------------------------------------------------------------------
 This is the main interface routine between cmp and iob.
1). check pcx packet.
2). check grant signal
3). drive cpx packet.
-----------------------------------------------------------------------------*/
void iob::do_iob()
{
  //drive signals.
  grant_check();  //cpx grant
  trig_pc_event();//check pc event
  if(pcx_list.empty() == 0)handle_pcx();
  if(cpx_list.empty() == 0)handle_cpx();
}

// Below is from strclass.cc / strclass.h which became unnecessary
/*---------------------------------------
  replace char with space.
  ----------------------------------------*/
void iob::replace(char* str)
{
  int i;
  for(i = 0; i < strlen(str);i++){
    if(
       str[i] == '(' ||
       str[i] == ')' ||
       str[i] == '-' ||
       str[i] == '>' ||
       str[i] == '"' ||
       str[i] == ',')str[i] = ' ';
  }
}

/*--------------------------------------
  convert ascii to hex array.
  ---------------------------------------*/
void iob::copy(char* buf, int* idx,  char* cbuf)
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

/*--------------------------------------
   check the address symbol that is "@".
   if symbol there, return address.
   ---------------------------------------*/
KeyType iob::getEight(char *buf)
{
  int  i;
  KeyType key = 0;

  for(i = 0;  buf[i] != '\0';i++){
    key <<= 4;
    key  |= buf[i] > '9' ? ((buf[i] & 0xf) + 9) : buf[i] & 0xf;
  }
  return key;
}

/*--------------------------------------
  remove hexa indicator
  ----------------------------------------*/
void iob::rmhexa(char* buf){
  int i, j;
  
  for(i = 0;i < strlen(buf);i++){
    if(buf[i] == 'h' || buf[i] == 'x')break;
  }
  j  = 0;
  for(i = i+1;i < strlen(buf);i++){
    buf[j++] = buf[i];
  }
  buf[j] = '\0'; 
}
