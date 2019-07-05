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
  grant   = 0;//cpx grant
  req     = 0;//cpx request
  pkt_vld = 0;
  next_cpx= 0;//reset flag for cpx packet
  next_req= 0;//reset flag for request.
  return 0;
}
/*-----------------------------------------------------------------------------
  deceide the bbot thread to start cmp.
-----------------------------------------------------------------------------*/
void iob::boot()
{
  char  *pargs;
  int mask, i;
  #ifndef PITON_DPI
  pargs = mc_scan_plusargs ((char *)"bootthread=");
  #else
  pargs = (char *) 0;
  #endif
  if(pargs != (char *) 0){
    mask = atoi(pargs);
  }
  else mask = 1;
//  for(i = 0; i < 32;i++){//deceide the boot thread.
  for(i = 0; i < 128;i++){//deceide the boot thread.
    if(mask & 1)break;
    mask >>= 1;
  }
  if (pcx_heap.empty()) {
    p_pkt = new pcx;
  } else {
    p_pkt = pcx_heap.front();
    pcx_heap.pop_front();
  }
  (*p_pkt).set_delay();
  (*p_pkt).cpu_id      = (i >> 2) & 0x7;
  (*p_pkt).thrid       = i & 0x3;
  (*p_pkt).true_id     = i;
  (*p_pkt).clean();
  //make interrupt pcx packet
  (*p_pkt).pkt[3]  = 1 << 16;
  (*p_pkt).pkt[1] |= 1 << 31;
  (*p_pkt).pkt[3] |= ((i & 0x7f) << 18);
  (*p_pkt).pkt[3] |= ((i & 0x3) << 10);
  (*p_pkt).pkt[3] |= 1;
  pcx_list.push_back(p_pkt);
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
    io_printf((char *)"Error:  can not open the event file %s for reading\n", str);
    #ifndef PITON_DPI
    tf_dofinish();
    #else // ifndef PITON_DPI
    exit(1);
    #endif // ifndef PITON_DPI
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
    //save event on the event tree.
    if(inst_event.count(key) > 0) {
      event_list = &inst_event.at(key);
      event_list->push_back(one_event);
    }else{//push event on the list
      event_list = new std::list<event_record*>;
      event_list->push_back(one_event);
      inst_event[key] = (*event_list);
    }
    io_printf((char *)"Info: intp(%llx) thread(%d) number(%d)\n", key, one_event->thrid, one_event->wait);
  }
  fclose(fp); 
}
/*-----------------------------------------------------------------------------
generate event.
source is in the list event_list.
-----------------------------------------------------------------------------*/
void iob::gen_event()
{  
  std::list<event_record*>::iterator iter;

  for (iter = event_list->begin(); iter != event_list->end(); iter++) {
    one_event = *iter;
    if(one_event->wait > 0){
      if (pcx_heap.empty()) {
        p_pkt = new pcx;
      } else {
        p_pkt = pcx_heap.front();
        pcx_heap.pop_front();
      }
      // This was previously a xlation() function in event.cc
        p_pkt->clean();
        p_pkt->cpu_id  = one_event->cpu_id;
        p_pkt->thrid   = one_event->thrid;
        p_pkt->pkt[3]  = one_event->type  << 16;
        p_pkt->pkt[2] |= 1 << 31;
        p_pkt->pkt[3] |= (one_event->true_id & 0x3fff) << 18;
        p_pkt->pkt[2] |= (one_event->true_id >> 16) & 0xffff;
        p_pkt->pkt[3] |= (one_event->cpu_id & 7) << 10;
        p_pkt->pkt[3] |= (one_event->thrid & 3) << 8;
        p_pkt->pkt[3] |= one_event->vec;
        p_pkt->wait   = 3;
      pcx_list.push_back(p_pkt);
      #ifndef PITON_DPI
      io_printf((char *)"(%0d)Info:generating interrupt pcx packet thread(%d) many(%d)\n",
		tf_gettime(), p_pkt->thrid, one_event->wait);
      #else
      io_printf((char *)"Info:generating interrupt pcx packet thread(%d) many(%d)\n",
		p_pkt->thrid, one_event->wait);
      #endif
      one_event->wait--;
      /* if(one_event->wait == 0){
	delete one_event;
	event_list->remove();
      }
      else event_list->nextQ();
      */
    }
  }
}
/*-----------------------------------------------------------------------------
 do pc event for 8 cores.
layout:
1). inst_done 
2). phyical pc
-----------------------------------------------------------------------------*/
#ifndef PITON_DPI
void iob::trig_pc_event()
{
  for(idx = PC_EVENT; idx < PC_EVENT + 8; idx += 2){
    if(tf_getp(idx)){//check instruction done
      low   = tf_getlongp(&high, idx+1);
      pc    = ((((KeyType) (high & 0xffff)) << 32) | low);
      if(inst_event.count(pc) > 0) {
        event_list = &inst_event.at(pc);
	io_printf((char *)"(%0d)Info:generate interrupt events for this pc(%llx)\n", tf_gettime(), pc);
	gen_event();
      }
    }
  }
}
#else // ifndef PITON_DPI
void iob::trig_pc_event(unsigned long long thread_pc)
{
    pc = thread_pc;
    if(inst_event.count(pc) > 0) {
        event_list = &inst_event.at(pc);
	io_printf((char *)"Info:generate interrupt events for this pc(%llx)\n", pc);
	gen_event();
    }
}
#endif // ifndef PITON_DPI
/*-----------------------------------------------------------------------------
  process pcx packet.
  -----------------------------------------------------------------------------*/
