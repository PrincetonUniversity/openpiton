// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pli_api_defines.h
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
// Description:  Header file included by diags that want to use the PLI API
//               interface.
//
//------------------------------------------------------------------------------

#ifndef PLIAPIDEFINES_H
#define PLIAPIDEFINES_H

// Configuration commands.
#define API_CONFIG         0x00000001
#define API_SSPCONFIG      0x00000002
#define API_TESTNAME       0x00000003
#define API_ADDRESS        0x00000011
#define API_IOADDRESS      0x00000012
#define API_CADDRESS       0x00000013
#define API_LPA            0x00000004
#define API_SAFARI_DDELAY  0x00000005
#define API_SAFARI_DSPLIT  0x00000006
#define API_DDELAY         0x00000007
#define API_DSPLIT         0x00000008
#define API_WBDELAY        0x00000009
#define API_WBSPLIT        0x0000000a
#define API_SAFARI_DDELAYR 0x0000000b
#define API_SAFARI_DSPLITR 0x0000000c
#define API_DDELAYR        0x0000000d
#define API_DSPLITR        0x0000000e
#define API_WBDELAYR       0x0000000f
#define API_WBSPLITR       0x00000010
#define API_SEED           0x00000014
#define API_APCHECK        0x00000015
#define API_APADDRESS      0x00000016
#define API_INTACCEPT      0x00000017
#define API_INTACK         0x00000018
#define API_INTMODE        0x00000019
#define API_ECCERROR       0x00000020
#define API_APERROR_ADR    0x00000021
// Transaction commands.
#define API_IFETCH         0x00000100
#define API_READ           0x00000200
#define API_WRITE          0x00000300
#define API_OWN            0x00000400
#define API_READBLK        0x00000500
#define API_READBLKMASK    0x00000600
#define API_WRITEBLK       0x00000700
#define API_READIO         0x00000800
#define API_WRITEIO        0x00000900
#define API_READMSKIO      0x00000a00
#define API_WRITEMSKIO     0x00000b00
#define API_READBLKIO      0x00000c00
#define API_WRITEBLKIO     0x00000d00
#define API_READBLKIOMASK  0x00000e00
#define API_INT            0x00000f00
#define API_SUBWRITE       0x00001000 /*Niagara Support*/
#define API_WRITEMSK       0x00001100 /*Niagara Support*/
// Execution flow commands.
#define API_WAIT           0x00010000
#define API_SYNC           0x00020000
#define API_IOSYNC         0x00030000
#define API_TIMEOUT        0x00040000
#define API_FLUSH          0x00050000
#define API_DONE           0x00060000

#define API_CHECKDONE      0x00070000

// Self-checking commands.
#define API_BUSCHECK       0x01000000
#define API_BUSWAIT        0x02000000
#define API_READINT        0x03000000
// Display commands.
#define API_PRINT          0x04000000
#define API_ERROR          0x05000000
#define API_DISPLAY_ECTAG  0x06000000
// Information.
#define API_SSPINFO          0x09000000
#define API_TRANSACTION_NUM  0x07000000
#define API_TRANSACTION_INFO 0x08000000


//!!!
#define API_DISCARDREAD
#define API_TRANSWAIT
#define API_INTWAIT
#define API_DATAWAIT
#define API_INTAVAILABLE
#define API_APERROR_TRANS
#define API_CACHETAG
#define API_TSO
#define API_ECHO
#define API_CORRECTDATA
#define API_RESET_ASSERTED
#define API_PAUSE


// Parameter definitions.
#define ENABLE 1
#define DISABLE 0
#define ON 1
#define OFF 0

// SSP Compatibility.
// Configuration parameters.
#define L2OFF 'n'
#define L2ON 'y'
#define SSMOFF 0
#define SSMON 1
#define ECCERR 1
#define ECCWARN 2
#define ECCOFF 0
#define SSMAGENTOFF 0
#define SSMAGENTON 1
// Address parameters
#define NOINTERLEVE -1
// Transaction parameters
#define NODDELAY -1
#define NODSPLIT -1
#define NOWBDELAY -1
#define NOWBSPLIT -1
#define ANYARB -1
#define NOARBWAIT -2
#define DATA 1
#define NODATA -1


