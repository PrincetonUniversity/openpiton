// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: Parser.cc
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
// Description:  Parser and command interpreter for SJM.
//
//------------------------------------------------------------------------------

#include "Parser.h"


//------------------------------------------------------------------------------
// Constructor.
Parser::Parser(char *name, char *filename)
{
  modname = new char[strlen(name)+1];
  strcpy(modname, name);

  if (filename) {
    prs_filename = new char[strlen(filename)+1];
    strcpy(prs_filename, filename);
  } else {
    prs_filename = NULL;
  }

  prs_iosync_addr = -1;
  prs_deadcycle_mode = -1;
  prs_estar_mode = -1;

  prs_firstCmd = NULL;
  prs_lastCmd = prs_firstCmd;
  prs_currCmd = prs_firstCmd;

  _prs_linecnt = -1;
  _prs_labellist = NULL;
  _prs_label = NULL;
  _prs_cmdtok = NULL;
}


//------------------------------------------------------------------------------
// Destructor.
Parser::~Parser()
{
  delete modname;
  if (prs_filename) {
    delete prs_filename;
  }

  if (prs_firstCmd) {
    Command *cmdptr = prs_firstCmd;
    Command *n;
    while (cmdptr != prs_lastCmd) {
      n = cmdptr->nextCmd;
      delete cmdptr;
      cmdptr = n;
    }
    delete cmdptr;
  }
  if (_prs_labellist) {
    delete _prs_labellist;
  }
  if (_prs_label) {
    delete _prs_label;
  }
  if (_prs_cmdtok) {
    delete _prs_cmdtok;
  }
}


//------------------------------------------------------------------------------
// Reset. Go back to the beginning of the command file.
void Parser::Reset()
{
  prs_currCmd = prs_firstCmd;
}


//------------------------------------------------------------------------------
// Checks if the parser is done. We're only done if we're at a DONE command.
int Parser::Done()
{
  if (prs_currCmd) {
    if (prs_currCmd->cmd == CMD_DONE) {
      return 1;
    }
  }
  return 0;
}


