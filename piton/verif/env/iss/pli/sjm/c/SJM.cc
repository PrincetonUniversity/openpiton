// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: SJM.cc
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
// Description:  Simulated JBus Master.
//
//------------------------------------------------------------------------------

#include "SJM.h"

#ifdef LINUX
#define sigsend(idtype, id, sig) kill(id, sig)
#endif

// Define the static vars.
char *SJM::mod_fsm = "sjm_fsm";
char *SJM::mod_in_fsm = "sjm_input_fsm";
char *SJM::mod_out_fsm = "sjm_output_fsm";
char *SJM::mod_parity = "sjm_parity_check";
char *SJM::mod_display = "sjm_display";
char *SJM::mod_cmd_proc = "sjm_cmd_processor";

//------------------------------------------------------------------------------
// Constructor.
SJM::SJM(int id, char *filename, LinkedList<PlusArg> *arglist)
{
  char str[1024];

  port_id = id;
  agent_id = -1;
  sprintf(modname, "sjm%d", port_id);

  multiple_ids = 0;
  idle_after_inv = 1;
  sjm_state = SJM_UNKNOWN;
  sjm_type = -1;
  sjm_configured = FALSE;
  sjm_cyclecnt = 0;
  sjm_resetcnt = -1;
  sjm_wait_on_start = 1;
  sjm_rst_state = 0;
  sjm_sample_rate = ESTAR_SPEED1;
  sjm_sample_cnt = 0;
  sjm_drive = TRUE;
  sjm_change_cnt = 0;
  sjm_timeout_scale = 1;
  sjm_pid = 0;

  // First determine the input format.
  if (filename) {
    dprintf(modname, 0, 0, "Initializing SJM %d with file '%s'.", port_id, filename);

    if (strstr(filename, ".cmd")) {
      sjm_type = SJMTYPE_CMD;
    } else {
      sjm_type = SJMTYPE_EXE;
    }
  } else {
    dprintf(modname, 0, 0, "Initializing SJM %d.", port_id);
    sjm_type = SJMTYPE_ARG;
  }

  // Initialize the CSR's.
  for (int i = 0; i < G_MAXPORTS; i++) {
    csr_liveports[i] = 0;
  }
  // Default is "not being used."
  csr_deadcycle_mode = -1;
  // Default is full speed.
  csr_estar_mode = -1;

  // Read the plusargs.
  int outq_size = G_OUTQ_DEPTH;
  //!!! these aren't ever deallocated.
  LinkedList<PlusArg> *memctrl_arg_list = new LinkedList<PlusArg>();
  LinkedList<PlusArg> *snpctrl_arg_list = new LinkedList<PlusArg>();
  LinkedList<PlusArg> *intctrl_arg_list = new LinkedList<PlusArg>();
  sjm_program_arg_list = new LinkedList<PlusArg>();
  if (!arglist->Empty()) {
    arglist->GoToHead();
    for (PlusArg *arg = arglist->CurrentNode(); arg || arglist->HasMoreNodes(); arg = arglist->NextNode()) {
      if (!strcmp(arg->name, "no_start_flag")) {
	sjm_wait_on_start = 0;

      } else if (!strcmp(arg->name, "deadcycle")) {
	csr_deadcycle_mode = arg->value;

      } else if (!strcmp(arg->name, "estar")) {
	if ((arg->value != ESTAR_SPEED1) && (arg->value != ESTAR_SPEED2) && (arg->value != ESTAR_SPEED32)) {
	  dprintf(modname, 49, 4, "Invalid estar mode '%d'", arg->value);
	} else {
	  csr_estar_mode = arg->value & 0xff;
	}

      } else if (!strcmp(arg->name, "outq_size")) {
	if (arg->value > G_OUTQ_DEPTH) {
	  dprintf (modname, 49, 4, "Requested output queue size is greater than the maximum allowed size of %d", G_OUTQ_DEPTH);
	  throw BadPlusArg();
	}

      } else if (!strcmp(arg->name, "rd_delay") || !strcmp(arg->name, "wr_delay")) {
	if ((arg->owner == port_id) || (arg->owner < 0)) {
	  memctrl_arg_list->Append(arg);
//        if (arg->owner == port_id) {
//          // Remove, none of the other ports are interested.
//          arg = arglist->Remove();
//          delete arg;
//        }
	}

      } else if (!strcmp(arg->name, "mem_delay_rand") || !strcmp(arg->name, "memq_size") ||
		 !strcmp(arg->name, "iomemq_size") || !strcmp(arg->name, "dataq_size")) {
	memctrl_arg_list->Append(arg);

      } else if (!strcmp(arg->name, "snp_delay")) {
	if ((arg->owner == port_id) || (arg->owner < 0)) {
	  snpctrl_arg_list->Append(arg);
//        if (arg->owner == port_id) {
//          // Remove, none of the other ports are interested.
//          arg = arglist->Remove();
//          delete arg;
//        }
	}

      } else if (!strcmp(arg->name, "snp_delay_rand") || !strcmp(arg->name, "snoopq_size") ||
		 !strcmp(arg->name, "in_jpackq_size")) {
	snpctrl_arg_list->Append(arg);

      } else if (!strcmp(arg->name, "int_ack_delay") || !strcmp(arg->name, "int_retry_delay")) {
	if ((arg->owner == port_id) || (arg->owner < 0)) {
	  intctrl_arg_list->Append(arg);
	}
      } else if (!strcmp(arg->name, "int_delay_rand")) {
	intctrl_arg_list->Append(arg);
      } else if (!strcmp(arg->name, "sjm_multiple_ids")) {
	if ((arg->owner == port_id) || (arg->owner < 0)) {
	  dprintf (modname, 0, 0, "sjm_multiple_ids specified. SJM will generate up to 16 outstanding reads");
	  multiple_ids=1;
	}
      } else if (!strcmp(arg->name, "sjm_no_idle_after_inv")) {
	if ((arg->owner == port_id) || (arg->owner < 0)) {
	  dprintf (modname, 0, 0, "sjm_idle_after_inv specified. SJM will allow back to back invalidates");
	  idle_after_inv=0;
	}
      } else if (!strcmp(arg->name, "timeout_scale")) {
	if ((arg->owner == port_id) || (arg->owner < 0)) {
	  if (arg->owner || (sjm_timeout_scale == 1)) {
	    sjm_timeout_scale = arg->value;
	  }
	}

      } else if (!strcmp(arg->name, "SJMARG")) {
	// Arguments for a command program. Ignore of this port doesn't use
	// a command program.
	if ((arg->owner == port_id) && (sjm_type == SJMTYPE_EXE)) {
	  sjm_program_arg_list->Append(arg);
	}

      } else if (!strcmp(arg->name, "SJMAID")) {
	// Instantiates a port. Ignore if this port wasn't instantiated with
	// plusargs.
	if ((arg->owner == port_id) && (sjm_type == SJMTYPE_ARG)) {
	  agent_id = arg->value;
	}

      } else {
	dprintf(modname, 49, 0, "CODE ERROR: got passed bad plusarg '%s'", arg->name);
      }
    }
  }

  sprintf(str, "sjm_parser");
  sjm_parser = new Parser(str, filename);

  if (sjm_type == SJMTYPE_CMD) {
    if ((agent_id = sjm_parser->ReadFile()) < 0) {
      throw BadInitialization();
    }
    sjm_configured = TRUE;
  } else if (sjm_type == SJMTYPE_EXE) {
    try {
      rdr_currCmd = NULL;
      sjmStartCmdProgram();
    } catch (FatalInitializationError) {
      throw;
    } catch (BadInitialization) {
      throw;
    }
  }

  // Check the agent ID
  if (find_port_id(agent_id) != port_id) {
    dprintf(modname, 0, 0, "Agent id %d does not correspond to port id %d.", agent_id, port_id);
    throw BadInitialization();
  }

  sjm_cache = new Cache();

  sprintf(str, "sjm_arbiter");
  sjm_arb = new Arbiter(str, port_id);

  sjm_outq = new Queue<Transaction>(outq_size, Q_FIFO);
  sjm_rdq = new Queue<Transaction>(outq_size / 2, Q_FIFO);

  sjm_wrbq = new Queue<Transaction>(outq_size / 2, Q_FIFO);

  sprintf(str, "sjm_regfile");
  sjm_regfile = new RegisterFile(str, 32);

  sprintf(str, "sjm_readbuffer");
  if(multiple_ids) //this allows up to 16 outstanding reads
    sjm_readbuff = new ReadOutBuffer(str, sjm_cache, sjm_regfile, G_READBUFFER_SIZE_MAX);
  else
    sjm_readbuff = new ReadOutBuffer(str, sjm_cache, sjm_regfile, G_READBUFFER_SIZE_PORT);

  sprintf(str, "sjm_snoop_ctrl");
  try {
    sjm_snpctrl = new SnoopControl(str, sjm_rdq, sjm_wrbq, sjm_cache, sjm_readbuff, csr_liveports, snpctrl_arg_list);
  } catch (SnoopControl::BadSnpCtrlPlusArg) {
    throw BadPlusArg();
  }

  //! Address ranges found in command file is ignored.
  sprintf(str, "sjm_memory_ctrl");
  try {
    sjm_memctrl = new MemoryControl(str, agent_id, sjm_parser->prs_iosync_addr, sjm_rdq, sjm_snpctrl, memctrl_arg_list);
  } catch (MemoryControl::BadMemCtrlPlusArg) {
    throw BadPlusArg();
  }

  sprintf(str, "sjm_interrupt_ctrl");
  try {
    sjm_intctrl = new InterruptControl(str, sjm_outq, intctrl_arg_list);
  } catch (InterruptControl::BadIntCtrlPlusArg) {
    throw BadPlusArg();
  }

  if (sjm_timeout_scale) {
    sjm_readbuff->ScaleTimeout(sjm_timeout_scale);
    sjm_intctrl->ScaleTimeout(sjm_timeout_scale);
  }

  sjm_check_addr_parity = 0;
  sjm_addr_parity_list = new BinaryKeyValueTree<ull>();
  sjm_bad_parity_addrs = new BinaryNumTree<ull>();
  sjm_bad_parity_trans = new BinaryNumTree<int>();
  sjm_bad_ecc_list = new BinaryKeyValueTree<ull>();
  sjm_bad_ecc_list_norand = new BinaryKeyValueTree<ull>();
  sjm_bad_ecc_list_norand_dest = new BinaryKeyValueTree<ull>();
  sjm_flipbits_list = new BinaryKeyValueTree<ull>();
  sjm_read_error_list = new BinaryKeyValueTree<ull>();

  //!!!
  nextgen = NULL;

  // Initialize the input state.
  in_state = CYC_IDLE;
  in_sampling = 0;

  // Initialize the reader variables.
  rdr_currCmd = sjm_parser->GetCmd();
  rdr_buswait = NULL;
  rdr_waitcnt = 0;
  rdr_trans = NULL;
  rdr_wbtrans = NULL;
  rdr_timeout = J_TIMEOUT * sjm_timeout_scale;
  rdr_timeout_cnt = 0;
  rdr_first = 1;

  // Initialize the signals.
  curr_ad[0] = 0;
  curr_ad[1] = 0;
  curr_advalid = 0;
  curr_adp = -1;
  curr_adtype = -1;

  // Initialize the output state.
  out_state = CYC_IDLE;
  out_trans = NULL;
  out_curr_q = sjm_outq;
  out_bit4_pattern[0] = BIT4_PATTERN_L;
  out_bit4_pattern[1] = BIT4_PATTERN_H;

  next_req_r = 'z';
  next_ad[0] = 0;
  next_ad[1] = 0;
  next_advalid = 0;
  next_adp = -1;
  next_adtype = -1;
  next_pack_r = -1;

  if (port_id == BUS_MASTER) {
    next_change = '1';
//     next_rst = '1';
//     next_por = '1';
    next_rst = 'z';
    next_por = 'z';
  } else {
    next_change = 'z';
    next_rst = 'z';
    next_por = 'z';
  }
}


//------------------------------------------------------------------------------
// Get a string representing a cycle type.
char *SJM::GetFSMState(int st)
{
  switch (st) {
  case CYC_IDLE :
    return "IDLE";
  case CYC_ADDR :
    return "ADDR";
  case CYC_DATA16 :
    return "DATA16";
  case CYC_DATA64 :
    return "DATA64";
  case CYC_RET16 :
    return "READ 16 DATA RETURN";
  case CYC_RET64 :
    return "READ 64 DATA RETURN";
  case CYC_ERR :
    return "ERROR";
  }
  return NULL;
}


// -----------------------------------------------------------------------------
// Detect asserted of pwr_ok.
void SJM::SetPwr()
{
  if (agent_id == BUS_MASTER) {
    next_por = '1';
  }
}


//------------------------------------------------------------------------------
// Detect changes in POR.
void SJM::SetPor(int state)
{
  if (state) {
    dprintf(mod_fsm, 11, 0, "POR has been asserted.");
    sjm_state = SJM_POR;

    // Read the mmedat data.
    FILE *fp;
    LinkedList<int> *datalist;
    ull write_size;
    ull addr = 0;
    int *data;
    char strin[128];

    sprintf(strin, "sjm_%d.memdat", port_id);
    if (fp = fopen(strin, "rb")) {
      while (!feof(fp)) {
	datalist = new LinkedList<int>();
	// Read the write size;
	if (!(fread((void *) &write_size, sizeof(ull), 1, fp))) {
	  break;
	}
	// Read the address.
	fread((void *) &addr, sizeof(ull), 1, fp);
	for (int cnt = 0; cnt < write_size;) {
	  data = new int;
	  cnt += fread((void *) data, sizeof(int), 1, fp);
	  datalist->Append(data);
	}
	sjm_memctrl->SetMemdat(addr, datalist);
	delete datalist;
      }
      fclose(fp);
    }
    // Reset the sampling rate to full speed.
    sjm_sample_rate = ESTAR_SPEED1;

  } else if (sjm_state != (SJM_POR | SJM_RST)) {
    dprintf(mod_fsm, 49, 4, "POWER-ON-RESET deasserted while RST not asserted.");
  } else {
    dprintf(mod_fsm, 11, 0, "POWER-ON-RESET has been deasserted.");
    sjm_state = SJM_RST;
  }
}


//------------------------------------------------------------------------------
// Get values from the bus.
void SJM::InputValues(char *j_req_in, char *j_ad, char *j_adp, char *j_adtype,
		      char **j_packs, char *j_change, char *j_rst, char *j_por)
{
  sjm_cyclecnt++;
  if (++sjm_sample_cnt < sjm_sample_rate) {
    sjm_drive = FALSE;
    return;
  }
  sjm_sample_cnt = 0;
  sjm_drive = TRUE;

  char por = j_por[0];
  char rst = j_rst[0];

  curr_change = j_change[0];

  if (sjm_state == SJM_UNKNOWN) {
    // Must wait for j_por.
    return;
  }

  if (sjm_state == SJM_POR) {
    // Look for reset being asserted.
    if (rst == '0') {
      sjm_state = SJM_POR | SJM_RST;
      sjm_resetcnt = -1;
      Reset();
    }
  } else if ((sjm_state & SJM_RST) == SJM_RST) {
    sjm_arb->Reset();
    if (sjm_resetcnt < 0) {
      if (rst == '1') {
	dprintf(mod_fsm, 11, 0, "RESET has been deasserted.");
	sjm_resetcnt = sjm_cyclecnt;
	sjm_state = SJM_READY;
      }
    }

    // Check who's driving valid packs.
    for (int i = 0; i < G_MAXPORTS; i++) {
      if (!csr_liveports[i]) {
	if (!strcmp(j_packs[i], "0")) {
	  csr_liveports[i] = 1;
	}
      }
    }

    // Flip the bits around so that j_req_in[0] is the req line for j_id 0.
    // Requests are active low, so invert. Representation is in binary.
    byte reqs_in[G_MAXPORTS - 1];
    for (int k = (strlen(j_req_in) - 1), j = 0; j < G_MAXPORTS - 1; k--, j++) {
      if (j_req_in[k] == '1') {
	reqs_in[j] = 0;
      } else if (j_req_in[k] == '0') {
	reqs_in[j] = 1;
      } else {
	reqs_in[j] = -1;
      }
    }
    sjm_arb->Arbitrate(reqs_in);

  } else if (sjm_state == SJM_CHANGE) {
    // Detect reset. If reset has been activated, end the wait period.
    if (rst == '0') {
      sjm_state = SJM_RST;
      sjm_resetcnt = -1;
//       sjm_wait_on_start = 0;
      sjm_change_cnt = 0;
      sjm_sample_cnt = 0;
      Reset();
    } else {
      if (++sjm_change_cnt < J_CHANGE_WAIT) {
	// Must still process jpacks.
	int packs[G_MAXPORTS];
	for (int i = 0; i < G_MAXPORTS; i++) {
	  packs[i] = atoi(j_packs[i]);
//        if ((strstr(j_packs[i], "x")) || (strstr(j_packs[i], "X"))) {
//          dprintf(modname, 49, 0, "Found 'X' in j_pack%d.", i);
//        }
	  if ((strstr(j_packs[i], "z")) || (strstr(j_packs[i], "Z")) ||
	      (strstr(j_packs[i], "x")) || (strstr(j_packs[i], "X"))) {
	    packs[i] = -1;
	  }
	}
	sjm_snpctrl->UpdatePacks(packs);
      } else {
	dprintf(mod_fsm, 12, 0, "Exiting CHANGE wait period.");

	ull conf_data = sjm_memctrl->ReadConfigAddress(CONF_ESTAR_CTRL, 8);
	if (conf_data != 0) {
	  // Value written in the csr takes precedence.
	  if ((conf_data != ESTAR_SPEED1) && (conf_data != ESTAR_SPEED2) && (conf_data != ESTAR_SPEED32)) {
	    dprintf(mod_fsm, 48, 0, "Invalid data 0x%llx written to estar control register, mode not changed.", conf_data);
	  } else {
	    sjm_sample_rate = conf_data;
	  }
	} else if (csr_estar_mode != 0xff) {
	  // The plusarg has next precedence.
	  sjm_sample_rate = csr_estar_mode;
	} else if (sjm_parser->prs_estar_mode != 0xff) {
	  // The command file has lowest precedence.
	  sjm_sample_rate = sjm_parser->prs_estar_mode;
	}
	dprintf(mod_fsm, 12, 0, "New speed is %d.", sjm_sample_rate);
	sjm_change_cnt = 0;
	sjm_sample_cnt = 0;
	sjm_state = SJM_EXEC;
      }
    }
  } else {
    if ((sjm_state == SJM_READY) && (sjm_cyclecnt < (sjm_resetcnt + J_POST_RST_STABLE_CYCLES))) {
      // Check who's driving valid packs.
      for (int i = 0; i < G_MAXPORTS; i++) {
	if (!csr_liveports[i]) {
	  if (!strcmp(j_packs[i], "0")) {
	    csr_liveports[i] = 1;
	  }
	}
      }
    }
    if (!sjm_wait_on_start && (sjm_cyclecnt == (sjm_resetcnt + J_POST_RST_CYCLES))) {
      dprintf(mod_fsm, 0, 0, "Starting command execution.");
      sjm_state = SJM_EXEC;
    }

    // Mangle the incoming data into a format that is more useful. After reset
    // 'x's are not allowed.

    // Detect reset. If reset has been activated, don't sample.
    if (rst == '0') {
      sjm_state = SJM_RST;
      sjm_resetcnt = -1;
//       sjm_wait_on_start = 0;
      Reset();

    } else {
      // Detect the beginning of the CHANGE sequence.
      if (sjm_change_cnt > 0) {
	if (sjm_change_cnt < J_CHANGE_INITIATE) {
	  sjm_change_cnt++;
	} else {
	  // Must now wait for the end of the change wait period.
	  sjm_state = SJM_CHANGE;

	  dprintf(mod_fsm, 12, 0, "Entering CHANGE wait period.");
	}
      }
      // Detect the beginning of the change sequence.
      if (curr_change == '0') {
	dprintf(mod_fsm, 12, 0, "CHANGE has been asserted.");
	sjm_change_cnt++;
      }

      // Flip the bits around so that j_req_in[0] is the req line for j_id 0.
      // Requests are active low, so invert. Representation is in binary.
      byte reqs_in[G_MAXPORTS - 1];
      for (int i = (strlen(j_req_in) - 1), j = 0; j < G_MAXPORTS - 1; i--, j++) {
//      if (j_req_in[i] == 'x') {
//        dprintf(modname, 49, 0, "Found 'X' in j_req_in for j_id %d.", j);
//      }
	if (j_req_in[i] == '1') {
	  reqs_in[j] = 0;
	} else if (j_req_in[i] == '0') {
	  reqs_in[j] = 1;
	} else {
	  reqs_in[j] = -1;
	}
      }

      // Look at two halves of j_ad at one time. Representation is in binary.
      curr_ad[0] = 0;
      curr_ad[1] = 0;
      curr_advalid = 1;
      ull mult = 1;
      if (1) { // <------------------------------------------------- compiler hack
	for (int i = 63, j = 127; i >= 0; i--, j--, mult *= 2) {
//        if ((j_ad[i] == 'x') || (j_ad[j] == 'x')) {
//          dprintf(modname, 49, 0, "Found 'X' in j_ad.");
//        }
	  if ((j_ad[i] == 'z') || (j_ad[j] == 'z') || (j_ad[i] == 'x') || (j_ad[j] == 'x')) {
	    curr_advalid = 0;
	    break;
	  }
	  if (j_ad[i] == '1') {
	    curr_ad[0] += mult;
	  }
	  if (j_ad[j] == '1') {
	    curr_ad[1] += mult;
	  }
	}
      }

      // Mangle j_adp. Representation is an integer.
      curr_adp = atoi(j_adp);
//       if ((strstr(j_adp, "x")) || (strstr(j_adp, "X"))) {
//      dprintf(modname, 49, 0, "Found 'X' in j_adp.");
//       }
      if ((strstr(j_adp, "z")) || (strstr(j_adp, "Z")) ||
	  (strstr(j_adp, "x")) || (strstr(j_adp, "X"))) {
	curr_adp = -1;
      }

      // Mangle j_adtype. Representation is an integer.
      curr_adtype = atoi(j_adtype);
//       if ((strstr(j_adtype, "x")) || (strstr(j_adtype, "X"))) {
//      dprintf(modname, 49, 0, "Found 'X' in j_adtype.");
//       }
      if ((strstr(j_adtype, "z")) || (strstr(j_adtype, "Z")) ||
	  (strstr(j_adtype, "x")) || (strstr(j_adtype, "X"))) {
	curr_adtype = -1;
      }

      // Mangle the j_packs. Representations are as integers.
      int packs[G_MAXPORTS];
      if (1) { // <------------------------------------------------- compiler hack
	for (int i = 0; i < G_MAXPORTS; i++) {
	  packs[i] = atoi(j_packs[i]);
//        if ((strstr(j_packs[i], "x")) || (strstr(j_packs[i], "X"))) {
//          dprintf(modname, 49, 0, "Found 'X' in j_pack%d.", i);
//        }
	  if ((strstr(j_packs[i], "z")) || (strstr(j_packs[i], "Z")) ||
	      (strstr(j_packs[i], "x")) || (strstr(j_packs[i], "X"))) {
	    packs[i] = -1;
	  }
	}
      }

      // Before doing anything, arbitrate.
      sjm_arb->Arbitrate(reqs_in);

      sjm_snpctrl->UpdatePacks(packs);

      // Process the incoming signals.
      sjmProcessInSigs();
    }
  }
  // Process the transaction output queue.
  // This is the only activity allowed during reset, so that ad and parity can
  // be driven.
  sjmProcessOutSigs();
}