// SJM compatibility.
// Configuration parameters.
#define DEADCYCLEON 1
#define DEADCYCLEOFF -1
#define ESTAR1 1
#define ESTAR2 2
#define ESTAR32 32

// To keep the compiler from complaining.
#ifndef NULL
#define NULL '\0'
#endif // #ifndef NULL


// This class includes the testname and id information for a device.
class PLI_API_DeviceInfo
{
public:
  char testname[1024];
  unsigned int port_id;
  unsigned int agent_id;
  unsigned int num;

  PLI_API_DeviceInfo() {
    testname[0] = NULL;
    port_id = -1;
    agent_id= -1;
    num = -1;
  }
};
// typedef struct _PLI_API_DeviceInfo {
//   char testname[1024];
//   unsigned int port_id;
//   unsigned int agent_id;
//   unsigned int num;
//   PLI_API_DeviceInfo();
// } PLI_API_DeviceInfo;

// The number of devices on the bus. Defined in pli_api.h.
extern int pli_api_num_devices;
// Information about each device on the bus. Defined in pli_api.h.
extern PLI_API_DeviceInfo *pli_api_device_info;


// Configuration commands.
int CONFIG(unsigned int, unsigned int, unsigned int, char, unsigned long long,
	   unsigned int, unsigned int, unsigned int, unsigned int);
int CONFIG(unsigned int, unsigned long long,
	   unsigned int, unsigned int, unsigned int, unsigned int,
	   unsigned int, unsigned int);
void SSPCONFIG(...);
void TESTNAME(char *);
int ADDRESS(unsigned long long, unsigned long long, unsigned int, unsigned int);
int IOADDRESS(unsigned long long, unsigned long long, unsigned int, unsigned int);
int CADDRESS(unsigned long long, unsigned long long, unsigned int, unsigned int);
void LPA(unsigned long long, unsigned long long);
void SAFARI_DDELAY(unsigned int);
void SAFARI_DSPLIT(unsigned int);
void DDELAY(unsigned int);
void DSPLIT(unsigned int);
void WBDELAY(unsigned int);
void WBSPLIT(unsigned int);
void SAFARI_DDELAYR(unsigned int, unsigned int);
void SAFARI_DSPLITR(unsigned int, unsigned int);
void DDELAYR(unsigned int, unsigned int);
void DSPLITR(unsigned int, unsigned int);
void WBDELAYR(unsigned int, unsigned int);
void WBSPLITR(unsigned int, unsigned int);
int SEED(unsigned int);
void APCHECK(char *);
void APADDRESS(unsigned long long, char *);
void INTACCEPT(unsigned int);
void INTACK(unsigned int);
void INTMODE(unsigned int);

// Transaction commands.
//!!! int IFETCH(unsigned long long, ... );
int IFETCH(unsigned long long, unsigned int, unsigned int, unsigned int,
	 unsigned int, unsigned int, unsigned int, unsigned int, ...);
//!!! int READ(unsigned long long, ...);
int READ(unsigned long long, unsigned int, unsigned int, unsigned int,
	 unsigned int, unsigned int, unsigned int, unsigned int, ...);
// int READ(unsigned long long, unsigned int, unsigned int, unsigned int,
//       unsigned int, unsigned int, unsigned int, unsigned int, unsigned int,
//       unsigned int, unsigned int, unsigned int, unsigned int, unsigned int,
//       unsigned int, unsigned int, unsigned int, unsigned int, unsigned int,
//       unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
//!!! int READ(unsigned long long, unsigned int, unsigned int, ... ) ;
int WRITE(unsigned long long, unsigned int, unsigned int, unsigned int,
	  unsigned int, unsigned int, unsigned int, unsigned int, unsigned int,
	  unsigned int, unsigned int, unsigned int, unsigned int, unsigned int,
	  unsigned int, unsigned int, unsigned int, unsigned int, unsigned int,
	  unsigned int, unsigned int, unsigned int, unsigned int);
