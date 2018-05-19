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
#include "vxl_veriuser.h"

#ifndef NO_VERA
#include "vmc_veri_funext.h"
#endif

char *veriuser_version_str = 
"=== OpenSPARC T1 PLI Version 1.0 ===\nCopyright (c) 2001-2006 Sun Microsystems, Inc. All rights reserved.\n";

int (*endofcompile_routines[TF_MAXARRAY])() =
{
    /*** my_eoc_routine, ***/
    0 /*** final entry must be 0 ***/
};

bool err_intercept(level,facility,code)
int level; char *facility; char *code;
{ 
printf("OpenSPARC T1 PLI: err_intercept: %d %s %s\n",level,facility,code);
return(true); 
}

extern  int init_jbus_model_call();
extern  int jbus_snoop_call();
extern  int l2_snoop_call();
extern  int init_iob_model_call();
extern  int iob_cdrive_call();
extern  int iob_jdrive_call();
extern  int ssi_drive_call();
extern  int bw_sys_call();
extern  int l2_warm_call();
extern  int l1_warm_call();
extern  int l2_error_call();
extern  int pc_trigger_call();
extern  int stale_dram_call();
extern  int slam_call();

extern int config_mem_call();
extern int read_mem_call();
extern int write_mem_call();
extern int in_order_call();
extern int init_dram_call();
extern int v_dump_call();
extern int v_force_call();
extern int v_set_delay_call();
extern int slam_mem_call();
extern int slam_random_call();
extern int create_event_handle_call();
extern int mon_event_call();
extern int read_dram_call();

extern int bw_list_call();
extern int bw_sas_recv_call();
extern int bw_sas_send_call();
extern int bw_socket_init_call();
extern int bw_is_empty_call();
extern int bw_instruction_decoder_call();
extern int check_good_trap_call();
extern int bw_tlb_reset_vld_call();
extern int bw_fail_call();
extern int bw_reset_buffer_call();

extern int monInit_check();
extern int monInit_call();
extern int info_check();
extern int infow_call();
extern int info_call();
extern int error_check();
extern int error_call();
extern int warn_check();
extern int warn_call();
extern int parse_check();
extern int parse_call();
extern int monErrorDisable_call();
extern int monErrorEnable_call();

#ifndef LINUX
// Tri: not sure why these are enabled when debug_all
linux_should_be_defined;
extern int new_jbus_mon_cycle();
extern int jbus_mon_init();
extern int jbus_mon_reset_change();
extern int new_jbus_check_cycle();
extern int jbus_check_init();
extern int jbus_check_reset_change();
extern int update_jbus_mon_outputs();
extern int update_jbus_check_outputs();
extern int jbus_mon_do_finish();
#endif

extern int dispmon();
extern int dispmon_misc();
extern int writemon();
extern int initmon();
extern int dispmon_status();
extern int enable_errwarnmon();
extern int disable_errwarnmon();
extern int check_mon();
extern int module_start();
extern int module_end();
extern int modules_done();
extern int get_no_of_modules();

extern int front_init();
extern int sjm_misc();
extern int front_assert_pwr();
extern int front_assert_por();
extern int front_deassert_por();
extern int front_start_exec();
extern int front_get_status();
extern int front_set_inputs();
extern int front_get_outputs();
extern int sjm_get_infsm();
extern int sjm_get_arbiter();
extern int sjm_get_snp_ctrl();
extern int sjm_get_snoopq();
extern int sjm_get_resultsq();
extern int sjm_get_jpackq();
extern int sjm_get_jpackoutq();
extern int sjm_get_memq();
extern int sjm_get_iomemq();
extern int sjm_get_dataq();
extern int sjm_get_readbuff();
extern int sjm_get_outq();
extern int sjm_get_rdrq();
extern int sjm_get_out_state();

int Size_32() { return (32); }
int Size_64() { return (64); }