//------------------------------------------------------------------------------
// Compiles the input file. The file once to filter out arguments and to count
// the total number of commands. It is then read again to parse the commands
// and store them in the array. If an error is found, returns the line number
// of the bad instruction; otherwise returns 0.
int Parser::ReadFile()
{
  if (!prs_filename) {
    return -1;
  }

  int id = -1;
  int bufsize = 2048;
  int errorcnt = 0;
  int errorchk;
  int checkval;
  char inbuf[2048];
  char *cmdptr, *strptr, *str;
  char *delim = " \t\n";
  char *lastlabel = NULL;

  Command *pCmd, *nCmd = NULL;
  Enumeration<Command> *en;

  if (!(_prs_inputfp = fopen(prs_filename, "r"))) {
    dprintf(modname, 49, 4, "Couldn't open file %s.", prs_filename);
    return -1;
  }

  // A list for storing commands that have a label.
  LinkedList<Command> *labellist = new LinkedList<Command>();

  _prs_linecnt = 0;

  while (fgets(inbuf, bufsize, _prs_inputfp)) {
    _prs_linecnt++;

    if (_prs_cmdtok) {
      delete _prs_cmdtok;
      _prs_cmdtok = NULL;
    }

    // Skip comments and blank lines.
    if ((inbuf[0] == '#') || (strspn(inbuf, " \t\n") == strlen(inbuf))) {
      continue;
    }

    // Configuration information must come first.
    if (id < 0) {
      // Start a new tokenizer.
      _prs_cmdtok = new StringTokenizer(inbuf, delim);
      cmdptr = _prs_cmdtok->GetToken();

      if (strcmp(cmdptr, "CONFIG")) {
	return -1;
      }
      // First parameter must be the id.
      if (!strcmp(_prs_cmdtok->GetToken(" \t\n="), "id")) {
	id = atoi(_prs_cmdtok->GetToken());
      } else {
	dprintf(modname, 0, 0, "LINE %d: Illegal argument.");
	errorcnt++;
      }
      errorcnt += ParseMisc(CMD_CONFIG, _prs_cmdtok);
      continue;
    }

    // Start a new tokenizer.
    _prs_cmdtok = new StringTokenizer(inbuf, delim);
    cmdptr = _prs_cmdtok->GetToken();

    if (!strcmp(cmdptr, "ADDRESS")) {
      // This does not generate a command.
      errorcnt += ParseAddress(CMD_ADDRESS);
      continue;

    } else if (!strcmp(cmdptr, "CADDRESS")) {
      // This does not generate a command.
      errorcnt += ParseAddress(CMD_ADDRESS);
      continue;

    } else if (!strcmp(cmdptr, "IOADDRESS")) {
      // This does not generate a command.
      errorcnt += ParseAddress(CMD_IOADDRESS);
      continue;
    }

    // Check for labels. The next pass through here assigns the label to the
    // command that follows it. For multiple labels specified with no commands
    // in between the last one is used.
    int strsize = strlen(cmdptr) - 1;
    if (cmdptr[strsize] == ':') {
      if (lastlabel) {
	delete lastlabel;
      }
      lastlabel = new char[strsize + 1];
      strncpy(lastlabel, cmdptr, strsize);
      lastlabel[strsize] = NULL;
      // Check for duplicate labels.
      en = (Enumeration<Command> *) labellist->Elements();
      errorchk = errorcnt;
      for (Command *c = (Command *) en->NextElement(); en->HasMoreElements() || c; c = (Command *) en->NextElement()) {
	if (!strcmp(c->label, lastlabel)) {
	  dprintf(modname, 0, 0, "LINE %d: Duplicate label '%s' found.", _prs_linecnt, lastlabel);
	  errorcnt++;
	}
      }
      if (errorchk != errorcnt) {
	delete lastlabel;
	lastlabel = NULL;
      }
      errorcnt += checkForGarbage(_prs_cmdtok);
      continue;
    }

    // At this point we know we're going to generate a new command.
    nCmd = new Command();
    if (!nCmd->SetCommand(cmdptr)) {
      // The command is not known. Remove the unwanted object.
      dprintf(modname, 0, 0, "LINE %d: Unrecognized command %s.", _prs_linecnt, cmdptr);
      errorcnt++;
//       delete nCmd;
      continue;
    }
    if (lastlabel) {
      // Assign the last label found to this command.
      strcpy(nCmd->label, lastlabel);
      labellist->Append(nCmd);
      delete lastlabel;
      lastlabel = NULL;
    }

    if ((nCmd->cmd == CMD_PRINT) || (nCmd->cmd == CMD_ERROR)) {
      // These have to be handled differently. The delimiter has to be changed.
      nCmd->AddMessage(_prs_cmdtok->GetToken("\n"));

    } else if ((nCmd->cmd == CMD_IOSYNC) || (nCmd->cmd == CMD_FLUSH) || (nCmd->cmd == CMD_DONE)) {
      // These commands have no parameters.
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_TIMEOUT) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->cycles = atoi(_prs_cmdtok->GetToken());
      // Grab optional register specification.
      if (_prs_cmdtok->HasMoreTokens()) {
	if (!nCmd->CheckOptArg(_prs_cmdtok->GetToken())) {
	  dprintf(modname, 0, 0, "LINE %d: Invalid argument '%s'.", _prs_linecnt, strptr);
	}
	errorcnt += checkForGarbage(_prs_cmdtok);
      }

    } else if (nCmd->cmd == CMD_WAIT) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->cycles = atoi(_prs_cmdtok->GetToken());
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_ARBWAIT) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      strptr = _prs_cmdtok->GetToken();
      if (!strcmp(strptr, "any")) {
	nCmd->waitID = -1;
      } else {
	nCmd->waitID = atoi(strptr);
	if ((nCmd->waitID < 0) || (nCmd->waitID >= G_MAXPORTS)) {
	  dprintf(modname, 0, 0, "LINE %d: Invalid id for ARBWAIT.", _prs_linecnt);
	  errorcnt++;
//        delete nCmd;
	  continue;
	}
      }
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if ((nCmd->cmd == CMD_TOADDRESS) || (nCmd->cmd == CMD_BEADDRESS) ||
	       (nCmd->cmd == CMD_SEADDRESS) || (nCmd->cmd == CMD_APADDRESS)) {
      errorcnt += parseAddressEnable(nCmd);

    } else if (nCmd->cmd == CMD_APERROR) { 
      //address parity error on a 64 byte addr or a transaction
      if (_prs_cmdtok->NumTokens() < 3) {
	dprintf(modname, 0, 0, "LINE %d: Additional parameter(s) required.", _prs_linecnt);
	errorcnt++;
	continue;
      }
      strptr = _prs_cmdtok->GetToken();
      if (isdigit(strptr[0])) {
	nCmd->AddAddress(strptr);
	nCmd->reg2 = 0;
      } else if (strcmp(strptr, "RD") && strcmp(strptr, "RDD") && strcmp(strptr, "RDS") &&
		 strcmp(strptr, "RDSA") && strcmp(strptr, "RDO") && strcmp(strptr, "OWN") &&
		 strcmp(strptr, "INV") && strcmp(strptr, "INV") && strcmp(strptr, "NCWRC") &&
		 //strcmp(strptr, "CWR") && /*new trans for niagara support*/
		 strcmp(strptr, "WRM") && /*new trans for niagara support*/
		 strcmp(strptr, "WRB") && strcmp(strptr, "WRBC") && strcmp(strptr, "WRI") &&
		 strcmp(strptr, "WRIS") && strcmp(strptr, "NCRD") && strcmp(strptr, "NCBRD") &&
		 strcmp(strptr, "NCWR") && strcmp(strptr, "NCBWR") && strcmp(strptr, "ALL")) {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter, '%s'", _prs_linecnt, strptr);
	errorcnt++;
      } else if (!strcmp(strptr, "ALL")) {
	nCmd->waitID = 0x100;
	nCmd->reg2 = 1;
      } else {
	nCmd->AddTransaction(strptr);
	nCmd->reg2 = 1;
      }
      if (!nCmd->SetOnOff(_prs_cmdtok->GetToken())) {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter '%s'", _prs_linecnt, strptr);
	errorcnt++;
      }
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_APCHECK) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      if (!nCmd->SetOnOff(_prs_cmdtok->GetToken())) {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter '%s'.", _prs_linecnt, strptr);
	errorcnt++;
      }
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_ECCERROR) {
      if (_prs_cmdtok->NumTokens() < 4) {
	dprintf(modname, 0, 0, "LINE %d: Additional parameter(s) required.", _prs_linecnt);
	errorcnt++;
	continue;
      }
      nCmd->AddAddress(_prs_cmdtok->GetToken());
      strptr = _prs_cmdtok->GetToken();
      if (!strcmp(strptr, "correct")) {
	nCmd->reg2 = ECC_CORRECT;
      } else if (!strcmp(strptr, "uncorrect")) {
	nCmd->reg2 = ECC_UNCORRECT;     
      } else if (!strcmp(strptr, "both")) {
	nCmd->reg2 = ECC_CORRECT | ECC_UNCORRECT;
      } else {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter '%s'.", _prs_linecnt, strptr);
	errorcnt++;
      }
      nCmd->SetOnOff(_prs_cmdtok->GetToken());
      errorcnt += errorchk;
//    can't use reg1 - used by above. Fix later.
      nCmd->mask = 0;
      strptr = _prs_cmdtok->GetToken();
      if (strptr){
	if (!strcmp(strptr, "norand"))
	  nCmd->mask = 1;
	else if (!strcmp(strptr, "rand"));
	else
	  dprintf(modname, 0, 0, "LINE %d: Invalid parameter '%s'.", _prs_linecnt, strptr);
      }
      nCmd->dvalid = -1;
      strptr = _prs_cmdtok->GetToken();
      if (strptr){
	if (!strcmp(strptr, "jid")){
	  strptr = _prs_cmdtok->GetToken();
	  if (strptr[0] == '<'){
	    nCmd->dvalid = atoi(strptr+1) & ECC_JID_MASK;
	    nCmd->dvalid = nCmd->dvalid | ECC_JID_TYPE_BIT;
	  }else
	    nCmd->dvalid = atoi(strptr) & ECC_JID_MASK;
	}else
	  dprintf(modname, 0, 0, "LINE %d: Invalid parameter '%s'.", _prs_linecnt, strptr);
      }
    } else if (nCmd->cmd == CMD_FLIPBITS) {
      if (_prs_cmdtok->NumTokens() < 3) {
	dprintf(modname, 0, 0, "LINE %d: Additional parameter(s) required.", _prs_linecnt);
	errorcnt++;
	continue;
      }
      nCmd->AddAddress(_prs_cmdtok->GetToken());
      if (!nCmd->SetOnOff(_prs_cmdtok->GetToken())) {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter.", _prs_linecnt);
	errorcnt++;
	continue;
      }
      errorchk = errorcnt;
      int darray[16];
      for (int i = 0; i < 16; i++) {
	darray[i] = 0;
      }
      for (strptr = _prs_cmdtok->GetToken(); strptr || _prs_cmdtok->HasMoreTokens(); strptr = _prs_cmdtok->GetToken()) {
	if (!strcmp(strptr, "+")) {
	  // Get the next line and continue.
	  delete _prs_cmdtok;
	  _prs_cmdtok = new StringTokenizer(fgets(inbuf, bufsize, _prs_inputfp), "\t\n=");
	  _prs_linecnt++;
	} else {
	  checkval = atoi(strptr);
	  if (checkval > 512) {
	    dprintf(modname, 0, 0, "LINE %d: Invalid parameter '%s'", strptr);
	    errorcnt++;
	  } else {
	    // 0-th bit is on the left.
	    darray[checkval / 32] |= 1 << (31 - (checkval % 32));
	  }
	}
      }
      for (int j = 0; j < 16; j++) {
	nCmd->AddData(darray[j]);
      }

    } else if ((nCmd->cmd == CMD_BUSCHECK) || (nCmd->cmd == CMD_BUSWAIT)) {
      if (_prs_cmdtok->NumTokens() < 6) {
	dprintf(modname, 0, 0, "LINE %d: Additional parameter(s) required.", _prs_linecnt);
	errorcnt++;
	continue;
      }
      // First parameter is a command.
      nCmd->AddTransaction(_prs_cmdtok->GetToken());

      // Second parameter is the address.
      nCmd->AddAddress(_prs_cmdtok->GetToken());

      // Third parameter is the mask.
      nCmd->AddMask(_prs_cmdtok->GetToken());

      // Fourth parameter is the j_adtype.
      int tmp0, tmp1 = 0;
      strptr = _prs_cmdtok->GetToken();
      for (int i = 2; i < 4; i++) {
	// Take out x's and make a mask.
	tmp1 <<= 1;
	if ((strptr[i] == 'x') || (strptr[i] == 'X')) {
	  strptr[i] = '0';
	} else {
	  tmp1 |= 1;
	}
      }
      sscanf(strptr, "%x", &tmp0);
      nCmd->reg1 = (short) tmp0;
      nCmd->reg2 = (short) tmp1;

      // Fifth parameter is the timeout.
      if (strcmp(_prs_cmdtok->GetToken(" \t\n="), "time")) {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter", _prs_linecnt);
	errorcnt++;
	continue;
      }
      nCmd->cycles = atoi(_prs_cmdtok->GetToken());

      // Optional sixth parameter.
      if (_prs_cmdtok->HasMoreTokens() && (nCmd->cmd == CMD_BUSWAIT)) {
	if (!nCmd->CheckOptArg(_prs_cmdtok->GetToken())) {
	  dprintf(modname, 0, 0, "LINE %d: Invalid paramter.", _prs_linecnt);
	  errorcnt++;
	}
      }
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if ((nCmd->cmd == CMD_BNE) || (nCmd->cmd == CMD_BE) || (nCmd->cmd == CMD_BA) || (nCmd->cmd == CMD_BI) || (nCmd->cmd == CMD_BNI) || (nCmd->cmd == CMD_BIA) || (nCmd->cmd == CMD_BNIA) || (nCmd->cmd == CMD_BD) || (nCmd->cmd == CMD_BND)) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt++;
	continue;
      }
      // Label is saved for second pass.
      sprintf(nCmd->tolabel, _prs_cmdtok->GetToken());
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_CMP) {
      if (_prs_cmdtok->NumTokens() < 3) {
	dprintf(modname, 0, 0, "LINE %d: Additional parameter(s) required.", _prs_linecnt);
	errorcnt++;
	continue;
      }
      strptr = _prs_cmdtok->GetToken();
      if (strptr[0] != 'R') {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter.", _prs_linecnt);
	errorcnt++;
//      delete nCmd;
	continue;
      }
      nCmd->reg1 = atoi(&(strptr[1]));
      strptr = _prs_cmdtok->GetToken();
      if (strptr[0] != 'R') {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter.", _prs_linecnt);
	errorcnt++;
//      delete nCmd;
	continue;
      }
      nCmd->reg2 = atoi(&(strptr[1]));
      if (_prs_cmdtok->HasMoreTokens()) {
	if (!nCmd->CheckOptArg(_prs_cmdtok->GetToken())) {
	  dprintf(modname, 0, 0, "LINE %d: Invalid parameter.", _prs_linecnt);
	  errorcnt++;
	}
      }
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_SYNC) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      LinkedList<int> *synclist = new LinkedList<int>();
      int *id;
      for (strptr = _prs_cmdtok->GetToken(); strptr; strptr = _prs_cmdtok->GetToken()) {
	// Count the ids first.
	int *id = new int;
	*id = atoi(strptr);
	synclist->Append(id);
      }
      nCmd->sync_ids = new int[synclist->Size() + 1];
      int i = 0;
      nCmd->sync_ids[i++] = synclist->Size();
      for (id = synclist->CurrentNode(); synclist->HasMoreNodes(); id = synclist->NextNode()) {
	nCmd->sync_ids[i++] = *id;
      }
      nCmd->sync_ids[i] = *id;
      delete synclist;

    } else if (nCmd->cmd == CMD_SEED) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->cycles = atoi(_prs_cmdtok->GetToken());
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_INTACK) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->cycles = atoi(_prs_cmdtok->GetToken());
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_INTMODE) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      strptr = _prs_cmdtok->GetToken();
      if (strcmp(strptr, "1") && strcmp(strptr, "2")) {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter.", _prs_linecnt);
	errorcnt++;
//      delete nCmd;
	continue;
      }
      nCmd->cycles = atoi(strptr);

    } else if (nCmd->cmd == CMD_INTACCEPT) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->cycles = atoi(_prs_cmdtok->GetToken());
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_DISPLAY_ECTAG) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->AddAddress(_prs_cmdtok->GetToken());
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_BUSERROR) {
      if (_prs_cmdtok->NumTokens() < 5) {
	dprintf(modname, 0, 0, "LINE %d: Additional parameter(s) required.", _prs_linecnt);
	errorcnt++;
	continue;
      }
      sscanf(_prs_cmdtok->GetToken(), "%x", &nCmd->waitID);
//       if (get_trans_type(nCmd->waitID)) {
//      dprintf(modname, 0, 0, "LINE %d: Invalid parameter.", _prs_linecnt);
//      errorcnt++;
//       } 
      nCmd->AddAddress(_prs_cmdtok->GetToken());
      nCmd->AddMask(_prs_cmdtok->GetToken());
      int tmp;
      sscanf(_prs_cmdtok->GetToken(), "%x", &tmp);
      nCmd->reg1 = (short) tmp;
      nCmd->reg2 = 0;
      if (_prs_cmdtok->NumTokens() > 5) {
	if (!strcmp(_prs_cmdtok->GetToken(), "multi")){
	  dprintf(modname, 0, 0, "LINE %d: multi line buserror command specified.", _prs_linecnt);
	  nCmd->reg2 = 1;
	}
      }
      errorcnt+= checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_CACHESTATE) {
      if (_prs_cmdtok->NumTokens() < 4) {
	dprintf(modname, 0, 0, "LINE %d: Additional parameter(s) required.", _prs_linecnt);
	errorcnt++;
	continue;
      }
      nCmd->AddAddress(_prs_cmdtok->GetToken());
      strptr = _prs_cmdtok->GetToken();
      if (!strcmp(strptr, "M")) {
	nCmd->reg2 = CSTATE_M;
      } else if (!strcmp(strptr, "O")) {
	nCmd->reg2 = CSTATE_O;
      } else if (!strcmp(strptr, "E")) {
	nCmd->reg2 = CSTATE_E;
      } else if (!strcmp(strptr, "S")) {
	nCmd->reg2 = CSTATE_S;
      } else if (!strcmp(strptr, "I")) {
	nCmd->reg2 = CSTATE_I;
      } else {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter '%s'", _prs_linecnt, strptr);
	errorcnt++;
      }
      nCmd->SetOnOff(_prs_cmdtok->GetToken());

    } else if (nCmd->cmd == CMD_READINT) {
      // These commands have optional data and no address.
      errorchk = ParseReadWrite(nCmd, _prs_cmdtok, 0, P_ADDR_N | P_DATA_R);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->SetSize("64");

    } else if (nCmd->cmd == CMD_INV) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      strptr = _prs_cmdtok->GetToken();
      if (strptr[0] != 'R') {
	dprintf(modname, 0, 0, "LINE %d: Invalid parameter.", _prs_linecnt);
	errorcnt++;
	continue;
      }
      nCmd->reg1 = atoi(&(strptr[1]));
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if ((nCmd->cmd == CMD_AOK) || (nCmd->cmd == CMD_DOK)) {
      errorchk = checkForParms(_prs_cmdtok);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->SetOnOff(_prs_cmdtok->GetToken());
      if (_prs_cmdtok->HasMoreTokens()) {
	nCmd->cycles = atoi(_prs_cmdtok->GetToken());
      } else {
	nCmd->cycles = 1;
      }
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if (nCmd->cmd == CMD_XIR) {
      // Takes no arguments.
      errorcnt += checkForGarbage(_prs_cmdtok);

    } else if ((nCmd->cmd == CMD_IFETCH) || (nCmd->cmd == CMD_READ) || (nCmd->cmd == CMD_OWN) || (nCmd->cmd == CMD_READIO)) {
      // For these commands size and data are optional.
      errorchk = ParseReadWrite(nCmd, _prs_cmdtok, 0x3f, P_SIZE_O);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }

    } else if ((nCmd->cmd == CMD_WRITE) || (nCmd->cmd == CMD_WRITEIO) || (nCmd->cmd == CMD_LOCK)) {
      // For these commands size and data are required. 
      errorchk = ParseReadWrite(nCmd, _prs_cmdtok, 0x3f, P_SIZE_R);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      if (nCmd->cmd == CMD_LOCK) {
	// Undo size manipulation from Command.
	nCmd->size /= 2;
	// Set to supress mismatch errors in the read buffer.
	nCmd->setcc = 1;
	//DW 120400 - we don't want to do this - might alter significant data. Moved this to the readreturn buffer code
	//which sets locks bytes after comparison
	// Fill with 1's.
	// nCmd->AddData(nCmd->size, "0xff");
	// for (int i = 1; i < nCmd->size; i++) {
	//   nCmd->AddData("0xff");
	// }
      }

    } else if ((nCmd->cmd == CMD_READBLK) || (nCmd->cmd == CMD_READBLKIO)) {
      // These commands have optional data only.
      errorchk = ParseReadWrite(nCmd, _prs_cmdtok, 0x3f, 0);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }

    } else if ((nCmd->cmd == CMD_WRITEBLK) || (nCmd->cmd == CMD_WRITEBLKIO) || (nCmd->cmd == CMD_INT)) {
      // These commands require data only.
      errorchk = ParseReadWrite(nCmd, _prs_cmdtok, 0x3f, P_DATA_R);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }

    } else if (nCmd->cmd == CMD_READMSKIO) {
      // These commands have a mask and optional data.
      errorchk = ParseReadWrite(nCmd, _prs_cmdtok, 0x30, P_MASK_R);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->SetSize("16");

    } else if (nCmd->cmd == CMD_WRITEMSKIO) {
      // These commands have a mask and require data.
      errorchk += ParseReadWrite(nCmd, _prs_cmdtok, 0x30, P_MASK_R | P_DATA_R);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
      nCmd->SetSize("16");

//    } else if (nCmd->cmd == CMD_SUBWRITE) { /*Niagara support  16byte aligned coherent write*/
//      // These commands have a mask and require data.
//      errorchk += ParseReadWrite(nCmd, _prs_cmdtok, 0x30, P_MASK_R | P_DATA_R);
//      if (errorchk) {
//	errorcnt += errorchk;
//	continue;
//      }
//      nCmd->SetSize("16");
//
    } else if (nCmd->cmd == CMD_WRITEMSK) { /*Niagara support 64B coherent write under mask*/
      // This command requires data and a mask.
      errorchk += ParseReadWrite(nCmd, _prs_cmdtok, 0x3f, P_MASK_R | P_DATA_R);
      if (errorchk) {
	errorcnt += errorchk;
	continue;
      }
    }  else {
      dprintf(modname, 0, 0, "LINE %d: Unrecognized command.", _prs_linecnt);
      errorcnt++;
//       delete nCmd;
      continue;
    }
    // Add the command to the list.
    AddCmd(nCmd);
    // If a DONE was found, stop parsing.
    if (prs_lastCmd->cmd == CMD_DONE) {
      break;
    }
  }
  fclose(_prs_inputfp);

  // Second pass. Match the labels for branch commands.
  _prs_linecnt = 0;
  for (nCmd = prs_firstCmd, pCmd = prs_firstCmd; nCmd; _prs_linecnt++) {
    if ((nCmd->cmd == CMD_BNE) || (nCmd->cmd == CMD_BE) || (nCmd->cmd == CMD_BA) || (nCmd->cmd == CMD_BI) || (nCmd->cmd == CMD_BNI) || (nCmd->cmd == CMD_BIA) || (nCmd->cmd == CMD_BNIA)) {
      en = (Enumeration<Command> *) labellist->Elements();
      for (Command *c = (Command *) en->NextElement(); en->HasMoreElements() || c; c = (Command *) en->NextElement()) {
	if (!strcmp(c->label, nCmd->tolabel)) {
	  nCmd->branchCmd = c;
	  break;
	}
      }
      delete en;
      if (!nCmd->branchCmd) {
	dprintf(modname, 0, 0, "LINE %d: No matching label found for branch.", _prs_linecnt);
	errorcnt++;
      }
    }
    nCmd = pCmd->nextCmd;
    pCmd = nCmd;
  }
  delete labellist;

  if (errorcnt > 0) {
    dprintf(modname, 49, 4, "Found %d error(s) in command file %s.", errorcnt, prs_filename);
    return -1;
  }

  // If no commands were found, put in single DONE command.
  if (!prs_firstCmd) {
    prs_firstCmd = new Command();
    prs_firstCmd->cmd = CMD_DONE;
    prs_lastCmd = prs_firstCmd;
  }
  // If the last command is not DONE, add one.
  if (prs_lastCmd->cmd != CMD_DONE) {
    nCmd = new Command();
    nCmd->cmd = CMD_DONE;
    prs_lastCmd->nextCmd = nCmd;
    prs_lastCmd = nCmd;
  }
  prs_currCmd = prs_firstCmd;
  return id;
}