//------------------------------------------------------------------------------
// Return j_req_out for driving onto the bus.
char *SJM::GetReq()
{
  char *outdata = new char[8];

  if (sjm_drive) {
    next_req_r = sjm_arb->GetReqOut();
  }

  char req_val = 'z';
  if (next_req_r == 0) {
    req_val = '1';
  } else if (next_req_r == 1) {
    req_val = '0';
  }

  int i = 0;
  for (i; i < G_MAXPORTS; i++) {
    outdata[i] = req_val;
  }
  outdata[i] = NULL;
  return outdata;
}


//------------------------------------------------------------------------------
// Return j_ad for driving onto the bus.
char *SJM::GetAd()
{
  char* outdata = new char[129];

  if (sjm_drive) {
    next_advalid_r = next_advalid;
    next_ad_r[0] = next_ad[0];
    next_ad_r[1] = next_ad[1];
  }

  sprintf(outdata, "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
  if (next_advalid_r) {
    sprintf(outdata, "%0.16llx%0.16llx", next_ad_r[0], next_ad_r[1]);
  }
  return outdata;
}


//------------------------------------------------------------------------------
// Return j_adp for driving onto the bus.
char *SJM::GetAdp()
{
  char* outdata = new char[5];

  if (sjm_drive) {
    next_adp_r = next_adp;
  }

  sprintf(outdata, "z");
  if (next_adp_r != -1) {
    sprintf(outdata, "%x", next_adp_r);
  }
  return outdata;
}


//------------------------------------------------------------------------------
// Return j_adtype for driving onto the bus.
char *SJM::GetAdtype()
{
  char* outdata = new char[9];

  if (sjm_drive) {
    next_adtype_r = next_adtype;
  }

  sprintf(outdata, "zz");
  if (next_adtype_r != -1) {
    sprintf(outdata, "%x", next_adtype_r);
  }
  return outdata;
}


//------------------------------------------------------------------------------
// Return j_pack for this masters, for driving onto the bus.
char *SJM::GetJpack()
{
  char *outdata = new char[4];

  if (sjm_drive) {
    next_pack_r = sjm_snpctrl->GetNextPack();
  }

  sprintf(outdata, "z");
  if (next_pack_r != -1) {
    sprintf(outdata, "%x", next_pack_r);
  }
  return outdata;
}


//------------------------------------------------------------------------------
// Return j_change for driving onto the bus.
char *SJM::GetChange()
{
  char *outdata = new char[2];

  if (sjm_drive) {
    next_change_r = next_change;
  }

  sprintf(outdata, "z");
  if (next_change_r != 0xff) {
    sprintf(outdata, "%c", next_change_r);
  }
  return outdata;
}


//------------------------------------------------------------------------------
// Return j_rst for driving onto the bus.
char *SJM::GetRst()
{
  char *outdata = new char[2];

  if (sjm_drive) {
    next_rst_r = next_rst;
  }

  sprintf(outdata, "z");
  if (next_rst_r != 0xff) {
    sprintf(outdata, "%c", next_rst_r);
  }
  return outdata;
}


//------------------------------------------------------------------------------
// Return j_por for driving onto the bus.
char *SJM::GetPor()
{
  char* outdata = new char[2];
  if (sjm_drive) {
    next_por_r = next_por;
  }

  sprintf(outdata, "z");
  if (next_por_r != 0xff) {
    sprintf(outdata, "%c", next_por_r);
  }
  return outdata;
}
void SJM::tidy_up(void){
  if (sjm_type == SJMTYPE_EXE)
    //if exe process is still alive, kill it.
    sigsend(P_PID, sjm_pid, SIGKILL);
}


//------------------------------------------------------------------------------
// Reset this master.
void SJM::Reset()
{
  dprintf(mod_fsm, 11, 0, "RESET has been asserted.");

  sjm_arb->Reset();
  sjm_memctrl->Reset();
  sjm_snpctrl->Reset();
  sjm_readbuff->Reset();
  sjm_intctrl->Reset();
  sjm_cache->Clear();
  sjm_regfile->Clear();
  sjm_parser->Reset();

  // Empty some lists.
  sjm_check_addr_parity = 0;
  delete sjm_addr_parity_list;
  sjm_addr_parity_list = new BinaryKeyValueTree<ull>();
  delete sjm_bad_parity_addrs;
  sjm_bad_parity_addrs = new BinaryNumTree<ull>();
  delete sjm_bad_parity_trans;
  sjm_bad_parity_trans = new BinaryNumTree<int>();
  delete sjm_bad_ecc_list;
  delete sjm_bad_ecc_list_norand;
  delete sjm_bad_ecc_list_norand_dest;
  sjm_bad_ecc_list = new BinaryKeyValueTree<ull>();
  sjm_bad_ecc_list_norand = new BinaryKeyValueTree<ull>();
  sjm_bad_ecc_list_norand_dest = new BinaryKeyValueTree<ull>();
  delete sjm_flipbits_list;
  sjm_flipbits_list = new BinaryKeyValueTree<ull>();
  delete sjm_read_error_list;
  sjm_read_error_list = new BinaryKeyValueTree<ull>();

  // Empty the writeback queue.
  Transaction *trans;
  while (!sjm_wrbq->Empty()) {
    sjm_wrbq->Pop();
  }
  // Empty the output queue.
  while (!sjm_outq->Empty()) {
    trans = sjm_outq->Pop();
    delete trans;
  }
  // Empty the read data return queue.
  while (!sjm_rdq->Empty()) {
    trans = sjm_rdq->Pop();
    delete trans;
  }
  // Clear all sync's.
  sync_clear(port_id);
  // Reset the input states.
  in_state = CYC_IDLE;
  in_sampling = 0;
  // Reset the command reader.
  rdr_currCmd = sjm_parser->GetCmd();
  rdr_waitcnt = 0;
  rdr_trans = NULL;
  rdr_wbtrans = NULL;
  rdr_timeout_cnt = 0;
  // Reset the output states.
  out_state = CYC_IDLE;
  out_trans = NULL;
  // Stop driving.
  next_ad[0] = 0;
  next_ad[0] = 0;
  next_advalid = 0;
  next_adp = -1;
  next_adtype = -1;
  next_change = 'z';
  next_rst = 'z';
  next_por = 'z';

  // Check how many times reset has been activated, and read the configuration
  // information.
  if ((sjm_state & SJM_POR) == SJM_POR) {
    // Must go back to deadcycles on.
    sjm_arb->SetDeadcycleMode(1);
    // Go back to full speed.
    sjm_sample_rate = ESTAR_SPEED1;
    sjm_rst_state = 0;

  } else if (sjm_rst_state == 1) {
    // This is second reset. Read the default configuration information.
    if (csr_deadcycle_mode > -1) {
      sjm_arb->SetDeadcycleMode(csr_deadcycle_mode);
    } else {
      if (sjm_parser->prs_deadcycle_mode > -1) {
	sjm_arb->SetDeadcycleMode(sjm_parser->prs_deadcycle_mode);
      }
    }

  } else if (sjm_rst_state > 1) {
    // Read the configuration information from the config address.
    ull conf_data = sjm_memctrl->ReadConfigAddress(CONF_TOM_CSR, 8);

    int arb_mode = (conf_data >> 27) | 0x3;
    if ((arb_mode == 0) || (arb_mode == 1)) {
      sjm_arb->SetDeadcycleMode(1);
    } if (arb_mode == 2) {
      sjm_arb->SetDeadcycleMode(0);
    } else {
      dprintf(mod_fsm, 48, 0, "Illegal arbitration mode %d.", arb_mode);
    }
  }

  if (sjm_type == SJMTYPE_EXE) {
    if (sigsend(P_PID, sjm_pid, 0) >= 0) {
      PLI_API_RspPacket rsp_packet;
      rsp_packet.status = API_STAT_RESET;
      int len = sizeof(PLI_API_RspPacket);
      if (write(sjm_out_pipe, (void *) &rsp_packet, len) != len) {
	 dprintf(modname, 49, 4, "Failed to write response to the input pipe.");
      }
    }
  }
  //don't do this as forking new processes seems very flakey - just keep old one running and send reset packet
  if (0){
    int restart = TRUE;
    // Check first that the child process is still alive.
    if (sigsend(P_PID, sjm_pid, 0) >= 0) {
      // Kill the child process.
      if (sigsend(P_PID, sjm_pid, SIGKILL) < 0) {
	dprintf(modname, 49, 4, "Unable to kill the child process.");
	restart = FALSE;
      }
    }
    if (restart) {
      // Must reset to accept the CONFIG command.
      sjm_configured = 0;
      // Restart the process.
      try {
	sjmStartCmdProgram();
      } catch (FatalInitializationError) {
	dprintf(modname, 49, 4, "Unable to restart the child process.");
      } catch (BadInitialization) {
	dprintf(modname, 49, 4, "Unable to restart the child process.");
      }
    }
  }
  sjm_rst_state++;
}


//------------------------------------------------------------------------------
// Start command execution.
void SJM::StartExecution()
{
  if (sjm_cyclecnt < (sjm_resetcnt + J_POST_RST_STABLE_CYCLES)) {
    dprintf(mod_fsm, 49, 4, "Cannot jump start execution until at least %d cycles after rst deassertion.", J_POST_RST_STABLE_CYCLES);
  }
  if (sjm_state != SJM_READY && sjm_state != SJM_EXEC) {
    dprintf(mod_fsm, 49, 4, "Attempted to start command execution when not ready. State is %x.", sjm_state);
    return;
  }
  dprintf(mod_fsm, 0, 0, "Starting command execution.");
  sjm_state = SJM_EXEC;
}


//------------------------------------------------------------------------------
// Check the status of this SJM. The SJM is done if:
// 1. it has no more transactions to issue (outq is empty)
// 2. it doesn't have any more memory transactions (memq is empty)
// 3. it isn't waiting for any data to be returned (readbuff is empty)
// 4. the interrupt controller doesn't have any more requests to process
char *SJM::GetExecStatus()
{
  char *outdata = new char[3];
  strcpy(outdata, "10");
  if (sjm_state & (SJM_RST | SJM_POR)) {
    strcpy(outdata, "01");
  } else if (rdr_currCmd && sjm_snpctrl->Done() &&
	     sjm_memctrl->Done() && sjm_intctrl->Done() &&
	     (out_trans == NULL) && sjm_readbuff->Empty()) {
    if (rdr_currCmd->cmd == CMD_DONE) {
      strcpy(outdata, "11");
    }
  }
  outdata[2] = NULL;
  return outdata;
}


//------------------------------------------------------------------------------
// Get information from the input state machine.
char *SJM::GetInputFSM()
{
  char *out = new char[64];
  int i = 0;
  if (!GetFSMState(in_prev)) {
    sprintf(out, " :");
  } else {
    sprintf(out, "%s:", GetFSMState(in_prev));
  }
  i = strlen(out);
  if (in_prev != CYC_ADDR) {
    sprintf(&out[i], " :");
  } else {
    sprintf(&out[i], "%s:", get_trans_string(in_ttype));
  }
  i = strlen(out);
  sprintf(&out[i], "%d", in_sampling);
  return out;
}














//------------------------------------------------------------------------------
// Get the outstanding transaction.
Transaction *SJM::GetOutTrans()
{
  return out_trans;
}

//------------------------------------------------------------------------------
// Get an entry in the outstanding read buffer.
ReadBuffEntry *SJM::GetReadBuffEntry(int indx)
{
  return sjm_readbuff->Get(indx);
}


//------------------------------------------------------------------------------
// Get the value of the previous out state.
char *SJM::GetOutState()
{
  char *state = new char[32];
  switch (out_prev) {
  case CYC_IDLE :
    sprintf(state, "IDLE");
    break;
  case CYC_ADDR :
    sprintf(state, "ADDR");
    break;
  case CYC_DATA16 :
    sprintf(state, "DATA 16");
    break;
  case CYC_DATA64 :
    sprintf(state, "DATA 64");
    break;
  case CYC_RET16 :
    sprintf(state, "DATA RETURN 16");
    break;
  case CYC_RET64 :
    sprintf(state, "DATA RETURN 64");
    break;
  case CYC_ERR :
    sprintf(state, "ERROR");
    break;
  default :
    sprintf(state, "z");
  }
  return state;
}



//!!!!!!!!!!!





//------------------------------------------------------------------------------
// Start a command program. Set up the pipes and fork the executable.
void SJM::sjmStartCmdProgram()
{
  int sjm_ud_dummy[2];
  // Set up the pipes.
  //this first one isn't used. Just working around a problem with pipe returning a file
  //id of zero. This seems legal, but cause problems later on when we come to read/fcntl
  //the descriptor.
  if (pipe(sjm_ud_dummy) < 0) {
    dprintf(modname, 0, 0, "Couldn't set up input pipe.");
    throw FatalInitializationError();
  }
  if (pipe(sjm_u) < 0) {
    dprintf(modname, 0, 0, "Couldn't set up input pipe.");
    throw FatalInitializationError();
  }
  if (pipe(sjm_d) < 0) {
    dprintf(modname, 0, 0, "Couldn't set up output pipe.");
    throw FatalInitializationError();
  }
  sjm_in_pipe = sjm_u[0];
  sjm_out_pipe = sjm_d[1];

#ifdef LINUX
  if ((sjm_pid = fork()) < 0) {
#else
  if ((sjm_pid = fork1()) < 0) {
#endif
    dprintf(modname, 0, 0, "Fork for command program failed.");
    throw FatalInitializationError();
  }
  if (sjm_pid != 0) {
    // We're the parent, wait for CONFIG to be called.
    if (!rdrNextCmd()) {
      dprintf(modname, 0, 0, "Invalid command program %s.", sjm_parser->prs_filename);
      throw BadInitialization();
    }
    if (fcntl(sjm_u[0], F_SETFL, O_NDELAY) < 0) {
      dprintf(modname, 0, 0, "Trouble with the pipe.");
      throw FatalInitializationError();
    }
    if (fcntl(sjm_d[1], F_SETFL, O_NDELAY) < 0) {
      dprintf(modname, 0, 0, "Trouble with the pipe.");
      throw FatalInitializationError();
    }
  }
  if (sjm_pid == 0) {
    // We're the child, set up the pipes execute the command program.
    // The downstream pipe is stdout.
    dup2(sjm_d[0], 0);
    // The upstream pipe is stdin.
    dup2(sjm_u[1], 1);
    // Don't need these any more.
    //don't bother closing them - we won't be calling this code more than once anyway.
    //and closing might cause problem with forked processes
    //close(sjm_u[0]);
    //close(sjm_u[1]);
    //close(sjm_d[0]);
    //close(sjm_d[1]);

    char str[1024];
    char **arglist = new char *[sjm_program_arg_list->Size() + 3];
    int i = 0;
    // First argument is the full path of the file.
//       getwd(str);
//       arglist[i] = new char[strlen(str) + strlen(sjm_parser->prs_filename) + 2];
//       sprintf(arglist[i++], "./%s", str, sjm_parser->prs_filename);
    arglist[i] = new char[strlen(sjm_parser->prs_filename) + 3];
    sprintf(arglist[i++], "./%s", sjm_parser->prs_filename);
    // Second arg is the port id.
    arglist[i] = new char[16];
    sprintf(arglist[i++], "%d", port_id);
    // Rest of the args come from the user, through plusargs.
    for (PlusArg *arg = sjm_program_arg_list->CurrentNode(); arg || sjm_program_arg_list->HasMoreNodes(); arg = sjm_program_arg_list->NextNode(), i++) {
      arglist[i] = arg->str;
    }
    arglist[i] = NULL;
    sprintf(str, "./%s", sjm_parser->prs_filename);
    execv(str, arglist);

      // If we reach here, the exec failed. Must call exit to kill the fork.
//      close(0);
//      close(1);
//       dprintf(modname, 0, 0, "Execution of command program failed.");
      //!!! report back to parent.
    exit(1);
  }
}


//------------------------------------------------------------------------------
// Process data coming in from the bus.
// Process j_ad, j_adtype, and j_adp to determine what transaction just came in.
//
// There's no CYC_RET16 case because it's taken care of in the cycle that it's
// detected.
void SJM::sjmProcessInSigs()
{
  // Get the parts of j_adtype.
  int cyc = (curr_adtype >> 6) & 0x3;
  int srcID;
  byte ecc1 = (curr_adtype >> 5) & 0x3;
  byte ecc2 = (curr_adtype >> 3) & 0x3;
  int indx;
  int cstate = curr_adtype & 0x7;
  // Get the parts of j_ad.
  int ttype = (curr_ad[1] >> 43) & 0x1f;
  int mask = (curr_ad[1] >> 48) & 0xffff;
  ull addr = curr_ad[1] & 0x7ffffffffff;
  byte err_type = curr_ad[1] & 0x7;

  // Niagara bug 2040:  Each SJM has a 5 bit agent_id that is defined in
  // the first line of its command file.  But the srcID is only a 4 bit value
  // on the bus.  When the MSB of the agent_id is 1'b1, this will always
  // miscompare, even when the source and agent IDs should match.  The fix is
  // to only compare the lower 4 bits of the srcID/agent_id.
  int four_bit_agent_id = agent_id & 0xf;

  //Used to emulate Habanero behavior - use adtype[3:2] as extra transaction ids
  if (multiple_ids){
    srcID = (curr_adtype >> 2) & 0xc;
    indx = curr_adtype & 0xf;
  }else{
    srcID = (curr_adtype >> 2) & 0xf;
    indx = curr_adtype & 0x3;
  }
  int own = 0;
  int hold_snoop = 0;
  int must_snoop = 1;

  in_prev = in_state;
  in_sampling = 0;

  // Decode the current cycle.
  if ((in_state == CYC_IDLE)  && curr_advalid) {
    if (cyc == C_ADDR) {
      // Address or idle cycle. If ttype = 0, we have an idle cycle.
      in_active = 0;
      if (ttype != T_IDLE) {
	// Have an address cycle. Check parity.
	parityCheck(addr);

	in_prev = CYC_ADDR;

	// if (srcID == agent_id) {
	if (srcID == four_bit_agent_id) {
	  own = 1;
	}

	if ((ttype == T_RD) || (ttype == T_RDD) || (ttype == T_RDS) ||
	    (ttype == T_RDSA) || (ttype == T_RDO) || (ttype == T_OWN)) {
	  // READ transactions.
	  if (sjm_memctrl->InRange(addr)) {
	    dprintf(mod_in_fsm, 0, 0, "Receiving %s: addr=0x%0.11llx src=0x%x orb=%d", get_trans_string(ttype), addr, srcID, indx);

	    in_sampling = 1;
	    if (find_range(addr)) {
	      dprintf(mod_in_fsm, 49, 0, "Address 0x%0.11llx is not in cacheable space.", addr);
	    } else {
	      hold_snoop = 1;
	      char state = -1;
	      if (ttype == T_RDSA) {
		state = CSTATE_S;
	      } else if ((ttype == T_RDO) || (ttype == T_OWN)) {
		state = CSTATE_M;
	      } else if (ttype == T_RDD) {
		state = CSTATE_I;
	      }

	      sjm_memctrl->AddRequest(addr, 64, srcID, indx, state, 0);
	    }
	  } else {
	    dprintf(mod_in_fsm, 21, 0, "Decoding %s: addr=0x%0.11llx src=0x%x orb=%d", get_trans_string(ttype), addr, srcID, indx);
	  }
	  // Queue a snoop.
	  sjm_snpctrl->NewSnoop(addr, srcID, indx, ttype, own, hold_snoop, must_snoop);

	} else if ((ttype == T_WRI) || (ttype == T_WRIS) || (ttype == T_WRB) || (ttype == T_WRBC)) {
	  // WRITE transactions.
	  if (sjm_memctrl->InRange(addr) && (ttype != T_WRBC)) {
	    dprintf(mod_in_fsm, 0, 0, "Receiving %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
	    in_sampling = 1;
	    if (find_range(addr)) {
	      dprintf(mod_in_fsm, 49, 0, "Address 0x%0.11llx is not in cacheable space.", addr);
	    } else {
	      hold_snoop = 1;
	      in_active = 1;
	      sjm_memctrl->AddRequest(addr, 64, srcID, 0, 0);
	    }
	  } else {
	    dprintf(mod_in_fsm, 21, 0, "Decoding %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
	  }
	  // Queue a snoop.
	  if ((ttype == T_WRB) || (ttype == T_WRBC)) {
	    must_snoop = 0;
	  }
	  sjm_snpctrl->NewSnoop(addr, srcID, -1, ttype, own, hold_snoop, must_snoop);

	  in_cyclecnt = 0;
	  in_state = CYC_DATA64;

	} else if (ttype == T_INV) {
	  // INVALIDATE transaction.
	  dprintf(mod_in_fsm, 21, 0, "Decoding %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
	  // Queue a snoop, the snooper should know what to do with this.
	  sjm_snpctrl->NewSnoop(addr, srcID, -1, ttype, own, hold_snoop, must_snoop);

	} else if ((ttype == T_NCRD) || (ttype == T_NCBRD)) {
	  // NONCACHED READ transactions.
	  if (sjm_memctrl->InRange(addr)) {
	    dprintf(mod_in_fsm, 0, 0, "Receiving %s: addr=0x%0.11llx src=0x%x orb=%d mask=0x%0.4x", get_trans_string(ttype), addr, srcID, indx, mask);
	    in_sampling = 1;
	    if (find_range(addr) <= 0) {
	      dprintf(mod_in_fsm, 49, 0, "Address 0x%0.11llx is not in noncacheable space.", addr);
	    } else {
	      if (ttype == T_NCRD) {
		sjm_memctrl->AddRequest(addr, 16, srcID, indx, -1, mask);
	      } else {
		sjm_memctrl->AddRequest(addr, 64, srcID, indx, CSTATE_I, mask);
	      }
	    }
	  } else {
	    dprintf(mod_in_fsm, 21, 0, "Decoding %s: addr=0x%0.11llx orb=%d mask=0x%0.4x", get_trans_string(ttype), addr, indx, mask);
	  }

	} else if ((ttype == T_NCWR) || (ttype == T_NCWRC) || (ttype == T_NCBWR)) {
	  // NONCACHED WRITE transactions.
	  if (sjm_memctrl->InRange(addr)) {
	    dprintf(mod_in_fsm, 0, 0, "Receiving %s: addr=0x%0.11llx src=0x%x mask=0x%0.4x", get_trans_string(ttype), addr, srcID, mask);
	    in_sampling = 1;
	    if (find_range(addr) <= 0) {
	      dprintf(mod_in_fsm, 49, 0, "Address 0x%0.11llx is not in noncacheable space.", addr);
	    } else {
	      in_active = 1;

	      if (ttype == T_NCBWR) {
		sjm_memctrl->AddRequest(addr, 64, srcID, mask, 0);
	      } else if (ttype == T_NCWRC) {
		sjm_memctrl->AddRequest(addr, 16, srcID, mask, 1);
	      } else {
		sjm_memctrl->AddRequest(addr, 16, srcID, mask, 0);
	      }
	    }
	  } else {
	    dprintf(mod_in_fsm, 21, 0, "Decoding %s: addr=0x%0.11llx src=0x%x mask=0x%0.4x", get_trans_string(ttype), addr, srcID, mask);
	  }
	  if (ttype == T_NCBWR) {
	    in_cyclecnt = 0;
	    in_state = CYC_DATA64;
	  } else {
	    in_state = CYC_DATA16;
	  }
//	} else if (ttype == T_CWR) { /*for Niagara support*/
//	  // Subline Coherent WRITE transactions.
//	  if (sjm_memctrl->InRange(addr)) { 
//	    /*this case shouldn't happen since we won't be send CWR's to I/O Bridge*/
//	    dprintf(mod_in_fsm, 0, 0, "Receiving %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
//	    in_sampling = 1;
//	    if (find_range(addr)) {
//	      dprintf(mod_in_fsm, 49, 0, "Address 0x%0.11llx is not in cacheable space.", addr);
//	    } else {
//	      hold_snoop = 1;
//	      in_active = 1;
//	      /* add a new write request to the input queue with mask and nocompress*/
//	      sjm_memctrl->AddRequest(addr, 16, srcID, mask, 0);
//	    }
//	  } else {
//	    /* this should happen as the I/O Bridge sending the CWR should snoop itself*/
//	    dprintf(mod_in_fsm, 21, 0, "Decoding %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
//	  }
//	  // Queue a snoop just like a WRIS
//	  sjm_snpctrl->NewSnoop(addr, srcID, -1, ttype, own, hold_snoop, must_snoop);
//
//	  //in_cyclecnt = 0;
//	  in_state = CYC_DATA16;
//
	} else if (ttype == T_WRM){ /*for Niagara support*/
	  // WRITE-UNDER-MASK transaction
	  if (sjm_memctrl->InRange(addr)) {
	    /*this case shouldn't happen since we won't be send WRM's to I/O Bridge*/
	    dprintf(mod_in_fsm, 0, 0, "Receiving %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
	    in_sampling = 1;
	    if (find_range(addr)) {
	      dprintf(mod_in_fsm, 49, 0, "Address 0x%0.11llx is not in cacheable space.", addr);
	    } else {
	      hold_snoop = 1;
	      in_active = 1;
	      sjm_memctrl->AddRequest(addr, 64, srcID, 0, 0);
	    }
	  } else {
	    /* this should happen as the I/O Bridge sending the WRM should snoop itself*/
	    dprintf(mod_in_fsm, 21, 0, "Decoding %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
	  }

	  // Queue a snoop.
	  sjm_snpctrl->NewSnoop(addr, srcID, -1, ttype, own, hold_snoop, must_snoop);

	  in_cyclecnt = 0;
	  in_state = CYC_DATA64;

	} else if ((ttype == T_INT) || (ttype == T_INTACK) || (ttype == T_INTNACK)) {
	  // INTERRUPT transactions.
	  if (sjm_memctrl->InRange(addr)) {
	    dprintf(mod_in_fsm, 0, 0, "Receiving %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
	    in_sampling = 1;
	    // The interrupt is in our range.
	    sjm_intctrl->NewIncoming(ttype, (curr_ad[1] >> 31) & 0x1f);
	    in_sampling = 1;
	    in_active = 1;
	  } else {
	    dprintf(mod_in_fsm, 21, 0, "Decoding %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
	  }
	  in_state = CYC_IDLE;
	  if (ttype == T_INT) {
	    in_cyclecnt = 0;
	    in_state = CYC_DATA64;
	  }

	} else if (ttype == T_XIR) {
	  // Restart the parser.
	  dprintf(mod_in_fsm, 0, 0, "Decoding %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);
	  in_sampling = 1;
	  sjm_parser->Reset();
	  rdr_currCmd = sjm_parser->GetCmd();
	  rdr_waitcnt = 0;
	  rdr_trans = NULL;
	  rdr_wbtrans = NULL;
	  rdr_timeout_cnt = 0;

	} else if (ttype == T_CHANGE) {
	  dprintf(mod_in_fsm, 21, 0, "Decoding %s: addr=0x%0.11llx src=0x%x", get_trans_string(ttype), addr, srcID);

	} else {
	  dprintf(mod_in_fsm, 48, 0, "Unknown transaction type %d.", ttype);
	}
	// Done processing transaction type.
	in_ttype = ttype;
	in_addr = addr;

	if ((ttype == T_RDO) || (ttype == T_OWN) || (ttype == T_WRI) ||
	    (ttype == T_WRIS) || (ttype == T_INV)) {
	  // These transactions must change WRB's to WRBC. Search the writeback
	  // queue for matching addresses.
	  Enumeration<Transaction> *en = (Enumeration<Transaction> *) sjm_wrbq->Elements();
	  for (Transaction *t = (Transaction *) en->NextElement(); t && en->HasMoreElements(); t = (Transaction *) en->NextElement()) {
	    if ((t->type == T_WRB) && ((t->addr & AD_MASK6) == (addr & AD_MASK6))) {
	      dprintf(mod_in_fsm, 13, 0, "Cancelling WRB: addr=0x%0.11llx", addr);
	      t->type = T_WRBC;
	    }
	  }
	  delete en;
	}

	// Send the transaction information to the command program interface,
	// but only if the program is still running.
	if ((sjm_type == SJMTYPE_EXE) && (sigsend(P_PID, sjm_pid, 0) >= 0)) {
	  PLI_API_RspPacket rsp;
	  rsp.status = API_STAT_TRANSINFO;
	  rsp.addr = addr;
	  rsp.ttype = ttype;
	  rsp.mask = mask;
	  rsp.transid = curr_adtype;
	  //!!!
	  int len = sizeof(PLI_API_RspPacket);
	  if (write(sjm_out_pipe, (void *) &rsp, len) != len) {
	    dprintf(modname, 49, 0, "Failed to write response to the output pipe.");
	  }
	}

      }
    } else if ((cyc == C_RET16) || (cyc == C_RET64)) {
      // Read data return cycle.
      in_active = 0;

      // if (srcID == agent_id) {
      if (srcID == four_bit_agent_id) {
	// It's for us.

	in_sampling = 1;

	in_orbe = sjm_readbuff->Get(indx);
	if (in_orbe) {
	  dprintf(mod_in_fsm, 0, 0, "Accepting READ DATA RETURN: address=0x%0.11llx agent=0x%x orb=%d", in_orbe->addr, srcID, indx);
	  dprintf(mod_in_fsm, 12, 0, "0x%0.16llx 0x%0.16llx", curr_ad[0], curr_ad[1]);

	  // Check parity.
	  parityCheck(in_orbe->addr);
	  if (in_orbe->expect_rderr) {
	    dprintf(mod_in_fsm, 49, 0, "Index %d expected %s read error packet.", indx, ReadBuffEntry::GetREADERRType(in_orbe->expected_rderr_type));
	  }

	  in_active = 1;

	  if (cyc == C_RET16) {
	    in_ordercnt = (in_orbe->addr & 0x30) >> 4;
	  } else {
	    in_ordercnt = (in_orbe->addr & 0x20) >> 4;
	  }

	  in_orbe->indata->Set(in_ordercnt * 16, curr_ad[0]);
	  in_orbe->indata->Set((in_ordercnt * 16) + 8, curr_ad[1]);

	  if (cyc == C_RET16) {
	    in_orbe->dataret = 1;
	  }
	} else {
	  dprintf(mod_in_fsm, 49, 0, "Index %d in outstanding read buffer is invalid.", indx);
	  in_active = 0;
	}
      }
      in_prev = CYC_RET16;
      if (cyc == C_RET64) {
	in_cyclecnt = 0;
	in_state = CYC_RET64;
	in_prev = in_state;
      }

    } else if (cyc == C_ERR) {
      // Have read error cycle.
      in_active = 0;

      // if (srcID == agent_id) {
      if (srcID == four_bit_agent_id) {
	in_sampling = 1;
	sjm_readbuff->ReportError(indx, err_type);
      }
    }
  } else if ((in_state == CYC_DATA16) && curr_advalid) {
    in_cyclecnt++;
    if (in_active) {
      // Entering a data cycle. Check parity.
      parityCheck(in_addr);

      in_sampling = 1;

      dprintf(mod_in_fsm, 11, 0, "Accepting 16B write data.");
      dprintf(mod_in_fsm, 12, 0, "0x%0.16llx 0x%0.16llx", curr_ad[0], curr_ad[1]);

      ByteString *bstr = new ByteString(16);
      bstr->Set(0, curr_ad[0]);
      bstr->Set(8, curr_ad[1]);
      sjm_memctrl->AddData(bstr);
    }
    in_state = CYC_IDLE;

  } else if ((in_state == CYC_DATA64)  && curr_advalid) {
    in_cyclecnt++;
    if (in_active) {
      // Entering a data cycle. Check parity.
      parityCheck(in_addr);

      in_sampling = 1;

      dprintf(mod_in_fsm, 11, 0, "Accepting 64B write data.");
      dprintf(mod_in_fsm, 12, 0, "0x%0.16llx 0x%0.16llx", curr_ad[0], curr_ad[1]);

      ByteString *bstr = new ByteString(16);
      bstr->Set(0, curr_ad[0]);
      bstr->Set(8, curr_ad[1]);
      if (in_ttype != T_INT) {
	sjm_memctrl->AddData(bstr);
      } else {
	sjm_intctrl->NewData(bstr);
      }
    }
    if (in_cyclecnt == 4) {
      in_state = CYC_IDLE;
    }

  } else if ((in_state == CYC_RET64) && curr_advalid) {
    in_cyclecnt++;
    if (in_active) {
      // Getting read data return data. Check parity.
      parityCheck(in_orbe->addr);

      in_sampling = 1;

      dprintf(mod_in_fsm, 11, 0, "Accepting READ DATA RETURN: address=0x%0.11llx cstate=0x%x ecc1=%d ecc2=%d", in_orbe->addr, cstate, ecc1, ecc2);
      dprintf(mod_in_fsm, 12, 0, "0x%0.16llx 0x%0.16llx", curr_ad[0], curr_ad[1]);

      // Figure out what quadword to receive.
      if (in_ordercnt == 3) {
	in_ordercnt = 0;
      } else {
	in_ordercnt++;
      }

      in_orbe->indata->Set((in_ordercnt * 16), curr_ad[0]);
      in_orbe->indata->Set(((in_ordercnt * 16) + 8), curr_ad[1]);

      if (in_cyclecnt == 1) {
	in_orbe->cstate = cstate;
	in_orbe->ecc[0] = ecc1;
	in_orbe->ecc[1] = ecc2;
      } else if (in_cyclecnt == 2) {
	in_orbe->ecc[2] = ecc2;
      } else if (in_cyclecnt == 3) {
	in_orbe->ecc[3] = ecc2;
	sjm_arb->ReleaseBus();
	in_orbe->dataret = 1;
      }
    }
    if (in_cyclecnt == 3) {
      in_state = CYC_IDLE;
    }
  }


  // Process the input queues.
  sjm_readbuff->Cycle();

  void *startgen = nextgen;
  do {
    if (nextgen == (void *) sjm_snpctrl) {
      // Snoop control generates read returns from the cache.
      if (!sjm_snpctrl->Cycle()) {
	break;
      }
      nextgen = (void *) sjm_memctrl;
    } else if (nextgen == (void *) sjm_memctrl) {
      // Memory control generates read returns from memory.
      if (!sjm_memctrl->Cycle()) {
	break;
      }
      nextgen = (void *) sjm_intctrl;
    } else if (nextgen == (void *) sjm_intctrl) {
      // Interrupt control generates ack/nacks and retries.
      if (!sjm_intctrl->Cycle()) {
	break;
      }
      nextgen = NULL;
    } else {
      nextgen = (void *) sjm_snpctrl;
      // Process the command file.
      if ((sjm_state == SJM_EXEC) && !sjmCycle()) {
	break;
      }
    }
  } while (nextgen != startgen);
}


//------------------------------------------------------------------------------
// Process the current command in the command file. If the command fails for
// any reason, it is skipped, assuming that the environment will stop the
// simulation at some point soon afterwards.
int SJM::sjmCycle()
{
  if (!rdr_currCmd) {
    // Attempt to get a command.
    rdrNextCmd();
    if (!rdr_currCmd) {
      return 1;
    }
  }

  // Check the timeout.
  if ((rdr_timeout_cnt >= rdr_timeout) && (rdr_currCmd->cmd != CMD_DONE)) {
    dprintf(mod_cmd_proc, 49, 0, "TIMEOUT EXCEEDED. No command dispatched for %d cycles.", rdr_timeout);
    return 1;
  }
  rdr_timeout_cnt++;

  // Check the pending buswait.
  if (rdr_buswait) {
    // Get the parts of j_ad.
    int bw_ttype = (curr_ad[1] >> 43) & 0x1f;
    ull bw_addr = curr_ad[1] & 0x7ffffffffff;
    int tmpmask = (curr_ad[1] >> 48) & 0xffff;
    int bw_mask = 0;

    // Reverse the mask we get from the bus.
    for (int i = 0; i < 16; i++, tmpmask >>= 1, bw_mask <<= 1) {
      bw_mask |= tmpmask & 0x1;
    }
    bw_mask >>= 1;

    if ((rdr_buswait->waitID != bw_ttype) || (rdr_buswait->addr != bw_addr) ||
	(rdr_buswait->mask != bw_mask) || (rdr_buswait->reg1 != curr_adtype)) {
      if (rdr_buswait->cycles == sjm_cyclecnt) {
	  dprintf(mod_cmd_proc, 49, 0, "BUSWAIT: timeout expired (%s addr=0x%0.11llx mask=0x%0.4x adtype=0x%0.2x)", get_trans_string(rdr_buswait->waitID), rdr_buswait->addr, rdr_buswait->mask, rdr_buswait->reg1);
	return 1;
      }
    } else {
	dprintf(mod_cmd_proc, 12, 0, "BUSWAIT: continuing (%s addr=0x%0.11llx mask=0x%0.4x adtype=0x%0.2x)", get_trans_string(rdr_buswait->waitID), rdr_buswait->addr, rdr_buswait->mask, rdr_buswait->reg1);
      rdr_buswait = NULL;
    }
  }

  // Pending transactions must be pushed.
  if (!rdr_trans) {
    // Process the command.
    int cmd = rdr_currCmd->cmd;

    if (cmd == CMD_DONE) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: DONE");
	rdr_first = 0;
      }
      return 1;
    }

    //!!! these need to be sorted by frequency
    if (cmd == CMD_SEED) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: SEED %d", rdr_currCmd->cycles);
      srand(rdr_currCmd->cycles);
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_INTACCEPT) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: INTACCEPT %d", rdr_currCmd->cycles);
      sjm_intctrl->SetAckPercentage(rdr_currCmd->cycles);
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_INTACK) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: INTACK %d", rdr_currCmd->cycles);
      sjm_intctrl->SetAckInterval(rdr_currCmd->cycles);
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_INTMODE) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: INTMODE %d", rdr_currCmd->cycles);
      sjm_intctrl->SetAckMode(rdr_currCmd->cycles);
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_TIMEOUT) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: TIMEOUT %d R%d",
	      rdr_currCmd->cycles, rdr_currCmd->reg1);
      if (rdr_currCmd->reg1 > -1) {
	if (rdr_currCmd->reg1 == 1) {
	  sjm_readbuff->SetTimeout(rdr_currCmd->cycles * sjm_timeout_scale);
	} else if (rdr_currCmd->reg1 == 2) {
	  sjm_intctrl->SetTimeout(rdr_currCmd->cycles * sjm_timeout_scale);
	} else {
	  dprintf(mod_cmd_proc, 0, 0, "TIMEOUT: invalid register specification %d, ignored.", rdr_currCmd->reg1);
	}
      } else {
	rdr_timeout = rdr_currCmd->cycles * sjm_timeout_scale;
	rdr_timeout_cnt = 0;
      }
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_APADDRESS) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: APADDRESS 0x%0.11llx %d",
	      rdr_currCmd->addr, rdr_currCmd->IsOnOff());
      // Find the address in the list.
      int *which = (int *) sjm_addr_parity_list->KVFind(rdr_currCmd->addr);
      if (which) {
	*which = rdr_currCmd->IsOnOff();
      } else {
	// Adding a new address.
	int *n = new int(rdr_currCmd->IsOnOff());
	if (!sjm_addr_parity_list->KVInsert(rdr_currCmd->addr & AD_MASK6, n)) {
	  delete n;
	}
      }
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_APERROR) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: APERROR 0x%0.11llx %d",
	      rdr_currCmd->addr, rdr_currCmd->IsOnOff());
      if (!rdr_currCmd->reg2) {
	// Look in the address list.
	ull *newad = new ull(rdr_currCmd->addr & AD_MASK6);
	if (rdr_currCmd->IsOnOff()) {
	  // Try to add it, ignore errors.
	  if (!sjm_bad_parity_addrs->Insert(newad)) {
	    delete newad;
	  }
	} else {
	  // Try to remove it, ignore errors.
	  ull *ad = sjm_bad_parity_addrs->Remove(newad);
	  if (ad) {
	    delete ad;
	  }
	  delete newad;
	}
      } else {
	// Look in the transaction list.
	int *newtr = new int(rdr_currCmd->waitID);
	if (rdr_currCmd->IsOnOff()) {
	  // Try to add it, ignore errors.
	  if (!sjm_bad_parity_trans->Insert(newtr)) {
	    delete newtr;
	  }
	} else {
	  // Try to remove it, ignore errors.
	  int *tr = sjm_bad_parity_trans->Remove(newtr);
	  if (tr) {
	    delete tr;
	  }
	  delete newtr;
	}
      }
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_APCHECK) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: APCHECK %d", rdr_currCmd->IsOnOff());
      sjm_check_addr_parity = rdr_currCmd->IsOnOff();
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_ECCERROR) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: ECCERROR 0x%0.11llx %d, norand=%d jid=%d",
	      rdr_currCmd->addr, rdr_currCmd->IsOnOff(), rdr_currCmd->mask, rdr_currCmd->dvalid);
      if (rdr_currCmd->mask){
	ull ad = rdr_currCmd->addr & (~0xf);
	int *find = (int *) sjm_bad_ecc_list_norand->KVFind(ad);
	if (rdr_currCmd->IsOnOff()) {
	  // First look if it was all ready added.
	  if (find) {
	    // Reset the value.
	    *find |= rdr_currCmd->reg2;
	  } else {
	    // Adding a new address.
	    int *w = new int(rdr_currCmd->reg2);
	    sjm_bad_ecc_list_norand->KVInsert(ad, (void *) w);
	    int *w1 = new int(rdr_currCmd->dvalid);
	    sjm_bad_ecc_list_norand_dest->KVInsert(ad, (void *) w1);
	  }
	} else {
	  // First look if it is there.
	  if (find) {
	    *find &= ~rdr_currCmd->reg2;
	    if (! *find) {
	      // Remove the node.
	      int *w = (int *) sjm_bad_ecc_list_norand->KVRemove(ad);
	      delete w;
	      w = (int *) sjm_bad_ecc_list_norand_dest->KVRemove(ad);
	      delete w;
	    }
	  }
	}
      }else{
	ull ad = rdr_currCmd->addr & AD_MASK6;
	int *find = (int *) sjm_bad_ecc_list->KVFind(ad);
	if (rdr_currCmd->IsOnOff()) {
	  // First look if it was all ready added.
	  if (find) {
	    // Reset the value.
	    *find |= rdr_currCmd->reg2;
	  } else {
	    // Adding a new address.
	    int *w = new int(rdr_currCmd->reg2);
	    sjm_bad_ecc_list->KVInsert(ad, (void *) w);
	  }
	} else {
	  // First look if it is there.
	  if (find) {
	    *find &= ~rdr_currCmd->reg2;
	    if (! *find) {
	      // Remove the node.
	      int *w = (int *) sjm_bad_ecc_list->KVRemove(ad);
	      delete w;
	    }
	  }
	}
      }
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_FLIPBITS) {
      dprintf(mod_cmd_proc, 11, 8, "COMMAND: FLIPBITS 0x%0.11llx %d",
	      rdr_currCmd->addr, rdr_currCmd->IsOnOff());
      ull ad = rdr_currCmd->addr & AD_MASK6;
      ByteString *bstr = (ByteString *) sjm_flipbits_list->KVFind(ad);
      if (bstr) {
	rdrPrintData(bstr, 16);
      } else {
	dprintf(mod_cmd_proc, 11, 8, "\n");
      }
      if (rdr_currCmd->IsOnOff()) {
	// Add an address.
	if (bstr) {
	  // Reset the value.
	  bstr->Copy(rdr_currCmd->data);
	} else {
	  // Add a new value.
	  bstr = new ByteString(*rdr_currCmd->data);
	  sjm_flipbits_list->KVInsert(ad, (void *) bstr);
	}
      } else {
	// Remove an address.
	if (bstr) {
	  bstr = (ByteString *) sjm_flipbits_list->KVRemove(ad);
	  delete bstr;
	}
      }

    } else if ((cmd == CMD_TOADDRESS) || (cmd == CMD_BEADDRESS) || (cmd == CMD_SEADDRESS)) {
      int err;
      if (cmd == CMD_TOADDRESS) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: TOADDRESS 0x%0.11llx %d",
		rdr_currCmd->addr, rdr_currCmd->IsOnOff());
	err = READERR_TIMEOUT;
      } else if (cmd == CMD_BEADDRESS) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: BEADDRESS 0x%0.11llx %d",
		rdr_currCmd->addr, rdr_currCmd->IsOnOff());
	err = READERR_BUSERR;
      } else {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: SEADDRESS 0x%0.11llx %d",
		rdr_currCmd->addr, rdr_currCmd->IsOnOff());
	err = READERR_UNMAPPED;
      }
      if (sjm_memctrl->InRange(rdr_currCmd->addr)) {
  // This is a local address
  // Record the address so we respond with a read error packet later
	if (rdr_currCmd->IsOnOff()) {
	  sjm_memctrl->AddReadErrorAddress(rdr_currCmd->addr & AD_MASK6, err);
	} else {
	  sjm_memctrl->RemoveReadErrorAddress(rdr_currCmd->addr & AD_MASK6, err);
	}
      } else {
	// This is a foreign address
	// Find the address in the list.
	int *which = (int *) sjm_read_error_list->KVFind(rdr_currCmd->addr & AD_MASK6);
	if (rdr_currCmd->IsOnOff()) {
	  // Record the address so we expect a read error packet later
	  dprintf(mod_cmd_proc, 11, 0, "         Address is foreign; will expect RDERR packet");
	  if (which) {
	    *which = err;
	  } else {
	    // Adding a new address.
	    int *n = new int(err);
	    if (!sjm_read_error_list->KVInsert(rdr_currCmd->addr & AD_MASK6, n)) {
	      delete n;
	    }
	  }
	} else {
	  if (which) {
	    // Remove the address, but only if the error type matches
	    if (err == *which) {
	      which = (int *) sjm_read_error_list->KVRemove(rdr_currCmd->addr & AD_MASK6);
	      delete which;
	    }
	  }
	}
      }
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_CACHESTATE) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: CACHESTATE 0x%0.11llx %c",
	      rdr_currCmd->addr, Cache::GetStateString(rdr_currCmd->reg2));
      if (rdr_currCmd->IsOnOff()) {
	sjm_memctrl->AddCacheStateAddress(rdr_currCmd->addr & AD_MASK6, rdr_currCmd->reg2);
      } else {
	sjm_memctrl->RemoveCacheStateAddress(rdr_currCmd->addr & AD_MASK6, rdr_currCmd->reg2);
      }
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_WAIT) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: WAIT %d", rdr_currCmd->cycles);
	rdr_first = 0;
      }
      if (rdr_waitcnt != rdr_currCmd->cycles) {
	rdr_waitcnt++;
	return 1;
      }
      rdr_waitcnt = 0;
      dprintf(mod_cmd_proc, 12, 0, "WAIT: continuing.");

    } else if (cmd == CMD_ARBWAIT) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: ARBWAIT %d", rdr_currCmd->waitID);
	rdr_first = 0;
      }
      if ((rdr_currCmd->waitID < 0)  && !sjm_arb->ReqActive()) {
	return 1;
      } else if ((rdr_currCmd->waitID >= 0) && !sjm_arb->GetReqIn(rdr_currCmd->waitID)) {
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "ARBWAIT: request %d asserted.", rdr_currCmd->waitID);

    } else if (cmd == CMD_BUSCHECK) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: BUSCHECK %s 0x%0.11llx 0x%0.4x 0x%x time=%d",
		get_trans_string(rdr_currCmd->waitID), rdr_currCmd->addr,
		rdr_currCmd->mask, rdr_currCmd->reg1, rdr_currCmd->cycles);
	rdr_first = 0;
      }
      // Get the parts of j_ad.
      int bc_ttype = (curr_ad[1] >> 43) & 0x1f;
      ull bc_addr = curr_ad[1] & 0x7ffffffffff;
      int tmpmask = (curr_ad[1] >> 48) & 0xffff;
      int bc_mask = 0;

      // Reverse the mask we get from the bus.
      for (int i = 0; i < 16; i++, tmpmask >>= 1, bc_mask <<= 1) {
	bc_mask |= tmpmask & 0x1;
      }
      bc_mask >>= 1;

      if (rdr_currCmd->waitID == bc_ttype) {
	if ((rdr_currCmd->addr != bc_addr) || (rdr_currCmd->mask != bc_mask) ||
	    ((rdr_currCmd->reg1 & rdr_currCmd->reg2) != (curr_adtype & rdr_currCmd->reg2))) {
	  dprintf(mod_cmd_proc, 49, 8, "BUSCHECK for '%s' failed.\n\tExpected:\n\taddress: 0x%0.11llx mask: 0x%0.4x adtype: 0x%0.2x\n\tReceived:\n\taddress: 0x%0.11llx mask: 0x%0.4x adtype: 0x%0.2x\n",
		  get_trans_string(rdr_currCmd->waitID), rdr_currCmd->addr, rdr_currCmd->mask,
		  rdr_currCmd->reg1, bc_addr, bc_mask, curr_adtype);
	  return 1;
	}
      } else {
	if (rdr_waitcnt != rdr_currCmd->cycles) {
	  rdr_waitcnt++;
	  return 1;
	} else {
	  dprintf(mod_cmd_proc, 49, 0, "BUSCHECK: timeout expired.");
	}
      }
      rdr_waitcnt = 0;
      dprintf(mod_cmd_proc, 12, 0, "BUSCHECK: continuing.");

    } else if (cmd == CMD_BUSWAIT) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: BUSWAIT %s 0x%0.11llx 0x%0.4x 0x%x time=%d queue=%d",
		get_trans_string(rdr_currCmd->waitID), rdr_currCmd->addr,
		rdr_currCmd->mask, rdr_currCmd->reg1, rdr_currCmd->cycles,
		(rdr_currCmd->reg2 == SSP_QUEUE)? 1 : 0);
	rdr_first = 0;
      }
      // Get the parts of j_ad.
      int bw_ttype = (curr_ad[1] >> 43) & 0x1f;
      ull bw_addr = curr_ad[1] & 0x7ffffffffff;
      int tmpmask = (curr_ad[1] >> 48) & 0xffff;
      int bw_mask = 0;

      // Reverse the mask we get from the bus.
      for (int i = 0; i < 16; i++, tmpmask >>= 1, bw_mask <<= 1) {
	bw_mask |= tmpmask & 0x1;
      }
      bw_mask >>= 1;

      if ((rdr_currCmd->waitID != bw_ttype) || (rdr_currCmd->addr != bw_addr) ||
	  (rdr_currCmd->mask != bw_mask) ||
	  ((rdr_currCmd->reg1 & rdr_currCmd->reg2) != (curr_adtype & rdr_currCmd->reg2))) {
	if (rdr_waitcnt != rdr_currCmd->cycles) {
	  rdr_waitcnt++;
	  if ((rdr_currCmd->reg2 == SSP_QUEUE) && !rdr_buswait) {
	    dprintf(mod_cmd_proc, 13, 0, "BUSWAIT: queueing (%s addr=0x%0.11llx mask=0x%0.4x adtype=0x%0.2x)", get_trans_string(rdr_currCmd->waitID), rdr_currCmd->addr, rdr_currCmd->mask, rdr_currCmd->reg1);
	    rdr_buswait = rdr_currCmd;
	    rdr_buswait->cycles += sjm_cyclecnt;
	  } else {
	    return 1;
	  }
	} else {
	  dprintf(mod_cmd_proc, 49, 0, "BUSWAIT: timeout expired (%s addr=0x%0.11llx mask=0x%0.4x adtype=0x%0.2x)", get_trans_string(rdr_currCmd->waitID), rdr_currCmd->addr, rdr_currCmd->mask, rdr_currCmd->reg1);
	  return 1;
	}
      } else {
	dprintf(mod_cmd_proc, 12, 0, "BUSWAIT: continuing (%s addr=0x%0.11llx mask=0x%0.4x adtype=0x%0.2x)", get_trans_string(rdr_currCmd->waitID), rdr_currCmd->addr, rdr_currCmd->mask, rdr_currCmd->reg1);
      }
      rdr_waitcnt = 0;

    } else if (cmd == CMD_INV) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: INV R%d", rdr_currCmd->reg1);
      }
      if (!sjm_readbuff->Empty()) {
	if (rdr_first) {
	  dprintf(mod_cmd_proc, 13, 0, "INV: performing FLUSH");
	  rdr_first = 0;
	}
	return 1;
      }
      rdr_first = 0;
      if (sjm_regfile->Invert(rdr_currCmd->reg1)) {
	dprintf(mod_cmd_proc, 12, 0, "INV: continuing.");
	rdrNextCmd();
	return sjmCycle();
      } else {
	dprintf(mod_cmd_proc, 12, 0, "INV: failed.");
      }

    } else if (cmd == CMD_SYNC) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 8, "COMMAND: SYNC");
	for (int i = 1; i < rdr_currCmd->sync_ids[0]; i++) {
	  dprintf(mod_cmd_proc, 11, 8, " %d", rdr_currCmd->sync_ids[i]);
	}
	dprintf(mod_cmd_proc, 11, 8, "\n");
	rdr_first = 0;
      }
      int state = sync_check_status(port_id);
      if (state == SYNC_STATE_NOSYNC) {
	dprintf(mod_cmd_proc, 13, 0, "SYNC: initiating.");
	if (sync_initiate(port_id, rdr_currCmd->sync_ids[0], &(rdr_currCmd->sync_ids[1])) != SYNC_STATE_DONE) {
	  return 1;
	}
      } else if (state == SYNC_STATE_UNKNOWN) {
	dprintf(mod_cmd_proc, 49, 0, "Error in call to SYNC.");
      } else if (state == SYNC_STATE_WAIT) {
	return 1;
      }
      // Last option is SYNC_STATE_DONE, in which case we continue so that the
      // next command is fetched.
      dprintf(mod_cmd_proc, 12, 0, "SYNC: continuing.");

    } else if (cmd == CMD_IOSYNC) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: IOSYNC");
	rdr_first = 0;
      }
      int state = sjm_memctrl->GetSyncState();
      if (state == MEM_IOSYNC_WAIT) {
	return 1;
      } else if (state == MEM_IOSYNC_DONE) {
	dprintf(mod_cmd_proc, 12, 0, "IOSYNC: continuing.");
      } else {
	dprintf(mod_cmd_proc, 49, 0, "Error in call to IOSYNC.");
      }

    } else if (cmd == CMD_FLUSH) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: FLUSH");
	rdr_first = 0;
      }
      if (!sjm_readbuff->Empty()) {
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "FLUSH: continuing.");

    } else if (cmd == CMD_CMP) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: CMP R%d R%d",
		rdr_currCmd->reg1, rdr_currCmd->reg2);
      }
      // Must flush first.
      if (!sjm_readbuff->Empty()) {
	if (rdr_first) {
	  dprintf(mod_cmd_proc, 12, 0, "CMP: performing FLUSH");
	  rdr_first = 0;
	}
	return 1;
      }
      rdr_first = 0;
      sjm_regfile->SetCC(rdr_currCmd->reg1, rdr_currCmd->reg2);
      if (!rdr_currCmd->setcc && sjm_regfile->GetCCR()) {
	dprintf(mod_cmd_proc, 49, 0, "Contents of registers R%d and R%d don't match.", rdr_currCmd->reg1, rdr_currCmd->reg2);
      }

    } else if (cmd ==  CMD_BNE) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: BNE %s", rdr_currCmd->tolabel);
      }
      if (!sjm_readbuff->Empty()) {
	if (rdr_first) {
	  dprintf(mod_cmd_proc, 13, 0, "BNE: performing FLUSH");
	  rdr_first = 0;
	}
	return 1;
      }
      rdr_first = 0;
      if (sjm_regfile->GetCCR()) {
	dprintf(mod_cmd_proc, 12, 0, "BNE: branch taken (\"%s\")", rdr_currCmd->tolabel);
	rdr_currCmd = sjm_parser->GetBranchCmd();
	rdr_timeout_cnt = 0;
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "BNE: branch not taken (\"%s\")", rdr_currCmd->tolabel);


    } else if (cmd == CMD_BE) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: BE %s", rdr_currCmd->tolabel);
      }
      if (!sjm_readbuff->Empty()) {
	if (rdr_first) {
	  dprintf(mod_cmd_proc, 13, 0, "BE: performing FLUSH");
	  rdr_first = 0;
	}
	return 1;
      }
      rdr_first = 0;
      if (!sjm_regfile->GetCCR()) {
	dprintf(mod_cmd_proc, 12, 0, "BE: branch taken (\"%s\")", rdr_currCmd->tolabel);
	rdr_currCmd = sjm_parser->GetBranchCmd();
	rdr_timeout_cnt = 0;
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "BE: branch not taken (\"%s\")", rdr_currCmd->tolabel);

    } else if (cmd == CMD_BA) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: BA %s", rdr_currCmd->tolabel);
      rdr_currCmd = sjm_parser->GetBranchCmd();
      rdr_timeout_cnt = 0;
      return 1;

    } else if (cmd == CMD_BI) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: BI %s", rdr_currCmd->tolabel);
	rdr_first = 0;
      }
      // Block if there are any pending interrupts.
      if (sjm_intctrl->NumOutgoing() > 0) {
	return 1;
      }
      if (sjm_intctrl->CheckForACK()) {
	dprintf(mod_cmd_proc, 12, 0, "BI: branch taken (\"%s\")", rdr_currCmd->tolabel);
	rdr_currCmd = sjm_parser->GetBranchCmd();
	rdr_timeout_cnt = 0;
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "BI: branch not taken (\"%s\")", rdr_currCmd->tolabel);

    } else if (cmd == CMD_BNI) {
      if (rdr_first) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: BNI %s", rdr_currCmd->tolabel);
	rdr_first = 0;
      }
      // Block if there are any pending interrupts.
      if (sjm_intctrl->NumOutgoing() > 0) {
	return 1;
      }
      if (sjm_intctrl->CheckForNACK()) {
	dprintf(mod_cmd_proc, 12, 0, "BNI: branch taken (\"%s\")", rdr_currCmd->tolabel);
	rdr_currCmd = sjm_parser->GetBranchCmd();
	rdr_timeout_cnt = 0;
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "BNI: branch not taken (\"%s\")", rdr_currCmd->tolabel);

    } else if (cmd == CMD_BIA) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: BIA %s", rdr_currCmd->tolabel);
      if (sjm_intctrl->CheckDataValid()) {
	dprintf(mod_cmd_proc, 12, 0, "BIA: branch taken (\"%s\")", rdr_currCmd->tolabel);
	rdr_currCmd = sjm_parser->GetBranchCmd();
	rdr_timeout_cnt = 0;
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "BIA: branch not taken (\"%s\")", rdr_currCmd->tolabel);

    } else if (cmd == CMD_BNIA) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: BNIA %s", rdr_currCmd->tolabel);
      if (!sjm_intctrl->CheckDataValid()) {
	dprintf(mod_cmd_proc, 12, 0, "BNIA: branch taken (\"%s\")", rdr_currCmd->tolabel);
	rdr_currCmd = sjm_parser->GetBranchCmd();
	rdr_timeout_cnt = 0;
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "BNIA: branch not taken (\"%s\")", rdr_currCmd->tolabel);

    } else if (cmd == CMD_BD) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: BD %s", rdr_currCmd->tolabel);
      if (PLIModulesDone()) {
	dprintf(mod_cmd_proc, 12, 0, "BD: branch taken (\"%s\")", rdr_currCmd->tolabel);
	rdr_currCmd = sjm_parser->GetBranchCmd();
	rdr_timeout_cnt = 0;
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "BD: branch not taken (\"%s\")", rdr_currCmd->tolabel);

    } else if (cmd == CMD_BND) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: BND %s", rdr_currCmd->tolabel);
      if (!PLIModulesDone()) {
	dprintf(mod_cmd_proc, 12, 0, "BND: branch taken (\"%s\")", rdr_currCmd->tolabel);
	rdr_currCmd = sjm_parser->GetBranchCmd();
	rdr_timeout_cnt = 0;
	return 1;
      }
      dprintf(mod_cmd_proc, 12, 0, "BND: branch not taken (\"%s\")", rdr_currCmd->tolabel);

    } else if (cmd == CMD_PRINT) {
      dprintf(mod_display, 0, 0, "%s", rdr_currCmd->msg);
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_ERROR) {
      dprintf(mod_display, 49, 0, "%s", rdr_currCmd->msg);

    } else if (cmd == CMD_DISPLAY_ECTAG) {
      dprintf(mod_display, 0, 0, "Tag for 0x%llx: 0x%llx", rdr_currCmd->addr, sjm_cache->GetTag(rdr_currCmd->addr));
      rdrNextCmd();
      return sjmCycle();

    } else if (cmd == CMD_AOK) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: AOK %d %d",
	      rdr_currCmd->IsOnOff(), rdr_currCmd->cycles);
      int pack = P_AOK_OFF;
      if (rdr_currCmd->IsOnOff()) {
	pack = P_AOK_ON;
      }
      for (int i = 0; i < rdr_currCmd->cycles; i++) {
	sjm_snpctrl->AddPack(pack);
      }

    } else if (cmd == CMD_DOK) {
      dprintf(mod_cmd_proc, 11, 0, "COMMAND: DOK %d %d",
	      rdr_currCmd->IsOnOff(), rdr_currCmd->cycles);
      int pack = P_DOK_OFF;
      if (rdr_currCmd->IsOnOff()) {
	pack = P_DOK_ON;
      }
      for (int i = 0; i < rdr_currCmd->cycles; i++) {
	sjm_snpctrl->AddPack(pack);
      }

    } else if (cmd == CMD_READINT) {
      dprintf(mod_cmd_proc, 11, 8, "COMMAND: READINT");
      rdrPrintData(rdr_currCmd->data, 16);
      // If no data was supplied, just check if the data is valid.
      ByteString *intdata = sjm_intctrl->CheckData();
      if (!intdata) {
	dprintf(mod_cmd_proc, 49, 0, "Interrupt data register is invalid.");
      } else {
	if (rdr_currCmd->dvalid) {
	  if (intdata->Compare(rdr_currCmd->data)) {
	    dprintf(mod_cmd_proc, 49, 8, "Interrupt data does not match.\n\texpected:\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\treceived:\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n",
		    rdr_currCmd->data->GetUll(0), rdr_currCmd->data->GetUll(8),
		    rdr_currCmd->data->GetUll(16), rdr_currCmd->data->GetUll(24),
		    rdr_currCmd->data->GetUll(32), rdr_currCmd->data->GetUll(40),
		    rdr_currCmd->data->GetUll(48), rdr_currCmd->data->GetUll(56),
		    intdata->GetUll(0), intdata->GetUll(8),
		    intdata->GetUll(16), intdata->GetUll(24),
		    intdata->GetUll(32), intdata->GetUll(40),
		    intdata->GetUll(48), intdata->GetUll(56));
	  } else {
	    dprintf(mod_cmd_proc, 12, 0, "READINT: data matched.");
	  }
	} else {
	  dprintf(mod_cmd_proc, 12, 0, "READINT: data is valid.");
	  if (rdr_currCmd->reg1 > -1) {
	    sjm_regfile->Set(rdr_currCmd->reg1, intdata, 0, 64, rdr_currCmd->setcc);
	  }
	}
      }

    } else if (cmd == CMD_INT) {
      dprintf(mod_cmd_proc, 11, 8, "COMMAND: INT 0x%llx", rdr_currCmd->addr);
      rdrPrintData(rdr_currCmd->data, 16);
      // Check if we need to repeat.
      int repeat = 0;
      if (rdr_currCmd->reg2 == SSP_REPEAT) {
	repeat = rdr_currCmd->cycles;
      }
      // Log a new outgoing interrupt.
      if (!sjm_intctrl->NewOutgoing(rdr_currCmd->addr, rdr_currCmd->data, repeat)) {
	return 1;
      }

    } else {
      // The rest potentially generate a transaction.
      char cstate;
      ByteString *cdata = NULL;
      int ttype = -1;
      int orb_indx = -1;
      int destID = find_agent_id(rdr_currCmd->addr);
      unsigned short mask = 0;

      if ((cmd == CMD_IFETCH) || (cmd == CMD_READ)) {
	if (rdr_first) {
	  if (cmd == CMD_IFETCH) {
	    dprintf(mod_cmd_proc, 11, 8, "COMMAND: IFETCH");
	  } else {
	    dprintf(mod_cmd_proc, 11, 8, "COMMAND: READ");
	  }
	  dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx %d", rdr_currCmd->addr, rdr_currCmd->size);
	  rdrPrintData(rdr_currCmd->data, 16);
	  rdr_first = 0;
	}

	// If there is a read outstanding to the address, stall until the data
	// has been returned.
	if (sjm_readbuff->BlockOn(rdr_currCmd->addr) || sjm_snpctrl->SnoopPending(rdr_currCmd->addr) || rdrWritePending()) {
	  return 1;
	}

	// Check if the data is all ready in the cache.
	cstate = sjm_cache->GetState(rdr_currCmd->addr);
	if (sjm_cache->Contains(rdr_currCmd->addr) && (cstate != CSTATE_I)) {
	  rdrCheckCache();
	} else {
	  // Generate a transaction.
	  ttype = T_RDS;
	  if (cmd == CMD_IFETCH) {
	    ttype = T_RDSA;
	  } else if (rdr_currCmd->reg2 == XTN_NOSNOOP) {
	    ttype = T_RD;
	  }

	  // Put the transaction into the outstanding read buffer.
	  if ((orb_indx = rdrAddToReadBuff(ttype, rdr_currCmd->size)) < 0) {
	    return 1;
	  }

	  // Address must be 32-byte aligned.
	  rdr_trans = new Transaction(ttype, rdr_currCmd->addr & 0xffffffffffffffe0 , destID, orb_indx, -1, 0);

	  // Check for writeback.
	  if ((cstate == CSTATE_M) || (cstate == CSTATE_O)) {
	    rdr_trans->atomic = 1;
	    rdr_wbtrans = rdrGenWriteBack();
	  }
	}

      } else if (cmd == CMD_OWN) {
	if (rdr_first) {
	  dprintf(mod_cmd_proc, 11, 8, "COMMAND: OWN");
	  dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx %d", rdr_currCmd->addr, rdr_currCmd->size);
	  rdrPrintData(rdr_currCmd->data, 16);
	  rdr_first = 0;
	}

	// If there is a read outstanding to the address, stall until the data
	// has been returned.
	if (sjm_readbuff->BlockOn(rdr_currCmd->addr) || sjm_snpctrl->SnoopPending(rdr_currCmd->addr) || rdrWritePending()) {
	  return 1;
	}

	cstate = sjm_cache->GetState(rdr_currCmd->addr);
	if (sjm_cache->Contains(rdr_currCmd->addr) && ((cstate == CSTATE_M) || (cstate == CSTATE_E))) {
	  rdrCheckCache();
	  if (cstate == CSTATE_E) {
	    if (!sjm_cache->ChangeState(rdr_currCmd->addr, CSTATE_M)) {
	      dprintf(modname, 49, 0, "Couldn't transition 0x%llx to state %c.", rdr_currCmd->addr, Cache::GetStateString(CSTATE_M));
	    }
	  }
	} else {
	  // Generate a transaction.
	  ttype = T_RDO;
	  if (sjm_cache->Contains(rdr_currCmd->addr) && (cstate == CSTATE_O)) {
	    ttype = T_OWN;
	  }

	  // Put the transaction into the outstanding read buffer.
	  if ((orb_indx = rdrAddToReadBuff(ttype, rdr_currCmd->size)) < 0) {
	    return 1;
	  }
	  // With RDO generated by OWN, we don't want to write data, just compare.
	  sjm_readbuff->SetCompare(orb_indx);
	  sjm_readbuff->UnsetModify(orb_indx);

	  // Address must be 32-byte aligned
	  rdr_trans = new Transaction(ttype, rdr_currCmd->addr & 0xffffffffffffffe0, destID, orb_indx, -1, 0);
	  // Check for writeback.
	  if ((cstate == CSTATE_M) || ((ttype != T_OWN) && (cstate == CSTATE_O))) {
	    rdr_trans->atomic = 1;
	    rdr_wbtrans = rdrGenWriteBack();
	  }
	}

      } else if ((cmd == CMD_WRITE) || (cmd == CMD_LOCK)) {
	if (rdr_first) {
	  if (cmd == CMD_WRITE) {
	    dprintf(mod_cmd_proc, 11, 8, "COMMAND: WRITE");
	  } else {
	    dprintf(mod_cmd_proc, 11, 8, "COMMAND: LOCK");
	  }
	  dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx %d", rdr_currCmd->addr, rdr_currCmd->size);
	  rdrPrintData(rdr_currCmd->data, 16);
	  rdr_first = 0;
	}

	// If there is a read outstanding to the address, stall until the data
	// has been returned.
	if (sjm_readbuff->BlockOn(rdr_currCmd->addr) || sjm_snpctrl->SnoopPending(rdr_currCmd->addr) || rdrWritePending()) {
	  return 1;
	}

	// Check if the data is in the cache.
	cstate = sjm_cache->GetState(rdr_currCmd->addr);
	if (sjm_cache->Contains(rdr_currCmd->addr) && ((cstate == CSTATE_M) || (cstate == CSTATE_E))) {
	 // if (port_id == 2 && cmd == CMD_WRITE && rdr_currCmd->addr  == 0x03059f0ff90)
	 //   cmd = CMD_LOCK;
	  if (rdrAnyWritePending()){
	    dprintf(mod_cmd_proc, 11, 0, "write hitting cache cannot be issued until previous writes have been issued to jbus");
	    return 1;
	  }
	  // Write the data into the cache.
	  dprintf(mod_cmd_proc, 30, 0, "Data for write to address 0x%llx found in the cache.", rdr_currCmd->addr);
	  cdata = sjm_cache->ReadLine(rdr_currCmd->addr);
	  int miscompare = 0;
	  if ((cmd == CMD_LOCK) && !cdata->Compare(rdr_currCmd->addr & 0x3f, rdr_currCmd->size, rdr_currCmd->data)) {
	    dprintf(mod_cmd_proc, 0, 0, "Expected data for write to address 0x%llx does not match what was found in the cache.", rdr_currCmd->addr);
	    miscompare = 1;
	  } else {
	    if (cmd == CMD_WRITE) {
	      cdata->Copy(rdr_currCmd->addr & 0x3f, rdr_currCmd->size, rdr_currCmd->data);
	    } else {
	      cdata->Copy(rdr_currCmd->addr & 0x3f, (rdr_currCmd->addr & 0x3f) + rdr_currCmd->size, rdr_currCmd->size, rdr_currCmd->data);
	    }
	    char nstate = cstate;
	    if (nstate == CSTATE_E) {
	      nstate = CSTATE_M;
	    }
	    if (!sjm_cache->WriteLine(rdr_currCmd->addr, cdata, nstate)) {
	      dprintf(mod_cmd_proc, 49, 0, "Problem writing cache with address 0x%llx, state %c", rdr_currCmd->addr, Cache::GetStateString(CSTATE_M));
	    } else {
	      dprintf(mod_cmd_proc, 30, 0, "0x%0.16llx 0x%0.16llx", cdata->GetUll(0), cdata->GetUll(8));
	      dprintf(mod_cmd_proc, 30, 0, "0x%0.16llx 0x%0.16llx", cdata->GetUll(16), cdata->GetUll(24));
	      dprintf(mod_cmd_proc, 30, 0, "0x%0.16llx 0x%0.16llx", cdata->GetUll(32), cdata->GetUll(40));
	      dprintf(mod_cmd_proc, 30, 0, "0x%0.16llx 0x%0.16llx", cdata->GetUll(48), cdata->GetUll(56));
	    }
	  }
	  if (rdr_currCmd->setcc) {
	    sjm_regfile->SetCC(miscompare);
	  }
	} else {
	  // Generate a transaction.
	  ttype = T_RDO;
	  if ((cstate == CSTATE_O) && (sjm_cache->Contains(rdr_currCmd->addr))) {
	    // Must issue and OWN and wait for the jpacks to see if we can modify
	    // the line. 
	    ttype = T_OWN;
	  }
	  // Put the transaction into the outstanding read buffer.
	  if ((orb_indx = rdrAddToReadBuff(ttype, rdr_currCmd->size)) < 0) {
	    return 1;
	  }
	  sjm_readbuff->SetModify(orb_indx);
	  if (cmd == CMD_LOCK) {
	    // The line must also be compared, as well as modified.
	    sjm_readbuff->SetCompare(orb_indx);
	  }

	  // Address must be 32-byte aligned.
	  rdr_trans = new Transaction(ttype, rdr_currCmd->addr & 0xffffffffffffffe0, destID, orb_indx, -1, 0);
	  // Check for writeback.
	  if ((cstate == CSTATE_M) || ((ttype != T_OWN) && (cstate == CSTATE_O))) {
	    rdr_trans->atomic = 1;
	    rdr_wbtrans = rdrGenWriteBack();
	  }
	}

      } else if (cmd == CMD_READBLK) {
	if (rdr_first) {
	  dprintf(mod_cmd_proc, 11, 8, "COMMAND: READBLK");
	  dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx", rdr_currCmd->addr);
	  rdrPrintData(rdr_currCmd->data, 16);
	  rdr_first = 0;
	}

	// If there is a read outstanding to the address, stall until the data
	// has been returned.
	if (sjm_readbuff->BlockOn(rdr_currCmd->addr) || sjm_snpctrl->SnoopPending(rdr_currCmd->addr) || rdrWritePending()) {
	  return 1;
	}

	cstate = sjm_cache->GetState(rdr_currCmd->addr);
	if (sjm_cache->Contains(rdr_currCmd->addr) && (cstate != CSTATE_I)) {
	  rdrCheckCache();
	} else {
	  // Generate a transaction.
	  ttype = T_RDD;
	  // Put the transaction into the outstanding read buffer.
	  if ((orb_indx = rdrAddToReadBuff(ttype, rdr_currCmd->size)) < 0) {
	    return 1;
	  }

	  // Address must be 64-byte aligned.
	  rdr_trans = new Transaction(ttype, rdr_currCmd->addr & AD_MASK6, destID, orb_indx, -1, 0);
	  // Don't need to check for writeback, because RDD does not cache the line.
	}

      } else if (cmd == CMD_WRITEBLK) {
	if (rdr_first) {
	  dprintf(mod_cmd_proc, 11, 8, "COMMAND: WRITEBLK");
	  dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx", rdr_currCmd->addr);
	  rdrPrintData(rdr_currCmd->data, 16);
	  rdr_first = 0;
	}
	
	// If there is an outstanding read to the same address, wait for it to
	// complete so we can invalidate the right data.
	if (sjm_readbuff->BlockOn(rdr_currCmd->addr) || sjm_snpctrl->SnoopPending(rdr_currCmd->addr)) {
	  return 1;
	}
	// If we all ready have the line, must issue WRIS.
	cstate = sjm_cache->GetState(rdr_currCmd->addr);
	ttype = T_WRIS;
	if (find_agent_id(rdr_currCmd->addr) == agent_id) {
	  // It's a local write, no data will be sent.
	  ttype = T_INV;
	} else if ((cstate == CSTATE_I) || !sjm_cache->Contains(rdr_currCmd->addr)) {
	  ttype = T_WRI;
	}
	
	// Address must be 64B aligned.
	rdr_trans = new Transaction(ttype, rdr_currCmd->addr & AD_MASK6, destID, 0, -1, 0);
	rdr_trans->data->Copy(rdr_currCmd->data);
	rdr_trans->size = 64;
	rdr_trans->multi = 1;
	
      } else if ((cmd == CMD_READIO) || (cmd == CMD_READMSKIO) || (cmd == CMD_READBLKIO)) {
	if (rdr_first) {
	  if (cmd == CMD_READIO) {
	    dprintf(mod_cmd_proc, 11, 8, "COMMAND: READIO");
	    dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx %d", rdr_currCmd->addr, rdr_currCmd->size);
	  } else if (cmd == CMD_READMSKIO) {
	    dprintf(mod_cmd_proc, 11, 8, "COMMAND: READMSKIO");
	    dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx 0x%0.4x",
		    rdr_currCmd->addr, rdr_currCmd->mask);
	  } else {
	    dprintf(mod_cmd_proc, 11, 8, "COMMAND: READBLKIO");
	    dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx", rdr_currCmd->addr);
	  }
	  rdrPrintData(rdr_currCmd->data, 4);
	  rdr_first = 0;
	}
	
	if (rdrWritePending()) {
	  return 1;
	}
	
	ttype = T_NCRD;
	ull align = -1;
	if (cmd == CMD_READBLKIO) {
	  ttype = T_NCBRD;
	  align = AD_MASK6;
	}
	// Generate a mask.
	if (cmd == CMD_READIO) {
	  // Assumes the address and size are correct.
	  mask = 0x1;
	  for (int i = 1; i < rdr_currCmd->size; i++) {
	    mask <<= 1;
	    mask |= 1;
	  }
	  mask <<= (rdr_currCmd->addr & 0xf);
	} else if (cmd == CMD_READMSKIO) {
	  // Have to reverse the bytes because that's how they should appear on the bus.
	  mask = rdr_currCmd->mask;
	  int tmpmask = 0;
	  for (int i = 0; i < 16; i++, tmpmask <<= 1, mask >>= 1) {
	    tmpmask |= mask & 0x1;
	  }
	  mask = (tmpmask >> 1) & 0xffff;
	}
	
	// Add the command to the outstanding read buffer.
	if ((orb_indx = rdrAddToReadBuff(ttype, rdr_currCmd->size)) < 0) {
	  return 1;
	}
	ReadBuffEntry *entry = sjm_readbuff->Get(orb_indx);
	entry->mask = mask;
	
	// Block transfers are 64B aligned, all others are byte aligned.
	rdr_trans = new Transaction(ttype, rdr_currCmd->addr & align, agent_id, orb_indx, -1, (ull) mask);
	
      } else if ((cmd == CMD_WRITEIO) || (cmd == CMD_WRITEMSKIO) || (cmd == CMD_WRITEBLKIO)) {
	if (cmd == CMD_WRITEIO) {
	  dprintf(mod_cmd_proc, 11, 8, "COMMAND: WRITEIO");
	  dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx %d", rdr_currCmd->addr, rdr_currCmd->size);
	} else if (cmd == CMD_WRITEMSKIO) {
	  dprintf(mod_cmd_proc, 11, 8, "COMMAND: WRITEMSKIO");
	  dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx 0x%0.4x",
		  rdr_currCmd->addr, rdr_currCmd->mask);
	} else {
	  dprintf(mod_cmd_proc, 11, 8, "COMMAND: WRITEBLKIO");
	  dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx", rdr_currCmd->addr);
	}
	rdrPrintData(rdr_currCmd->data, 4);

	ttype = T_NCWR;
	int size = 16;
	ull align = -1;
	if (cmd == CMD_WRITEBLKIO) {
	  ttype = T_NCBWR;
	  size = 64;
	  align = AD_MASK6;
	} else if (rdr_currCmd->reg2 == XTN_COMPRESS) {
	  ttype = T_NCWRC;
	}

	// Generate a mask.
	if (cmd == CMD_WRITEIO) {
	  // Assumes the address and size are correct.
	  mask = 0x1;
	  for (int i = 1; i < rdr_currCmd->size; i++) {
	    mask <<= 1;
	    mask |= 1;
	  }
	  mask <<= (rdr_currCmd->addr & 0xf);
	} else if (cmd == CMD_WRITEMSKIO) {
	  // Have to reverse the bytes because that's how they should appear on the bus.
	  mask = rdr_currCmd->mask;
	  int tmpmask = 0;
	  for (int i = 0; i < 16; i++, tmpmask <<= 1, mask >>= 1) {
	    tmpmask |= mask & 0x1;
	  }
	  mask = (tmpmask >> 1) & 0xffff;
	}

	// Block transfers are 64B aligned, all others are byte aligned.
	rdr_trans = new Transaction(ttype, rdr_currCmd->addr & align, find_agent_id(rdr_currCmd->addr), 0, -1, (ull) mask);
	rdr_trans->data->Copy(rdr_currCmd->data);
	rdr_trans->multi = 1;
	rdr_trans->size = size;