// void WRITE(unsigned long long, ... ) ;
int OWN(unsigned long long, unsigned int, unsigned int, unsigned int,
	  unsigned int, unsigned int, unsigned int, unsigned int, ...);
//!!! int OWN(unsigned long long, unsigned int, unsigned int, ... ) ;
int READBLK(unsigned long long, unsigned int, unsigned int, unsigned int,
	    unsigned int, ...);
//!!! int READBLK(unsigned long long, ...);
int READBLKMASK(unsigned long long, unsigned int, unsigned int, unsigned int,
		unsigned int, unsigned long long, unsigned int, unsigned int,
		unsigned int, unsigned int, unsigned int, unsigned int,
		unsigned int, unsigned int, unsigned int, unsigned int,
		unsigned int, unsigned int, unsigned int, unsigned int,
		unsigned int, unsigned int);
void WRITEBLK(unsigned long long, ... );
int READIO(unsigned long long, unsigned int, unsigned int, unsigned int,
	   unsigned int, unsigned int, ... );
//!!! int READIO(unsigned long long, ... );
void WRITEIO(unsigned long long, ... );
int READMSKIO(unsigned long long, ... );
void WRITEMSKIO(unsigned long long, ... );
int READBLKIO(unsigned long long, ... );
void WRITEBLKIO(unsigned long long, ... );
int READBLKIOMASK(unsigned long long, unsigned int, unsigned int, unsigned int,
		  unsigned int, unsigned long long, unsigned int, unsigned int,
		  unsigned int, unsigned int, unsigned int, unsigned int,
		  unsigned int, unsigned int, unsigned int, unsigned int,
		  unsigned int, unsigned int, unsigned int, unsigned int,
		  unsigned int, unsigned int);
//!!! int INT(unsigned long long, ... );
int INT(unsigned long long, unsigned int, unsigned int, unsigned int,
	unsigned int, unsigned int, unsigned int, unsigned int,
	unsigned int, unsigned int, unsigned int, unsigned int,
	unsigned int, unsigned int, unsigned int, unsigned int,
	unsigned int, unsigned int, unsigned int, unsigned int);

// Execution flow commands.
int WAIT(unsigned int);
void SYNC(unsigned int, ... );
int IOSYNC(void);
int TIMEOUT(unsigned int);
int TIMEOUT(unsigned int, unsigned int);
void FLUSH(void);
int DONE(void);

int CHECKDONE(void);

// Self-checking commands.
void BUSCHECK(unsigned int, unsigned long long, unsigned int,
	      unsigned int, unsigned int);
void BUSWAIT(unsigned int, unsigned long long, unsigned int,
	     unsigned int, unsigned int, unsigned int);
int READINT(unsigned int, unsigned long long, unsigned long long,
	    unsigned long long, unsigned long long, unsigned long long,
	    unsigned long long, unsigned long long, unsigned long long);

// Display commands.
int PRINT(char *, ...);
int ERROR(char *, ...);
void DISPLAY_ECTAG(unsigned long long);

// Information.
int SSPINFO();
int TRANSACTION_NUM();
int TRANSACTION_INFO(unsigned int, unsigned int *, unsigned long long *,
		     unsigned int *, unsigned int *);



//????
int DISCARDREAD(unsigned long long, ... );
void TRANSWAIT(unsigned int *, unsigned long long *, unsigned int *, unsigned int *);
void INTWAIT(unsigned int *);
void DATAWAIT(unsigned long long *);
unsigned int INTAVAILABLE(unsigned long long *, unsigned long long *,
			  unsigned long long *, unsigned long long *,
			  unsigned long long *, unsigned long long *,
			  unsigned long long *, unsigned long long *);
int ECCERROR(unsigned long long, char *, char *);      //rand
int ECCERROR(unsigned long long, char *, char *, char *);  //norand
int APERROR_ADR(unsigned long long, char *);
void APERROR_TRANS(char *, char *);
int CACHETAG(unsigned long long);
void TSO(unsigned int);
void ECHO(unsigned int);
void CORRECTDATA(unsigned int);
unsigned int RESET_ASSERTED(void);
void PAUSE(unsigned int, unsigned int, unsigned int, unsigned int);

#endif // PLIAPIDEFINES_H
