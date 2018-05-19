// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: main.cc
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
// Description:  Verilog-to-C++ interface for SJM. 
//
//------------------------------------------------------------------------------


#include "SJM.h"

// Routines called by the verilog code.
extern "C" void front_init();
extern "C" void sjm_misc(int data, int reason);
extern "C" void front_assert_pwr();
extern "C" void front_assert_por();
extern "C" void front_deassert_por();
extern "C" void front_start_exec();
extern "C" void front_get_status();
extern "C" void front_set_inputs();
extern "C" void front_get_outputs();

extern "C" void sjm_get_infsm();
extern "C" void sjm_get_arbiter();
extern "C" void sjm_get_snp_ctrl();
extern "C" void sjm_get_snoopq();
extern "C" void sjm_get_resultsq();
extern "C" void sjm_get_jpackq();
extern "C" void sjm_get_jpackoutq();

extern "C" void sjm_get_memq();
extern "C" void sjm_get_iomemq();
extern "C" void sjm_get_dataq();
extern "C" void sjm_get_readbuff();

extern "C" void sjm_get_outq();
extern "C" void sjm_get_rdrq();
extern "C" void sjm_get_out_state();

void get_memq(int);

// Variables used for $dispmon-style display.
#define VRLG_FINISH 0
#define VRLG_STOP 1
int maxerr = 1;
int maxwarn = 25;
int doerr = VRLG_FINISH;
int dowarn = VRLG_FINISH;
int errcnt = 0;
int warncnt = 0;
int msgactive[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		    -1, -1, -1, -1, -1, -1, -1, 1, 1 };

SJM *g_masters[G_MAX_MASTERS];
int g_nummasters;
// List of process id's of children.
int g_children[G_MAX_MASTERS];

