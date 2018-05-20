// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: socket_pli.c
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
/*******************************************************************************
    mon_pli.c
********************************************************************************
*
* Definition for tcp client/server program
*/

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <string.h>
#include "veriuser.h"
#include "acc_user.h"
#ifdef __ICARUS__
#include <unistd.h>
#include <stdio.h>
#include "icarus-compat.h"
#endif


#define TOK_CMD               1
#define TOK_RTL_CYCLE         2
#define TOK_READ_TH_REG       3
#define TOK_READ_TH_CTL_REG   4
#define TOK_READ_TH_FP_REG_I  5
#define TOK_READ_TH_FP_REG_X  6
#define TOK_READ_REGS_ALL     7
#define TOK_SSTEP             8
#define TOK_QUIT              9

#define SERV_HOST_ADDR "127.0.0.1"

#define CMD_BUFSIZE 512
#define RCV_BUFSIZE 16000

int sas_client_init_calltf(), sas_client_init_checktf();
int sas_client_calltf(), sas_client_checktf();

static int csocket;
static int sockfd;
static int csocket_found = 0;

int debug_socket_pli;

#define CONTROL_REGS_COUNT               75

static unsigned long long sas_ctrl_regs_val[4][CONTROL_REGS_COUNT];
static unsigned long long sas_glob_regs_val[4][32];
static unsigned long long sas_int_regs_val[4][32];
static unsigned long long sas_fp_regs_val[4][64];

static char cmd_buf[CMD_BUFSIZE], recv_buf[RCV_BUFSIZE];

static void socket_read_regs_all_error (int err)
{
  tf_error ("socket-pli: incomplete regs value (from read-regs-all call (%d))\n", err);
  tf_dofinish();
}
/*
 * Send command to sas
 */

#ifndef __ICARUS__
int send_cmd (fd, ptr)
     register int fd;
     register char *ptr;
#else
int send_cmd (int fd, char *ptr)
#endif
{
  int nbytes, nwritten;

  if (debug_socket_pli >= 2)
    io_printf ("%d:DEBUG:send_cmd_entry> %s", tf_gettime(), ptr);

  nbytes = strlen (ptr);
  nwritten = write (fd, ptr, nbytes);
  if (nwritten != nbytes)
    perror ("send_cmd: writen error on socket");

 if (debug_socket_pli >= 2)
    io_printf ("%d:DEBUG:send_cmd_exit>\n", tf_gettime());

  return (nbytes - nwritten);
}


#ifndef __ICARUS__
int recv_reply (fd, ptr, maxlen, chk)
     register int fd;
     register char *ptr;
     register int maxlen;
     register int chk;
#else
int recv_reply (int fd, char *ptr, int maxlen, int chk)
#endif
{
  int n, rc, retry_count;
  char *ptr1;
  char c;
  char line[160];

  
  if (debug_socket_pli >= 2)
    io_printf ("DEBUG: RCVD REPLY\n");
  ptr1 = line;
  retry_count = 0;
//  for (n=1; n< maxlen; n++) {
  n = 1;
  while (1) {
    if (n++ >= maxlen) {
        tf_error ("socket-pli: recv_reply (reveive buffer overflow)\n");
        *ptr = 0;
        return (-1);
    }
    if ((rc = read (fd, &c, 1)) == 1) {

      *ptr1++ = c;
      if (c == '\n') {
	*ptr1 = 0;
	if (strncmp(line, "sas:info>", 9) == 0) {
	  io_printf ("%s", line);
	}
	if (debug_socket_pli >= 1)
	  io_printf ("DEBUG:socket_pli:%s\n", line);
	strcpy (ptr, line);
	ptr1 = line;
	ptr += strlen(line);
	if (strncmp (line, "e-o-s-l", 7) == 0) {
	  if (debug_socket_pli >= 2)
	    io_printf ("DEBUG: LINE RETURN\n");
	  *ptr = 0;
	  return 1;
	}
        retry_count = 0;
      }
    } else {
                        //    if (chk == 1) 
      if (retry_count++ > 16) {
          tf_error ("socket-pli: recv_reply (timeout)\n");
          *ptr = 0;
          return (-1);
      }
    }
  }
}

