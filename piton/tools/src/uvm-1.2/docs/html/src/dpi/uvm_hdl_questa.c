//----------------------------------------------------------------------
//   Copyright 2007-2011 Cadence Design Systems, Inc.
//   Copyright 2009-2010 Mentor Graphics Corporation
//   Copyright 2010-2011 Synopsys, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

#include "uvm_dpi.h"


/* 
 * UVM HDL access C code.
 *
 */

/*
 * This C code checks to see if there is PLI handle
 * with a value set to define the maximum bit width.
 *
 * If no such variable is found, then the default 
 * width of 1024 is used.
 *
 * This function should only get called once or twice,
 * its return value is cached in the caller.
 *
 */
static int uvm_hdl_max_width()
{
  vpiHandle ms;
  s_vpi_value value_s = { vpiIntVal, { 0 } };
  ms = vpi_handle_by_name((PLI_BYTE8*) "uvm_pkg::UVM_HDL_MAX_WIDTH", 0);
  if(ms == 0) 
    return 1024;  /* If nothing else is defined, 
                     this is the DEFAULT */
  vpi_get_value(ms, &value_s);
  return value_s.value.integer;
}


#ifdef QUESTA
static int uvm_hdl_set_vlog(char *path, p_vpi_vecval value, PLI_INT32 flag);
static int uvm_hdl_get_vlog(char *path, p_vpi_vecval value, PLI_INT32 flag);
static int partsel = 0;

/*
 * Given a path with part-select, break into individual bit accesses 
 * path = pointer to user string
 * value = pointer to logic vector
 * flag = deposit vs force/release options, etc
 */
static int uvm_hdl_set_vlog_partsel(char *path, p_vpi_vecval value, PLI_INT32 flag)
{
  char *path_ptr = path;
  int path_len, idx;
  svLogicVecVal bit_value;

  path_len = strlen(path);
  path_ptr = (char*)(path+path_len-1);

  if (*path_ptr != ']') 
    return 0;

  while(path_ptr != path && *path_ptr != ':' && *path_ptr != '[')
    path_ptr--;

  if (path_ptr == path || *path_ptr != ':') 
    return 0;

  while(path_ptr != path && *path_ptr != '[')
    path_ptr--;

  if (path_ptr == path || *path_ptr != '[') 
    return 0;

  int lhs, rhs, width, incr;

  // extract range from path
  if (sscanf(path_ptr,"[%u:%u]",&lhs, &rhs)) {
    char index_str[20];
    int i;
    path_ptr++;
    path_len = (path_len - (path_ptr - path));
    incr = (lhs>rhs) ? 1 : -1;
    width = (lhs>rhs) ? lhs-rhs+1 : rhs-lhs+1;

    // perform set for each individual bit
    for (i=0; i < width; i++) {
      sprintf(index_str,"%u]",rhs);
      strncpy(path_ptr,index_str,path_len);
      svGetPartselLogic(&bit_value,value,i,1);
      rhs += incr;
      if (!uvm_hdl_set_vlog(path,&bit_value,flag))
        return 0;
    }
    return 1;
  }
}


/*
 * Given a path with part-select, break into individual bit accesses 
 * path = pointer to user string
 * value = pointer to logic vector
 * flag = deposit vs force/release options, etc
 */