//------------------------------------------------------------------------------
// Initializes the masters.
void front_init()
{
  // The array of masters is initially empty.
  for (int i = 0; i < G_MAX_MASTERS; i++) {
    g_masters[i] = NULL;
    g_children[i] = 0;
  }
  g_nummasters = 0;
  int tmp = 0;
  // The name of the diag.
  char *diagname;
  char *argvalue = mc_scan_plusargs("safari");
  if (!argvalue) {
//     io_printf("SJM WARNING: No diag name specified, SJM's will not be activated.\n");
//     return;
    diagname = NULL;
  } else {
    diagname = new char[strlen(argvalue)];
    strcpy(diagname, argvalue);
  }

  // Check the plusargs.
  LinkedList<PlusArg> *arglist = new LinkedList<PlusArg>();
  PlusArg *arg;
  char argname[64];
  unsigned int *seed_val = NULL;
  int system_mode = 0;
  int deadcycle_mode = -1;
  int estar_mode = -1;
  // Deadcycle on.
  argvalue = mc_scan_plusargs("default_dead");
  if (argvalue) {
    if (system_mode < 1) {
      system_mode = 1;
    }
  }
  // Deadcycle on, no sampling.
  argvalue = mc_scan_plusargs("default_nosample_dead");
  if (argvalue) {
    if (system_mode < 2) {
      system_mode = 2;
    }
  }
  // Deadcycle off.
  // argvalue = mc_scan_plusargs("default_nodead");
  // if (argvalue) {
  //  if (system_mode < 3) {
  //    system_mode = 3;
  //  }
  //}

  // shasta_default behavior (default_nodead) occurs by default
  if (system_mode < 3) {
    system_mode = 3;
  }

  // Deadcycle on.
  argvalue = mc_scan_plusargs("dead");
  if (argvalue) {
    if (system_mode < 4) {
      system_mode = 4;
    }
  }
  // Deadcycle on, no sampling.
  argvalue = mc_scan_plusargs("nosample_dead");
  if (argvalue) {
    if (system_mode < 5) {
      system_mode = 5;
    }
  }
  // Deadcycle off.
  argvalue = mc_scan_plusargs("nodead");
  if (argvalue) {
    if (system_mode < 6) {
      system_mode = 6;
    }
  }
  // Random seed.
  argvalue = mc_scan_plusargs("seed");
  if (argvalue) {
    seed_val = new unsigned int;
    *seed_val = atoi(argvalue);
  }
  // Turns off the required start flag.
  argvalue = mc_scan_plusargs("sjm_no_start_flag");
  if (argvalue) {
    arg = new PlusArg("no_start_flag", -1, -1);
    arglist->Append(arg);
  }
  // Set the deadcycle mode.
  argvalue = mc_scan_plusargs("SJMDEADCYCLE=");
  if (argvalue) {
    if (!strcmp(argvalue, "off")) {
      deadcycle_mode = 0;
    } else if (!strcmp(argvalue, "on")) {
      deadcycle_mode = 1;
    }
  }
  // Set the estar mode.
  argvalue = mc_scan_plusargs("SJMESTAR=");
  if (argvalue) {
    estar_mode = atoi(argvalue);
  }
  // Set the output queue size.
  argvalue = mc_scan_plusargs("sjm_outq_size");
  if (argvalue) {
    arg = new PlusArg("outq_size", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Memory read delay, all ports.
  argvalue = mc_scan_plusargs("sjm_read_delay");
  if (argvalue) {
    arg = new PlusArg("rd_delay", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Memory write delay, all ports.
  argvalue = mc_scan_plusargs("sjm_write_delay");
  if (argvalue) {
    arg = new PlusArg("wr_delay", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Randomize memory delays, all ports.
  argvalue = mc_scan_plusargs("sjm_memory_delay_random");
  if (argvalue) {
    if (argvalue[0] != '\0') {
      arg = new PlusArg("mem_delay_rand", -1, atoi(argvalue));
    } else {
      arg = new PlusArg("mem_delay_rand", -1, -1);
    }
    arglist->Append(arg);
  }
  // Set the memory request queue size.
  argvalue = mc_scan_plusargs("sjm_memq_size");
  if (argvalue) {
    arg = new PlusArg("memq_size", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Set the io memory request queue size.
  argvalue = mc_scan_plusargs("sjm_iomemq_size");
  if (argvalue) {
    arg = new PlusArg("iomemq_size", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Set the data queue size.
  argvalue = mc_scan_plusargs("sjm_mem_dataq_size");
  if (argvalue) {
    arg = new PlusArg("dataq_size", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Snoop delay, all ports.
  argvalue = mc_scan_plusargs("sjm_snoop_delay");
  if (argvalue) {
    if (isdigit(argvalue[0])) {
      arg = new PlusArg("snp_delay", atoi(argvalue), -1);
      arglist->Append(arg);
    }
  }
  // Randomize snoop delay, all ports.
  argvalue = mc_scan_plusargs("sjm_snoop_delay_random");
  if (argvalue) {
    if (argvalue[0] != '\0') {
      arg = new PlusArg("snp_delay_rand", -1, atoi(argvalue));
    } else {
      arg = new PlusArg("snp_delay_rand", -1, -1);
    }
    arglist->Append(arg);
  }
  // Set the snoop queue size.
  argvalue = mc_scan_plusargs("sjm_snoopq_size");
  if (argvalue) {
    arg = new PlusArg("snoopq_size", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Set the incoming jpack queue size.
  argvalue = mc_scan_plusargs("sjm_incoming_jpackq_size");
  if (argvalue) {
    arg = new PlusArg("in_jpackq_size", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Interrupt acknowledge delay.
  argvalue = mc_scan_plusargs("sjm_int_ack_delay");
  if (argvalue) {
    arg = new PlusArg("int_ack_delay", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Interrupt retry delay.
  argvalue = mc_scan_plusargs("sjm_int_retry_delay");
  if (argvalue) {
    arg = new PlusArg("int_retry_delay", atoi(argvalue), -1);
    arglist->Append(arg);
  }
  // Randomize interrupt delays.
  argvalue = mc_scan_plusargs("sjm_int_delay_random");
  if (argvalue) {
    if (argvalue[0] != '\0') {
      arg = new PlusArg("int_delay_rand", -1, atoi(argvalue));
    } else {
      arg = new PlusArg("int_delay_rand", atoi(argvalue), -1);
    }
    arglist->Append(arg);
  }
  // Timeout scale.
  argvalue = mc_scan_plusargs("sjm_timeout_scale");
  if (argvalue) {
    arg = new PlusArg("timeout_scale", atoi(argvalue), -1);
    arglist->Append(arg);
  }

  if (1) { // <--------------------------------------------------- compiler hack
    for (int i = 0; i < G_MAX_MASTERS; i++) {
      // Memory read delay, specific port.
      sprintf(argname, "sjm%d_read_delay", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("rd_delay", atoi(argvalue), i);
	arglist->Append(arg);
      }
      // Memory write delay, specific port.
      sprintf(argname, "sjm%d_write_delay", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("wr_delay", atoi(argvalue), i);
	arglist->Append(arg);
      }
      // Snoop delay, specific port.
      sprintf(argname, "sjm%d_snoop_delay", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("snp_delay", atoi(argvalue), i);
	arglist->Append(arg);
      }
      // Interupt acknowledge delay.
      sprintf(argname, "sjm%d_int_ack_delay", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("int_ack_delay", atoi(argvalue), i);
	arglist->Append(arg);
      }
      // Interrupt retry delay.
      sprintf(argname, "sjm%d_int_retry_delay", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("int_retry_delay", atoi(argvalue), i);
	arglist->Append(arg);
      }
      // Timeout scale.
      sprintf(argname, "sjm%d_timeout_scale", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("timeout_scale", atoi(argvalue), i);
	arglist->Append(arg);
      }
      // multiple agents ids for more outstanding reads
      sprintf(argname, "sjm%d_multiple_ids", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("sjm_multiple_ids", 0, i);
	arglist->Append(arg);
      }
      // multiple agents ids for more outstanding reads
      sprintf(argname, "sjm%d_no_idle_after_inv", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("sjm_no_idle_after_inv", 0, i);
	arglist->Append(arg);
      }

      // Arguments for command programs.
      sprintf(argname, "SSPARG[%d]=", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("SJMARG", 0, i);
	arg->str = new char[strlen(argvalue)];
	strcpy(arg->str, argvalue);
	arglist->Append(arg);
      }
      sprintf(argname, "SJMARG[%d]=", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("SJMARG", 0, i);
	arg->str = new char[strlen(argvalue)];
	strcpy(arg->str, argvalue);
	arglist->Append(arg);
      }
      for (int j = 0; ; j++) {
	sprintf(argname, "SJMARG[%d][%d]=", i, j);
	argvalue = mc_scan_plusargs(argname);
	if (argvalue) {
	  arg = new PlusArg("SJMARG", 0, i);
	  arg->str = new char[strlen(argvalue)];
	  strcpy(arg->str, argvalue);
	  arglist->Append(arg);
	} else {
	  break;
	}
      }

      // Device initialization.
      sprintf(argname, "SJMAID[%d]=", i);
      argvalue = mc_scan_plusargs(argname);
      if (argvalue) {
	arg = new PlusArg("SJMAID", atoi(argvalue), i);
	arglist->Append(arg);
      }
    }
  }

  //!!! for now do always, move to switch later.
  if (estar_mode > -1) {
    arg = new PlusArg("estar", estar_mode, -1);
    arglist->Append(arg);
  }

  // Set the system mode.
  switch (system_mode) {
  case 0:
    if (deadcycle_mode > -1) {
      arg = new PlusArg("deadcycle", deadcycle_mode, -1);
      arglist->Append(arg);
    }
    break;
  case 1 :
  case 2 :
  case 4 :
  case 5 :
    arg = new PlusArg("deadcycle", 1, -1);
    arglist->Append(arg);
    break;
  case 3 :
  case 6 :
    arg = new PlusArg("deadcycle", 0, -1);
    arglist->Append(arg);
    break;
  default:
    break;
  }

  // Seed the random number generator.
  if (seed_val) {
    srand(*seed_val);
    delete seed_val;
  } else {
    srand(1);
  }

  FILE *fp, *fpout;
  ull write_size;
  char fline[2084], strin[2084], *str;
  int memdat = 0;
  int memdatdefault = 0;
  int id, *data, idlist[G_MAX_MASTERS];
  ull addr;

  // Initialize the masters.
  if (1) { // <--------------------------------------------------- compiler hack
    for (int i = 0; i < G_MAX_MASTERS; i++) {
      if (diagname) {
	// First try the alias name.
	sprintf(strin, "%s_%d.cmd", diagname, i);
	if (fp = fopen(strin, "r")) {
	  fclose(fp);
	  try {
	    g_masters[i] = new SJM(i, strin, arglist);
	  } catch (SJM::BadInitialization) {
	    dprintf("SJM_INITIALIZATION", 0, 0, "Had trouble reading file %s, device %d not initialized.", strin, i);
	    g_masters[i] = NULL;
	  } catch (SJM::BadPlusArg) {
	    dprintf("SJM_INITIALIZATION", 0, 0, "Device %d received a bad plusarg and will not be initialized.", i);
	    g_masters[i] = NULL;
	  } catch (SJM::FatalInitializationError) {
	    dprintf("SJM_INITIALIZATION", 49, 4, "Fatal error, aborting.");
	    g_masters[i] = NULL;
	    return;
	  }
	}
	// Look for an executable.
	sprintf(strin, "%s_%d.exe", diagname, i);
	if (fp = fopen(strin, "r")) {
	  fclose(fp);
	  if (g_masters[i]) {
	    dprintf("SJM_INITIALIZATION", 49, 4, "Found both a command executable and a command file for port %d, which isn't allowed.", i);
	    continue;
	  } else {
	    try {
	      g_masters[i] = new SJM(i, strin, arglist);
	    } catch (SJM::BadInitialization) {
	      dprintf("SJM_INITIALIZATION", 0, 0, "Had trouble with file %s, device %d not initialized.", strin, i);
	      g_masters[i] = NULL;
	    } catch (SJM::BadPlusArg) {
	      dprintf("SJM_INITIALIZATION", 0, 0, "Device %d received a bad plusarg and will not be initialized.", i);
	      g_masters[i] = NULL;
	    } catch (SJM::FatalInitializationError) {
	      dprintf("SJM_INITIALIZATION", 49, 4, "Fatal error, aborting.");
	      g_masters[i] = NULL;
	      return;
	    }
	  }
	}
      }
      if (!g_masters[i]) {
	// Try the default name.
	sprintf(strin, "sjm_%d.cmd", i);
	if (fp = fopen(strin, "r")) {
	  fclose(fp);
	  try {
	    g_masters[i] = new SJM(i, strin, arglist);
	  } catch (SJM::BadInitialization) {
	    dprintf("SJM_INITIALIZATION", 0, 0, "Had trouble reading file %s, device %d not initialized.", strin, i);
	    g_masters[i] = NULL;
	  } catch (SJM::BadPlusArg) {
	    dprintf("SJM_INITIALIZATION", 0, 0, "Device %d received a bad plusarg and will not be initialized.", i);
	    g_masters[i] = NULL;
	  } catch (SJM::FatalInitializationError) {
	    dprintf("SJM_INITIALIZATION", 49, 4, "Fatal error, aborting.");
	    g_masters[i] = NULL;
	    return;
	  }
	}
	// Look for an executable.
	sprintf(strin, "sjm_%d.exe", i);
	if (fp = fopen(strin, "r")) {
	  fclose(fp);
	  if (g_masters[i]) {
	    dprintf("SJM_INITIALIZATION", 49, 4, "Found both a command executable and a command file for port %d, which isn't allowed.", i);
	    continue;
	  } else {
	    try {
	      g_masters[i] = new SJM(i, strin, arglist);
	    } catch (SJM::BadInitialization) {
	      dprintf("SJM_INITIALIZATION", 0, 0, "Had trouble with file %s, device %d not initialized.", strin, i);
	      g_masters[i] = NULL;
	    } catch (SJM::BadPlusArg) {
	      dprintf("SJM_INITIALIZATION", 0, 0, "Device %d received a bad plusarg and will not be initialized.", i);
	      g_masters[i] = NULL;
	    } catch (SJM::FatalInitializationError) {
	      dprintf("SJM_INITIALIZATION", 49, 4, "Fatal error, aborting.");
	      g_masters[i] = NULL;
	      return;
	    }
	  }
	}
      }
      if (!g_masters[i]) {
	// Check if plusargs are activating this device.
	sprintf(argname, "SJM[%d]AID=", i);
	argvalue = mc_scan_plusargs(argname);
	if (argvalue) {
	  // If it all ready exists, it's ok.
	  if (!g_masters[i]) {
	    try {
	      g_masters[i] = new SJM(i, NULL, arglist);
	    } catch (SJM::BadInitialization) {
	      printf("SJM_INITIALIZATION", 0, 0, "Had trouble reading file %s, device %d not initialized.", strin, i);
	      g_masters[i] = NULL;
	    } catch (SJM::BadPlusArg) {
	      dprintf("SJM_INITIALIZATION", 0, 0, "Device %d received a bad plusarg and will not be initialized.", i);
	      g_masters[i] = NULL;
	    } catch (SJM::FatalInitializationError) {
	      dprintf("SJM_INITIALIZATION", 49, 4, "Fatal error, aborting.");
	      g_masters[i] = NULL;
	      return;
	    }
	  }
	}
      }
      if (g_masters[i]) {
	// Put the id in the list for the synchronizer.
	idlist[g_nummasters] = i;
	g_nummasters++;
      }

      // Clean up any lingering memdat files.
      sprintf(strin, "sjm_%d.memdat", i);
      remove(strin);
    }
  }
  delete arglist;

  if (g_nummasters > 0) {
    // Register the SJM's with the synchronizer control.
    sync_register(g_nummasters, idlist);

    // Read the memdat file, if any was found.
    char *mfile;
    if (fp = fopen(MEMDAT_NAME, "r")) {
      mfile = MEMDAT_NAME;
      memdat = 1;
    } else if (fp = fopen(MEMDAT_DEFAULT, "r")) {
      mfile = MEMDAT_DEFAULT;
      memdatdefault = 1;
    }
    if (memdat || memdatdefault) {
      LinkedList<int> *datalist;

      fgets(fline, 2084, fp);
      while(!feof(fp)) {
	if (fline[0] == '@') {
	  // Found an address start specifier.
	  sscanf(&(fline[1]), "%llx", &addr);
	  id = find_port_id(find_agent_id(addr));
	  if ((id < -1) || !g_masters[id]) {
	    fgets(fline, 2084, fp);
	    continue;
	  }
	  if (g_masters[id] && g_masters[id]->InRange(addr)) {
	    // This address checks out, go ahead and read the data.
	    datalist = new LinkedList<int>();
	    write_size = 0;
	    while (fgets(fline, 2084, fp)) {
	      if ((fline[0] == ' ') || (fline[0] == '\n') || !strncmp(fline, "//", 2)) {
		continue;
	      } else if (fline[0] == '@') {
		break;
	      }
	      for (str = strtok(fline, " \t\n"); str; str = strtok(NULL, " \t\n")) {
		data = new int;
		sscanf(str, "%x", data);
		datalist->Append(data);
		write_size++;
	      }
	    }
	    sprintf(strin, "sjm_%d.memdat", id);
	    //!!! check that it can be opened.
	    fpout = fopen(strin, "ab");

	    // Write the size.
	    fwrite((void *) &write_size, sizeof(ull), 1, fpout);
	    // Write the address.
	    fwrite((void *) &addr, sizeof(ull), 1, fpout);
	    // Write the data.
	    datalist->GoToHead();
	    for (data = datalist->CurrentNode(); data || datalist->HasMoreNodes(); data = datalist->NextNode()) {
	      fwrite((void *) data, sizeof(int), 1, fpout);
	    }
	    delete datalist;
	    fclose(fpout);
	  } else {
	    fgets(fline, 2084, fp);
	  }
	} else {
	  fgets(fline, 2084, fp);
	}
      }
      fclose(fp);
    }
  }
}
extern "C" void sjm_misc(int data, int reason){
  int i;
  switch (reason) {
    case reason_finish:
      for (i = 0; i < G_MAX_MASTERS; i++) {
	if (g_masters[i] != NULL)
	  g_masters[i]->tidy_up();
      }
      break;
    default:
      break;
  }
}



// -----------------------------------------------------------------------------
// pwr_ok has been asserted.
void front_assert_pwr()
{
  acc_initialize () ;
  handle tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    g_masters[j_id]->SetPwr();
  }
  acc_close () ;
}


// -----------------------------------------------------------------------------
// por_l has been asserted.
void front_assert_por()
{
  acc_initialize () ;
  handle tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    g_masters[j_id]->SetPor(1);
  }
  acc_close () ;
}


// -----------------------------------------------------------------------------
// por_l has been deasserted.
void front_deassert_por()
{
  acc_initialize () ;
  handle tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    g_masters[j_id]->SetPor(0);
  }
  acc_close () ;
}


//------------------------------------------------------------------------------
// Tells the SJM's to start executing their command files.
void front_start_exec()
{
  acc_initialize () ;
  handle tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    g_masters[j_id]->StartExecution();
  }
  acc_close () ;
}


//------------------------------------------------------------------------------
// Checks the status of the sjm. Encodings are:
// 00: inactive
// 01: reset
// 10: executing
// 11: done
void front_get_status()
{
  acc_initialize () ;
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;

  tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  tmphandle = acc_handle_tfarg(2);
  value_s.format = accBinStrVal;
  if (g_masters[j_id]) {
    value_s.value.str = g_masters[j_id]->GetExecStatus();
    acc_set_value(tmphandle, &value_s, &delay_s);
    delete value_s.value.str;
  } else {
    value_s.value.str = "00";
    acc_set_value(tmphandle, &value_s, &delay_s);
  }
  acc_close () ;
}


// -----------------------------------------------------------------------------
// Get the current values on the bus.
void front_set_inputs()
{
  char *j_packs[G_MAXPORTS];
  int i = 1;

  acc_initialize () ;
  // Get j_id.
  handle tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  // Get j_req_in.
  tmphandle = acc_handle_tfarg(i++);
  char *j_req_in_c = acc_fetch_value(tmphandle, "%b", NULL);

  // Get j_ad.
  tmphandle = acc_handle_tfarg(i++);
  char* j_ad_c = acc_fetch_value(tmphandle, "%b", NULL);

  // Get j_adp.
  tmphandle = acc_handle_tfarg(i++);
  char* j_adp_c = acc_fetch_value(tmphandle, "%d", NULL);

  // Get j_adtype
  tmphandle = acc_handle_tfarg(i++);
  char* j_adtype_c = acc_fetch_value(tmphandle, "%d", NULL);

  // Get the jpacks.
  for (int j = 0; j < G_MAXPORTS; j++) {
    tmphandle = acc_handle_tfarg(i++);
    j_packs[j] = acc_fetch_value(tmphandle, "%d", NULL);
  }

  // Get j_change.
  tmphandle = acc_handle_tfarg(i++);
  char *j_change_c = acc_fetch_value(tmphandle, "%b", NULL);

  // Get j_rst.
  tmphandle = acc_handle_tfarg(i++);
  char *j_rst_c = acc_fetch_value(tmphandle, "%b", NULL);

  // Get j_por.
  tmphandle = acc_handle_tfarg(i++);
  char *j_por_c = acc_fetch_value(tmphandle, "%b", NULL);
  if (g_masters[j_id]) {
      g_masters[j_id]->InputValues(j_req_in_c, j_ad_c, j_adp_c, j_adtype_c, j_packs, j_change_c, j_rst_c, j_por_c);
  }
  acc_close () ;
}


// -----------------------------------------------------------------------------
// Drive values onto the bus.
void front_get_outputs()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;
  int i = 1;

  acc_initialize () ;
  tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    // Output j_req_out.
    tmphandle = acc_handle_tfarg(i++);
    value_s.format = accBinStrVal;
    value_s.value.str = g_masters[j_id]->GetReq();
    acc_set_value(tmphandle, &value_s, &delay_s);
    delete value_s.value.str;

    // Output j_ad.
    tmphandle = acc_handle_tfarg(i++);
    value_s.format = accHexStrVal;
    value_s.value.str = g_masters[j_id]->GetAd();
    acc_set_value(tmphandle, &value_s, &delay_s);
    delete value_s.value.str;

    // Output j_adp.
    tmphandle = acc_handle_tfarg(i++);
    value_s.format = accHexStrVal;
    value_s.value.str = g_masters[j_id]->GetAdp();
    acc_set_value(tmphandle, &value_s, &delay_s);
    delete value_s.value.str;

    // Output j_adtype.
    tmphandle = acc_handle_tfarg(i++);
    value_s.format = accHexStrVal;
    value_s.value.str = g_masters[j_id]->GetAdtype();
    acc_set_value(tmphandle, &value_s, &delay_s);
    delete value_s.value.str;

    // Output the jpacks.
    for (int j = 0; j < G_MAXPORTS; j++) {
      tmphandle = acc_handle_tfarg(i++);
      value_s.format = accHexStrVal;
      if (j_id == j) {
	value_s.value.str = g_masters[j_id]->GetJpack();
	acc_set_value(tmphandle, &value_s, &delay_s);
	delete value_s.value.str;
      } else {
	value_s.value.str = "z";
	acc_set_value(tmphandle, &value_s, &delay_s);
      }
    }

    // Output j_change.
    tmphandle = acc_handle_tfarg(i++);
    value_s.format = accHexStrVal;
    value_s.value.str = g_masters[j_id]->GetChange();
    acc_set_value(tmphandle, &value_s, &delay_s);
    delete value_s.value.str;

    // Output j_rst.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = g_masters[j_id]->GetRst();
    acc_set_value(tmphandle, &value_s, &delay_s);
    delete value_s.value.str;

    // Output j_por.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = g_masters[j_id]->GetPor();
    acc_set_value(tmphandle, &value_s, &delay_s);
    delete value_s.value.str;
  }

  acc_close ();
}


//------------------------------------------------------------------------------
// Get the registers from the input fsm.
void sjm_get_infsm()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;

  acc_initialize () ;
  tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  char *sigs, *p;
  if (g_masters[j_id]) {
    sigs = g_masters[j_id]->GetInputFSM();
    p = strtok(sigs, ":");

    // The state.
    tmphandle = acc_handle_tfarg(2);
    if (p[0] == ' ') {
      value_s.format = accHexStrVal;
      value_s.value.str = "z";
    } else {
      value_s.format = accStringVal;
      value_s.value.str = p;
    }
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // The transaction type.
    tmphandle = acc_handle_tfarg(3);
    if (p[0] == ' ') {
      value_s.format = accHexStrVal;
      value_s.value.str = "z";
    } else {
      value_s.format = accStringVal;
      value_s.value.str = p;
    }
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // Active state.
    tmphandle = acc_handle_tfarg(4);
    value_s.format = accBinStrVal;
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);

    delete sigs;
  } 
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values of the arbiter.
void sjm_get_arbiter()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;
  int i = 1;

  acc_initialize () ;
  tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  char *sigs, *p;
  if (g_masters[j_id]) {
    sigs = g_masters[j_id]->GetArbiter();
    p = strtok(sigs, ":");

    // Previous grant.
    tmphandle = acc_handle_tfarg(i++);
    value_s.format = accBinStrVal;
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // Next grant.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // Grant.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // Deadcycle.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // Req out.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);

    delete sigs;
  }
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values of the snoop control.
void sjm_get_snp_ctrl()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;
  int i = 1;

  acc_initialize ();
  tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  char *sigs, *p;
  if (g_masters[j_id]) {
    sigs = g_masters[j_id]->GetSnoopControl();
    p = strtok(sigs, ":");

    // AOK state from snoop queue.
    tmphandle = acc_handle_tfarg(i++);
    value_s.format = accBinStrVal;
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // AOK state from results queue.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // Packs in state.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // Snoop delay limit.
    tmphandle = acc_handle_tfarg(i++);
    value_s.format = accIntVal;
    value_s.value.integer = atoi(p);
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // Snoop delay counter.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.integer = atoi(p);
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // AOK state for each port.
    tmphandle = acc_handle_tfarg(i++);
    value_s.format = accBinStrVal;
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // AOK previous.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // AOK next.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // DOK previous for each port.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    // DOK next for each port.
    tmphandle = acc_handle_tfarg(i++);
    value_s.value.str = p;
    acc_set_value(tmphandle, &value_s, &delay_s);
    p = strtok(NULL, ":");

    delete sigs;
  }
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values in the snoop queue.
void sjm_get_snoopq()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;
  int i = 1;
  char str[1024];

  acc_initialize ();
  tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    Enumeration<Snoop> *en = g_masters[j_id]->GetSnoopQueue();

    for (Snoop *snp = (Snoop *) en->NextElement(); en->HasMoreElements(); snp = (Snoop *) en->NextElement()) {

      if (!snp) {
	// Type.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accHexStrVal;
	value_s.value.str = "z";
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(i++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Request source.
	tmphandle = acc_handle_tfarg(i++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Read buffer index.
	tmphandle = acc_handle_tfarg(i++);
	acc_set_value(tmphandle, &value_s, &delay_s);

      } else {
	// Type.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accStringVal;
	value_s.value.str = get_trans_string(snp->type);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accHexStrVal;
	sprintf(str, "%0.11llx", snp->addr);
	value_s.value.str = str;
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Request source.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accIntVal;
	value_s.value.integer = snp->srcID;
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Read buffer index.
	tmphandle = acc_handle_tfarg(i++);
	value_s.value.integer = snp->orb_indx;
	acc_set_value(tmphandle, &value_s, &delay_s);
      }
    }
    delete en;
  }
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values of the results queue.
void sjm_get_resultsq()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;
  int i = 1;
  char str[1024];

  acc_initialize ();
  tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    Enumeration<PackResult> *en = g_masters[j_id]->GetResultsQueue();

    for (PackResult *res = (PackResult *) en->NextElement(); en->HasMoreElements(); res = (PackResult *) en->NextElement()) {

      if (!res) {
	// Address.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accHexStrVal;
	value_s.value.str = "z";
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Result.
	tmphandle = acc_handle_tfarg(i++);
	acc_set_value(tmphandle, &value_s, &delay_s);   

      } else {
	// Address.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accHexStrVal;
	sprintf(str, "%0.11llx", res->addr);
	value_s.value.str = str;
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Result.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accIntVal;
	value_s.value.integer = res->result;
	acc_set_value(tmphandle, &value_s, &delay_s);
      }
    }
    delete en;
  }
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values in the jpack input queues.
void sjm_get_jpackq()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;
  int i = 1;

  acc_initialize ();
  tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    tmphandle = acc_handle_tfarg(i++);
    int indx = atoi(acc_fetch_value(tmphandle, "%d", NULL));

    Enumeration<int> *en = g_masters[j_id]->GetPackQueue(indx);

    for (int *pack = (int *) en->NextElement(); en->HasMoreElements(); pack = (int *) en->NextElement()) {

      if (!pack) {
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accHexStrVal;
	value_s.value.str = "z";
	acc_set_value(tmphandle, &value_s, &delay_s);      
      } else {
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accIntVal;
	value_s.value.integer = *pack;
	acc_set_value(tmphandle, &value_s, &delay_s);
      }
    }
    delete en;
  }
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values in the jpack output queue.
void sjm_get_jpackoutq()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;
  int i = 1;

  acc_initialize ();
  tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    Enumeration<int> *en = g_masters[j_id]->GetPackOutQueue();

    for (int *pack = (int *) en->NextElement(); en->HasMoreElements(); pack = (int *) en->NextElement()) {
      if (!pack) {
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accHexStrVal;
	value_s.value.str = "z";
	acc_set_value(tmphandle, &value_s, &delay_s);      
      } else {
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accIntVal;
	value_s.value.integer = *pack;
	acc_set_value(tmphandle, &value_s, &delay_s);
      }
    }
    delete en;
  }
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values in the memory request queue.
void sjm_get_memq()
{
  get_memq(0);
}


//------------------------------------------------------------------------------
// Get the values in the IO memory request queue.
void sjm_get_iomemq()
{
  get_memq(1);
}


//------------------------------------------------------------------------------
// Do the work to fetch the data in the memory reqeust queue.
void get_memq(int which)
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;
  int i = 1;
  char str[1024];

  acc_initialize ();
  tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    Enumeration<MemoryRequest> *en;
    if (which) {
      en = g_masters[j_id]->GetIOMemQueue();
    } else {
      en = g_masters[j_id]->GetMemQueue();
    }

    for (MemoryRequest *mrq = (MemoryRequest *) en->NextElement(); en->HasMoreElements(); mrq = (MemoryRequest *) en->NextElement()) {

      if (!mrq) {
	// Type.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accHexStrVal;
	value_s.value.str = "z";
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(i++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Request source.
	tmphandle = acc_handle_tfarg(i++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Read buffer index.
	tmphandle = acc_handle_tfarg(i++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Cache state / mask.
	tmphandle = acc_handle_tfarg(i++);
	acc_set_value(tmphandle, &value_s, &delay_s);

      } else {
	// Type.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accStringVal;
	sprintf(str, "%c", toupper(mrq->type));
	value_s.value.str = str;
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accHexStrVal;
	sprintf(str, "%0.11llx", mrq->addr);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Data.
//      tmphandle = acc_handle_tfarg(i++);
//      if (mrq->type == MEM_READ) {
//        value_s.value.str = "z";
//      } else {
//        sprintf(str, "%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx",
//              mrq->data->GetUll(0), mrq->data->GetUll(8),
//              mrq->data->GetUll(16), mrq->data->GetUll(24),
//              mrq->data->GetUll(32), mrq->data->GetUll(40), 
//              mrq->data->GetUll(48), mrq->data->GetUll(56));
//      }
//      acc_set_value(tmphandle, &value_s, &delay_s);

	// Request source.
	tmphandle = acc_handle_tfarg(i++);
	value_s.format = accIntVal;
	value_s.value.integer = mrq->srcID;
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Read buffer index.
	tmphandle = acc_handle_tfarg(i++);
	value_s.value.integer = mrq->orb_indx;
	acc_set_value(tmphandle, &value_s, &delay_s);

	if (which) {
	  // Mask.
	  tmphandle = acc_handle_tfarg(i++);
	  value_s.format = accHexStrVal;
	  sprintf(str, "%x", mrq->mask);
	  value_s.value.str = str;
	  acc_set_value(tmphandle, &value_s, &delay_s);
	} else {
	  // Cache state.
	  tmphandle = acc_handle_tfarg(i++);
	  value_s.format = accStringVal;
	  if (mrq->cstate < 0) {
	    value_s.value.str = "NA";
	  } else {
	    sprintf(str, "%c", Cache::GetStateString(mrq->cstate));
	    value_s.value.str = str;
	  }
	  acc_set_value(tmphandle, &value_s, &delay_s);
	}
      }
    }
    delete en;
  }
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values of the data request queue.
void sjm_get_dataq()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;
  int i = 1;
  char str[128];

  acc_initialize ();
  tmphandle = acc_handle_tfarg(i++);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    Enumeration<ByteString> *en = g_masters[j_id]->GetDataQueue();
    int qsize = g_masters[j_id]->GetDataQueueSize();
    ByteString *bstr;

    value_s.format = accHexStrVal;

    for (int j = 0; j < qsize; j++) {
      bstr = (ByteString *) en->NextElement();

      tmphandle = acc_handle_tfarg(i++);
      if (!bstr) {
	value_s.value.str = "z";
      } else {
	sprintf(str, "%0.16llx%0.16llx", bstr->GetUll(0), bstr->GetUll(8));
	value_s.value.str = str;
      }
      acc_set_value(tmphandle, &value_s, &delay_s);
    }
    delete en;
  }
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values of the outstanding read buffer.
void sjm_get_readbuff()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;

  acc_initialize ();
  tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    ReadBuffEntry *entry;
    char str[1024];
    int arg = 2;

    for (int i = 0; i < G_READBUFFER_SIZE_PORT; i++) {
      entry = g_masters[j_id]->GetReadBuffEntry(i);
      if (!entry) {
	// Type.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accHexStrVal;
	value_s.value.str = "z";
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Incoming data.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Expected data.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Cache state.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Load register number.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Setcc.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// On bus or not.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Blocking state.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

      } else {
	//Type.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accStringVal;
	value_s.value.str = get_trans_string(entry->type);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accHexStrVal;
	sprintf(str, "%0.11llx", entry->addr);
	value_s.value.str = str;
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Incoming data.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx",
		entry->indata->GetUll(0), entry->indata->GetUll(8),
		entry->indata->GetUll(16), entry->indata->GetUll(24),
		entry->indata->GetUll(32), entry->indata->GetUll(40), 
		entry->indata->GetUll(48), entry->indata->GetUll(56));
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Expected data.
	tmphandle = acc_handle_tfarg(arg++);
	if (!entry->dvalid) {
	  value_s.value.str = "z";
	} else {
	  sprintf(str, "%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx",
		entry->expdata->GetUll(0), entry->expdata->GetUll(8),
		entry->expdata->GetUll(16), entry->expdata->GetUll(24),
		entry->expdata->GetUll(32), entry->expdata->GetUll(40), 
		entry->expdata->GetUll(48), entry->expdata->GetUll(56));
	}
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Cache state.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accStringVal;
	if (entry->cstate < 0) {
	  value_s.value.str = "NA";
	} else {
	  sprintf(str, "%c", Cache::GetStateString(entry->cstate));
	  value_s.value.str = str;
	}
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Load register number.
	tmphandle = acc_handle_tfarg(arg++);
	if (entry->reg < 0) {
	  value_s.value.str = "NA";
	} else {
	  sprintf(str, "R%d", entry->reg);
	  value_s.value.str = str;
	}
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Setcc.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accBinStrVal;
	sprintf (str, "%d", entry->setcc);
	value_s.value.str = str;
	acc_set_value(tmphandle, &value_s, &delay_s);

	// On bus or not.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%d", entry->onbus);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Blocking state.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%d", entry->blocking);
	acc_set_value(tmphandle, &value_s, &delay_s);
      }
    }
  }
  acc_close ();
}



















//------------------------------------------------------------------------------
// Get the values of the output queue.
//!!! still under construction
void sjm_get_outq()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;

  acc_initialize ();
  tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    // First get the outstanding transaction, if any.
    int arg = 2;
    char str[1024];

    Enumeration<Transaction> *en = g_masters[j_id]->GetOutQueue();
//     Transaction *trans = g_masters[j_id]->GetOutTrans();
    Transaction *trans = (Transaction *) en->NextElement();

    for (int i = 0; i < G_OUTQ_DEPTH; i++) {
      if (!trans) {
	// Type.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accHexStrVal;
	value_s.value.str = "z";
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Data.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Mask.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Destination ID.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Readbuffer index.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Cache state.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

      } else {
	// Type.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accStringVal;
	value_s.value.str = get_trans_string(trans->type);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accHexStrVal;
	sprintf(str, "%0.11llx", trans->addr);
	value_s.value.str = str;
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Data.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx",
		trans->data->GetUll(0), trans->data->GetUll(8),
		trans->data->GetUll(16), trans->data->GetUll(24),
		trans->data->GetUll(32), trans->data->GetUll(40), 
		trans->data->GetUll(48), trans->data->GetUll(56));
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Mask.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%x", trans->mask);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Destination ID.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%x", trans->destID);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Readbuffer index.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%x", trans->orb_indx);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Cache state.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accStringVal;
	if (trans->state < 0) {
	  value_s.value.str = "NA";
	} else {
	  sprintf(str, "%c", Cache::GetStateString(trans->state));
	}
	acc_set_value(tmphandle, &value_s, &delay_s);
      }
      trans = (Transaction *) en->NextElement();
    }
    delete en;
  }  
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the values of the read data return queue.
//!!! still under construction
void sjm_get_rdrq()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;

  acc_initialize () ;
  tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    int arg = 2;
    char str[1024];

    Enumeration<Transaction> *en = g_masters[j_id]->GetRDRQueue();
    Transaction *trans = (Transaction *) en->NextElement();

    for (int i = 0; i < (G_OUTQ_DEPTH / 2); i++) {
      if (!trans) {
	// Type.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accHexStrVal;
	value_s.value.str = "z";
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Data.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Destination ID.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Readbuffer index.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Cache state.
	tmphandle = acc_handle_tfarg(arg++);
	acc_set_value(tmphandle, &value_s, &delay_s);

      } else {
	// Type.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accStringVal;
	value_s.value.str = get_trans_string(trans->type);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Address.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accHexStrVal;
	sprintf(str, "%0.11llx", trans->addr);
	value_s.value.str = str;
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Data.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx%0.16llx",
		trans->data->GetUll(0), trans->data->GetUll(8),
		trans->data->GetUll(16), trans->data->GetUll(24),
		trans->data->GetUll(32), trans->data->GetUll(40), 
		trans->data->GetUll(48), trans->data->GetUll(56));
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Destination ID.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%x", trans->destID);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Readbuffer index.
	tmphandle = acc_handle_tfarg(arg++);
	sprintf(str, "%x", trans->orb_indx);
	acc_set_value(tmphandle, &value_s, &delay_s);

	// Cache state.
	tmphandle = acc_handle_tfarg(arg++);
	value_s.format = accStringVal;
	if (trans->state < 0) {
	  value_s.value.str = "NA";
	} else {
	  sprintf(str, "%c", Cache::GetStateString(trans->state));
	}
	acc_set_value(tmphandle, &value_s, &delay_s);
      }
      trans = (Transaction *) en->NextElement();
    }
    delete en;
  }  
  acc_close ();
}


//------------------------------------------------------------------------------
// Get the value of the out_prev variable.
void sjm_get_out_state()
{
  s_setval_delay delay_s;
  delay_s.model = accNoDelay;
  s_setval_value value_s;
  handle tmphandle;

  acc_initialize ();
  tmphandle = acc_handle_tfarg(1);
  int j_id = atoi(acc_fetch_value(tmphandle, "%d", NULL));

  if (g_masters[j_id]) {
    tmphandle = acc_handle_tfarg(2);
    value_s.format = accStringVal;
    value_s.value.str = g_masters[j_id]->GetOutState();
    acc_set_value(tmphandle, &value_s, &delay_s);
    delete value_s.value.str;
  }
  acc_close ();
}


//------------------------------------------------------------------------------
// Return a string representation of the transacion type.
char *get_trans_string(int type)
{
  switch (type) {
  case T_IDLE:
    return "IDLE";
  case T_RD:
    return "RD";
  case T_RDD:
    return "RDD";
  case T_RDS:
    return "RDS";
  case T_RDSA:
    return "RDSA";
  case T_RDO:
    return "RDO";
  case T_OWN:
    return "OWN";
  case T_WRB:
    return "WRB";
  case T_WRBC:
    return "WRBC";
  case T_WRI:
    return "WRI";
  case T_WRIS:
    return "WRIS";
//  case T_CWR:    /*niagara support*/
//    return "CWR";
  case T_WRM:    /*niagara support*/
    return "WRM";
  case T_INV:
    return "INV";
  case T_NCRD:
    return "NCRD";
  case T_NCBRD:
    return "NCBRD";
  case T_NCWR:
    return "NCWR";
  case T_NCWRC:
    return "NCWRC";
  case T_NCBWR:
    return "NCBWR";
  case T_INT:
    return "INT";
  case T_INTACK:
    return "INTACK";
  case T_INTNACK:
    return "INTNACK";
  case T_XIR:
    return "XIR";
  case T_CHANGE:
    return "CHANGE";
  case J_DATARET16:
    return "READ 16 DATA RETURN";
  case J_DATARET64:
    return "READ 64 DATA RETURN";
  case J_READERR:
    return "READ ERROR";
  default:
    return "???";
  }
}


//------------------------------------------------------------------------------
// Return the group type of a transaction.
int get_trans_type(int trans)
{
  // Filter out the reserved ranges.
  if ((trans == 0) || (trans == 0x1) ||
      (trans == 0x09) || /*(trans == 0x0b) || for Niagara support*/
      (trans == 0x18) || (trans == 0x19) ||
      ((trans >= 0x1b) && (trans <= 0x1e))) {
    return 0;
  }

  if ((trans == J_DATARET16) || (trans == J_DATARET64) || (trans == J_READERR)) {
    return TYPE_DATARET;
  } else if ((trans == T_RD) || (trans == T_RDD) || (trans == T_RDS) || (trans == T_RDSA) || (trans == T_RDO) || (trans == T_OWN)) {
    return TYPE_READ;
  } else if ((trans == T_WRB) || (trans == T_WRBC) || (trans == T_WRI) || (trans == T_WRIS) || (trans == T_INV)) {
    return TYPE_WRITE;
  } else if ((trans == T_NCRD) || (trans == T_NCBRD)) {
    return TYPE_NCREAD;
  } else if ((trans == T_NCWR) || (trans == T_NCWRC) || (trans == T_NCBWR)) {
    return TYPE_NCWRITE;
  } else if ((trans == T_INT) || (trans == T_INTACK) || (trans == T_INTNACK)) {
    return TYPE_INTERRUPT;
  } else if ((trans == T_WRM) /*|| (trans == T_CWR)*/ ){ /*for Niagara support*/
    return TYPE_WRITE;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Find the agent ID of the device whose range contains the given address. For
// now the fifth bit is dropped.
int find_agent_id(ull addr)
{
  int id;
  if (find_range(addr) == ADDR_CONF) {
    id = (addr >> 23) & 0xf;
  } else {
    id = (addr >> 36) & 0xf;
  }
  if (id < 6) {
    // CPU's.
    return id;
  }
  if ((id & 0xe) == AGENT_TOM0) {
    // I/O Bridge 0.
    return AGENT_TOM0;
  }
  if ((id & 0xe) == AGENT_TOM1) {
    // I/O Bridge 1.
    return AGENT_TOM1;
  }
  if ((id & 0xc) == AGENT_ZULU) {
    return AGENT_ZULU;
  }
  return -1;
}


//------------------------------------------------------------------------------
// Find the port id, given the agent id.
int find_port_id(int id)
{
  if (id < 5) {
    return id;
  }
  if (id == 5) {
    return 6;
  }
  if ((id & 0xe) == AGENT_TOM0) {
    return 4;
  }
  if ((id & 0xe) == AGENT_TOM1) {
    return 5;
  }
  if ((id & 0xc)  == AGENT_ZULU) {
    return 6;
  }
  return -1;
}


//------------------------------------------------------------------------------
// Find which range an address belongs to. Returns -1 if the address is not
// within a valid range.
int find_range(ull addr)
{
  // Niagara: The address space should only be defined by
  // the upper two bits of the address (bits [42:41])

  //  if (((addr >> 40) & 6) == ADDR_CONF) {
  if ((addr >> 41) == ADDR_CONF) {
    return ADDR_CONF;
  }
  //  if (((addr >> 40) & 6) == ADDR_NONC) {
  if ((addr >> 41) == ADDR_NONC) {
    return ADDR_NONC;
  }
  //  if (((addr >> 40) & 6) == ADDR_CCHE) {
  if ((addr >> 41) == ADDR_CCHE) {
    return ADDR_CCHE;
  }
  return -1;
}



//------------------------------------------------------------------------------
// Get the id and testname information for all ports. Returns the number of
// SJM's instantiated.
int get_device_info(int *port_ids, int *agent_ids, char **testnames)
{
  for (int i = 0, j = 0; i < G_MAX_MASTERS; i++) {
    if (g_masters[i]) {
      port_ids[j] = i;
      agent_ids[j] = g_masters[i]->GetAgentID();
      strcpy(testnames[j++], g_masters[i]->GetTestName());
    }
  }
  return g_nummasters;
}
