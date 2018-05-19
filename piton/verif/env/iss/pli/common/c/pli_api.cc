// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: pli_api.cc
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
// Description:  API for the PLI-based stub models. Sets up pipes between the
//               process that calls these functions and it's parent process.
//
//------------------------------------------------------------------------------

#include "pli_api.h"
#include "Vector.h"

#define _PLI_SSP 0
#define _PLI_SJM 1
#define _PLI_PCI 2

#ifdef LINUX
#define sigsend(idtype, id, sig) kill(id, sig)
#else
extern int sigsend(idtype_t idtype, id_t id, int sig);
#endif


// Set if the interface has been initialized.
int api_init = 0;
// Parent process id.
pid_t api_ppid;
// List of transactions that have happened.
Vector<PLI_API_RspPacket> *trans_list;
// The number of devices on the bus.
int pli_api_num_devices = 0;
// Information about each device on the bus.
PLI_API_DeviceInfo *pli_api_device_info = NULL;
static int reset=0;
PLI_API_CmdPacket cmd_packet;
PLI_API_RspPacket rsp_packet;

//------------------------------------------------------------------------------
// Send a command packet and wait for a response packet.
int send_cmd()
{
  if (!api_init) {
    api_ppid = getppid();
    if (fcntl(0, F_SETFL, O_NDELAY) < 0) {
      //!!! report error
      exit(1);
    }
    trans_list = new Vector<PLI_API_RspPacket>(1000, 100);
    api_init = 1;
  }

  int len = sizeof(PLI_API_CmdPacket);

  // Send the packet.
  if (write(1, (void *) &cmd_packet, len) != len) {
    //!!! report error.
    exit(1);
  }

  fd_set readfds;
  timeval tval;
  int nfds;

  len = sizeof(PLI_API_RspPacket);

  // Wait for a response.
  //!!! loop has no timeout
  while (1) {
    // Check that the parent process is still alive.
    if (sigsend(P_PID, api_ppid, 0) < 0) {
      //!!! report error
      exit(1);
    }

    FD_ZERO(&readfds);
    FD_SET(0, &readfds);
    tval.tv_sec = 0;
    tval.tv_usec = 10000;
    nfds = select(1, &readfds, NULL, NULL, &tval);

    if ((nfds < 0) && (errno != EINTR)) {
      fflush(stderr);
      //!!! report error.
      exit(1);
    }
    if (nfds > 0) {
      if (FD_ISSET(0, &readfds)) {
	for (int stat = 0; stat != len;) {
	  stat = read(0, (void *) &rsp_packet, len);
	  if ((stat != 0) && (stat != len)) {
	    //!!! report error.
	    exit(1);
	  }
	}

	if (rsp_packet.status == API_STAT_TRANSINFO) {
	  // Received a transaction information packet.
	  PLI_API_RspPacket *packet = new PLI_API_RspPacket(rsp_packet);
	  trans_list->Add(packet);
	  rsp_packet.status = 0;
	} else if (rsp_packet.status == API_STAT_RESET){
	  reset = 1;
	} else if (rsp_packet.status == API_STAT_DEVICEINFO) {
	  // Received a device information packet.
	  if (pli_api_num_devices == 0) {
	    // Index 0 stores the number of devices.
	    pli_api_num_devices = rsp_packet.data[0];
	    pli_api_device_info = new PLI_API_DeviceInfo[pli_api_num_devices];
	  }
	  // Index 1 stores the device who's info we've gotten.
	  // Index 2 stores the port id.
	  pli_api_device_info[rsp_packet.data[1]].port_id = rsp_packet.data[2];
	  // Index 3 stores the agent id.
	  pli_api_device_info[rsp_packet.data[1]].agent_id = rsp_packet.data[3];
	  // Index 4 stores other id information.
	  pli_api_device_info[rsp_packet.data[1]].num = rsp_packet.data[4];
	  // The info part stores the diag name.
	  strcpy(pli_api_device_info[rsp_packet.data[1]].testname, rsp_packet.info);
	} else {
	  //!!! other responses.
	  return 1;
	}
      }
    }
    // Otherwise, try again.
  }
  return 0;
}


