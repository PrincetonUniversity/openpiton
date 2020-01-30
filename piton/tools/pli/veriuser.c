// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: veriuser.c
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
#include <ctype.h>
#include "veriuser.h"
#ifndef USE_VPI
#include "vxl_veriuser.h"
#else
#include <vpi_user.h>
#endif

#ifdef RIVIERA
#include "aldecpli.h"
#endif

char *veriuser_version_str = 
"=== OpenSPARC T1 PLI Version 1.0 ===\nCopyright (c) 2001-2006 Sun Microsystems, Inc. All rights reserved.\n";

#ifndef USE_VPI
int (*endofcompile_routines[TF_MAXARRAY])() =
#else
int (*endofcompile_routines[])() =
#endif
{
    /*** my_eoc_routine, ***/
    0 /*** final entry must be 0 ***/
};

extern  int read_64b_call();
extern  int write_64b_call();

extern  int init_jbus_model_call();
extern  int iob_cdrive_call();

extern int slam_random_call();

extern int bw_tlb_reset_vld_call();

int Size_32() { return (32); }
int Size_64() { return (64); }

#ifndef USE_VPI
s_tfcell veriusertfs[TF_MAXARRAY] =
#else
s_tfcell veriusertfs[] =
#endif
{
    {usertask, 0, 0, 0, init_jbus_model_call, 0, "$init_jbus_model"},
    {usertask, 0, 0, 0, iob_cdrive_call, 0, "$iob_cdriver"},

    {usertask, 0, 0, 0, slam_random_call, 0, "$slam_random"},

    {usertask, 0, 0, 0, read_64b_call, 0, "$read_64b"},
    {usertask, 0, 0, 0, write_64b_call, 0, "$write_64b"},

    {usertask, 0, 0, 0, bw_tlb_reset_vld_call, 0, "$bw_force_by_name"},

    {0}
};

#ifdef __ICARUS__
static void veriusertfs_register(void)
{
    veriusertfs_register_table(veriusertfs);
}

void (*vlog_startup_routines[])() = { &veriusertfs_register, 0 };
#else
#ifdef MODELSIM
static void veriusertfs_register(void)
{
    s_vpi_systf_data task_data_s;
    p_vpi_systf_data task_data_p = &task_data_s;

    //{usertask, 0, 0, 0, init_jbus_model_call, 0, "$init_jbus_model"},
    task_data_p->type = vpiSysTask;
    task_data_p->tfname = "$init_jbus_model";
    task_data_p->calltf = init_jbus_model_call;
    task_data_p->compiletf = 0;
    vpi_register_systf(task_data_p);

    //{usertask, 0, 0, 0, iob_cdrive_call, 0, "$iob_cdriver"},
    task_data_p->type = vpiSysTask;
    task_data_p->tfname = "$iob_cdriver";
    task_data_p->calltf = iob_cdrive_call;
    task_data_p->compiletf = 0;
    vpi_register_systf(task_data_p);

    //{usertask, 0, 0, 0, slam_random_call, 0, "$slam_random"},
    task_data_p->type = vpiSysTask;
    task_data_p->tfname = "$slam_random";
    task_data_p->calltf = slam_random_call;
    task_data_p->compiletf = 0;
    vpi_register_systf(task_data_p);

    //{usertask, 0, 0, 0, read_64b_call, 0, "$read_64b"},
    task_data_p->type = vpiSysTask;
    task_data_p->tfname = "$read_64b";
    task_data_p->calltf = read_64b_call;
    task_data_p->compiletf = 0;
    vpi_register_systf(task_data_p);

    //{usertask, 0, 0, 0, write_64b_call, 0, "$write_64b"},
    task_data_p->type = vpiSysTask;
    task_data_p->tfname = "$write_64b";
    task_data_p->calltf = write_64b_call;
    task_data_p->compiletf = 0;
    vpi_register_systf(task_data_p);

    //{usertask, 0, 0, 0, bw_tlb_reset_vld_call, 0, "$bw_force_by_name"},
    task_data_p->type = vpiSysTask;
    task_data_p->tfname = "$bw_force_by_name";
    task_data_p->calltf = bw_tlb_reset_vld_call;
    task_data_p->compiletf = 0;
    vpi_register_systf(task_data_p);
}

void (*vlog_startup_routines[])() = { &veriusertfs_register, 0 };

#endif
#endif