s_tfcell veriusertfs[TF_MAXARRAY] =
{

#ifndef NO_VERA
#include "vmc_veri_fundef.c" 
#endif

    {usertask, 0, 0, 0, init_jbus_model_call, 0, "$init_jbus_model"},
    {usertask, 0, 0, 0, jbus_snoop_call, 0, "$jbus_snoop"},
    {usertask, 0, 0, 0, l2_snoop_call, 0, "$l2_snoop"},
    {usertask, 0, 0, 0, init_iob_model_call, 0, "$init_iob_model"},
    {usertask, 0, 0, 0, iob_cdrive_call, 0, "$iob_cdriver"},
    {usertask, 0, 0, 0, iob_jdrive_call, 0, "$iob_jdriver"},
    {usertask, 0, 0, 0, ssi_drive_call, 0, "$ssi_drive"},
    {usertask, 0, 0, 0, bw_sys_call, 0, "$bw_sys"},
    {usertask, 0, 0, 0, l2_warm_call, 0, "$l2_warm"},
    {usertask, 0, 0, 0, l1_warm_call, 0, "$l1_warm"},
    {usertask, 0, 0, 0, l2_error_call, 0, "$l2_error_enjection"},
    {usertask, 0, 0, 0, pc_trigger_call, 0, "$pc_trigger_event"},
    {usertask, 0, 0, 0, stale_dram_call, 0, "$stale_dram"},
    {usertask, 0, 0, 0, slam_call, 0, "$slam_cache"},

    {userfunction, 0, 0, Size_32, config_mem_call, 0, "$config_mem"},
    {usertask, 0, 0, 0, read_mem_call, 0, "$read_mem"},
    {usertask, 0, 0, 0, write_mem_call, 0, "$write_mem"},
    {usertask, 0, 0, 0, in_order_call, 0, "$in_order"},
    {usertask, 0, 0, 0, init_dram_call, 0, "$init_dram"},
    {usertask, 0, 0, 0, v_dump_call, 0, "$v_dump"},
    {usertask, 0, 0, 0, v_force_call, 0, "$v_force"},
    {usertask, 0, 0, 0, v_set_delay_call, 0, "$v_delay"},
    {usertask, 0, 0, 0, slam_mem_call, 0, "$slam_mem"},
    {usertask, 0, 0, 0, slam_random_call, 0, "$slam_random"},
    {userfunction, 0, 0, Size_32, create_event_handle_call, 0, "$create_event_handle"},
    {usertask, 0, 0, 0, mon_event_call, 0, "$mon_event"},
    {userfunction, 0, 0, Size_64, read_dram_call, 0, "$read_dram"},

    {userfunction, 0, 0, Size_32, bw_list_call, 0, "$bw_list"},
    {userfunction, 0, 0, Size_32, bw_sas_recv_call, 0, "$bw_sas_recv"},
    {userfunction, 0, 0, Size_32, bw_sas_send_call, 0, "$bw_sas_send"},
    {usertask, 0, 0, 0, bw_socket_init_call, 0, "$bw_socket_init"},
    {userfunction, 0, 0, Size_32, bw_is_empty_call, 0, "$bw_empty"},
    {userfunction, 0, 0, Size_32, bw_instruction_decoder_call, 0, "$bw_decoder"},
    {userfunction, 0, 0, Size_32, check_good_trap_call, 0, "$bw_good_trap"},
    {usertask, 0, 0, 0, bw_tlb_reset_vld_call, 0, "$bw_force_by_name"},
    {usertask, 0, 0, 0, bw_fail_call, 0, "$bw_fail"},
    {usertask, 0, 0, 0, bw_reset_buffer_call, 0, "$bw_reset_buf"},

    {usertask, 0, monInit_check, 0, monInit_call, 0, "$monInit"},
    {usertask, 0, info_check, 0, infow_call, 0, "$infow"},
    {usertask, 0, info_check, 0, info_call, 0, "$info"},
    {usertask, 0, error_check, 0, error_call, 0, "$error"},
    {usertask, 0, warn_check, 0, warn_call, 0, "$warn"},
    {userfunction, 0, parse_check, Size_32, parse_call, 0, "$parse"},
    {usertask, 0, 0, 0, monErrorDisable_call, 0, "$monErrorDisable"},
    {usertask, 0, 0, 0, monErrorEnable_call, 0, "$monErrorEnable"},

#ifndef LINUX
    {usertask, 0, 0, 0, new_jbus_mon_cycle, jbus_mon_init, "$new_jbus_mon_cycle"},
    {usertask, 0, 0, 0, jbus_mon_reset_change, 0, "$jbus_mon_reset_change"},
    {usertask, 0, 0, 0, new_jbus_check_cycle, jbus_check_init, "$new_jbus_check_cycle"},
    {usertask, 0, 0, 0, jbus_check_reset_change, 0, "$jbus_check_reset_change"},
    {usertask, 0, 0, 0, update_jbus_mon_outputs, 0, "$jbus_mon_outputs"},
    {usertask, 0, 0, 0, update_jbus_check_outputs, 0, "$jbus_check_outputs"},
    {usertask, 0, 0, 0, jbus_mon_do_finish, 0, "$jbus_mon_finish"},
#endif

    {usertask, 0, 0, 0, dispmon, dispmon_misc, "$dispmon"},
    {usertask, 0, 0, 0, writemon, 0, "$writemon"},
    {usertask, 0, 0, 0, initmon, 0, "$initmon"},
    {userfunction, 0, 0, Size_32, dispmon_status, 0, "$dispmon_status"},
    {usertask, 0, 0, 0, enable_errwarnmon, 0, "$enable_errwarnmon"},
    {usertask, 0, 0, 0, disable_errwarnmon, 0, "$disable_errwarnmon"},
    {userfunction, 0, 0, Size_32, check_mon, 0, "$check_mon"},
    {usertask, 0, 0, 0, module_start, 0, "$ModuleStart"},
    {usertask, 0, 0, 0, module_end, 0, "$ModuleEnd"},
    {userfunction, 0, 0, Size_32, modules_done, 0, "$ModulesDone"},
    {userfunction, 0, 0, Size_32, get_no_of_modules, 0, "$GetModules"},

    {userfunction, 0, 0, Size_32, front_init, sjm_misc, "$sjm_init"},
    {userfunction, 0, 0, Size_32, front_assert_pwr, 0, "$sjm_assert_pwr"},
    {userfunction, 0, 0, Size_32, front_assert_por, 0, "$sjm_assert_por"},
    {userfunction, 0, 0, Size_32, front_deassert_por, 0, "$sjm_deassert_por"},
    {userfunction, 0, 0, Size_32, front_start_exec, 0, "$sjm_start_exec"},
    {userfunction, 0, 0, Size_32, front_get_status, 0, "$sjm_get_status"},
    {userfunction, 0, 0, Size_32, front_set_inputs, 0, "$sjm_set_inputs"},
    {userfunction, 0, 0, Size_32, front_get_outputs, 0, "$sjm_get_outputs"},
    {userfunction, 0, 0, Size_32, sjm_get_infsm, 0, "$sjm_get_infsm"},
    {userfunction, 0, 0, Size_32, sjm_get_arbiter, 0, "$sjm_get_arbiter"},
    {userfunction, 0, 0, Size_32, sjm_get_snp_ctrl, 0, "$sjm_get_snp_ctrl"},
    {userfunction, 0, 0, Size_32, sjm_get_snoopq, 0, "$sjm_get_snoopq"},
    {userfunction, 0, 0, Size_32, sjm_get_resultsq, 0, "$sjm_get_resultsq"},
    {userfunction, 0, 0, Size_32, sjm_get_jpackq, 0, "$sjm_get_jpackq"},
    {userfunction, 0, 0, Size_32, sjm_get_jpackoutq, 0, "$sjm_get_jpackoutq"},
    {userfunction, 0, 0, Size_32, sjm_get_memq, 0, "$sjm_get_memq"},
    {userfunction, 0, 0, Size_32, sjm_get_iomemq, 0, "$sjm_get_iomemq"},
    {userfunction, 0, 0, Size_32, sjm_get_dataq, 0, "$sjm_get_dataq"},
    {userfunction, 0, 0, Size_32, sjm_get_readbuff, 0, "$sjm_get_readbuff"},
    {userfunction, 0, 0, Size_32, sjm_get_outq, 0, "$sjm_get_outq"},
    {userfunction, 0, 0, Size_32, sjm_get_rdrq, 0, "$sjm_get_rdrq"},
    {userfunction, 0, 0, Size_32, sjm_get_out_state, 0, "$sjm_get_out_state"},
    {0}
};