//------------------------------------------------------------------------------
// Confguration support function.
int _config(unsigned int ctype, unsigned int id, ...)
{
  cmd_packet.cmd = API_CONFIG;
  sprintf(cmd_packet.params, "%d:", id);
  int len = strlen(cmd_packet.params);
  int ival;
  char cval;
  va_list ap;
  va_start(ap, id);

  if (ctype == _PLI_SSP) {
    len += sprintf(&cmd_packet.params[len], "arbnum=%d:", va_arg(ap, unsigned int));
    len += sprintf(&cmd_packet.params[len], "l1=%d:", va_arg(ap, unsigned int));
    cval = va_arg(ap, char);
    if ((cval == L2OFF) || (cval == L2ON)) {
      len += sprintf(&cmd_packet.params[len], "l2=%c:", cval);
    } else {
      len += sprintf(&cmd_packet.params[len], "l2=auto:");
    }
    len += sprintf(&cmd_packet.params[len], "iosyncadr=0x%llx:", va_arg(ap, unsigned long long));
    len += sprintf(&cmd_packet.params[len], "snoopdelay=%d:", va_arg(ap, unsigned int));
    ival = va_arg(ap, unsigned int);
    if (ival == SSMON) {
      len += sprintf(&cmd_packet.params[len], "ssm:");
    }
    ival = va_arg(ap, unsigned int);
    if (ival == ECCERR) {
      len += sprintf(&cmd_packet.params[len], "ecc=err:");
    } else if (ival == ECCWARN) {
      len += sprintf(&cmd_packet.params[len], "ecc=warn:");
    }
    ival = va_arg(ap, unsigned int);
    if (ival == SSMAGENTON) {
      len += sprintf(&cmd_packet.params[len], "ssm_agent:");
    }
  } else if (ctype == _PLI_SJM) {
    len += sprintf(&cmd_packet.params[len], "iosyncadr=0x%llx:", va_arg(ap, unsigned long long));
    ival = va_arg(ap, unsigned int);
    if (ival == DEADCYCLEON) {
      len += sprintf(&cmd_packet.params[len], "deadcycle=on:");
    } else if (ival == DEADCYCLEOFF) {
      len += sprintf(&cmd_packet.params[len], "deadcycle=off:");
    }
    ival = va_arg(ap, unsigned int);
    if ((ival == ESTAR1) || (ival == ESTAR2) || (ival == ESTAR32)) {
      len += sprintf(&cmd_packet.params[len], "estar=%d:", ival);
    }
  } else if (ctype == _PLI_PCI) {

  }

  va_end(ap);
  return send_cmd();
}


//------------------------------------------------------------------------------
// SSP compatiblity.
int CONFIG(unsigned int id, unsigned int arbnum, unsigned int l1, char l2, unsigned long long iosyncaddr, unsigned int snoopdelay, unsigned int ssm, unsigned int ecc, unsigned int ssm_agent)
{
  return _config(_PLI_SSP, id, arbnum, l1, l2, iosyncaddr, snoopdelay, ssm, ecc, ssm_agent);
}


//------------------------------------------------------------------------------
// SJM compatibility.
//!!! should be the same as for SSP, plus extended args.
int CONFIG(unsigned int id, unsigned long long iosyncaddr, unsigned int deadcycle, unsigned int estar)
{
  return _config(_PLI_SJM, id, iosyncaddr, deadcycle, estar);
}



//------------------------------------------------------------------------------
// void SSPCONFIG(...);
// void TESTNAME(char *);


//------------------------------------------------------------------------------
int _address(unsigned long long start, unsigned long long end, unsigned int interleave, unsigned int blocksize)
{
  sprintf(cmd_packet.params, "0x%llx:0x%llx:", start, end);
  if (interleave != NOINTERLEVE) {
    sprintf(&cmd_packet.params[strlen(cmd_packet.params) - 1], "%d:%d:", interleave, blocksize);
  }
  return send_cmd();
}


//------------------------------------------------------------------------------
// Set an address range.
int ADDRESS(unsigned long long start, unsigned long long end, unsigned int interleave, unsigned int blocksize)
{
  cmd_packet.cmd = API_ADDRESS;
  return _address(start, end, interleave, blocksize);
}


//------------------------------------------------------------------------------
// Set a noncacheable (I/O) address range.
int IOADDRESS(unsigned long long start, unsigned long long end, unsigned int interleave, unsigned int blocksize)
{
  cmd_packet.cmd = API_IOADDRESS;
  return _address(start, end, interleave, blocksize);
}