static void
get_sas_reg_val (int core)
{
  int i;
  char *ptr;

  sprintf (cmd_buf, "read-regs-all %d\neosl\n", core); 
  send_cmd (sockfd, cmd_buf);
  recv_reply (sockfd, recv_buf, RCV_BUFSIZE, 1);
  if (recv_buf == NULL) socket_read_regs_all_error (1);
  ptr = strtok (recv_buf, "\n");
  if (ptr == NULL) socket_read_regs_all_error (2);

  for (i=0; i < CONTROL_REGS_COUNT; i++) {
    ptr = strtok (NULL, "\n");
    if (ptr == NULL) socket_read_regs_all_error (3);
    sas_ctrl_regs_val[0][i] = strtoull(ptr, 0, 16);
    if (debug_socket_pli >= 3)
      io_printf ("%d::DEBUG:ctl(%d)> %016llx\n", tf_gettime(), i, sas_ctrl_regs_val[0][i]);
  }

  for (i=0; i < 32; i++) {
    ptr = strtok (NULL, "\n");
    if (ptr == NULL) socket_read_regs_all_error (4);
    sas_glob_regs_val[0][i] = strtoull(ptr, 0, 16);
    if (debug_socket_pli >= 3)
      io_printf ("%d::DEBUG:glob(%d)> %016llx\n", tf_gettime(), i, sas_glob_regs_val[0][i]);
  }

  for (i=0; i < 128; i++) {
    ptr = strtok (NULL, "\n");
    if (ptr == NULL) socket_read_regs_all_error (5);
    sas_int_regs_val[0][i] = strtoull(ptr, 0, 16);
    if (debug_socket_pli >= 3)
      io_printf ("%d::DEBUG:intreg(%d)> %016llx\n", tf_gettime(), i, sas_int_regs_val[0][i]);
  }

  for (i=0; i < 32; i++) {
    ptr = strtok (NULL, "\n");
    if (ptr == NULL) socket_read_regs_all_error (6);
    sas_fp_regs_val[0][i] = strtoull(ptr, 0, 16);
    if (debug_socket_pli >= 3)
      io_printf ("%d::DEBUG:fpreg(%d)> %016llx\n", tf_gettime(), i, sas_fp_regs_val[0][i]);
  }
}
//slam all the register value into memory.
int slam_data(unsigned long long* regs,
	      s_tfnodeinfo node_info,
	      int start,
	      int num)
{
 char* avalPtr, *bvalPtr, byte;
 int   word, groups, size, ind;
 unsigned long long tem_data;
 ind = 0;
 word = node_info.node_ngroups * 2;
 for(size = start;size < num;size++){
   avalPtr  = node_info.node_value.memoryval_p + size * word;
   bvalPtr  = avalPtr + node_info.node_ngroups;
   tem_data = regs[ind++];
   for(groups = 0; groups < node_info.node_ngroups; groups++){
      byte            = tem_data & 0xff;
      avalPtr[groups] = byte;
      bvalPtr[groups] = 0;
      tem_data      >>= 8;
    }
  }
}
//slam all the registers
int slam_mem(){
  char* avalPtr, *bvalPtr, byte;
  int   word, groups, size;
  unsigned long long tem_data;
  s_tfnodeinfo node_info;
  tf_nodeinfo(2, &node_info);
  //control register
  slam_data(sas_ctrl_regs_val[0], node_info, 0, CONTROL_REGS_COUNT);
  //global
  slam_data(sas_glob_regs_val[0], node_info, 75, 107);
  //integer register
  slam_data(sas_int_regs_val[0],  node_info, 107, 235);
  //float
  slam_data(sas_fp_regs_val[0],   node_info, 235, 267);
}
int sas_client_init_checktf()
{
  //  if (tf_nump() != 1) {
  //    tf_error ("Usages:\n");
  //  }
  //
  //  if (tf_typep(1) != tf_readwrite) {
  //    tf_error ("Arg must be reg type\n");
  //  }
  csocket = 0;
}
char last_instr[128];

