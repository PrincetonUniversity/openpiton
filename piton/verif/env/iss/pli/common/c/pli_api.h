// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pli_api.h
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
// Description:  API for the PLI-based stub models. Sets up pipes between the
//               process that calls these functions and it's parent process.
//
//------------------------------------------------------------------------------

#include <sys/ioctl.h>
#include <sys/time.h>
#include <sys/types.h>
#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdarg.h>
#include <wait.h>
#include "pli_api_defines.h"

#ifndef PLIAPI_H
#define PLIAPI_H


// Return status definitions.
#define API_STAT_OK  0x01
#define API_STAT_ERR 0x02
#define API_STAT_TRANSINFO 0x04
#define API_STAT_DEVICEINFO 0x8
#define API_STAT_RESET 0x10

// Command (output) packet.
class PLI_API_CmdPacket
{
public:
  unsigned int cmd;
  char params[1024];
};

// Response (input) packet.
class PLI_API_RspPacket
{
public:
  unsigned int status;
  unsigned long long addr;
  unsigned int ttype;
  unsigned int mask;
  unsigned int transid;
  unsigned int data[64];
  char info[1024];

  PLI_API_RspPacket() {
    status = -1;
    addr = -1;
    ttype = -1;
    mask = -1;
    transid = -1;
    for (int i = 0; i < 64; i++) {
      data[i] = -1;
    }
    info[0] = NULL;
  }
  PLI_API_RspPacket(PLI_API_RspPacket &rsp) {
    status = rsp.status;
    addr = rsp.addr;
    ttype = rsp.ttype;
    mask = rsp.mask;
    transid = rsp.transid;
    for (int i = 0; i < 64; i++) {
      data[i] = rsp.data[i];
    }
    info[0] = NULL;
  }
};

// The number of devices on the bus.
extern int pli_api_num_devices;
// Information about each device on the bus.
extern PLI_API_DeviceInfo *pli_api_device_info;


#endif // PLIAPI_H