//------------------------------------------------------------------------------
// Parse miscelaneous formats. Returns a count of the number of errors found.
int Parser::ParseMisc(int cmd, StringTokenizer *parmstok)
{
  int errorcnt = 0;

  if (cmd == CMD_CONFIG) {
    for (char *str = parmstok->GetToken(); parmstok->HasMoreTokens(); str = parmstok->GetToken()) {
      if (!strcmp(str, "iosyncadr")) {
	sscanf(parmstok->GetToken(), "%llx", &prs_iosync_addr);
      } else if (!strcmp(str, "deadcycle")) {
	str = parmstok->GetToken();
	if (!strcmp(str, "on")) {
	  prs_deadcycle_mode = 1;
	} else if (!strcmp(str, "off")) {
	  prs_deadcycle_mode = 0;
	} else {
	  dprintf(modname, 0, 0, "LINE %d: Illegal argument '%s'.", _prs_linecnt, str);
	  errorcnt++;
	}
      } else if (!strcmp(str, "estar")) {
	prs_estar_mode = atoi(parmstok->GetToken());
	if ((prs_estar_mode != ESTAR_SPEED1) && (prs_estar_mode != ESTAR_SPEED2) && (prs_estar_mode != ESTAR_SPEED32)) {
	  dprintf(modname, 0, 0, "LINE %d: Illegal argument.", _prs_linecnt);
	  errorcnt++;
	}
      } else if (!strcmp(str, "arbnum")) {
	parmstok->GetToken();
	//!!! unsupported
      } else if (!strcmp(str, "l1")) {
	parmstok->GetToken();
	//!!! unsupported
      } else if (!strcmp(str, "l2")) {
	parmstok->GetToken();
	//!!! unsupported
      } else if (!strcmp(str, "snoopdelay")) {
	parmstok->GetToken();
	//!!! unsupported
      } else if (!strcmp(str, "ssm")) {
	//!!! unsupported
      } else if (!strcmp(str, "ecc")) {
	parmstok->GetToken();
	//!!! unsupported
      } else {
	dprintf(modname, 0, 0, "LINE %d: Illegal argument '%s'.", _prs_linecnt, str);
	errorcnt++;
      }
    }
  }
  return errorcnt;
}