static int uvm_hdl_get_vlog_partsel(char *path, p_vpi_vecval value, PLI_INT32 flag)
{
  char *path_ptr = path;
  int path_len, idx;
  svLogicVecVal bit_value;

  path_len = strlen(path);
  path_ptr = (char*)(path+path_len-1);

  if (*path_ptr != ']') 
    return 0;

  while(path_ptr != path && *path_ptr != ':' && *path_ptr != '[')
    path_ptr--;

  if (path_ptr == path || *path_ptr != ':') 
    return 0;

  while(path_ptr != path && *path_ptr != '[')
    path_ptr--;

  if (path_ptr == path || *path_ptr != '[') 
    return 0;

  int lhs, rhs, width, incr;

  // extract range from path
  if (sscanf(path_ptr,"[%u:%u]",&lhs, &rhs)) {
    char index_str[20];
    int i;
    path_ptr++;
    path_len = (path_len - (path_ptr - path));
    incr = (lhs>rhs) ? 1 : -1;
    width = (lhs>rhs) ? lhs-rhs+1 : rhs-lhs+1;
    bit_value.aval = 0;
    bit_value.bval = 0;
    partsel = 1;
    for (i=0; i < width; i++) {
      int result;
      svLogic logic_bit;
      sprintf(index_str,"%u]",rhs);
      strncpy(path_ptr,index_str,path_len);
      result = uvm_hdl_get_vlog(path,&bit_value,flag);
      logic_bit = svGetBitselLogic(&bit_value,0);
      svPutPartselLogic(value,bit_value,i,1);
      rhs += incr;
      if (!result)
        return 0;
    }
    partsel = 0;
    return 1;
  }
}
#endif


/*
 * Given a path, look the path name up using the PLI,
 * and set it to 'value'.
 */
static int uvm_hdl_set_vlog(char *path, p_vpi_vecval value, PLI_INT32 flag)
{
  static int maxsize = -1;
  vpiHandle r;
  s_vpi_value value_s = { vpiIntVal, { 0 } };
  s_vpi_time  time_s = { vpiSimTime, 0, 0, 0.0 };

  //vpi_printf("uvm_hdl_set_vlog(%s,%0x)\n",path,value[0].aval);

  #ifdef QUESTA
  int result = 0;
  result = uvm_hdl_set_vlog_partsel(path,value,flag);
  if (result < 0)
    return 0;
  if (result == 1)
    return 1;

  if (!strncmp(path,"$root.",6))
    r = vpi_handle_by_name(path+6, 0);
  else
  #endif
  r = vpi_handle_by_name(path, 0);

  if(r == 0)
  {
      const char * err_str = "set: unable to locate hdl path (%s)\n Either the name is incorrect, or you may not have PLI/ACC visibility to that name";
      char buffer[strlen(err_str) + strlen(path)];
      sprintf(buffer, err_str, path);
      m_uvm_report_dpi(M_UVM_ERROR,
                       (char*) "UVM/DPI/HDL_SET",
                       &buffer[0],
                       M_UVM_NONE,
                       (char*)__FILE__,
                       __LINE__);
    return 0;
  }
  else
  {
    if(maxsize == -1) 
        maxsize = uvm_hdl_max_width();

    if (flag == vpiReleaseFlag) {
      //size = vpi_get(vpiSize, r);
      //value_p = (p_vpi_vecval)(malloc(((size-1)/32+1)*8*sizeof(s_vpi_vecval)));
      //value = &value_p;
    }
    value_s.format = vpiVectorVal;
    value_s.value.vector = value;
    vpi_put_value(r, &value_s, &time_s, flag);  
    //if (value_p != NULL)
    //  free(value_p);
    if (value == NULL) {
      value = value_s.value.vector;
    }
  }
#ifndef VCS
  vpi_release_handle(r);
#endif
  return 1;
}


/*
 * Given a path, look the path name up using the PLI
 * and return its 'value'.
 */