//      }  else if (cmd == CMD_SUBWRITE){ /*Niagara Support*/
//	/*leveraged from WRITEMSKIO code*/
//	dprintf(mod_cmd_proc, 11, 8, "COMMAND: SUBWRITE");
//	dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx 0x%0.4x",
//		rdr_currCmd->addr, rdr_currCmd->mask);
//	
//	rdrPrintData(rdr_currCmd->data, 4);
//
//	//For Niagara Support: this should probably not occur?
//	// If there is an outstanding read to the same address, wait for it to
//	// complete so we can invalidate the right data.
//	if (sjm_readbuff->BlockOn(rdr_currCmd->addr) || sjm_snpctrl->SnoopPending(rdr_currCmd->addr)) {
//	  return 1;
//	}
//
//	ttype = T_CWR;
//	int size = 16;
//	ull align = -1;
//
//	// Have to reverse the bytes because that's how they should appear on the bus.
//	mask = rdr_currCmd->mask;
//	int tmpmask = 0;
//	for (int i = 0; i < 16; i++, tmpmask <<= 1, mask >>= 1) {
//	  tmpmask |= mask & 0x1;
//	}
//	mask = (tmpmask >> 1) & 0xffff;
//	
//
//	// Block transfers are 64B aligned, all others are byte aligned.
//	rdr_trans = new Transaction(ttype, rdr_currCmd->addr & align, find_agent_id(rdr_currCmd->addr), 0, -1,(ull)  mask);
//	rdr_trans->data->Copy(rdr_currCmd->data);
//	rdr_trans->multi = 1;
//	rdr_trans->size = size;
//
      } else if (cmd == CMD_WRITEMSK) { /*Niagara Support*/
	/*leveraged from WRITEBLK code*/
	if (rdr_first) {
	  dprintf(mod_cmd_proc, 11, 8, "COMMAND: WRITEMSK");
	  dprintf(mod_cmd_proc, 11, 8, " 0x%0.11llx 0x%0.16llx",
		  rdr_currCmd->addr, rdr_currCmd->mask);
	  rdrPrintData(rdr_currCmd->data, 16);
	  rdr_first = 0;
       	}
	  
	//dprintf(mod_cmd_proc, 0, 0, "COMMAND: WRITEMSK");
	//dprintf(mod_cmd_proc, 0, 0, " 0x%0.11llx 0x%0.16llx",
	//	rdr_currCmd->addr, rdr_currCmd->mask);

	// If there is an outstanding read to the same address, wait for it to
	// complete so we can invalidate the right data.
	if (sjm_readbuff->BlockOn(rdr_currCmd->addr) || sjm_snpctrl->SnoopPending(rdr_currCmd->addr)) {
	  return 1;
	}
	
	//For Niagara Support: we can assume that this data would never
	//be in a I/O Bridge chip in a valid state. Thus the following 
	//checks are no longer necessary
	/*
	// If we all ready have the line, must issue WRIS.
	cstate = sjm_cache->GetState(rdr_currCmd->addr);
	ttype = T_WRIS;
	if (find_agent_id(rdr_currCmd->addr) == agent_id) {
	// It's a local write, no data will be sent.
	ttype = T_INV;
	} else if ((cstate == CSTATE_I) || !sjm_cache->Contains(rdr_currCmd->addr)) {
	ttype = T_WRI;
	}
	*/
	
	ttype = T_WRM;
	// Have to reverse the bytes because that's how they should appear on the bus.
        unsigned long long wrm_mask = rdr_currCmd->mask;
	unsigned long long tmpmask = 0;
	for (int i = 0; i < 64; i++) {
	  tmpmask <<= 1;
	  tmpmask |= wrm_mask & 0x1;
	  wrm_mask >>= 1;
	}
	wrm_mask = tmpmask;
	//rdr_currCmd->mask = wrm_mask; // Bug4498: Writing reversed bits back cause flip back next loop iteration

	// Address must be 64B aligned.
	rdr_trans = new Transaction(ttype, rdr_currCmd->addr & AD_MASK6, destID, 0, -1, wrm_mask);
	rdr_trans->data->Copy(rdr_currCmd->data);
	rdr_trans->size = 64;
	rdr_trans->multi = 1;
	
      } else if (cmd == CMD_XIR) {
	dprintf(mod_cmd_proc, 11, 0, "COMMAND: XIR");
	rdr_trans = new Transaction(T_XIR, 0, agent_id, 0, -1, 0);

      } else if (cmd == CMD_BUSERROR) {
	rdr_trans = new Transaction(rdr_currCmd->waitID, rdr_currCmd->addr & AD_MASK6, (rdr_currCmd->reg1 >> 2) & 0xf, rdr_currCmd->reg1 & 0x3, -1 , rdr_currCmd->mask);
	rdr_trans->raw = 1;
	rdr_trans->destID = rdr_currCmd->reg1;
	rdr_trans->atomic = rdr_currCmd->reg2;
      } else {
	// The parser understands a command that the reader does not. This is
	// a code error.
	dprintf(mod_cmd_proc, 49, 0, "CODE ERROR: unimplemented command 0x%x", cmd);
      }
    }
  }
  if (rdr_trans) {
    if (sjm_outq->Full() || (rdr_trans->atomic && (sjm_outq->SpaceLeft() < 2))) {
      dprintf(mod_cmd_proc, 21, 0, "Output queue is full.");
      return 0;
    }
    sjm_outq->Push(rdr_trans);
    rdr_trans = NULL;

    if (rdr_wbtrans) {
      sjm_outq->Push(rdr_wbtrans);
      if (!sjm_wrbq->Push(rdr_wbtrans)) {
	dprintf(mod_cmd_proc, 49, 0, "CODE ERROR: wrbq overflow.");
      }
      rdr_wbtrans = NULL;
    }
  }

  // If we succeed in getting to this point, we're ready to get the next command.
  rdrNextCmd();
  return 1;
}