//------------------------------------------------------------------------------
// Set a cacheable address range.
int CADDRESS(unsigned long long start, unsigned long long end, unsigned int interleave, unsigned int blocksize)
{
  cmd_packet.cmd = API_CADDRESS;
  return _address(start, end, interleave, blocksize);
}


//------------------------------------------------------------------------------
// void LPA(unsigned long long, unsigned long long);
// void SAFARI_DDELAY(unsigned int)
// void SAFARI_DSPLIT(unsigned int)
// void DDELAY(unsigned int);
// void DSPLIT(unsigned int);
// void WBDELAY(unsigned int);
// void WBSPLIT(unsigned int);
// void SAFARI_DDELAYR(unsigned int, unsigned int);
// void SAFARI_DSPLITR(unsigned int, unsigned int);
// void DDELAYR(unsigned int, unsigned int);
// void DSPLITR(unsigned int, unsigned int);
// void WBDELAYR(unsigned int, unsigned int);
// void WBSPLITR(unsigned int, unsigned int);


//------------------------------------------------------------------------------
// Reseed the random number generator.
int SEED(unsigned int s)
{
  cmd_packet.cmd = API_SEED;
  sprintf(cmd_packet.params, "%d", s);
  return send_cmd();
}


//------------------------------------------------------------------------------
// void APCHECK(char *);
// void APADDRESS(unsigned long long, char *);
// void INTACCEPT(unsigned int);
// void INTACK(unsigned int);
// void INTMODE(unsigned int);


//------------------------------------------------------------------------------
int _read_write(int ctype, unsigned long long addr, unsigned int size, unsigned int *data, char **opts)
{
  cmd_packet.cmd = ctype;
  if (ctype == API_READBLK)
    sprintf(cmd_packet.params, "0x%llx:", addr);
  else
    sprintf(cmd_packet.params, "0x%llx:%d:", addr, size);
  int len = strlen(cmd_packet.params);
  if (data) {
    if (size > 0) {
      len += sprintf(&cmd_packet.params[len], "%d:", data[0]);
    }
    if (size >= 8) {
      len += sprintf(&cmd_packet.params[len], "%d:", data[1]);
    }
    if (size >= 16) {
      len += sprintf(&cmd_packet.params[len], "%d:%d:", data[2], data[3]);
    }
    if (size >= 32) {
      len += sprintf(&cmd_packet.params[len], "%d:%d:%d:%d:", data[4], data[5], data[6], data[7]);
    }
    if (size == 64) {
      len += sprintf(&cmd_packet.params[len], "%d:%d:%d:%d:%d:%d:%d:%d:", data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]);
    }
    delete data;
  }
  for (int i = 0; opts[i]; i++) {
    len += sprintf(&cmd_packet.params[len], "%s:", opts[i]);
  }
//   delete[] opts;
  return send_cmd();
}


//------------------------------------------------------------------------------
// int IFETCH(unsigned long long addr, ... )