void iob::handle_pcx()
{
  p_pkt = pcx_list.front();
  // io_printf("HERE I am %d\n", (*p_pkt).thrid);
  if((*p_pkt).get_delay() == 0){
    p_pkt  = pcx_list.front();//remove a packet from the top of stack
    pcx_list.pop_front();

    if (cpx_heap.empty()) {
      c_pkt = new cpx;
    } else {
      c_pkt = cpx_heap.front();
      cpx_heap.pop_front();
    }
    if(data)(*c_pkt).xlation(p_pkt, data->data);
    else (*c_pkt).xlation(p_pkt, (char*)0);
    cpx_list.push_back(c_pkt);//push cpx on list
    pcx_heap.push_back(p_pkt);//keep it on heap.
  }
}
/*-----------------------------------------------------------------------------
  send cpx packet.
  1). pkt_vld, send the valid cpx packet.
  2). next_cpx = 1, reset the valid bit.
-----------------------------------------------------------------------------*/
#ifndef PITON_DPI
void iob::drive_cpx(int loc)
{
#else // ifndef PITON_DPI
int iob::drive_cpx()
{
#endif // ifndef PITON_DPI
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
      c_pkt              = cpx_list.front();//remove a packet from the top of stack
      cpx_list.pop_front();
      ptr                = (*c_pkt).get_cpx();  
      pkt_vld            = 0;//clear wait for the next request.
      next_cpx           = 1;
      cpx_heap.push_back(c_pkt);//free memory
    }

#ifndef PITON_DPI
#ifdef USE_ACC
    sprintf(outdata,"%x", next_cpx ? (ptr[0] & 0x1ffff) : 0);
    for(idx = 1; idx < 5;idx++) {
	sprintf(tmpdata,"%0.8x", next_cpx ? ptr[idx] : 0);
	strcat(outdata,tmpdata);
    }
    acc_initialize();
    tmphandle = acc_handle_tfarg(loc);
    value_s.format = accHexStrVal;
    value_s.value.str = outdata;
    acc_set_value(tmphandle, &value_s, &delay_s);

#else // ifdef USE_ACC
    tf_nodeinfo(loc, &node_info);
    idx = 0;
    for(groups = node_info.node_ngroups -1 ; groups >= 0; groups--){
      node_info.node_value.vecval_p[groups].avalbits = next_cpx ? ptr[idx++] : 0;
      node_info.node_value.vecval_p[groups].bvalbits = 0;
    }
    tf_propagatep(loc);
#endif // ifdef USE_ACC
#endif // ifndef PITON_DPI
  }
#ifdef PITON_DPI
  return next_cpx;
#endif // ifndef PITON_DPI
}

#ifdef PITON_DPI
int iob::get_cpx_word(int index)
{
    return ptr[index];
}
#endif // ifdef PITON_DPI
/*-----------------------------------------------------------------------------
 drive the valid. At the next cycle, reset request.
-----------------------------------------------------------------------------*/
void iob::drive_req()
{
  if(next_req){
    #ifndef PITON_DPI
    io_printf((char *)"Info(%0d): cpx request %x\n", tf_gettime(), req & 0xff);
    #else // ifndef PITON_DPI
    io_printf((char *)"Info: cpx request %x\n", req & 0xff);
    #endif // ifndef PITON_DPI
    grant = req; // Was used to push data in verilog
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
    #ifndef PITON_DPI
    io_printf((char *)"Info(%d): Qsel value(%d)\n", tf_gettime(), Qsel[(*c_pkt).cpu_id]);
    #else // ifndef PITON_DPI
    io_printf((char *)"Info: Qsel value(%d)\n", Qsel[(*c_pkt).cpu_id]);
    #endif // ifndef PITON_DPI
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
  //cpx grant
  if(grant != 0){
    for(idx = 0; idx < 8; idx++){
      if(grant & 1)if(Qsel[idx])Qsel[idx]--;
      grant >>= 1;
    }
  }
  #ifndef PITON_DPI
  trig_pc_event();//check pc event
  #endif // ifndef PITON_DPI
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