//------------------------------------------------------------------------------
// Fetch the next command.
int SJM::rdrNextCmd()
{
  if (sjm_type == SJMTYPE_CMD) {
    rdr_currCmd = sjm_parser->GetNextCmd();
  } else if (sjm_type == SJMTYPE_EXE) {
    if (rdr_currCmd) {
      delete rdr_currCmd;
    }
    rdr_currCmd = NULL;

    PLI_API_CmdPacket cmd_packet;
    PLI_API_RspPacket rsp_packet;
    int len;
    int status = API_STAT_OK;
    Command *exeCmd = NULL;
    int fetch_next = TRUE;

    while (fetch_next) {
      len = sizeof(PLI_API_CmdPacket);
      for (int stat = 0; stat != len;) {
	// Check that the child process hasn't died.
	if (sigsend(P_PID, sjm_pid, 0) < 0) {
	  dprintf(modname, 49, 4, "The child process has died.");
	  fetch_next = 0;
	  break;
	}

	stat = read(sjm_in_pipe, (void *) &cmd_packet, len);
	if ((stat != 0) && (stat != len)) {
	  dprintf(modname, 49, 4, "Failed to read command from the input pipe.");
	  return 0;
	}
      }
      if (!fetch_next) {
	break;
      }

      // Set up a tokenizer.
      StringTokenizer *cmdtok = new StringTokenizer(cmd_packet.params, ":");
      char *str, *strptr;
      int ival;

      if (!sjm_configured) {
	// PRINT and ERROR are allowed before CONFIG is called.
	if (cmd_packet.cmd == API_PRINT) {
	  dprintf(mod_display, 0, 0, "%s", cmd_packet.params);
	} else if (cmd_packet.cmd == API_ERROR) {
	  dprintf(mod_display, 49, 0, "%s", cmd_packet.params);
	} else if (cmd_packet.cmd != API_CONFIG) {
	  // Expect the first command to be CONFIG.
	  return 0;
	} else {
	  // First token is the agent id.
	  agent_id = atoi(cmdtok->GetToken(":="));
	  // Handle the rest of the parameters.
	  sjm_parser->ParseMisc(CMD_CONFIG, cmdtok);
	  sjm_configured = 1;
	  fetch_next = FALSE;
	}
      } else {

	if (cmd_packet.cmd == API_ADDRESS) {
	  sjm_parser->ParseAddress(CMD_ADDRESS);
	} else if (cmd_packet.cmd == API_IOADDRESS) {
	  sjm_parser->ParseAddress(CMD_IOADDRESS);
	} else if (cmd_packet.cmd == API_CADDRESS) {
	  sjm_parser->ParseAddress(CMD_CADDRESS);

	} else if (cmd_packet.cmd == API_CHECKDONE) {
	  rsp_packet.data[0] = FALSE;
	  if (PLIModulesDone()) {
	    rsp_packet.data[0] = TRUE;
	  }

	} else if (cmd_packet.cmd == API_SSPINFO) {
	  int port_ids[G_MAX_MASTERS];
	  int agent_ids[G_MAX_MASTERS];
	  char **testnames = new char *[G_MAX_MASTERS];
	  for (int i = 0; i < G_MAX_MASTERS; i++) {
	    testnames[i] = new char[1024];
	  }
	  int numdev = get_device_info(port_ids, agent_ids, testnames);
	  len = sizeof(rsp_packet);
	  rsp_packet.status = API_STAT_DEVICEINFO;
	  for (int j = 0; j < numdev; j++) {
	    rsp_packet.data[0] = numdev;
	    rsp_packet.data[1] = j;
	    rsp_packet.data[2] = port_ids[j];
	    rsp_packet.data[3] = agent_ids[j];
	    rsp_packet.data[4] = -1;
	    strcpy(rsp_packet.info, testnames[j]);
	    if (write(sjm_out_pipe, (void *) &rsp_packet, len) != len) {
	      dprintf(modname, 49, 4, "Failed to write response to the input pipe.");
	      return 0;
	    }
	  }
	  delete[] testnames;



	} else {
	  // These all generate a command.
	  exeCmd = new Command();
	  if (cmd_packet.cmd == API_WRITE) {
	    exeCmd->cmd = CMD_WRITE;
	    // Size and data are required.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, P_SIZE_R);
	  } else if (cmd_packet.cmd == API_READ) {
	    exeCmd->cmd = CMD_READ;
	    // Size and data are optional.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, P_SIZE_O);
	  } else if (cmd_packet.cmd == API_IFETCH) {
	    exeCmd->cmd = CMD_IFETCH;
	    // Size and data are optional.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, P_SIZE_O);
	  } else if (cmd_packet.cmd == API_OWN) {
	    exeCmd->cmd = CMD_OWN;
	    // Size and data are optional.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, P_SIZE_O);
	  } else if (cmd_packet.cmd == API_READIO) {
	    exeCmd->cmd = CMD_READIO;
	    // Size and data are optional.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, P_SIZE_O);
	  } else if (cmd_packet.cmd == API_WRITEIO) {
	    exeCmd->cmd = CMD_WRITEIO;
	    // Size and data are required.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, P_SIZE_R);
	  } else if (cmd_packet.cmd == API_READBLK) {
	    exeCmd->cmd = CMD_READBLK;
	    // Data is optional.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, 0);
	  } else if (cmd_packet.cmd == API_WRITEBLK) {
	    exeCmd->cmd = CMD_WRITEBLK;
	    // Data is required.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, P_DATA_R);
	  } else if (cmd_packet.cmd == CMD_READBLKIO) {
	    exeCmd->cmd = CMD_READBLKIO;
	    // Data is optional.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, 0);
	  } else if (cmd_packet.cmd == API_WRITEBLKIO) {
	    exeCmd->cmd = CMD_WRITEBLKIO;
	    // Data is required.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, P_DATA_R);
	  } else if (cmd_packet.cmd == API_INT) {
	    exeCmd->cmd = CMD_INT;
	    // Data is required.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x3f, P_DATA_R);
	  } else if (cmd_packet.cmd == API_READMSKIO) {
	    exeCmd->cmd = CMD_READMSKIO;
	    // Mask is required, data is optional.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x30, P_MASK_R);
	  } else if (cmd_packet.cmd == API_WRITEMSKIO) {
	    exeCmd->cmd = CMD_WRITEMSKIO;
	    // Mask and data are required.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x30, P_MASK_R | P_DATA_R);
//	  } else if (cmd_packet.cmd == API_SUBWRITE) { /*Niagara support*/
//	    exeCmd->cmd = CMD_SUBWRITE;
//	    // Mask and data are required.
//	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x30, P_MASK_R | P_DATA_R);
	  } else if (cmd_packet.cmd == API_WRITEMSK) { /*Niagara support*/
	    exeCmd->cmd = CMD_WRITEMSK;
	    // Mask and data are required.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0x30, P_MASK_R | P_DATA_R);
	  } else if (cmd_packet.cmd == API_READINT) {
	    exeCmd->cmd = CMD_READINT;
	    // Address is invalid, data is required.
	    sjm_parser->ParseReadWrite(exeCmd, cmdtok, 0, P_ADDR_N | P_DATA_R);
	  } else if (cmd_packet.cmd == API_WAIT) {
	    exeCmd->cmd = CMD_WAIT;
	    exeCmd->cycles = atoi(cmd_packet.params);
	  } else if (cmd_packet.cmd == API_PRINT) {
	    exeCmd->cmd = CMD_PRINT;
	    exeCmd->AddMessage(cmd_packet.params);
	  } else if (cmd_packet.cmd == API_IOSYNC) {
	    exeCmd->cmd = CMD_IOSYNC;
	  } else if (cmd_packet.cmd == API_ERROR) {
	    exeCmd->cmd = CMD_ERROR;
	    exeCmd->AddMessage(cmd_packet.params);
	  } else if (cmd_packet.cmd == API_TIMEOUT) {
	    exeCmd->cmd = CMD_TIMEOUT;
	    exeCmd->reg1 = atoi(cmdtok->GetToken());
	    exeCmd->cycles = atoi(cmdtok->GetToken());
	  } else if (cmd_packet.cmd == API_DONE) {
	    exeCmd->cmd = CMD_DONE;
	  } else if (cmd_packet.cmd == API_ECCERROR) {
	    exeCmd->cmd = CMD_ECCERROR;
	    exeCmd->AddAddress(cmdtok->GetToken());
	    strptr = cmdtok->GetToken();
	    if (!strcmp(strptr, "correct")) {
	      exeCmd->reg2 = ECC_CORRECT;
	    } else if (!strcmp(strptr, "uncorrect")) {
	      exeCmd->reg2 = ECC_UNCORRECT;
	    } else if (!strcmp(strptr, "both")) {
	      exeCmd->reg2 = ECC_CORRECT | ECC_UNCORRECT;
	    }
	    exeCmd->SetOnOff(cmdtok->GetToken());
	    strptr = cmdtok->GetToken();
	    exeCmd->mask = 0;
	    if (strptr){
	      if (!strcmp(strptr, "norand"))
		exeCmd->mask = 1;
	    }
	    strptr = cmdtok->GetToken();
	    exeCmd->dvalid = -1;
	    if (strptr){
	      if (!strcmp(strptr, "jid"))
		strptr = cmdtok->GetToken();
		if (strptr[0] == '<'){
		  exeCmd->dvalid = atoi(strptr+1) & ECC_JID_MASK;
		  exeCmd->dvalid = exeCmd->dvalid | ECC_JID_TYPE_BIT;
		}else
		  exeCmd->dvalid = atoi(strptr) & ECC_JID_MASK;
	    }
	  } else {
	    dprintf(mod_cmd_proc, 0, 0, "Unrecognized command, 0x%x.", cmd_packet.cmd);
	    status = API_STAT_ERR;
	  }
	  fetch_next = FALSE;
	  rdr_currCmd = exeCmd;
	}
      }
      delete cmdtok;

      // Send a response.
      rsp_packet.status = status;
      len = sizeof(rsp_packet);
      if (write(sjm_out_pipe, (void *) &rsp_packet, len) != len) {
	dprintf(modname, 49, 4, "Failed to write response to the input pipe.");
	return 0;
      }
    }
  }
  rdr_timeout_cnt = 0;
  rdr_first = 1;
  return 1;
}


