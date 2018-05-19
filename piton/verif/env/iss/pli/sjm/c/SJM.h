// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: SJM.h
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


#include "Parser.h"
#include "pli_api.h"

#include "Arbiter.h"
#include "Cache.h"
#include "InterruptControl.h"
#include "MemoryControl.h"

// Input types.
#define SJMTYPE_CMD 0x0
#define SJMTYPE_EXE 0x1
#define SJMTYPE_ARG 0x2

// The following define global states.
#define SJM_UNKNOWN   0x00
#define SJM_POR       0x02
#define SJM_RST       0x04
#define SJM_READY     0x08
#define SJM_EXEC      0x10
#define SJM_CHANGE    0x20

// The following define input and output cycle states.
#define CYC_IDLE   0x0a
#define CYC_ADDR   0x0b
#define CYC_DATA16 0x0c
#define CYC_DATA64 0x0d
#define CYC_RET16  0x0e
#define CYC_RET64  0x0f
#define CYC_ERR    0x10
#define CYC_CHANGE 0x11

extern int PLIModulesDone();

class SJM
{
private:
  char modname[5];
  int port_id;
  int agent_id;

  // Monitor names.
  static char *mod_fsm;
  static char *mod_in_fsm;
  static char *mod_out_fsm;
  static char *mod_parity;
  static char *mod_cmd_proc;
  static char *mod_display;

  // Keeps track of the global state.
  short sjm_state;
  // Describes how this port is driven.
  short sjm_type;
  // Set if this port has been configured.
  short sjm_configured;
  // Keeps track of the cycle count.
  ull sjm_cyclecnt;
  // Reset cycle counter.
  int sjm_resetcnt;
  // Sets whether or not to wait for the start flag.
  byte sjm_wait_on_start;
  // Keeps track of how many times rst has been asserted.
  short sjm_rst_state;
  // Keeps track of the clocking rate.
  int sjm_sample_rate;
  // Counter for the sample rate.
  int sjm_sample_cnt;
  // Keeps track of when to drive.
  short sjm_drive;
  // Tracks the change sequence.
  int sjm_change_cnt;
  // Timeout scale value.
  int sjm_timeout_scale;
  // Process id of forked process if any.
  pid_t sjm_pid;
  //whether we drive an idle after an invalidate or not
  int idle_after_inv;

  // Pipes.
  int sjm_u[2];
  int sjm_d[2];
  int sjm_in_pipe;
  int sjm_out_pipe;

  // The parser.
  Parser *sjm_parser;
  // The cache.
  Cache *sjm_cache;
  // The arbiter.
  Arbiter *sjm_arb;
  // The outstanding read return buffer.
  ReadOutBuffer *sjm_readbuff;
  // Snoop control.
  SnoopControl *sjm_snpctrl;
  // Primary memory control.
  MemoryControl *sjm_memctrl;
  // Interrupt control.
  InterruptControl *sjm_intctrl;
  // Transaction output queue.
  Queue<Transaction> *sjm_outq;
  // Read data return output queue.
  Queue<Transaction> *sjm_rdq;
  // Writeback queue.
  Queue<Transaction> *sjm_wrbq;
  // Pointer to the last person to generate a transaction.
  void *nextgen;

  // The register file.
  RegisterFile *sjm_regfile;

  // Check/don't check parity.
  byte sjm_check_addr_parity;
  // Addresses that can accept parity errors.
  BinaryKeyValueTree<ull> *sjm_addr_parity_list;
  // Addresses that should send parity errors.
  BinaryNumTree<ull> *sjm_bad_parity_addrs;
  // Transaction types that should send parity errors.
  BinaryNumTree<int> *sjm_bad_parity_trans;
  // Stores addresses that should generate ECC errors randomly anywhere in a 64 byte value.
  BinaryKeyValueTree<ull> *sjm_bad_ecc_list;
  // Stores addresses that should generate ECC errors down to a 16byte value.
  BinaryKeyValueTree<ull> *sjm_bad_ecc_list_norand;
  // used if ECC error only set to specific jid
  BinaryKeyValueTree<ull> *sjm_bad_ecc_list_norand_dest;
  // Stores address that flip bits.
  BinaryKeyValueTree<ull> *sjm_flipbits_list;
  // Stores addresses that expect read error packets.
  BinaryKeyValueTree<ull> *sjm_read_error_list;

  // State registers.
  byte csr_liveports[G_MAXPORTS];
  byte csr_deadcycle_mode;
  byte csr_estar_mode;