int sas_client_init_calltf()
{
  struct sockaddr_in  serv_addr;
  char   *pargs;

  debug_socket_pli = 0;
  pargs = mc_scan_plusargs ("debug_socket_pli=");  
  if (pargs != (char *)0) {
      debug_socket_pli = atoi (pargs);
  }

  pargs = mc_scan_plusargs ("csocket=");  

  csocket_found = 0;
  if (pargs != (char *)0) {
    csocket = atoi (pargs);
    if (csocket !=0) {csocket_found = 1;}
  }

  if (csocket_found == 0) return 0;

  io_printf ("Using csocket = %d\n", csocket);

  /*
   * Fill in server address with the address of the server
   */

  bzero ((char *) &serv_addr, sizeof (serv_addr));
  serv_addr.sin_family      = AF_INET;
  serv_addr.sin_addr.s_addr = inet_addr (SERV_HOST_ADDR);
  serv_addr.sin_port        = htons (csocket);
  
  /*
   * Open a TCP socket
   */
  
  if ((sockfd = socket (AF_INET, SOCK_STREAM, 0)) < 0)
    perror ("client: Can't open stream socket");
  
  if (connect (sockfd, (struct sockaddr *) &serv_addr, sizeof (serv_addr)) < 0)
     perror ("client: Can't connect to in server");

  sprintf (last_instr, " ");

}

int sas_client_checktf()
{
  //  if (tf_nump() != 1) {
  //    tf_error ("Usages:\n");
  //  }
  //
  //  if (tf_typep(1) != tf_readwrite) {
  //    tf_error ("Arg must be reg type\n");
  //  }
  // io_printf ("sas: client checktf\n");
  return 0;
}