//------------------------------------------------------------------------------
// Check that the data is in the cache, and, if necessary, that the cached
// data matches the expected data.
void SJM::rdrCheckCache()
{
  ByteString *cdata = sjm_cache->ReadLine(rdr_currCmd->addr);
  if (!rdr_currCmd->setcc && rdr_currCmd->dvalid) {
    // Compare the cached data to the data in the command.
    if (!cdata->Compare(rdr_currCmd->addr & 0x3f, rdr_currCmd->size, rdr_currCmd->data)) {
      dprintf(mod_cmd_proc, 49, 8, "Expected read data for address 0x%llx does not match what was found in the cache.\n\texpected:\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\tcached:\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n\t0x%0.16llx 0x%0.16llx\n", rdr_currCmd->addr,
	      rdr_currCmd->data->GetUll(0), rdr_currCmd->data->GetUll(8),
	      rdr_currCmd->data->GetUll(16), rdr_currCmd->data->GetUll(24),
	      rdr_currCmd->data->GetUll(32), rdr_currCmd->data->GetUll(40),
	      rdr_currCmd->data->GetUll(48), rdr_currCmd->data->GetUll(56),
	      cdata->GetUll(0), cdata->GetUll(8), cdata->GetUll(16), cdata->GetUll(24),
	      cdata->GetUll(32), cdata->GetUll(40),cdata->GetUll(48), cdata->GetUll(56));
    }
  }
  dprintf(mod_cmd_proc, 30, 0, "Data for read to address 0x%llx found in the cache.", rdr_currCmd->addr);
  dprintf(mod_cmd_proc, 30, 0, "0x%0.16llx 0x%0.16llx", cdata->GetUll(0), cdata->GetUll(8));
  dprintf(mod_cmd_proc, 30, 0, "0x%0.16llx 0x%0.16llx", cdata->GetUll(16), cdata->GetUll(24));
  dprintf(mod_cmd_proc, 30, 0, "0x%0.16llx 0x%0.16llx", cdata->GetUll(32), cdata->GetUll(40));
  dprintf(mod_cmd_proc, 30, 0, "0x%0.16llx 0x%0.16llx", cdata->GetUll(48), cdata->GetUll(56));

  if (rdr_currCmd->reg1 > -1) {
    sjm_regfile->Set(rdr_currCmd->reg1, cdata, rdr_currCmd->addr & 0x3f, rdr_currCmd->size, 0);
  }
  if (rdr_currCmd->setcc) {
    if (rdr_currCmd->dvalid) {
      sjm_regfile->SetCC(cdata, rdr_currCmd->data, rdr_currCmd->addr & 0x3f, rdr_currCmd->size);
    } else {
      sjm_regfile->SetCC(cdata, rdr_currCmd->addr & 0x3f, rdr_currCmd->size);
    }
  }
}


