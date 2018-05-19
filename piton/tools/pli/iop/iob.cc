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
  for(idx = 0; idx < 5;idx++)content[idx] = 0;
  //dram ucb counter
  dcnt0 = 3;dnible0 = 0;n_num0 = 0;
  dcnt1 = 3;dnible1 = 0;n_num1 = 0;
  for(idx = 0; idx < 4;idx++){
    dram_pkt0.itype[idx] = 0;
    dram_pkt1.itype[idx] = 0;

  }
  wake_status = 0;
  pio_idx     = PIO_SIZE-1;
  //repeat on, keep sending.

  repeat = 0;
  pargs = mc_scan_plusargs ("event_loop_on=");
  if(pargs != (char *) 0)repeat = atoi(pargs);
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
void iob::sys_mem(b_tree_node_ptr* mem, event* eiob)
{
  sysMem    = mem;
  //iob_event = eiob;
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
  wake_status = 1 << (*p_pkt).thrid; 
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
      pc_event.xlation(one_event, p_pkt);
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
  get pcx packet.
-----------------------------------------------------------------------------*/
void iob::read_pcx()
{
  idx = 0;
  tf_nodeinfo(PCX_LOC, &node_info);//bind arg
  for(groups = (node_info.node_ngroups - 1); groups >= 0; groups--)
    pcx_pkt[idx++]  = node_info.node_value.vecval_p[groups].avalbits;

  if(pcx_pkt[0] & 0x8000000){//valid pcx packet
    p_pkt = pcx_heap.empty() ? new pcx : pcx_heap.shift();//allocate memory
    (*p_pkt).chop_pkt(pcx_pkt, available);
    //ignore forward packet.
    if((*p_pkt).rqtype == 0xa || (*p_pkt).rqtype == 0xb)pcx_heap.append(p_pkt);//keep it on heap.
    else pcx_list.append(p_pkt);
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
    //which device accessed
    switch((*p_pkt).dev){
    case 0 : //boot rom
      mask_addr = (*p_pkt).mask_addr;
      data = b_Find(sysMem, &mask_addr);
      break;
    case 1 ://dram control
      d_pkt = dev_heap.empty() ? new device : dev_heap.shift();
      (*d_pkt).xlation(p_pkt);
      (*p_pkt).dram_channel ? dram1_list.append(d_pkt) :dram0_list.append(d_pkt);
      break;
    case 2 : //jbi pio drive
      d_pkt = dev_heap.empty() ? new device : dev_heap.shift();
      (*d_pkt).xlation(p_pkt);
      dev_list.append(d_pkt);//push cpx on list
      break;
    case 3 ://need many operation
      break;
    }

    //it is not an io read.
    if(!(*p_pkt).io_wait){
      c_pkt = cpx_heap.empty() ? new cpx : cpx_heap.shift();;
      if(data)(*c_pkt).xlation(p_pkt, data->data);
      else (*c_pkt).xlation(p_pkt, (char*)0);
      cpx_list.append(c_pkt);//push cpx on list
      //send interrupt.
      if((*p_pkt).dev == 4){//make interrupt
	c_pkt = cpx_heap.empty() ? new cpx : cpx_heap.shift();;
	(*c_pkt).xlation(p_pkt);
	cpx_list.append(c_pkt);//push cpx on list
  io_printf("(%0d)TRIN: handle_pcx made cpx\n", tf_gettime());
      }    
      pcx_heap.append(p_pkt);//keep it on heap.
    }
    else{//wait data from iob device.
      if((*p_pkt).dev == 1)pcx_load[(*p_pkt).thrid].append(p_pkt);//dram
      if((*p_pkt).dev == 2)jpcx_load[(*p_pkt).thrid].append(p_pkt);//jbi
    }
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
  read_pcx();
  grant_check();  //cpx grant
  trig_pc_event();//check pc event
  if(pcx_list.empty() == 0)handle_pcx();
  if(cpx_list.empty() == 0)handle_cpx();
}
/*-----------------------------------------------------------------------------
 drive jbi pio bus.
-----------------------------------------------------------------------------*/
void iob::drive_jbi(int loc)
{
  if(dev_list.empty() == 0){
    d_pkt = dev_list.front();
    if(d_pkt->ready){
      if(d_pkt->jbi_driver(loc)){
	d_pkt  = dev_list.shift();
	dev_heap.append(d_pkt);//free memory
      }
    }
  }
}
/*-----------------------------------------------------------------------------
 drive ucb data on the dram.

-----------------------------------------------------------------------------*/
void iob::drive_dram(int loc, int bank)
{
  if((dram0_list.empty() == 0) && !bank ||
     (dram1_list.empty() == 0) && bank){
    d_pkt = bank ? dram1_list.front() : dram0_list.front();
    if(d_pkt->ready){
      if(d_pkt->dram_driver(loc)){
	d_pkt  =  bank ? dram1_list.shift() : dram0_list.shift();
	dev_heap.append(d_pkt);//free memory
      }
    }
  }
}
/*-----------------------------------------------------------------------------
 common receiver for 4 bit.
-----------------------------------------------------------------------------*/
bool iob::read_ucb(int loc, int *dram_pkt, int *dcnt, 
		   int *dnible, int *num)
{
  if(tf_getp(loc)){//valid bit
    int val           = tf_getp(loc+1) & 0xf;
    val             <<= (*num);
    dram_pkt[*dcnt]  |= val;
    (*dnible)++;
    *num += 4;
    if(*dnible == 8){//received 32 bits
      *dnible = 0;
      *num    = 0;
      (*dcnt)--;
    }
    return 1;
  }
  return 0;
}
/*-----------------------------------------------------------------------------
 drive ucb data on the dram.
layout:
127-96        95-64            63-32        31-0 bit
dram_pkt[0], dram_pkt[1], dram_pkt[2],  dram_pkt[3]
-----------------------------------------------------------------------------*/
void iob::read_dram(int loc, int bank)
{

  if(bank){//bank one      
    if(read_ucb(loc, dram_pkt1.itype, &dcnt1, &dnible1, &n_num1) &&
       dcnt1 < 0){//received 128 bits ucb data.
      thrid = (dram_pkt1.itype[3] >> 5) & 0x1f;
      p_pkt = pcx_load[thrid].front();
      c_pkt = cpx_heap.empty() ? new cpx : cpx_heap.shift();
      (*c_pkt).xlation(p_pkt, dram_pkt1.itype);
      cpx_list.append(c_pkt);//push cpx on list
      pcx_heap.append(p_pkt);//keep it on heap.
      dcnt1  = 3;
      n_num1 = 0;
      for(idx = 0; idx < 4;idx++)dram_pkt1.itype[idx] = 0;
    }
  }
  else{
    if(read_ucb(loc, dram_pkt0.itype, &dcnt0, &dnible0, &n_num0) &&
       dcnt0 < 0){//received 128 bits ucb data.
      thrid = (dram_pkt0.itype[3] >> 5) & 0x1f;
      p_pkt = pcx_load[thrid].front();
      c_pkt = cpx_heap.empty() ? new cpx : cpx_heap.shift();
      (*c_pkt).xlation(p_pkt, dram_pkt0.itype);
      
      cpx_list.append(c_pkt);//push cpx on list
      pcx_heap.append(p_pkt);//keep it on heap.

      for(idx = 0; idx < 4;idx++)dram_pkt0.itype[idx] = 0;
      dcnt0  = 3;
      n_num0 = 0;
    }
  }
}
/*-----------------------------------------------------------------------------
 jbus clok domain.
 read jbi_iob
`define UCB_THR_HI             9        // (6) cpu/thread ID
`define UCB_THR_LO             4

-----------------------------------------------------------------------------*/
void iob::read_pio()
{
  if(tf_getp(JBI_PIO_VLD)){
    jbi_pio_data[pio_idx--] = tf_getp(JBI_PIO_VLD+1);
    if(pio_idx < 0){
      thrid = (jbi_pio_data[11] >> 4) & 0x1f;
      p_pkt = jpcx_load[thrid].front();
      c_pkt = cpx_heap.empty() ? new cpx : cpx_heap.shift();
      (*c_pkt).jxlation(p_pkt,jbi_pio_data );
      cpx_list.append(c_pkt);//push cpx on list
      pcx_heap.append(p_pkt);//keep it on heap.
      pio_idx = PIO_SIZE - 1;
    }
  }
}
/*-----------------------------------------------------------------------------
 jbus clok domain.
-----------------------------------------------------------------------------*/
void iob::do_jiob()
{
  if(dev_list.empty() == 0){//wait for delay cycle.
    d_pkt = dev_list.front();
    d_pkt->dec_wait();
  }
  if(dram0_list.empty() == 0){
    d_pkt = dram0_list.front();
    d_pkt->dec_wait();
  }
  if(dram1_list.empty() == 0){
    d_pkt = dram1_list.front();
    d_pkt->dec_wait();
  }
}
