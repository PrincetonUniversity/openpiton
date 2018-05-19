// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Parser.h
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
//------------------------------------------------------------------------------
//
// Description:  Parser and command interpreter for SJM.
//
//------------------------------------------------------------------------------

#include <ctype.h>
#include <fstream>
#include <wait.h>
#include "globals.h"
#include "JBus.h"
#include "Command.h"
#include "StringTokenizer.h"

#ifndef PARSER_H
#define PARSER_H

// For transaction command processing.
#define P_ADDR_N 0x01
#define P_MASK_R 0x02
#define P_SIZE_O 0x04
#define P_SIZE_R 0x08
#define P_DATA_R 0x10



class Parser {
private:
  char *modname;
  Command *prs_firstCmd;
  Command *prs_lastCmd;
  Command *prs_currCmd;

  // Stuff needed during parsing that needs to be accessed by other functions.
  FILE *_prs_inputfp;
  int _prs_linecnt;
  LinkedList<Command> *_prs_labellist;
  char *_prs_label;
  StringTokenizer *_prs_cmdtok;

public:
  // The name of the file being parsed.
  char *prs_filename;
  ull prs_iosync_addr;
  byte prs_deadcycle_mode;
  byte prs_estar_mode;
  //!!! supports only 1 address range.
  Range *prs_memrange;
  Range *prs_iorange;

  Parser(char *, char *);
  ~Parser();
  void Reset();
  int Done();
  int ReadFile();
  int ParseMisc(int, StringTokenizer *);
  int ParseAddress(int);
  int ParseReadWrite(Command *, StringTokenizer *, int, int);
  Command *GetCmd();
  Command *GetNextCmd();
  Command *GetBranchCmd();
  int AddCmd(Command *cmd);

private:
  int checkForParms(StringTokenizer *);
  int checkForGarbage(StringTokenizer *);
  int parseAddressEnable(Command *);
};


#endif // PARSER_H