//------------------------------------------------------------------------------
// Add an entry to the readbuffer.
int SJM::rdrAddToReadBuff(int ttype, int size)
{
  if (sjm_readbuff->Full()) {
    dprintf(mod_cmd_proc, 21, 0, "Outstanding read buffer is full, won't generate transaction.");
    return -1;
  }

  int orb_indx = sjm_readbuff->Add(ttype, rdr_currCmd->addr, size, -1, rdr_currCmd->reg1, rdr_currCmd->setcc);
  if (rdr_currCmd->dvalid) {
    sjm_readbuff->AddData(orb_indx, rdr_currCmd->data);
  }
  // Look up the address in the read error list, to see if we should
  // expect a read error packet.
  int *which = (int *) sjm_read_error_list->KVFind(rdr_currCmd->addr & AD_MASK6);
  if ((which) && (*which)) {
    sjm_readbuff->ExpectErrorPkt(orb_indx, *which);
  }
  return orb_indx;
}


//------------------------------------------------------------------------------
// Generate a writeback transaction.
Transaction *SJM::rdrGenWriteBack()
{
  ull wbaddr = sjm_cache->GetAddress(rdr_currCmd->addr);
  Transaction *trans = new Transaction(T_WRB, wbaddr, find_agent_id(wbaddr), 0, -1, 0);
  trans->atomic = 1;
  trans->multi = 1;
  trans->size = 64;
  trans->data->Copy(sjm_cache->ReadLine(wbaddr));
  dprintf(mod_cmd_proc, 11, 8, "WRITEBACK: 0x%0.11llx", wbaddr);
  rdrPrintData(trans->data, 16);
  // Transition the cache line.
  if (sjm_cache->GetState(rdr_currCmd->addr) == CSTATE_M) {
    if (!sjm_cache->ChangeState(rdr_currCmd->addr, CSTATE_O)) {
      dprintf(mod_cmd_proc, 49, 0, "Couldn't transition 0x%llx to state %c.", rdr_currCmd->addr, Cache::GetStateString(CSTATE_O));
    }
  }
  return trans;
}


