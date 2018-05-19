// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Command.h
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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "JBus.h"

#ifndef COMMAND_H
#define COMMAND_H

// Commands that aren't saved.
#define CMD_CONFIG     0x10000
#define CMD_ADDRESS    0x20000
#define CMD_CADDRESS   0x30000
#define CMD_IOADDRESS  0x40000
// Special.
#define CMD_DONE       0x00000
// Configuration commands.
#define CMD_TIMEOUT    0x01000
#define CMD_SEED       0x02000
#define CMD_APCHECK    0x03000
#define CMD_APERROR    0x04000
#define CMD_APADDRESS  0x05000
#define CMD_ECCERROR   0x06000
#define CMD_FLIPBITS   0x0e000
#define CMD_TOADDRESS  0x07000
#define CMD_BEADDRESS  0x08000
#define CMD_SEADDRESS  0x09000
#define CMD_CACHESTATE 0x0a000
#define CMD_INTACCEPT  0x0b000
#define CMD_INTACK     0x0c000
#define CMD_INTMODE    0x0d000
// Transaction commands.
#define CMD_IFETCH     0x00001
#define CMD_READ       0x00002
#define CMD_WRITE      0x00003
#define CMD_OWN        0x00004
#define CMD_LOCK       0x00011
#define CMD_READBLK    0x00005
#define CMD_WRITEBLK   0x00006
#define CMD_READIO     0x00007
#define CMD_WRITEIO    0x00008
#define CMD_READMSKIO  0x00009
#define CMD_WRITEMSKIO 0x0000a
#define CMD_READBLKIO  0x0000b
#define CMD_WRITEBLKIO 0x0000c
#define CMD_INT        0x0000d
#define CMD_XIR        0x0000e
#define CMD_BUSERROR   0x0000f
//#define CMD_SUBWRITE   0x00014  /*Niagara support*/
#define CMD_WRITEMSK   0x00015  /*Niagara support*/
// Other bus stimulus.
#define CMD_AOK        0x00012
#define CMD_DOK        0x00013
// Execution flow commands.
#define CMD_SYNC       0x00010
#define CMD_IOSYNC     0x00020
#define CMD_FLUSH      0x00030
#define CMD_WAIT       0x00040
#define CMD_ARBWAIT    0x00050
#define CMD_CMP        0x00080
#define CMD_BNE        0x00090
#define CMD_BE         0x000a0
#define CMD_BA         0x000b0
#define CMD_BI         0x000c0
#define CMD_BNI        0x000d0
#define CMD_BIA        0x000e0
#define CMD_BNIA       0x000f0
#define CMD_BD         0x30000
#define CMD_BND        0x40000
// Self-checking commands.
#define CMD_BUSCHECK   0x00060
#define CMD_BUSWAIT    0x00070
#define CMD_READINT    0x10000
#define CMD_INV        0x20000
// Display commands.
#define CMD_PRINT           0x00100
#define CMD_DISPLAY_ECTAG   0x00200
#define CMD_ERROR           0x00300

// Encodings for extended options.
#define SSP_REPEAT   0x0010
#define SSP_QUEUE    0x0020
#define XTN_NOSNOOP  0x0100
#define XTN_COMPRESS 0x0200

#define ECC_JID_MASK 0x1f
#define ECC_JID_TYPE_BIT 0x100
class Command {
private:
  // For keeping track of data being added.
  int cmd_datacnt;
  int cmd_datastart;
  short cmd_byte;
  // Set if this command has optional parameters.
  char cmd_has_opts;

public:
  // The command to execute.
  int cmd;
  // The address field.
  unsigned long long addr;
  // The data size in bytes.
  int size;
  // An array of data, up to 64 bytes.
  ByteString *data;
  // Wether or not data is defined.
  short dvalid;
  // The mask for IO commands.
  //unsigned short mask;
  unsigned long long mask;  /*Niagara Support*/
  // The label that precedes this command, if any.
  char label[32];
  // Label to branch to, for branch commands.
  char tolabel[32];
  // Used for 'set register' and 'compare register'.
  short reg1;
  // Used for 'compare register'.
  short reg2;
  // Indicates whether or not to set condition code register.
  char setcc;
  // Used to store id's on SYNC.
  int *sync_ids;
  // Stores messages to output.
  char *msg;
  // Stores wait cycles.
  int cycles;
  // Stores the request line to wait on.
  int waitID;
  // A pointer to the next command.
  Command *nextCmd;
  // A pointer to an options branch command.
  Command *branchCmd;

  Command();
  ~Command();
  int SetCommand(char *);
  int SetSize(char *);
  int SetSize(int);
  int SetOnOff(char *);
  int CheckOptArg(char *);
  void AddAddress(char *);
  int AddData(int, int);
  int AddData(int);
  int AddData(int, char *);
  int AddData(char *);
  void FixData();
  //int AddMask(char *);
  ull AddMask(char *);  //for Niagara support
  int AddTransaction(char *);
  void AddMessage(char *);
  int HasOptParms() { return cmd_has_opts; }
  int IsOnOff() { return reg1; }
//   char *Print();
};

#endif // COMMAND_H