//------------------------------------------------------------------------------
// Parse an address command. Returns the number of errors found.
int Parser::ParseAddress(int which)
{
  if (!_prs_cmdtok) {
    dprintf(modname, 49, 0, "CODE ERROR: string tokenizer is not valid.");
    return 1;
  }

  ull addrstart, addrend;
  char *str;

  // Start address.
  if (!(str = _prs_cmdtok->GetToken())) {
    dprintf(modname, 0, 0, "LINE %d: No start address specified.", _prs_linecnt);
    return 1;
  }
  sscanf(str, "%llx", &addrstart);
  // End address.
  if (!(str = _prs_cmdtok->GetToken())) {
    dprintf(modname, 0, 0, "LINE %d: No end address specified.", _prs_linecnt);
    return 1;
  }
  sscanf(str, "%llx", &addrend);
  //!!!
  if (_prs_cmdtok->HasMoreTokens()) {
    dprintf(modname, 0, 0, "LINE %d: Garbage found.", _prs_linecnt);
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Parse the parameters for a transaction-generating command.
int Parser::ParseReadWrite(Command *cmd, StringTokenizer *parmstok, int align, int opts)
{
  int err = 0;
  char *str;
  int bufsize = 2084;
  char inbuf[2084];

  if (checkForParms(parmstok)) {
    return 1;
  }
  // Address.
  if (!(opts & P_ADDR_N)) {
    cmd->AddAddress(parmstok->GetToken());
  }

  // At least one more parameter is required.
  if ((opts & (P_MASK_R | P_SIZE_R | P_DATA_R)) && checkForParms(parmstok)) {
    return ++err;
  } else if (!(opts & (P_MASK_R | P_SIZE_R | P_DATA_R)) && !parmstok->HasMoreTokens()) {
    return 0;
  }
  if (opts & P_MASK_R) {
    // Mask.
    if (!cmd->AddMask(parmstok->GetToken())) {
      dprintf(modname, 0, 0, "LINE %d: Invalid mask.", _prs_linecnt);
      err++;
    }
  } else if (opts & P_SIZE_R) {
    // Size.
    if (!cmd->SetSize(parmstok->GetToken())) {
      dprintf(modname, 0, 0, "LINE %d: Invalid size.", _prs_linecnt);
      err++;
    }
    // Data is automatically required.
    opts |= P_DATA_R;
  } else if (opts & P_SIZE_O) {
    // Check optional parameters first.
    str = parmstok->GetToken();
    if (!cmd->CheckOptArg(str)) {
      if (!cmd->SetSize(str)) {
	dprintf(modname, 0, 0, "LINE %d: Invalid size.", _prs_linecnt);
	err++;
      }
    }
  }

  // At least one more parameter is required.
  if ((opts & P_DATA_R) && checkForParms(parmstok)) {
    return ++err;
  }

  // Data.
  for (str = parmstok->GetToken(); str || parmstok->HasMoreTokens(); str = parmstok->GetToken()) {
    if (!cmd->CheckOptArg(str)) {
      if (cmd->HasOptParms()) {
	// Nothing is allowed after the optional parameters.
	err += checkForGarbage(_prs_cmdtok);
	break;
      } 
      if (!strcmp(str, "+")) {
	// Get the next line and continue.
	delete parmstok;
	parmstok = new StringTokenizer(fgets(inbuf, bufsize, _prs_inputfp), " \t\n=");
	_prs_linecnt++;
	err += checkForParms(parmstok);
      } else if (!cmd->dvalid) {
	// First data fragment must align the rest of the data.
	if (!cmd->AddData(cmd->addr & align, str)) {
	  dprintf(modname, 0, 0, "LINE %d: Invalid data.", _prs_linecnt);
	  err++;
	  break;
	}
      } else if (!cmd->AddData(str)) {
	dprintf(modname, 0, 0, "LINE %d: Invalid data.", _prs_linecnt);
	err++;
	break;
      }
    }
  }
//   cmd->FixData();

  return err;
}


//------------------------------------------------------------------------------
// Returns the current command.
Command *Parser::GetCmd()
{
  return prs_currCmd;
}


//------------------------------------------------------------------------------
// Advances to the next command and returns it.
Command *Parser::GetNextCmd()
{
  if (prs_currCmd) {
    Command *ptr = prs_currCmd->nextCmd;
    prs_currCmd = ptr;
  }
  return prs_currCmd;
}


//------------------------------------------------------------------------------
// Advances to the branch command and then returns it.
Command *Parser::GetBranchCmd()
{
  if (prs_currCmd) {
    Command *ptr = prs_currCmd->branchCmd;
    prs_currCmd = ptr;
  }
  return prs_currCmd;
}


//------------------------------------------------------------------------------
// Adds a command to the end of the list. If the last command is DONE, don't
// bother.
int Parser::AddCmd(Command *cmd)
{
  if (!prs_firstCmd) {
    // Adding to an empty list.
    prs_firstCmd = cmd;
    prs_lastCmd = prs_firstCmd;
  } else if (prs_lastCmd->cmd != CMD_DONE) {
      prs_lastCmd->nextCmd = cmd;
      prs_lastCmd = cmd;
  } else {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Check for missing parameters.
int Parser::checkForParms(StringTokenizer *tok)
{
  if (!tok) {
    dprintf(modname, 49, 0, "CODE ERROR: string tokenizer is not valid.");
    return 1;
  }
  if (!tok->HasMoreTokens()) {
    dprintf(modname, 0, 0, "LINE %d: Additional parameter(s) required.", _prs_linecnt);
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Check for garbage.
int Parser::checkForGarbage(StringTokenizer *tok)
{
  if (!tok) {
    dprintf(modname, 49, 0, "CODE ERROR: string tokenizer is not valid.");
    return 1;
  }
  if (tok->HasMoreTokens()) {
    dprintf(modname, 0, 0, "LINE %d: Garbage found.", _prs_linecnt);
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Parse an address and enable combination.
int Parser::parseAddressEnable(Command *cmd)
{
  if (!_prs_cmdtok) {
    dprintf(modname, 49, 0, "CODE ERROR: string tokenizer is not valid.");
    return 1;
  }

  if (_prs_cmdtok->NumTokens() < 3) {
    dprintf(modname, 0, 0, "LINE %d: Additional parameter(s) required.", _prs_linecnt);
    return 1;
  }
  cmd->AddAddress(_prs_cmdtok->GetToken());
  if (!cmd->SetOnOff(_prs_cmdtok->GetToken())) {
    dprintf(modname, 0, 0, "LINE %d: Invalid parameter.", _prs_linecnt);
    return 1;
  }
  return checkForGarbage(_prs_cmdtok);
}