//------------------------------------------------------------------------------
// Check for pending write to the address of the current command.
int SJM::rdrAnyWritePending(void)
{
  int ttype;
  Enumeration<Transaction> *en = (Enumeration<Transaction> *) sjm_outq->Elements();
  for (Transaction *t = (Transaction *) en->NextElement(); t && en->HasMoreElements(); t = (Transaction *) en->NextElement()) {
    if (t->type == T_RDO || t->type == T_OWN || get_trans_type(t->type) == TYPE_WRITE)
      return 1;
  }
  delete en;
  return 0;
}
//------------------------------------------------------------------------------
// Check for pending write to the address of the current command.
int SJM::rdrWritePending()
{
  int ttype;
  Enumeration<Transaction> *en = (Enumeration<Transaction> *) sjm_outq->Elements();
  for (Transaction *t = (Transaction *) en->NextElement(); t && en->HasMoreElements(); t = (Transaction *) en->NextElement()) {
    ttype = get_trans_type(t->type);
    if ((ttype == TYPE_WRITE) || (ttype == TYPE_NCWRITE)) {
      // Check that the read is anywhere in the same cacheline as the write.
      if ((t->addr & AD_MASK6) == (rdr_currCmd->addr & AD_MASK6)) {
	return 1;
      }
    }
  }
  delete en;
  return 0;
}


//------------------------------------------------------------------------------
// Print the data of a command.
void SJM::rdrPrintData(ByteString *bstr, int n)
{
  for (int i = 0; i < n; i++) {
    dprintf(mod_cmd_proc, 11, 8, " 0x%0.8x", bstr->GetInt(i * 4));
  }
  dprintf(mod_cmd_proc, 11, 8, "\n");
}