  // The signals that are currently on the bus.
  ull curr_ad[2];
  short curr_advalid;
  int curr_adp;
  int curr_adtype;
  char curr_change;

  // The signals that are going to be driven onto the bus.
  byte next_req_r;
  ull next_ad[2];
  ull next_ad_r[2];
  short next_advalid;
  short next_advalid_r;
  int next_adp;
  int next_adp_r;
  int next_adtype;
  int next_adtype_r;
  int next_pack_r;
  char next_change;
  char next_change_r;
  char next_rst;
  char next_rst_r;
  char next_por;
  char next_por_r;

  // Starting command programs.
  LinkedList<PlusArg> *sjm_program_arg_list;
  void sjmStartCmdProgram();

  // Variables and routines for processing incoming information.
  int in_state;
  int in_prev;
  int in_ttype;
  ull in_addr;
  byte in_active;
  byte in_sampling;
  int in_cyclecnt;
  int in_ordercnt;
  ReadBuffEntry *in_orbe;
  void sjmProcessInSigs();

  // This set of variables and routines handles executing commands from the
  // command file.
  Command *rdr_currCmd;
  Command *rdr_buswait;
  int rdr_waitcnt;
  Transaction *rdr_trans;
  Transaction *rdr_wbtrans;
  int rdr_timeout;
  int rdr_timeout_cnt;
  char rdr_first;
  int sjmCycle();
  int multiple_ids;
  int rdrNextCmd();
  void rdrCheckCache();
  int rdrAddToReadBuff(int, int);
  Transaction *rdrGenWriteBack();
  int rdrAnyWritePending();
  int rdrWritePending();
  void rdrPrintData(ByteString *, int);

  // Variables and routines for processing the outgoing information.
  int out_state;
  int out_prev;
  int out_cyclecnt;
  int out_ordercnt;
  Queue<Transaction> *out_curr_q;
  Transaction *out_trans;
  short out_bad_parity_cycle;
  ull out_bit4_pattern[2];
  void sjmProcessOutSigs();
  void outSwitchQueues();
  int outHoldForNextTrans();

  // Utility routines.
  void parityCheck(ull);
  char getBit4Pattern();

public:
  // Thrown if there was an initialization problem.
  class BadInitialization { };
  // Thrown if there was a bad plusarg.
  class BadPlusArg { };
  // Thrown if there was a fatal error.
  class FatalInitializationError { };

  SJM(int, char *, LinkedList<PlusArg> *);

  static char *GetFSMState(int);

  void SetPwr();
  void SetPor(int);
  void InputValues(char *, char *, char *, char *, char **, char *, char *, char *);
  char *GetReq();
  char *GetAd();
  char *GetAdp();
  char *GetAdtype();
  char *GetJpack();
  char *GetChange();
  char *GetRst();
  char *GetPor();

  //this is used to kill stuff at the very end of the simulation
  void tidy_up();
  void Reset();
  void StartExecution();
  char *GetExecStatus();

  char *GetInputFSM();
  char *GetArbiter() { return sjm_arb->RTLData(); }
  char *GetSnoopControl() { return sjm_snpctrl->RTLData(); }
  Enumeration<Snoop> *GetSnoopQueue() { return sjm_snpctrl->SnoopQueue(); }
  Enumeration<PackResult> *GetResultsQueue() { return sjm_snpctrl->ResultsQueue(); }
  Enumeration<int> *GetPackQueue(int indx) { return sjm_snpctrl->PackQueue(indx); }
  Enumeration<int> *GetPackOutQueue() { return sjm_snpctrl->PackOutQueue(); }
  Enumeration<MemoryRequest> *GetMemQueue() { return sjm_memctrl->MemoryQueue(); }
  Enumeration<MemoryRequest> *GetIOMemQueue() { return sjm_memctrl->IOMemoryQueue(); }
  Enumeration<ByteString> *GetDataQueue() { return sjm_memctrl->DataQueue(); }
  int GetDataQueueSize() { return sjm_memctrl->DataQueueSize(); }
  ReadBuffEntry *GetReadBuffEntry(int);

  Transaction *GetOutTrans();
  Enumeration<Transaction> *GetOutQueue() { return (Enumeration<Transaction> *) sjm_outq->Elements(); }
  Enumeration<Transaction> *GetRDRQueue() { return (Enumeration<Transaction> *) sjm_rdq->Elements(); };
  char *GetOutState();

  int GetAgentID() { return agent_id; }
  char *GetTestName() { return sjm_parser->prs_filename; }
  int GetType() { return sjm_type; }
  int InRange(ull addr) { return sjm_memctrl->InRange(addr); }
};