static int uvm_hdl_get_vlog(char *path, p_vpi_vecval value, PLI_INT32 flag)
{
  static int maxsize = -1;
  int i, size, chunks;
  vpiHandle r;
  s_vpi_value value_s;

  #ifdef QUESTA
  if (!partsel) {
    maxsize = uvm_hdl_max_width();
    chunks = (maxsize-1)/32 + 1;
    for(i=0;i<chunks-1; ++i) {
      value[i].aval = 0;
      value[i].bval = 0;
    }
  }
  int result = 0;
  result = uvm_hdl_get_vlog_partsel(path,value,flag);
  if (result < 0)
    return 0;
  if (result == 1)
    return 1;

  if (!strncmp(path,"$root.",6))
    r = vpi_handle_by_name(path+6, 0);
  else
  #endif
  r = vpi_handle_by_name(path, 0);

  if(r == 0)
  {
      const char * err_str = "get: unable to locate hdl path (%s)\n Either the name is incorrect, or you may not have PLI/ACC visibility to that name";
      char buffer[strlen(err_str) + strlen(path)];
      sprintf(buffer, err_str, path);
      m_uvm_report_dpi(M_UVM_ERROR,
    		  (char*)"UVM/DPI/HDL_GET",
                       &buffer[0],
                       M_UVM_NONE,
                       (char*)__FILE__,
                       __LINE__);
    // Exiting is too harsh. Just return instead.
    // tf_dofinish();
    return 0;
  }
  else
  {
    if(maxsize == -1) 
        maxsize = uvm_hdl_max_width();

    size = vpi_get(vpiSize, r);
    if(size > maxsize)
    {
      const char * err_str = "uvm_reg : hdl path '%s' is %0d bits, but the maximum size is %0d.  You can increase the maximum via a compile-time flag: +define+UVM_HDL_MAX_WIDTH=<value>";
      char buffer[strlen(err_str) + strlen(path) + (2*int_str_max(10))];
      sprintf(buffer, err_str, path, size, maxsize);
      m_uvm_report_dpi(M_UVM_ERROR,
    		  (char*)"UVM/DPI/HDL_SET",
                       &buffer[0],
                       M_UVM_NONE,
                       (char*)__FILE__,
                       __LINE__);
      //tf_dofinish();
#ifndef VCS
      vpi_release_handle(r);
#endif
      return 0;
    }
    chunks = (size-1)/32 + 1;

    value_s.format = vpiVectorVal;
    vpi_get_value(r, &value_s);
    /*dpi and vpi are reversed*/
    for(i=0;i<chunks; ++i)
    {
      value[i].aval = value_s.value.vector[i].aval;
      value[i].bval = value_s.value.vector[i].bval;
    }
  }
  //vpi_printf("uvm_hdl_get_vlog(%s,%0x)\n",path,value[0].aval);
#ifndef VCS
  vpi_release_handle(r);
#endif
  return 1;
}


/*
 * Given a path, look the path name up using the PLI,
 * but don't set or get. Just check.
 *
 * Return 0 if NOT found.
 * Return 1 if found.
 */
int uvm_hdl_check_path(char *path)
{
  vpiHandle r;

  #ifdef QUESTA
  if (!strncmp(path,"$root.",6)) {
    r = vpi_handle_by_name(path+6, 0);
  }
  else
  #endif
  r = vpi_handle_by_name(path, 0);

  if(r == 0)
      return 0;
  else 
    return 1;
}


/*
 * Given a path, look the path name up using the PLI
 * or the FLI, and return its 'value'.
 */
int uvm_hdl_read(char *path, p_vpi_vecval value)
{
    return uvm_hdl_get_vlog(path, value, vpiNoDelay);
}

/*
 * Given a path, look the path name up using the PLI
 * or the FLI, and set it to 'value'.
 */
int uvm_hdl_deposit(char *path, p_vpi_vecval value)
{
    return uvm_hdl_set_vlog(path, value, vpiNoDelay);
}


/*
 * Given a path, look the path name up using the PLI
 * or the FLI, and set it to 'value'.
 */
int uvm_hdl_force(char *path, p_vpi_vecval value)
{
    return uvm_hdl_set_vlog(path, value, vpiForceFlag);
}


/*
 * Given a path, look the path name up using the PLI
 * or the FLI, and release it.
 */
int uvm_hdl_release_and_read(char *path, p_vpi_vecval value)
{
    return uvm_hdl_set_vlog(path, value, vpiReleaseFlag);
}

/*
 * Given a path, look the path name up using the PLI
 * or the FLI, and release it.
 */
int uvm_hdl_release(char *path)
{
  s_vpi_vecval value;
  p_vpi_vecval valuep = &value;
  return uvm_hdl_set_vlog(path, valuep, vpiReleaseFlag);
}