int sas_client_calltf()
{
  int need_sas_sparc_intf_update;
  unsigned long long ll;
  unsigned int threads;
  char tmp_buf[256];
  int i, j;
  int swerver_idx, len;
  int op_id;
  char *op, *ptr;
  char *opargs;
  static s_acc_value avalue = {accIntVal};    /* Holds argument value */
  static s_setval_delay delay_s = {{0}, accNoDelay};

  if (csocket_found == 0) return 0;

  op_id = 0;

  op = tf_getcstringp (1);
  if (strcmp(op, "cmd") == 0) {
    op_id = TOK_CMD;
    opargs = tf_getcstringp (2);
  }
  else if (strcmp(op, "rtl_cycle") == 0) {
    op_id = TOK_RTL_CYCLE;
  }
  else if (strcmp(op, "sstep") == 0) {
    op_id = TOK_SSTEP;
    opargs = tf_getcstringp (2);
  }
  else if (strcmp(op, "read-th-reg") == 0) {
    op_id = TOK_READ_TH_REG;
    opargs = tf_getcstringp (2);
  }
  else if (strcmp(op, "read-th-ctl-reg") == 0) {
    op_id = TOK_READ_TH_CTL_REG;
  }
  else if (strcmp(op, "read-th-fp-reg-i") == 0) {
    op_id = TOK_READ_TH_FP_REG_I;
    opargs = tf_getcstringp (2);
  }
  else if (strcmp(op, "read-th-fp-reg-x") == 0) {
    op_id = TOK_READ_TH_FP_REG_X;
    opargs = tf_getcstringp (2);
  }
  else if (strcmp(op, "read-regs-all") == 0) {
    op_id = TOK_READ_REGS_ALL;
    opargs = tf_getcstringp (2);
  }
  else if (strcmp(op, "quit") == 0) {
    op_id = TOK_QUIT;
  }

  switch (op_id) {
  case TOK_CMD:
    sprintf (cmd_buf, "%s\neosl\n", opargs);
    if (debug_socket_pli >= 2)
      io_printf ("%d:0:DEBUG:cmd_send> %s", tf_gettime(), cmd_buf);
    send_cmd (sockfd, cmd_buf);
    if (debug_socket_pli >= 2)
      io_printf ("%d:DEBUG:TOK_CMD:recv_reply_start>\n", tf_gettime());
    recv_reply (sockfd, recv_buf, RCV_BUFSIZE, 1);
    if (recv_buf == NULL) socket_read_regs_all_error (7);
    if (debug_socket_pli >= 2)
      io_printf ("%d:DEBUG:TOK_CMD:recv_reply_end>%s\n", tf_gettime(), recv_buf);
    io_printf ("%d:sas> %s", tf_gettime(), recv_buf);
    break;

  case TOK_SSTEP:
    threads = tf_getp (2);
    len = 0;
    swerver_idx = (threads & 0x7);
    for (i=0; i <= swerver_idx; i++) {
      threads >>= 3;
      if ((threads & 0x7) > 4)
	sprintf (tmp_buf+len, "-");
      else
	sprintf (tmp_buf+len, "%x", (threads & 0x7));
      len++;
    }
    sprintf (tmp_buf+len, "\n");
    sprintf (cmd_buf, "ssi t%seosl\n", tmp_buf);
    if (debug_socket_pli >= 2)
      io_printf ("%d:2:DEBUG:cmd_send> %s", tf_gettime(), cmd_buf);
    send_cmd (sockfd, cmd_buf);
    if (debug_socket_pli >= 2)
      io_printf ("%d:3:DEBUG:recv_reply_start> %s\nwaiting for reply\n", tf_gettime(), cmd_buf);
    recv_reply (sockfd, recv_buf, RCV_BUFSIZE, 1);
    if (recv_buf == NULL) socket_read_regs_all_error (8);
    if (debug_socket_pli >= 2)
      io_printf ("%d:3:DEBUG:rcvd_reply_done> %s <end>", tf_gettime(), recv_buf);

    ptr = strtok (recv_buf, "\n");
    if (ptr == NULL) socket_read_regs_all_error (9);
    ptr = strtok (NULL, "\n");
    if (ptr == NULL) socket_read_regs_all_error (10);
    io_printf ("%d:sas> %s\n", tf_gettime(), ptr);
    break;

  case TOK_READ_TH_REG:
    sprintf (cmd_buf, "read-th-reg %d %d %d\neosl\n", 
	     tf_getp (3), tf_getp (4), tf_getp (5));
    if (debug_socket_pli >= 2)
      io_printf ("%d:5:DEBUG:cmd_send> %s", tf_gettime(), cmd_buf);
    send_cmd (sockfd, cmd_buf);
    recv_reply (sockfd, recv_buf, RCV_BUFSIZE, 1);
    if (recv_buf == NULL) socket_read_regs_all_error (11);
    if (debug_socket_pli >= 2)
      io_printf ("%d:6:DEBUG:sas> %s", tf_gettime(), recv_buf);
    ptr = strtok (recv_buf, "\n");
    if (ptr == NULL) socket_read_regs_all_error (12);
    ptr = strtok (NULL, "\n");
    if (ptr+7 == NULL) socket_read_regs_all_error (13);
    ll = strtoull (ptr+7, 0, 16);
    if (debug_socket_pli >= 2)
      io_printf ("DEBUG-CMP0: %016llx; %s\n", ll, ptr+7);
    sprintf (tmp_buf, "%016llx\0", ll);
    avalue.value.str = tmp_buf;
    avalue.format = accHexStrVal;
    acc_set_value(acc_handle_tfarg(2), &avalue, &delay_s);
    break;

  case TOK_READ_TH_CTL_REG:
    sprintf (cmd_buf, "read-th-ctl-reg %d %d\neosl\n", 
	     tf_getp (3), tf_getp (4));
    if (debug_socket_pli >= 2)
      io_printf ("%d:15:DEBUG:cmd_send> %s", tf_gettime(), cmd_buf);
    send_cmd (sockfd, cmd_buf);
    recv_reply (sockfd, recv_buf, RCV_BUFSIZE, 1);
    if (recv_buf == NULL) socket_read_regs_all_error (14);
    if (debug_socket_pli >= 2)
      io_printf ("%d:16:DEBUG:sas> %s", tf_gettime(), recv_buf);

    ptr = strtok (recv_buf, "\n");
    if (ptr == NULL) socket_read_regs_all_error (15);
    ptr = strtok (NULL, "\n");
    if (ptr+7 == NULL) socket_read_regs_all_error (16);
    ll = strtoull (ptr+7, 0, 16);
    if (debug_socket_pli >= 2)
      io_printf ("DEBUG-CMP1: %016llx; %s\n", ll, ptr+7);
    sprintf (tmp_buf, "%016llx\0", ll);
    avalue.value.str = tmp_buf;
    avalue.format = accHexStrVal;
    acc_set_value(acc_handle_tfarg(2), &avalue, &delay_s);
    break;

  case TOK_READ_TH_FP_REG_I:
    sprintf (cmd_buf, "read-th-fp-reg-i %d %d\neosl\n", 
	     tf_getp (3), tf_getp (4));
    if (debug_socket_pli >= 2)
      io_printf ("%d:5:DEBUG:cmd_send> %s", tf_gettime(), cmd_buf);
    send_cmd (sockfd, cmd_buf);
    recv_reply (sockfd, recv_buf, RCV_BUFSIZE, 1);
    if (recv_buf == NULL) socket_read_regs_all_error (17);
    if (debug_socket_pli >= 2)
      io_printf ("%d:6:DEBUG:sas> %s", tf_gettime(), recv_buf);
    ptr = strtok (recv_buf, "\n");
    if (ptr == NULL) socket_read_regs_all_error (18);
    ptr = strtok (NULL, "\n");
    if (ptr == NULL) socket_read_regs_all_error (19);
    ll = strtoull (ptr+7, 0, 16);
    if (debug_socket_pli >= 2)
      io_printf ("DEBUG-CMP0: %08x; %s\n", ll, ptr+7);
    sprintf (tmp_buf, "%08x\0", (unsigned int)ll);
    avalue.value.str = tmp_buf;
    avalue.format = accHexStrVal;
    acc_set_value(acc_handle_tfarg(2), &avalue, &delay_s);
    break;

  case TOK_READ_TH_FP_REG_X:
    sprintf (cmd_buf, "read-th-fp-reg-x %d %d\neosl\n", 
	     tf_getp (3), tf_getp (4));
    if (debug_socket_pli >= 2)
      io_printf ("%d:5:DEBUG:cmd_send> %s", tf_gettime(), cmd_buf);
    send_cmd (sockfd, cmd_buf);
    recv_reply (sockfd, recv_buf, RCV_BUFSIZE, 1);
    if (recv_buf == NULL) socket_read_regs_all_error (20);
    if (debug_socket_pli >= 2)
      io_printf ("%d:6:DEBUG:sas> %s", tf_gettime(), recv_buf);
    ptr = strtok (recv_buf, "\n");
    if (ptr == NULL) socket_read_regs_all_error (21);
    ptr = strtok (NULL, "\n");
    if (ptr+7 == NULL) socket_read_regs_all_error (22);
    ll = strtoull (ptr+7, 0, 16);
    if (debug_socket_pli >= 2)
      io_printf ("DEBUG-CMP0: %016llx; %s\n", ll, ptr+7);
    sprintf (tmp_buf, "%016llx\0", ll);
    avalue.value.str = tmp_buf;
    avalue.format = accHexStrVal;
    acc_set_value(acc_handle_tfarg(2), &avalue, &delay_s);
    break;

  case TOK_READ_REGS_ALL:
   
    get_sas_reg_val (tf_getp (3));
    slam_mem();
    /*
    len = 0;
    for (i=0; i < CONTROL_REGS_COUNT; i++)
      len += sprintf (recv_buf+len, "%016llx", sas_ctrl_regs_val[0][i]);
    for (i=0; i < 32; i++)
      len += sprintf (recv_buf+len, "%016llx", sas_glob_regs_val[0][i]);
    for (i=0; i < 128; i++)
      len += sprintf (recv_buf+len, "%016llx", sas_int_regs_val[0][i]);
    for (i=0; i < 32; i++)
      len += sprintf (recv_buf+len, "%016llx", sas_fp_regs_val[0][i]);
    len += sprintf (recv_buf+len, "\n");

    avalue.value.str = recv_buf;
    avalue.format = accHexStrVal;
    acc_set_value(acc_handle_tfarg(2), &avalue, &delay_s);*/
    break;

  case TOK_RTL_CYCLE:
    sprintf (cmd_buf, "rtl_cycle\neosl\n");
    if (debug_socket_pli >= 2)
      io_printf ("%d:0:DEBUG:cmd_send> %s", tf_gettime(), cmd_buf);
    send_cmd (sockfd, cmd_buf);
    recv_reply (sockfd, recv_buf, RCV_BUFSIZE, 1);
    if (recv_buf == NULL) socket_read_regs_all_error (23);
    if (debug_socket_pli >= 2)
      io_printf ("%d:1:DEBUG:sas> %s", tf_gettime(), recv_buf);
    break;

  case TOK_QUIT:
    sprintf (cmd_buf, "quit\n");
    if (debug_socket_pli >= 2)
      io_printf ("%d:0:DEBUG:cmd_send> %s", tf_gettime(), cmd_buf);
    send_cmd (sockfd, cmd_buf);
//    if (debug_socket_pli >= 2)
//      io_printf ("%d:DEBUG:TOK_QUIT:recv_reply_start>\n", tf_gettime());
//    recv_reply (sockfd, recv_buf, RCV_BUFSIZE, 0);
//    if (recv_buf == NULL) socket_read_regs_all_error (24);
//    if (debug_socket_pli >= 2)
//      io_printf ("%d:DEBUG:TOK_CMD:recv_reply_end>%s\n", tf_gettime(), recv_buf);
//     io_printf ("%d:sas> %s", tf_gettime(), recv_buf);
     break;


  }
}