//------------------------------------------------------------------------------
// Read data.
//
// SSP compatibility.
int IFETCH(unsigned long long addr, unsigned int size, unsigned int ddelay, unsigned int dsplit, unsigned int wbdelay, unsigned int wbsplit, unsigned int arbwait, unsigned int data, ...)
{
  unsigned int *darray = NULL;
  if (data != NODATA) {
    va_list ap;
    va_start(ap, data);
    darray = new unsigned int[15];
    for (int i = 0; i < 16; i++) {
      darray[i] = va_arg(ap, unsigned int);
    }
    va_end(ap);
  }

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (wbdelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbdelay=%d", wbdelay);
  }
  if (wbsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbsplit=%d", wbsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_IFETCH, addr, size, darray, opts);
}


//------------------------------------------------------------------------------
// Read data.
//
// SSP compatibility.
int READ(unsigned long long addr, unsigned int size, unsigned int ddelay, unsigned int dsplit, unsigned int wbdelay, unsigned int wbsplit, unsigned int arbwait, unsigned int data, ...)
{
  unsigned int *darray = NULL;
  if (data != NODATA) {
    va_list ap;
    va_start(ap, data);
    darray = new unsigned int[15];
    for (int i = 0; i < 16; i++) {
      darray[i] = va_arg(ap, unsigned int);
    }
    va_end(ap);
  }

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (wbdelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbdelay=%d", wbdelay);
  }
  if (wbsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbsplit=%d", wbsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_READ, addr, size, darray, opts);
}


//------------------------------------------------------------------------------
// Read data.
//
// SSP compatibility.
/*
int READ(unsigned long long addr, unsigned int size, unsigned int ddelay, unsigned int dsplit, unsigned int wbdelay, unsigned int wbsplit, unsigned int arbwait, unsigned int data, unsigned int data0, unsigned int data1, unsigned int data2, unsigned int data3, unsigned int data4, unsigned int data5, unsigned int data6, unsigned int data7, unsigned int data8, unsigned int data9, unsigned int data10, unsigned int data11, unsigned int data12, unsigned int data13, unsigned int data14, unsigned int data15)
{
  unsigned int *darray = NULL;
  if (data != NODATA) {
    darray = new unsigned int[15];
    darray[0] = data0;
    darray[1] = data1;
    darray[2] = data2;
    darray[3] = data3;
    darray[4] = data4;
    darray[5] = data5;
    darray[6] = data6;
    darray[7] = data7;
    darray[8] = data8;
    darray[9] = data9;
    darray[10] = data10;
    darray[11] = data11;
    darray[12] = data12;
    darray[13] = data13;
    darray[14] = data14;
    darray[15] = data15;
  }

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (wbdelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbdelay=%d", wbdelay);
  }
  if (wbsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbsplit=%d", wbsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_READ, addr, size, darray, opts);
}
*/



//------------------------------------------------------------------------------
// Read data.
//!!! still under construction.
/*int READ(unsigned long long addr, unsigned int size, unsigned int vargs, ... )
{
  cmd_packet.cmd = API_READ;
  sprintf(cmd_packet.params, "0x%llx:%d:", addr, size);
  int len = strlen(cmd_packet.params);

  va_list ap;
  va_start(ap, size);
  char *str;
  int i = 0;

  unsigned int darray[15];
  if (!(vargs & NO_DATA)) {
    if (size > 0) {
      darray[i++] = va_arg(ap, unsigned int);
    }
    if (size >= 8) {
      darray[i++] = va_arg(ap, unsigned int);
    }
    if (size >= 16) {
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
    }
    if (size >= 32) {
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
    }
    if (size == 64) {
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
      darray[i++] = va_arg(ap, unsigned int);
    }
  }

  char **opts;
  if (!(varags & NO_OPTARGS)) {

  }
  va_end(ap);
}*/


//------------------------------------------------------------------------------
int WRITE(unsigned long long addr, unsigned int size, unsigned int ddelay,
unsigned int dsplit, unsigned int wbdelay, unsigned int wbsplit, unsigned int arbwait,
unsigned int data0, unsigned int data1, unsigned int data2, unsigned int data3, unsigned int data4, unsigned int data5, unsigned int data6,
unsigned int data7, unsigned int data8, unsigned int data9, unsigned int data10, unsigned int data11, unsigned int data12, unsigned int data13,
unsigned int data14, unsigned int data15)
{
  unsigned int *darray = new unsigned int[15];
  darray[0] = data0;
  darray[1] = data1;
  darray[2] = data2;
  darray[3] = data3;
  darray[4] = data4;
  darray[5] = data5;
  darray[6] = data6;
  darray[7] = data7;
  darray[8] = data8;
  darray[9] = data9;
  darray[10] = data10;
  darray[11] = data11;
  darray[12] = data12;
  darray[13] = data13;
  darray[14] = data14;
  darray[15] = data15;

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (wbdelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbdelay=%d", wbdelay);
  }
  if (wbsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbsplit=%d", wbsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_WRITE, addr, size, darray, opts);
}


//------------------------------------------------------------------------------
// Own a cache line.
//
// SSP compatibility.
int OWN(unsigned long long addr, unsigned int size, unsigned int ddelay, unsigned int dsplit, unsigned int wbdelay, unsigned int wbsplit, unsigned int arbwait, unsigned int data, ...)
{
  unsigned int *darray = NULL;
  if (data != NODATA) {
    va_list ap;
    va_start(ap, data);
    darray = new unsigned int[15];
    for (int i = 0; i < 16; i++) {
      darray[i] = va_arg(ap, unsigned int);
    }
    va_end(ap);
  }

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (wbdelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbdelay=%d", wbdelay);
  }
  if (wbsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbsplit=%d", wbsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_OWN, addr, size, darray, opts);
}


//------------------------------------------------------------------------------
// Own a cache line.
//
// SSP compatibility.
/*
int OWN(unsigned long long addr, unsigned int size, unsigned int ddelay, unsigned int dsplit, unsigned int wbdelay, unsigned int wbsplit, unsigned int arbwait, unsigned int data, unsigned int data0, unsigned int data1, unsigned int data2, unsigned int data3, unsigned int data4, unsigned int data5, unsigned int data6, unsigned int data7, unsigned int data8, unsigned int data9, unsigned int data10, unsigned int data11, unsigned int data12, unsigned int data13, unsigned int data14, unsigned int data15)
{
  unsigned int *darray = NULL;
  if (data != NODATA) {
    darray = new unsigned int[15];
    darray[0] = data0;
    darray[1] = data1;
    darray[2] = data2;
    darray[3] = data3;
    darray[4] = data4;
    darray[5] = data5;
    darray[6] = data6;
    darray[7] = data7;
    darray[8] = data8;
    darray[9] = data9;
    darray[10] = data10;
    darray[11] = data11;
    darray[12] = data12;
    darray[13] = data13;
    darray[14] = data14;
    darray[15] = data15;
  }

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (wbdelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbdelay=%d", wbdelay);
  }
  if (wbsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "wbsplit=%d", wbsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_OWN, addr, size, darray, opts);
}
*/


//------------------------------------------------------------------------------
// Own a cache line.
//!!! still under construction
// int OWN(unsigned long long addr, unsigned intsize, unsigned int vargs, ... )
// {
// }


//------------------------------------------------------------------------------
// Read a block.
int READBLK(unsigned long long addr, unsigned int ddelay, unsigned int dsplit, unsigned int arbwait, unsigned int data, ...)
{
  unsigned int *darray = NULL;
  if (data != NODATA) {
    va_list ap;
    va_start(ap, data);
    darray = new unsigned int[15];
    for (int i = 0; i < 16; i++) {
      darray[i] = va_arg(ap, unsigned int);
    }
    va_end(ap);
  }

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_READBLK, addr, 64, darray, opts);
}


//------------------------------------------------------------------------------
// Read a block.
/*
int READBLK(unsigned long long addr, unsigned int ddelay, unsigned int dsplit, unsigned int arbwait, unsigned int data, unsigned int data0, unsigned int data1, unsigned int data2, unsigned int data3, unsigned int data4, unsigned int data5, unsigned int data6, unsigned int data7, unsigned int data8, unsigned int data9, unsigned int data10, unsigned int data11, unsigned int data12, unsigned int data13, unsigned int data14, unsigned int data15)
{
  unsigned int *darray = NULL;
  if (data != NODATA) {
    darray = new unsigned int[15];
    darray[0] = data0;
    darray[1] = data1;
    darray[2] = data2;
    darray[3] = data3;
    darray[4] = data4;
    darray[5] = data5;
    darray[6] = data6;
    darray[7] = data7;
    darray[8] = data8;
    darray[9] = data9;
    darray[10] = data10;
    darray[11] = data11;
    darray[12] = data12;
    darray[13] = data13;
    darray[14] = data14;
    darray[15] = data15;
  }

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_READBLK, addr, 64, darray, opts);
}
*/


//------------------------------------------------------------------------------
// int READBLKMASK(unsigned long long, unsigned int, unsigned int, unsigned int,
//              unsigned int, unsigned long long, unsigned int, unsigned int,
//              unsigned int, unsigned int, unsigned int, unsigned int,
//              unsigned int, unsigned int, unsigned int, unsigned int,
//              unsigned int, unsigned int, unsigned int, unsigned int,
//              unsigned int, unsigned int);
// void WRITEBLK(unsigned long long, ... );


//------------------------------------------------------------------------------
// Read I/O data.
int READIO(unsigned long long addr, unsigned int size, unsigned int ddelay, unsigned int dsplit, unsigned int arbwait, unsigned int data, ... )
{
  unsigned int *darray = NULL;
  if (data != NODATA) {
    va_list ap;
    va_start(ap, data);
    darray = new unsigned int[15];
    for (int i = 0; i < 4; i++) {
      darray[i] = va_arg(ap, unsigned int);
    }
    va_end(ap);
  }

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_READIO, addr, size, darray, opts);
}


//------------------------------------------------------------------------------
// Read I/O data.
/*
int READIO(unsigned long long addr, unsigned int size, unsigned int ddelay, unsigned int dsplit, unsigned int arbwait, unsigned int data, unsigned int data0, unsigned int data1, unsigned int data2, unsigned int data3)
{
  unsigned int *darray = NULL;
  if (data != NODATA) {
    darray = new unsigned int[15];
    darray[0] = data0;
    darray[1] = data1;
    darray[2] = data2;
    darray[3] = data3;
  }

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_READIO, addr, size, darray, opts);
}
*/


//------------------------------------------------------------------------------
// void WRITEIO(unsigned long long, ... );
// int READMSKIO(unsigned long long, ... );
// void WRITEMSKIO(unsigned long long, ... );
// int READBLKIO(unsigned long long, ... );
// void WRITEBLKIO(unsigned long long, ... );
// int READBLKIOMASK(unsigned long long, unsigned int, unsigned int, unsigned int,
//                unsigned int, unsigned long long, unsigned int, unsigned int,
//                unsigned int, unsigned int, unsigned int, unsigned int,
//                unsigned int, unsigned int, unsigned int, unsigned int,
//                unsigned int, unsigned int, unsigned int, unsigned int,
//                unsigned int, unsigned int);



//------------------------------------------------------------------------------
int INT(unsigned long long addr, unsigned int ddelay, unsigned int dsplit, unsigned int arbwait, unsigned int  data0, unsigned int data1, unsigned int data2, unsigned int data3, unsigned int data4, unsigned int data5, unsigned int data6, unsigned int data7, unsigned int data8, unsigned int data9, unsigned int data10, unsigned int data11, unsigned int data12, unsigned int data13, unsigned int data14, unsigned int data15)
{
  unsigned int *darray = new unsigned int[15];
  darray[0] = data0;
  darray[1] = data1;
  darray[2] = data2;
  darray[3] = data3;
  darray[4] = data4;
  darray[5] = data5;
  darray[6] = data6;
  darray[7] = data7;
  darray[8] = data8;
  darray[9] = data9;
  darray[10] = data10;
  darray[11] = data11;
  darray[12] = data12;
  darray[13] = data13;
  darray[14] = data14;
  darray[15] = data15;

  char *opts[6];
  int i = 0;
  opts[0] = NULL;
  if (ddelay > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "ddelay=%d", ddelay);
  }
  if (dsplit > -1) {
    opts[i] = new char[20];
    sprintf(opts[i++], "dsplit=%d", dsplit);
  }
  if (arbwait == -2) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=any");
  } else if (arbwait > -1) {
    opts[i] = new char[15];
    sprintf(opts[i++], "arbwait=%d", arbwait);
  }
  opts[i] = NULL;

  return _read_write(API_INT, addr, 64, darray, opts);
}