//------------------------------------------------------------------------------
// Process the output queues. This method maintains a state so that it can
// keep track of multi-cycle transactions. Initial state is IDLE: in that
// state, this method can execute a data cycle or the first cycle of a read
// data return. The only states it can transition to from IDLE are write
// data cycle (CYC_DATA64) or read data return cycle (CYC_RET64).
void SJM::sjmProcessOutSigs()
{
  // Clear the output variables, so that we always drive something.
  next_ad[0] = 0;
  next_ad[1] = 0;
  next_advalid = 0;
  next_adp = -1;
  next_adtype = -1;

  if (port_id == BUS_MASTER) {
    next_change = '1';
//     next_rst = '1';
//     next_por = '1';
  } else {
    next_change = 'z';
    next_rst = 'z';
    next_por = 'z';
  }

  Transaction *wbtrans = NULL;
  int gen_bad_parity = 0;
  static int bad, flip_data;
  if ((out_state == CYC_IDLE) && (sjm_state != SJM_CHANGE)) {
    // Don't get new transactions while in CHANGE sequence.
    out_bad_parity_cycle = 0;

    // Try two times, to give each queue a chance.
    for (int i = 0; i < 2; i++) {
      out_trans = out_curr_q->Next();
      if (out_trans) {
	int transtype = get_trans_type(out_trans->type);
	if (out_trans->atomic && (transtype == TYPE_READ)) {
	  // Need to look at two transactions.
	  wbtrans = sjm_wrbq->Next();
	} else {
	  // Make sure variable is valid.
	  wbtrans = new Transaction();
	}

	// Check the flow control. There must be room at the recipient for up to
	// two addresses and four cycles of data (read + writeback). However, if
	// we're working the WRB, bypass checking.
	if ((transtype != TYPE_INTERRUPT) && (transtype != TYPE_DATARET) &&
	    ((!out_trans->atomic &&  !out_trans->raw &&
	      (!sjm_snpctrl->AOK() || (!sjm_snpctrl->DOK(find_port_id(out_trans->destID)) &&
				       ((transtype == TYPE_WRITE) ||
					(transtype == TYPE_NCWRITE))))) ||
	     (out_trans->atomic && (transtype == TYPE_READ) &&
	      (!sjm_snpctrl->AOK() || !sjm_snpctrl->DOK(find_port_id(wbtrans->destID)))))) {
	  // AOK/DOK is off.
	  if (!sjm_snpctrl->AOK()) {
	    dprintf(mod_out_fsm, 21, 0, "AOK is off, not generating transaction.");
	  } else {
	    dprintf(mod_out_fsm, 21, 0, "DOK for agent %d is off, not generating transaction.", out_trans->destID);
	  }
	  if (sjm_rdq->Empty()) {
	    // No need to try the other queue.
	    sjm_arb->ReleaseBus();
	    break;
	  } else {
	    // Switch queues and try again.
	    outSwitchQueues();
	  }
	} else if (sjm_arb->HasGrant() && (sjm_arb->GetReqOut() || !(out_trans->multi || out_trans->atomic))) {
      
	  dprintf(mod_out_fsm, 21, 0, "QDEBUG: HasGrant=%d ReqOut=%d multi=%d Atom=%d", 
		  sjm_arb->HasGrant(), sjm_arb->GetReqOut(), out_trans->multi,
		  out_trans->atomic);

	  out_state = CYC_ADDR;
	  // Pop the transaction and switch queues before proceeding.
	  out_trans = out_curr_q->Pop();
	  if (!out_trans->atomic) {
	    outSwitchQueues();
	  }
	  break;
	} else {
	  // Atomic and multi-cycle transactions must first request the bus.
	  sjm_arb->RequestBus(out_trans->multi);
	  break;
	}
	// Clean up.
	if (!out_trans->atomic) {
	  delete wbtrans;
	}
	wbtrans = NULL;
      } else {
	// Switch queues and try again.
	outSwitchQueues();
      }
    } //for loop
  } //if (out_state == CYC_IDLE)

  out_prev = out_state;

  // Prepare an idle packet just in case we need to drive one.
  if (sjm_arb->HasGrant()) {
    next_adtype = 0xff;
    next_ad[0] = -1;
    next_ad[1] = -1;
    next_advalid = 1;
  }

  if (out_state == CYC_ADDR) {
    // Check if we want to generate bad parity.
    // First check if ALL is set for the transaction type.
    int *bad_tr = new int(0x100);
    if (sjm_bad_parity_trans->Find(bad_tr)) {
      gen_bad_parity = 1;
      if (out_trans->multi) {
	out_bad_parity_cycle = getBit4Pattern();
      }
    }
    // Try the transaction.
    *bad_tr = out_trans->type;
    if (sjm_bad_parity_trans->Find(bad_tr)) {
      gen_bad_parity = 1;
    }
    delete bad_tr;
    // Try the address.
    ull *bad_ad = new ull(out_trans->addr & AD_MASK6);
    if (sjm_bad_parity_addrs->Find(bad_ad)) {
      if (out_trans->multi) {
	out_bad_parity_cycle = getBit4Pattern();
      } else {
	gen_bad_parity = 1;
      }
    }
    delete bad_ad;

    int transtype = get_trans_type(out_trans->type);

    if (out_trans->type == J_READERR) {
      // Sending a read error packet.
      dprintf(mod_out_fsm, 0, 0, "Executing READERR: agent=0x%x orb=%d errtype=%d.", out_trans->destID, out_trans->orb_indx, out_trans->state);

      next_adtype = C_ERR << 6;
      next_adtype |= out_trans->destID << 2;
      next_adtype |= out_trans->orb_indx;

      next_advalid = 1;
      next_ad[1] = out_trans->state;
      next_ad[0] = next_ad[1];


      if (outHoldForNextTrans()) {
	sjm_arb->RequestToHoldBus();
      } else {
	sjm_arb->ReleaseBus();
      }
      delete out_trans;
      out_trans = NULL;
      out_state = CYC_IDLE;

    } else if (transtype == TYPE_DATARET) {
      // Sending a read data return packet.
      dprintf(mod_out_fsm, 0, 0, "Executing READ DATA RETURN: agent=0x%x orb=%d.", out_trans->destID, out_trans->orb_indx);

      // Set the ECC bits.
      int *which = (int *) sjm_bad_ecc_list->KVFind(out_trans->addr & AD_MASK6);
      int w;
      if (which) {
	int bad = getBit4Pattern();
	dprintf(mod_out_fsm, 22, 0, "Setting ecc bits to 0x%0.1x", bad);
	for (int i = 0; i < 4; i++, bad >>= 1) {
	  if (bad & 0x1) {
	    w = *which;
	    if (*which == (ECC_CORRECT | ECC_UNCORRECT)) {
	      w = ((float) rand() / RAND_MAX) < 0.5 ? ECC_CORRECT : ECC_UNCORRECT;
	    }
	    out_trans->ecc[i] = w;
	  }
	}
      }
      // Set the ECC bits.
      for (int i = 0; i < 4; i++){
	which = (int *) sjm_bad_ecc_list_norand->KVFind((out_trans->addr & AD_MASK6)  | (((out_trans->addr & 0x20) | (i << 4)) & 0x30));
	if (which){
	  int *dst = (int *) sjm_bad_ecc_list_norand_dest->KVFind((out_trans->addr & AD_MASK6)  | (((out_trans->addr & 0x20) | (i << 4)) & 0x30));
	  dprintf(mod_out_fsm, 23, 0, "ecc error to be set for addr 0llx, jid check = %d, dest %d\n", *dst, out_trans->destID);
	  flip_data = *dst != -1;
	  /*flip data and signal an ecc error if src id of read return matches exactly jid in ecc command,
	    OR if < sign was specified and src id in range 0..jid-1 */
	  if (*dst == -1 ||
	    (out_trans->destID == (*dst & ECC_JID_MASK) && !(*dst & ECC_JID_TYPE_BIT)) ||
	    (out_trans->destID < (*dst & ECC_JID_MASK) && (*dst & ECC_JID_TYPE_BIT)))
	    out_trans->ecc[i] = *which;
	}
      }
      // Flip bits.
      //!!! it'd be more efficient to store which bytes actually need flipping.
      ByteString *bstr = (ByteString *) sjm_flipbits_list->KVFind(out_trans->addr & AD_MASK6);
      if (bstr) {
	dprintf(mod_out_fsm, 23, 0, "Flipping bits with pattern:");
	dprintf(mod_out_fsm, 23, 0, "0x%0.16llx 0x%01.6llx",
		bstr->GetUll(0), bstr->GetUll(8));
	dprintf(mod_out_fsm, 23, 0, "0x%0.16llx 0x%01.6llx",
		bstr->GetUll(16), bstr->GetUll(24));
	dprintf(mod_out_fsm, 23, 0, "0x%0.16llx 0x%01.6llx",
		bstr->GetUll(32), bstr->GetUll(40));
	dprintf(mod_out_fsm, 23, 0, "0x%0.16llx 0x%01.6llx",
		bstr->GetUll(48), bstr->GetUll(56));
	char *b;
	for (int i = 0; i < 64; i++) {
	  b = out_trans->data->GetByte(i);
	  out_trans->data->AddByte(i, *b ^ *bstr->GetByte(i));
	}
      }

      next_adtype = 0;
      if (out_trans->type == J_DATARET16) {
	out_ordercnt = (out_trans->addr & 0x30) >> 4;
	next_adtype |= C_RET16 << 6;
      } else {
	out_ordercnt = (out_trans->addr & 0x20) >> 4;
	next_adtype |= C_RET64 << 6;
      }
      next_adtype |= (out_trans->destID << 2);
      next_adtype |= out_trans->orb_indx;

      next_ad[0] = out_trans->data->GetUll(out_ordercnt * 16);
      next_ad[1] = out_trans->data->GetUll((out_ordercnt * 16) + 8);
      if (out_trans->ecc[out_ordercnt] && flip_data){
	//flip data for random ECC
	next_ad[0] = ~next_ad[0];
	next_ad[1] = ~next_ad[1];
	dprintf(mod_out_fsm, 11, 0, "0x%0.16llx 0x%0.16llx flipped", next_ad[0], next_ad[1]);
      }else
	dprintf(mod_out_fsm, 11, 0, "0x%0.16llx 0x%0.16llx", next_ad[0], next_ad[1]);

      next_advalid = 1;


      if (out_trans->type == J_DATARET64) {
	// Check if we should generate bad parity.
	if (out_bad_parity_cycle & 0x1) {
	  gen_bad_parity = 1;
	}
	out_bad_parity_cycle >>= 1;
	out_cyclecnt = 0;
	out_state = CYC_RET64;
      } else {
	// Check if we should generate bad parity.
	if (out_bad_parity_cycle) {
	  gen_bad_parity = 1;
	}
	// Hold the bus for back-to-back transactions.
	if (outHoldForNextTrans()) {
	  sjm_arb->RequestToHoldBus();
	} else {
	  sjm_arb->ReleaseBus();
	}
	delete out_trans;
	out_trans = NULL;
	out_state = CYC_IDLE;
      }
    } else if (transtype == TYPE_INTERRUPT && !out_trans->raw) {
      // Sending an interrupt packet.
      dprintf(mod_out_fsm, 0, 0, "Executing %s: agent=%d.", get_trans_string(out_trans->type), out_trans->destID);

      next_adtype = 0;
      next_adtype |= C_ADDR << 6;
      next_adtype |= agent_id << 2;

      next_advalid = 1;
      next_ad[1] = 0;
      next_ad[1] |= ((ull) out_trans->type) << 43;
      next_ad[1] |= ((ull) out_trans->destID) << 36;
      next_ad[1] |= ((ull) agent_id) << 31;
      next_ad[0] = next_ad[1];
      // The address is not sent (just the destination id).

      if (out_trans->type == T_INT) {
	out_cyclecnt = 0;
	out_state = CYC_DATA64;
      } else {
	if (outHoldForNextTrans()) {
	  sjm_arb->RequestToHoldBus();
	} else {
	  sjm_arb->ReleaseBus();
	}
	delete out_trans;
	out_trans = NULL;
	out_state = CYC_IDLE;
      }

    } else {
      dprintf(mod_out_fsm, 0, 0, "Executing %s: address=0x%0.11llx agent=0x%x orb=%d mask=0x%0.16llx", get_trans_string(out_trans->type), out_trans->addr, out_trans->destID, out_trans->orb_indx, out_trans->mask);  //Niagara support
      if (out_trans->type == T_WRB){
	if (sjm_snpctrl->SnoopPending(out_trans->addr, 1)){
	  out_trans->type = T_WRBC;
	  dprintf(mod_out_fsm, 0, 0, "Cancelling WRB because it hits on an invalidating snoop q entry");
	}
      }
      if (out_trans->raw)
	next_adtype = out_trans->destID;
      else{
	next_adtype = 0;
	next_adtype |= C_ADDR << 6;
	// ID of the sender is in bits [5:2].
	next_adtype |= agent_id << 2;
	// Readbuffer index is in bits [1:0].
	next_adtype |= out_trans->orb_indx;
      }

	next_advalid = 1;

	/*for Niagara Support: put mask in upper 64 bits of ad bus*/
	if(out_trans->type == T_WRM){
	  //next_ad[1] = ((ull) out_trans->mask) << 64;
	  next_ad[1]  = ((ull) out_trans->type) << 43;
	  next_ad[1] |= out_trans->addr & 0x7ffffffffff;
	  next_ad[0] =(ull) out_trans->mask;
	  //dprintf(mod_out_fsm, 0, 0, "DEBUG(WRM-MASK): %0.16llx\n", out_trans->mask);
	  //dprintf(mod_out_fsm, 0, 0, "DEBUG(WRM): %0.16llx%0.16llx\n", next_ad[0], next_ad[1]);

	}else{
	  next_ad[1] = ((ull) out_trans->mask) << 48;
	  next_ad[1] |= ((ull) out_trans->type) << 43;
	  next_ad[1] |= out_trans->addr & 0x7ffffffffff;
	  next_ad[0] = next_ad[1];
	}
      // Signal that the read is on the bus.
      if ((transtype == TYPE_READ) || (transtype == TYPE_NCREAD)) {
	sjm_readbuff->SetOnBus(out_trans->orb_indx);
      }
      // Remove the WRB from the wrbq.
      if ((out_trans->type == T_WRB) || (out_trans->type == T_WRBC)) {
//      if ((out_trans->type == T_WRB) && (sjm_cache->GetState(out_trans->addr) == CSTATE_O)) {
//        // Writebacks need to invalidate the cache.
//        if (!sjm_cache->ChangeState(out_trans->addr, CSTATE_I)) {
//          dprintf(modname, 49, 0, "Couldn't transition 0x%llx to state %c.", out_trans->addr, Cache::GetStateString(CSTATE_I));
//        }
//      }
	wbtrans = sjm_wrbq->Pop();
	if (wbtrans != out_trans) {
	  dprintf("sjm_wrb_err", 49, 0, "CODE ERROR: wrbq entry doesn't match outq entry.");
	}
      }
      // Write the INV data to memory.
      if (out_trans->type == T_INV) {
	// Queue a memory transaction.
	sjm_memctrl->AddRequest(out_trans->addr,  64, agent_id, 0, 0);
	ByteString *bstr;
	for (int i = 0; i < 4; i++) {
	  bstr = new ByteString(16);
	  bstr->Copy(0, i * 16, 16, out_trans->data);
	  sjm_memctrl->AddData(bstr);
	}
	// Queue a snoop.
	sjm_snpctrl->NewSnoop(out_trans->addr, agent_id, -1, T_WRI, 1, 1, 0);   
	if (idle_after_inv)
	  /* Fool state machine into thinking INV has a data cycle after it, as
	   we need to have an idle cycles after INV to match JP */
	  out_trans->size = 16;
	else
	  out_trans->size = 1;
      }

      if (out_trans->size == 16) {
	if (outHoldForNextTrans()) {
	  sjm_arb->RequestToHoldBus();
	} else {
	  sjm_arb->ReleaseBus();
	}
	out_state = CYC_DATA16;
      } else if (out_trans->size == 64) {
	int bad1;

	out_cyclecnt = 0;
	out_state = CYC_DATA64;
	bad = 0;
	int *which = (int *) sjm_bad_ecc_list->KVFind(out_trans->addr & AD_MASK6);
	if (which)
	  bad = getBit4Pattern() & 0xf;

	bad1 = 0;
	// Set the ECC bits.
	for (int i = 0; i < 4; i++){
	  which = (int *) sjm_bad_ecc_list_norand->KVFind((out_trans->addr & AD_MASK6)  | (i << 4));
	  if (which){
	    int *dst1 = (int *) sjm_bad_ecc_list_norand_dest->KVFind((out_trans->addr & AD_MASK6)  | (i << 4));
	    dprintf(mod_out_fsm, 23, 0, "ecc error to be set for addr 0llx, jid check = %d, dest %d\n", out_trans->addr, *dst1, out_trans->destID);
	    flip_data = *dst1 != -1;
	    bad1 = bad1 | 0x10;
	  }
	  bad1 = bad1 >> 1;
	}
	//or bad ecc flags from rand and no rand results
	bad = bad | bad1;

      } else if (out_trans->type == T_CHANGE) {
	// change is active low.
	next_change = '0';
	sjm_arb->HoldBus();
	out_cyclecnt = -1;
	delete out_trans;
	out_trans = NULL;
	out_state = CYC_CHANGE;
      } else {
	if (!out_trans->atomic) {
	  if (outHoldForNextTrans()) {
	    sjm_arb->RequestToHoldBus();
	  } else {
	    sjm_arb->ReleaseBus();
	  }
	}
	delete out_trans;
	out_trans = NULL;
	out_state = CYC_IDLE;
      }
    }

  } else if (out_state == CYC_DATA16) {
    dprintf(mod_out_fsm, 11, 0, "Sending 16B write data.");

    // Check if we should drive bad parity.
    if (out_bad_parity_cycle) {
      gen_bad_parity = 1;
    }

    if (out_trans->type == T_INV) {
      /* Force an IDLE cycle after INV */
      next_adtype = 0xff;
      next_ad[0] = -1;
      next_ad[1] = -1;
    } else {
      next_adtype = 0;

      out_ordercnt = (out_trans->addr & 0x30) >> 4;
      next_ad[0] = out_trans->data->GetUll(out_ordercnt * 16);
      next_ad[1] = out_trans->data->GetUll((out_ordercnt * 16) + 8);
    }
    next_advalid = 1;

    dprintf(mod_out_fsm, 12, 0, "0x%0.16llx 0x%0.16llx", next_ad[0], next_ad[1]);

    out_state = CYC_IDLE;
    delete out_trans;
    out_trans = NULL;
  } else if (out_state == CYC_DATA64) { 
    dprintf(mod_out_fsm, 11, 0, "Sending 64B write data.");

    // Check if we should generate bad parity.
    if (out_bad_parity_cycle & 0x1) {
      gen_bad_parity = 1;
    }
    out_bad_parity_cycle >>= 1;

    if (bad & 1)
      //ecc error
      next_adtype = 0x10;
    else
      next_adtype = 0;
    bad = bad >> 1;
    next_ad[0] = out_trans->data->GetUll(out_cyclecnt * 16);
    next_ad[1] = out_trans->data->GetUll((out_cyclecnt * 16) + 8);
    if ((bad & 1) && flip_data){
      next_ad[0] = ~ next_ad[0];
      next_ad[1] = ~ next_ad[1];
      dprintf(mod_out_fsm, 12, 0, "0x%0.16llx 0x%0.16llx flipped", next_ad[0], next_ad[1]);
    }else
      dprintf(mod_out_fsm, 12, 0, "0x%0.16llx 0x%0.16llx", next_ad[0], next_ad[1]);
    next_advalid = 1;


    out_cyclecnt++;
    if (out_cyclecnt == 3) {
      if (outHoldForNextTrans()) {
	sjm_arb->RequestToHoldBus();
      } else {
	sjm_arb->ReleaseBus();
      }
    } else if (out_cyclecnt == 4) {
      // This is the last cycle.
      out_state = CYC_IDLE;
      if (out_trans->atomic)
	/*Make sure read returns get a fair chance if we're doing back to back RDO/WRBs */
	outSwitchQueues();
      delete out_trans;
      out_trans = NULL;
    }
  } else if (out_state == CYC_RET64) {
    dprintf(mod_out_fsm, 11, 0, "Sending READ DATA RETURN.");

    // Check if we should generate bad parity.
    if (out_bad_parity_cycle & 0x1) {
      gen_bad_parity = 1;
    }
    out_bad_parity_cycle >>= 1;

    out_cyclecnt++;

    // Figure out what quadword to send.
    if (out_ordercnt == 3) {
      out_ordercnt = 0;
    } else {
      out_ordercnt++;
    }

    next_ad[0] = out_trans->data->GetUll(out_ordercnt * 16);
    next_ad[1] = out_trans->data->GetUll((out_ordercnt * 16) + 8);
    if (out_trans->ecc[out_ordercnt] && flip_data){
      //flip data for random ECC
      next_ad[0] = ~next_ad[0];
      next_ad[1] = ~next_ad[1];
    }
    next_advalid = 1;

    next_adtype = 0;

    dprintf(mod_out_fsm, 12, 0, "0x%0.16llx 0x%0.16llx", next_ad[0], next_ad[1]);

    if (out_cyclecnt == 1) {
      next_adtype |= (out_trans->ecc[0] << 5) | (out_trans->ecc[1] << 3);
      next_adtype |= out_trans->state;
    } else if (out_cyclecnt == 2) {
      next_adtype |= out_trans->ecc[2] << 3;
      if (outHoldForNextTrans()) {
	sjm_arb->RequestToHoldBus();
      } else {
	sjm_arb->ReleaseBus();
      }
    } else {
      next_adtype |= out_trans->ecc[3] << 3;
      delete out_trans;
      out_trans = NULL;
      out_state = CYC_IDLE;
    }
  } else if (out_state == CYC_CHANGE) {
    dprintf(mod_out_fsm, 11, 0, "Executing CHANGE.");
    if (++out_cyclecnt < J_CHANGE_WAIT) {
      sjm_arb->HoldBus();
    } else {
      sjm_arb->ReleaseBus();
      out_state = CYC_IDLE;
    }
  }

  // Make sure to drive parity.
  if (next_advalid) {
    int par;
    int parts[4];
    parts[0] = next_ad[0] >> 32;
    parts[1] = next_ad[0] & 0xffffffff;
    parts[2] = next_ad[1] >> 32;
    parts[3] = next_ad[1] & 0xffffffff;

    int adp = 0;
    int i;
    for (i = 0; i < 4; i++) {
      par = 0;
      for (int j = 0; j < 32; j++, parts[i] >>= 1) {
	par ^= parts[i] & 0x1;
      }
      adp <<= 1;
      adp |= par;
    }
    // Also include parity for j_adtype.
    int adt = next_adtype;
    for (i = 0, par = 0; i < 8; i++, adt >>= 1) {
      par ^= adt & 0x1;
    }
    adp ^= par << 3;

    if (gen_bad_parity) {
//       int bad = ((int) ((((float) rand() / RAND_MAX) * 100) / 6.25)) & 0xf;
//       if (!bad) {
//      bad = 0xf;
//       }
//       adp ^= bad;
      adp ^= getBit4Pattern();
    }

    // Parity is odd, so invert adp.
    next_adp = 0 | (~adp & 0xf);
  }
}


//------------------------------------------------------------------------------
// Switch what the current output queue is.
void SJM::outSwitchQueues()
{
  if (out_curr_q == sjm_outq) {
    out_curr_q = sjm_rdq;
  } else {
    out_curr_q = sjm_outq;
  }
}


//------------------------------------------------------------------------------
// Check if we need to hold the req for the next transaction.
int SJM::outHoldForNextTrans()
{
  Transaction *trans = sjm_outq->Next();

  if (trans) {
    if (trans->multi) {
      return 1;
    } else if (sjm_rdq->Next()) {
      return 1;
    }
  } else if (sjm_rdq->Next()) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Check odd parity.
void SJM::parityCheck(ull addr)
{
  int report_error = 1;

  // Look up the address in the address parity list.
  int *which = (int *) sjm_addr_parity_list->KVFind(addr & AD_MASK6);
  if (which) {
    // If parity checking is enabled, but not for this address, don't check
    // parity. If parity checking for this address is enabled, but parity
    // checking is off, do check parity.
    if (!(*which)) {
      report_error = 0;
    }
  } else if (!sjm_check_addr_parity) {
    report_error = 0;
  }

  int adp = curr_adp;
  int parbits[] = { 0, 0, 0, 0 };
  int error = 0;
  int parts[4];
  parts[0] = curr_ad[1] & 0xffffffff;
  parts[1] = curr_ad[1] >> 32;
  parts[2] = curr_ad[0] & 0xffffffff;
  parts[3] = curr_ad[0] >> 32;

  for (int i = 0; i < 4; i++, adp >>= 1) {
    parbits[i] = 0;
    for (int j = 0; j < 32; j++, parts[i] >>= 1) {
      parbits[i] ^= parts[i] & 0x1;
    }
    parbits[i] ^= adp & 0x1;
  }
  // Also check j_adtype.
  int adt = curr_adtype;
  if (1) { // <--------------------------------------------------- compiler hack
    for (int i = 0; i < 8; i++, adt >>= 1) {
      parbits[3] ^= adt & 0x1;
    }
  }
  // Check the correctness.
  if (1) { // <--------------------------------------------------- compiler hack
    for (int i = 0; i < 4; i++) {
      if (!parbits[i]) {
	error = 1;
	dprintf(mod_parity, 0, 0, "Incorrect parity on j_adp[%d].", i);
      }
    }
  }
  if (error) {
    // Check that errors on this address are ok.
    if (report_error) {
      dprintf(mod_parity, 49, 0, "For transaction: j_ad=0x%0.16llx 0x%0.16llx j_adtype=0x%0.2x j_adp=0x%0.1x", curr_ad[0], curr_ad[1], curr_adtype, curr_adp);
    } else {
      dprintf(mod_parity, 11, 0, "For transaction: j_ad=0x%0.16llx 0x%0.16llx j_adtype=0x%0.2x j_adp=0x%0.1x", curr_ad[0], curr_ad[1], curr_adtype, curr_adp);
    }
  }

}


//------------------------------------------------------------------------------
// Get a 4-bit number from the rotating pattern generator.
char SJM::getBit4Pattern()
{
  char ret = out_bit4_pattern[0] & 0xf;
  char tmp = out_bit4_pattern[1] & 0xf;
  out_bit4_pattern[0] >>= 4;
  out_bit4_pattern[1] >>= 4;
  out_bit4_pattern[0] |= tmp << 28;
  out_bit4_pattern[1] |= ret << 28;
  return ret;
}
