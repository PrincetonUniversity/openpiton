// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: Command.cc
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

#include "Command.h"


//------------------------------------------------------------------------------
// Constructor. Creates DONE command.
// Size defaults to 4 words to handle commands that don't specify a size.
Command::Command()
{
  cmd = CMD_DONE;
  addr = 0;
  size = 64;
  mask = 0;
  label[0] = NULL;
  reg1 = -1;
  reg2 = -1;
  setcc = 0;
  msg = NULL;
  cycles = -1;
  nextCmd = NULL;
  branchCmd = NULL;
  sync_ids = NULL;
  data = new ByteString(64);
  dvalid = 0;
  waitID = -1;

  cmd_datacnt = 0;
  cmd_datastart = 0;
  cmd_byte = 0;
  cmd_has_opts = 0;
}


//------------------------------------------------------------------------------
// Destructor.
Command::~Command()
{
  if (msg) {
    delete msg;
  }
  delete data;
}


//------------------------------------------------------------------------------
// Set the command. If the command is not supported, returns 0; otherwise
// returns 1.
//
// These commands are not supported:
// - LPA
// - SAFARI_DDELAY
// - SAFARI_DSPLIT
// - DDELAY
// - DSPLIT
// - WBDELAY
// - WBSPLIT
int Command::SetCommand(char *incmd)
{

  printf("DEBUG: incoming command \"%s\"\n", incmd);
  if (!strcmp(incmd, "DONE")) {
    cmd = CMD_DONE;
  } else if (!strcmp(incmd, "WRITE")) {
    cmd = CMD_WRITE;
  } else if (!strcmp(incmd, "READ")) {
    cmd = CMD_READ;
  } else if (!strcmp(incmd, "IFETCH")) {
    cmd = CMD_IFETCH;
  } else if (!strcmp(incmd, "OWN")) {
    cmd = CMD_OWN;
  } else if (!strcmp(incmd, "READIO")) {
    cmd = CMD_READIO;
  } else if (!strcmp(incmd, "WRITEIO")) {
    cmd = CMD_WRITEIO;
  } else if (!strcmp(incmd, "LOCK")) {
    cmd = CMD_LOCK;
  } else if (!strcmp(incmd, "READBLK")) {
    cmd = CMD_READBLK;
  } else if (!strcmp(incmd, "WRITEBLK")) {
    cmd = CMD_WRITEBLK;
  } else if (!strcmp(incmd, "READBLKIO")) {
    cmd = CMD_READBLKIO;
  } else if (!strcmp(incmd, "WRITEBLKIO")) {
    cmd = CMD_WRITEBLKIO;
  } else if (!strcmp(incmd, "INT")) {
    cmd = CMD_INT;
  } else if (!strcmp(incmd, "READMSKIO")) {
    cmd = CMD_READMSKIO;
  } else if (!strcmp(incmd, "WRITEMSKIO")) {
    cmd = CMD_WRITEMSKIO;
//  } else if (!strcmp(incmd, "SUBWRITE")) { /*Niagara support*/
//    cmd = CMD_SUBWRITE;
  } else if (!strcmp(incmd, "WRITEMSK")) { /*Niagara support*/
    cmd = CMD_WRITEMSK;
  } else if (!strcmp(incmd, "READINT")) {
    cmd = CMD_READINT;
  } else if (!strcmp(incmd, "WAIT")) {
    cmd = CMD_WAIT;
  } else if (!strcmp(incmd, "PRINT")) {
    cmd = CMD_PRINT;

  } else if (!strcmp(incmd, "SYNC")) {
    cmd = CMD_SYNC;
  } else if (!strcmp(incmd, "IOSYNC")) {
    cmd = CMD_IOSYNC;
  } else if (!strcmp(incmd, "FLUSH")) {
    cmd = CMD_FLUSH;
  } else if (!strcmp(incmd, "ARBWAIT")) {
    cmd = CMD_ARBWAIT;
  } else if (!strcmp(incmd, "BUSCHECK")) {
    cmd = CMD_BUSCHECK;
  } else if (!strcmp(incmd, "BUSWAIT")) {
    cmd = CMD_BUSWAIT;
  } else if (!strcmp(incmd, "CMP")) {
    cmd = CMD_CMP;
  } else if (!strcmp(incmd, "BNE")) {
    cmd = CMD_BNE;
  } else if (!strcmp(incmd, "BE")) {
    cmd = CMD_BE;
  } else if (!strcmp(incmd, "BA")) {
    cmd = CMD_BA;
  } else if (!strcmp(incmd, "BI")) {
    cmd = CMD_BI;
  } else if (!strcmp(incmd, "BNI")) {
    cmd = CMD_BNI;
  } else if (!strcmp(incmd, "BIA")) {
    cmd = CMD_BIA;
  } else if (!strcmp(incmd, "BNIA")) {
    cmd = CMD_BNIA;
  } else if (!strcmp(incmd, "INTACK")) {
    cmd = CMD_INTACK;
  } else if (!strcmp(incmd, "INTMODE")) {
    cmd = CMD_INTMODE;
  } else if (!strcmp(incmd, "DISPLAY_ECTAG")) {
    cmd = CMD_DISPLAY_ECTAG;
  } else if (!strcmp(incmd, "ERROR")) {
    cmd = CMD_ERROR;
  } else if (!strcmp(incmd, "TIMEOUT")) {
    cmd = CMD_TIMEOUT;
  } else if (!strcmp(incmd, "SEED")) {
    cmd = CMD_SEED;
  } else if (!strcmp(incmd, "INTACCEPT")) {
    cmd = CMD_INTACCEPT;
  } else if (!strcmp(incmd, "APADDRESS")) {
    cmd = CMD_APADDRESS;
  } else if (!strcmp(incmd, "APERROR")) {
    cmd = CMD_APERROR;
  } else if (!strcmp(incmd, "APCHECK")) {
    cmd = CMD_APCHECK;
  } else if (!strcmp(incmd, "ECCERROR")) {
    cmd = CMD_ECCERROR;
  } else if (!strcmp(incmd, "TOADDRESS")) {
    cmd = CMD_TOADDRESS;
  } else if (!strcmp(incmd, "BEADDRESS")) {
    cmd = CMD_BEADDRESS;
  } else if (!strcmp(incmd, "SEADDRESS")) {
    cmd = CMD_SEADDRESS;
  } else if (!strcmp(incmd, "AOK")) {
    cmd = CMD_AOK;
  } else if (!strcmp(incmd, "DOK")) {
    cmd = CMD_DOK;
  } else if (!strcmp(incmd, "XIR")) {
    cmd = CMD_XIR;
  } else if (!strcmp(incmd, "BUSERROR")) {
    cmd = CMD_BUSERROR;
  } else if (!strcmp(incmd, "CACHESTATE")) {
    cmd = CMD_CACHESTATE;
  } else if (!strcmp(incmd, "FLIPBITS")) {
    cmd = CMD_FLIPBITS;
  } else if (!strcmp(incmd, "INV")) {
    cmd = CMD_INV;
  } else if (!strcmp(incmd, "BD")) {
    cmd = CMD_BD;
  } else if (!strcmp(incmd, "BND")) {
    cmd = CMD_BND;

  } else {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Checks that the argument is a valid size. Returns 1 if the size is ok, 0
// otherwise.
int Command::SetSize(char *sval)
{
  int s = atoi(sval);
  return SetSize(s);
}


//------------------------------------------------------------------------------
// Checks that the argument is a valid size.
int Command::SetSize(int s)
{
  size = s;
  if ((size > 16) && ((cmd == CMD_READIO) || (cmd == CMD_WRITEIO))) {
    return 0;
  }
  if (cmd == CMD_LOCK) {
    if (size > 4) {
      return 0;
    }
    // This is so that the data parsing doesn't break.
    size *= 2;
  }
  if ((size != 1) && (size != 2) && (size != 4) && (size != 8) &&
      (size != 16) && (size != 32) && (size != 64)) {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// For enable/disable and on/off parameters.
int Command::SetOnOff(char *arg)
{
  if (!strcmp(arg, "enable") || !strcmp(arg, "ON")) {
    reg1 = 1;
  } else if (!strcmp(arg, "disable") || !strcmp(arg, "OFF")) {
    reg1 = 0;
  } else {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Check an optional argument. Returns 1 if the argument is valid, 0 otherwise.
//
// These optional arguments are not supported:
// - ddelay
// - dsplit
// - wbdelay
// - wbsplit
// - arbwait
int Command::CheckOptArg(char *arg)
{
  int ret = 1;

  if (arg[0] == 'R') {
    if ((cmd != CMD_IFETCH) && (cmd != CMD_READ) && (cmd != CMD_OWN) && (cmd != CMD_READBLK) &&
	(cmd != CMD_READIO) && (cmd != CMD_READBLKIO) && (cmd != CMD_READMSKIO) &&
	(cmd != CMD_TIMEOUT) && (reg1 != -1)) {
      ret = 0;
    } else {
      reg1 = atoi(&arg[1]);
      if ((reg1 < 0) || (reg1 >= 32)) {
	reg1 = -1;
	ret = 0;
      }
    }
  } else if (!strncmp(arg, "repeat=", 7)) {
    if (cmd != CMD_INT) {
      ret = 0;
    } else {
      reg2 = SSP_REPEAT;
      cycles = atoi(&arg[7]);
    }
  } else if (!strcmp(arg, "setcc")) {
    if ((cmd != CMD_IFETCH) && (cmd != CMD_READ) && (cmd != CMD_OWN) &&
	(cmd != CMD_LOCK) && (cmd != CMD_READBLK) && (cmd != CMD_READIO) &&
	(cmd != CMD_READBLKIO) && (cmd != CMD_READMSKIO) && (cmd != CMD_CMP)) {
      ret = 0;
    } else {
      setcc = 1;
    }
  } else if (!strcmp(arg, "queue")) {
    if (cmd != CMD_BUSWAIT) {
      ret = 0;
    } else {
      reg2 = SSP_QUEUE;
    }

  } else if (!strcmp(arg, "nosnoop")) {
    if (cmd != CMD_READ) {
      ret = 0;
    } else {
      reg2 = XTN_NOSNOOP;
    }
  } else if (!strcmp(arg, "compress")) {
    if ((cmd != CMD_WRITEIO) && (cmd != CMD_WRITEMSKIO)) {
      ret = 0;
    } else {
      reg2 = XTN_COMPRESS;
    }
  } else if ((!strncmp(arg, "ddelay=", 7)) ||
	     (!strncmp(arg, "dsplit=", 7)) ||
	     (!strncmp(arg, "wbdelay=", 8)) ||
	     (!strncmp(arg, "wbsplit=", 8)) ||
	     (!strncmp(arg, "arbwait=", 8))) {
    // Not supported, do nothing.
  } else {
    ret = 0;
  }
  if (ret) {
    cmd_has_opts = 1;
  }
  return ret;
}


//------------------------------------------------------------------------------
// Add an address to the command.
void Command::AddAddress(char *str)
{
  if ((str[0] == '0') && ((str[1] == 'x') || (str[1] == 'X'))) {
    sscanf(str, "%llx", &addr);
  } else {
    sscanf(str, "%lld", &addr);
  }
}


//------------------------------------------------------------------------------
// Add data, given a start bye.
int Command::AddData(int start, int d)
{
  cmd_datacnt = start & 0x3c;
  cmd_datastart = cmd_datacnt;
  return AddData(d);
}


//------------------------------------------------------------------------------
// Add data.
int Command::AddData(int d)
{
  if (cmd_datacnt >= (cmd_datastart + size)) {
    return 0;
  }
  data->Set(cmd_datacnt, d);
  cmd_datacnt += 4;
  return 1;
}


//------------------------------------------------------------------------------
// Add data to the command, given a start byte.
int Command::AddData(int start, char *din)
{
  if ((din[0] == '0') && ((din[1] == 'x') || (din[1] == 'X'))) {
    cmd_datacnt = start;
  } else {
    cmd_datacnt = start & 0x3c;
  }
  cmd_datastart = cmd_datacnt;
  return AddData(din);
}


//------------------------------------------------------------------------------
// Add data to this command. Assumes leftmost is 0 and saves data in the order
// it is found in the file.
int Command::AddData(char *din)
{
  dvalid = 1;

  char sval[3];
  int ival;

  if ((din[0] == '0') && ((din[1] == 'x') || (din[1] == 'X'))) {
    int limit = strlen(din);
    for (int i = 2; i < limit; i++) {
      if (cmd_datacnt >= (cmd_datastart + size)) {
	return 0;
      }
      strncpy(sval, &din[i], 1);
      sval[1] = NULL;
      sscanf(sval, "%x", &ival);
      data->AddHalfByte(cmd_datacnt, ival);
      if (cmd_byte) {
	cmd_datacnt++;
	cmd_byte = 0;
      } else {
	cmd_byte = 1;
      }
    }
  } else {
    if (cmd_datacnt >= (cmd_datastart + size)) {
      return 0;
    }
    sscanf(din, "%d", &ival);
    data->Set(cmd_datacnt, ival);
    cmd_datacnt += 4;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Make sure the last byte is correct.
void Command::FixData()
{
  if (!dvalid) {
    return;
  }

  if (cmd_byte) {
    data->AddHalfByte(cmd_datacnt, 0);
    cmd_datacnt++;
    cmd_byte = 0;
  }
}


//------------------------------------------------------------------------------
// Add the mask for IO commands. The mask must be a 2-byte hex value. Returns 0
// if the mask isn't valid, 0 otherwise.
ull Command::AddMask(char *msk)
{
  //??? error checking?
  ull val;  //used to be int val
  //For Niagara Support: we need to be able to support a 64-bit mask
  //for the WRite-under-Mask transaction
  sscanf(msk, "%llx", &val);

  if(size < 64){ //to satisfy 16-bit masks
    mask = val & 0xffff;
  }else{
    mask = val;
    //dprintf("Command Method", 0, 0, "mask = 0x%0.16llx", mask);
  }
  return 1;
}


//------------------------------------------------------------------------------
// Add a transaction type.
int Command::AddTransaction(char *trans)
{
  if (trans[0] == '0') {
    sscanf(trans, "%x", &waitID);
  } else if (!strcmp(trans, "RD")) {
    waitID = T_RD;
  } else if (!strcmp(trans, "RDD")) {
    waitID = T_RDD;
  } else if (!strcmp(trans, "RDS")) {
    waitID = T_RDS;
  } else if (!strcmp(trans, "RDSA")) {
    waitID = T_RDSA;
  } else if (!strcmp(trans, "RDO")) {
    waitID = T_RDO;
  } else if (!strcmp(trans, "OWN")) {
    waitID = T_OWN;
  } else if (!strcmp(trans, "INV")) {
    waitID = T_INV;
  } else if (!strcmp(trans, "NCWRC")) {
    waitID = T_NCWRC;
  //} else if (!strcmp(trans, "CWR")) { /* Niagara support*/
  //  waitID = T_CWR;
  } else if (!strcmp(trans, "WRM")) { /* Niagara support*/
    waitID = T_WRM;
  } else if (!strcmp(trans, "WRB")) {
    waitID = T_WRB;
  } else if (!strcmp(trans, "WRBC")) {
    waitID = T_WRBC;
  } else if (!strcmp(trans, "WRI")) {
    waitID = T_WRI;
  } else if (!strcmp(trans, "WRIS")) {
    waitID = T_WRIS;
  } else if (!strcmp(trans, "NCRD")) {
    waitID = T_NCRD;
  } else if (!strcmp(trans, "NCBRD")) {
    waitID = T_NCBRD;
  } else if (!strcmp(trans, "NCWR")) {
    waitID = T_NCWR;
  } else if (!strcmp(trans, "NCBWR")) {
    waitID = T_NCBWR;
  } else if (!strcmp(trans, "INT")) {
    waitID = T_INT;
  } else if (!strcmp(trans, "INTACK")) {
    waitID = T_INTACK;
  } else if (!strcmp(trans, "INTNACK")) {
    waitID = T_INTNACK;
  } else if (!strcmp(trans, "XIR")) {
    waitID = T_XIR;
  } else if (!strcmp(trans, "CHANGE")) {
    waitID = T_CHANGE;
  } else if (!strcmp(trans, "IDLE")) {
    waitID = T_IDLE;
  } else {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Add a message string.
void Command::AddMessage(char *str)
{
  msg = new char[strlen(str)+1];
  strcpy(msg, str);
}


//------------------------------------------------------------------------------
// Return a string containing the contents of this command.
//!!! clean up.
// char *Command::Print()
// {
//   char outbuf[100000];
//   char buf[64];
//   char *str;
//   int len = 0;

//   sprintf(outbuf, "cmd=0x%x addr=0x%llx size=%d reg1=%d reg2=%d\ndata=",
//        cmd, addr, size, reg1, reg2);
//   len += strlen(outbuf);
//   sprintf(&outbuf[len], "\n");
//   len++;
//   if (label[0]) {
//     sprintf(buf, "label=%s ", label);
//     sprintf(&outbuf[len], "%s", buf);
//     len += strlen(buf);
//   }
//   sprintf(buf, "setcc=%d ", setcc);
//   sprintf(&outbuf[len], "%s", buf);
//   len += strlen(buf);
//   for (int i = 0; i < 4; i++) {
//     sprintf(buf, "syncid[%d]=%d ", i, sync_ids[i]);
//     sprintf(&outbuf[len], "%s", buf);
//     len += strlen(buf);
//   }
//   sprintf(&outbuf[len], "\n");
//   len++;
//   if (msg) {
//     sprintf(buf, "msg=%s\n", msg);
//     sprintf(&outbuf[len], "%s", buf);
//     len += strlen(buf);
//   }
//   sprintf(buf, "cycles=%d", cycles);
//   sprintf(&outbuf[len], "%s", buf);
//   len += strlen(buf);
//   outbuf[len] = NULL;
//   return outbuf;
// }