//------------------------------------------------------------------------------
// void SYNC(unsigned int, ... );


//------------------------------------------------------------------------------
// Cause a device to wait a certain number of cycles.
int WAIT(unsigned int cycles)
{
  cmd_packet.cmd = API_WAIT;
  sprintf(cmd_packet.params, "%d", cycles);
  return send_cmd();
}


//------------------------------------------------------------------------------
// Change a timeout.
int TIMEOUT(unsigned int cycles)
{
  cmd_packet.cmd = API_TIMEOUT;
  sprintf(cmd_packet.params, "-1:%d", cycles);
  return send_cmd();
}


//------------------------------------------------------------------------------
// Change a timeout.
int TIMEOUT(unsigned int cycles, unsigned int which)
{
  cmd_packet.cmd = API_TIMEOUT;
  sprintf(cmd_packet.params, "%d:%d", which, cycles);
  return send_cmd();
}

//------------------------------------------------------------------------------
// Change a timeout.
int ECCERROR(unsigned long long int addr, char *type, char *on_off)
{
  cmd_packet.cmd = API_ECCERROR;
  sprintf(cmd_packet.params, "0x%llx:%s:%s", addr, type, on_off);
  return send_cmd();
}

// Change a timeout.
int ECCERROR(unsigned long long int addr, char *type, char *on_off, char *norand)
{
  cmd_packet.cmd = API_ECCERROR;
  sprintf(cmd_packet.params, "0x%llx:%s:%s:%s", addr, type, on_off, norand);
  return send_cmd();
}
int APERROR_ADR(unsigned long long int addr, char *on_off){
  cmd_packet.cmd = API_APERROR_ADR;
  sprintf(cmd_packet.params, "0x%llx:%s", addr, on_off);
  return send_cmd();

}


//------------------------------------------------------------------------------
// void FLUSH(void);


//------------------------------------------------------------------------------
int IOSYNC()
{
  cmd_packet.cmd = API_IOSYNC;
  cmd_packet.params[0] = '\0';
  return send_cmd();
}


//------------------------------------------------------------------------------
// Signal that the test is done.
int DONE()
{
  cmd_packet.cmd = API_DONE;
  cmd_packet.params[0] = '\0';
  return send_cmd();
}


//------------------------------------------------------------------------------
int CHECKDONE()
{
  cmd_packet.cmd = API_CHECKDONE;
  if (send_cmd()) {
    return rsp_packet.data[0];
  }
  return 0;
}



//------------------------------------------------------------------------------
// void BUSCHECK(unsigned int, unsigned long long, unsigned int,
//            unsigned int, unsigned int);
// void BUSWAIT(unsigned int, unsigned long long, unsigned int,
//           unsigned int, unsigned int, unsigned int);
// int READINT(unsigned int, unsigned long long, unsigned long long,
//          unsigned long long, unsigned long long, unsigned long long,
//          unsigned long long, unsigned long long, unsigned long long);


//------------------------------------------------------------------------------
// Print a message.
int PRINT(char *msg, ...)
{
  cmd_packet.cmd = API_PRINT;
  va_list ap;
  va_start(ap, msg);
  vsprintf(cmd_packet.params, msg, ap);
  va_end(ap);
  return send_cmd();
}


//------------------------------------------------------------------------------
// Print an error.
int ERROR(char *msg, ...)
{
  cmd_packet.cmd = API_ERROR;
  va_list ap;
  va_start(ap, msg);
  vsprintf(cmd_packet.params, msg, ap);
  va_end(ap);
  return send_cmd();
}


//------------------------------------------------------------------------------
// void DISPLAY_ECTAG(unsigned long long);


//------------------------------------------------------------------------------
int SSPINFO()
{
  cmd_packet.cmd = API_SSPINFO;
  return send_cmd();
}


//------------------------------------------------------------------------------
int TRANSACTION_NUM()
{
  return trans_list->Size();
}


//------------------------------------------------------------------------------
int TRANSACTION_INFO(unsigned int indx, unsigned int *transid, unsigned long long *addr, unsigned int *ttype, unsigned int *mask)
{
  // Normalize, so that there's no such thing as transaction 0.
  int i = indx - 1;
  if (!trans_list->Valid(i)) {
    return 0;
  }
  PLI_API_RspPacket *trans = trans_list->Get(i);
  *transid = trans->transid;
  *addr = trans->addr;
  *ttype = trans->ttype;
  *mask = trans->mask;
  return 1;
}




// int DISCARDREAD(unsigned long long, ... );
// void TRANSWAIT(unsigned int *, unsigned long long *, unsigned int *, unsigned int *);
// void INTWAIT(unsigned int *);
// void DATAWAIT(unsigned long long *);
// unsigned int INTAVAILABLE(unsigned long long *, unsigned long long *,
//                        unsigned long long *, unsigned long long *,
//                        unsigned long long *, unsigned long long *,
//                        unsigned long long *, unsigned long long *)
// void APERROR_TRANS(char *, char *);
// int CACHETAG(unsigned long long);
// void TSO(unsigned int);
// void ECHO(unsigned int);
// void CORRECTDATA(unsigned int);
unsigned int RESET_ASSERTED(void){
  if (reset){
    reset = 0;
    return 1;
  }else{
    return 0;
  }
}
// void PAUSE(unsigned int, unsigned int, unsigned int, unsigned int)
