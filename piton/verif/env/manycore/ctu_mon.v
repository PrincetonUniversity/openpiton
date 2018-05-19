// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ctu_mon.v
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
////////////////////////////////////////////////////////;
// ctu_mon.v
//
//  ctu_mon_on : Check the clk stop sequence and turn off cken mon
//  ctu_mon_off :if not defined :
//               Check the frequency(divmon) and level mon
//               if defined :
//               turn off the frequency(divmon) and level mon
//
//  usage : ctu_mon_off , define when the signal is intended to toggle
//                        (level mon off and divcheck mon off)
//  usage : ctu_mon_on  , define when clock stop test is run
//
// Description: CTU Monitor
////////////////////////////////////////////////////////


//`include "cross_module.h"

`define IDLE       0
`define DBG_DELAY    1
`define STOP_SIML  2
`define STOP_NO    3
`define CKEN_DLY   4
`define STOP_DLY   5

`define NUM_EN     35

`define CDIV_DEF   4
`define DDIV_DEF   16
`define JDIV_DEF   16

`define CDIV_DEF_SLAM   2
`define DDIV_DEF_SLAM   14
`define JDIV_DEF_SLAM   12


module ctu_mon ();

//--------------------------------------------------------------------------------------
// Interface (note that most of the stuff is cross-module referencing,
// so the interface is minimal
//--------------------------------------------------------------------------------------
  //input clk;            // the cpu clock
  //input rst_l;          // reset (active low).

  reg   clk_stop;
  reg   clk_stop_simult;
  reg [4:0]  dbg_delay;
  reg [6:0]  cken_delay;
  reg [5:0]  stop_id; 
  reg        done;

  wire        clk       = cmp_top.iop.ctu.cmp_clk;      // hooked to clk in ctu which is always running
  wire        rst_l     = cmp_top.iop.ctu.cmp_rst_l;    // hooked to clk in ctu which is always running
  wire        ossdis    = cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.clsp_ctrl_ossdis_cl;   // bit 63
  wire        clkdis    = cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.clsp_ctrl_clkdis_cl;   // bit 62
  wire [4:0]  dbg_dly   = cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_creg.dbgtrig_dly_cnt_val[4:0];  // [44:40] of reg 0x18,ctu
  wire [6:0]  cken_dly  = cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.clsp_ctrl_clkstop_dly_cl[6:0]; // [54:48] of reg 0x8,ctu
  wire [5:0]  stp_id    = cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_creg.new_id[5:0];   // stop id for clock

  wire [`NUM_EN-1:0] cken_array =  {
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_misc_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_dbg_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_efc_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_iob_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_jbusr_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_jbusl_cken_cl,
                                                       1'b0,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_jbi_cken_cl,
                                                       1'b0,
                                                       1'b0,
                                                       1'b0,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_ddr3_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_ddr2_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_ddr1_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_ddr0_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_fpu_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_ccx_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_dram13_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_dram02_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sctag3_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sctag2_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sctag1_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sctag0_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_scdata3_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_scdata2_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_scdata1_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_scdata0_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sparc7_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sparc6_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sparc5_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sparc4_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sparc3_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sparc2_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sparc1_cken_cl,
                       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.ctu_sparc0_cken_cl
                         };




  wire        trig  = cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkctrl.dbg_trig;     // trigger for clock stop
  wire        sctag0_tr  = cmp_top.iop.ctu.sctag0_ctu_tr;
  wire        sctag1_tr  = cmp_top.iop.ctu.sctag1_ctu_tr;
  wire        sctag2_tr  = cmp_top.iop.ctu.sctag2_ctu_tr;
  wire        sctag3_tr  = cmp_top.iop.ctu.sctag3_ctu_tr;
  wire        jbi_tr     = cmp_top.iop.ctu.jbi_ctu_tr;
  wire        iob_tr     = cmp_top.iop.ctu.iob_ctu_tr;
  wire        iob_l2_tr  = cmp_top.iop.ctu.iob_ctu_l2_tr;
  wire        dram02_tr  = cmp_top.iop.ctu.dram02_ctu_tr;
  wire        dram13_tr  = cmp_top.iop.ctu.dram13_ctu_tr;

  wire        freq_change  = cmp_top.iop.ctu.ctu_clsp.frq_chng_pending_jl;
  reg         freq_chng;



  wire        pll_clk  =  cmp_top.iop.ctu.u_pll.pll_clk_out; 
  wire        cmp_gclk =  cmp_top.iop.ctu.cmp_gclk_out;     
  wire        dram_gclk = cmp_top.iop.ctu.dram_gclk_out;   
  wire        jbus_gclk = cmp_top.iop.ctu.jbus_gclk_out;  
  wire        wake_thrd = cmp_top.iop.ctu_iob_wake_thr;
  wire        J_RST_L   = cmp_top.iop.J_RST_L;
  wire        PWRON_RST_L =  cmp_top.iop.PWRON_RST_L;

//-----------------------------------------------------------
// Signals ported from ctu sat, ios_rsts.v



  ////////////////////////////////////////////////////////////////
  // 'pin' signals cover from chip pin to a non-pad cluster's port
  ////////////////////////////////////////////////////////////////
  wire hi_pin_clk_stretch = (
    ( cmp_top.CLK_STRETCH                         ) &
    ( cmp_top.iop.CLK_STRETCH                     ) &
    ( cmp_top.iop.pad_misc.clk_stretch            ) &
    ( cmp_top.iop.pad_misc.io_clk_stretch         ) &
    ( cmp_top.iop.io_clk_stretch                  ) &
    ( cmp_top.iop.ctu.io_clk_stretch              )
  );
   
  wire lo_pin_clk_stretch = (
    (~cmp_top.CLK_STRETCH                         ) &
    (~cmp_top.iop.CLK_STRETCH                     ) &
    (~cmp_top.iop.pad_misc.clk_stretch            ) &
    (~cmp_top.iop.pad_misc.io_clk_stretch         ) &
    (~cmp_top.iop.io_clk_stretch                  ) &
    (~cmp_top.iop.ctu.io_clk_stretch              )
  );
   
  wire hi_pin_j_rst_l = (
    ( cmp_top.J_RST_L                             ) &
    ( cmp_top.iop.J_RST_L                         ) &
    ( cmp_top.iop.pad_jbusr.j_rst_l               ) &
    ( cmp_top.iop.pad_jbusr.io_jbi_j_rst_l        ) &
    ( cmp_top.iop.jbi.ctu_jbi_fst_rst_l           ) &  
    ( cmp_top.iop.ctu.io_j_rst_l                  ) 
  );

  wire lo_pin_j_rst_l = (
    (~cmp_top.J_RST_L                             ) &
    (~cmp_top.iop.J_RST_L                         ) &
    (~cmp_top.iop.pad_jbusr.j_rst_l               ) &
    (~cmp_top.iop.pad_jbusr.io_jbi_j_rst_l        ) &
    (~cmp_top.iop.jbi.ctu_jbi_fst_rst_l           ) &  
    (~cmp_top.iop.ctu.io_j_rst_l                  )
  );

  wire hi_pin_pll_char_in = (
    ( cmp_top.PLL_CHAR_IN                         ) &
    ( cmp_top.iop.PLL_CHAR_IN                     ) &
    ( cmp_top.iop.pad_misc.pll_char_in            ) &
    ( cmp_top.iop.pad_misc.io_pll_char_in         ) &
    ( cmp_top.iop.io_pll_char_in                  ) &
    ( cmp_top.iop.ctu.io_pll_char_in              )
  );

  wire lo_pin_pll_char_in = (
    (~cmp_top.PLL_CHAR_IN                         ) &
    (~cmp_top.iop.PLL_CHAR_IN                     ) & 
    (~cmp_top.iop.pad_misc.pll_char_in            ) &
    (~cmp_top.iop.pad_misc.io_pll_char_in         ) &
    (~cmp_top.iop.io_pll_char_in                  ) &
    (~cmp_top.iop.ctu.io_pll_char_in              ) 
  );

  wire hi_pin_pwron_rst_l = (
    ( cmp_top.PWRON_RST_L                         ) &
    ( cmp_top.iop.PWRON_RST_L                     ) &
    ( cmp_top.iop.pad_misc.pwron_rst_l            ) &
    ( cmp_top.iop.pad_misc.io_pwron_rst_l         ) &
    ( cmp_top.iop.io_pwron_rst_l                  ) &
    ( cmp_top.iop.ctu.io_pwron_rst_l              )
  );

  wire lo_pin_pwron_rst_l = (
    (~cmp_top.PWRON_RST_L                         ) &
    (~cmp_top.iop.PWRON_RST_L                     ) & 
    (~cmp_top.iop.pad_misc.pwron_rst_l            ) &
    (~cmp_top.iop.pad_misc.io_pwron_rst_l         ) &
    (~cmp_top.iop.io_pwron_rst_l                  ) &
    (~cmp_top.iop.ctu.io_pwron_rst_l              ) 
  );

  wire hi_pin_trst_l = (
    ( cmp_top.TRST_L                              ) &
    ( cmp_top.iop.TRST_L                          ) &
    ( cmp_top.iop.pad_misc.trst_l                 ) &
    ( cmp_top.iop.pad_misc.io_trst_l              ) &
    ( cmp_top.iop.io_trst_l                       ) &
    ( cmp_top.iop.ctu.io_trst_l                   )
  );
   
  wire lo_pin_trst_l = (
    (~cmp_top.TRST_L                              ) &
    (~cmp_top.iop.TRST_L                          ) &
    (~cmp_top.iop.pad_misc.trst_l                 ) &
    (~cmp_top.iop.pad_misc.io_trst_l              ) &
    (~cmp_top.iop.io_trst_l                       ) &
    (~cmp_top.iop.ctu.io_trst_l                   )
  );

  wire hi_pin_tms = (
    ( cmp_top.TMS                                 ) &
    ( cmp_top.iop.TMS                             ) &
    ( cmp_top.iop.pad_misc.tms                    ) &
    ( cmp_top.iop.pad_misc.io_tms                 ) &
    ( cmp_top.iop.io_tms                          ) &
    ( cmp_top.iop.ctu.io_tms                      )
  );
   
  wire lo_pin_tms = (
    (~cmp_top.TMS                                 ) &
    (~cmp_top.iop.TMS                             ) &
    (~cmp_top.iop.pad_misc.tms                    ) &
    (~cmp_top.iop.pad_misc.io_tms                 ) &
    (~cmp_top.iop.io_tms                          ) &
    (~cmp_top.iop.ctu.io_tms                      )
  );

  wire hi_pin_test_mode = (
    ( cmp_top.iop.TEST_MODE                       ) &
    ( cmp_top.iop.pad_misc.test_mode              ) &
    ( cmp_top.iop.pad_misc.io_test_mode           ) &
    ( cmp_top.iop.io_test_mode                    ) &
    ( cmp_top.iop.ctu.io_test_mode                ) &
    ( cmp_top.iop.pad_ddr0.test_mode              ) &
    ( cmp_top.iop.pad_ddr1.test_mode              ) &
    ( cmp_top.iop.pad_ddr2.test_mode              ) &
    ( cmp_top.iop.pad_ddr3.test_mode              )
  );
   
  wire lo_pin_test_mode = (
    (~cmp_top.iop.TEST_MODE                       ) &
    (~cmp_top.iop.pad_misc.test_mode              ) &
    (~cmp_top.iop.pad_misc.io_test_mode           ) &
    (~cmp_top.iop.io_test_mode                    ) &
    (~cmp_top.iop.ctu.io_test_mode                ) &
    (~cmp_top.iop.pad_ddr0.test_mode              ) &
    (~cmp_top.iop.pad_ddr1.test_mode              ) &
    (~cmp_top.iop.pad_ddr2.test_mode              ) &
    (~cmp_top.iop.pad_ddr3.test_mode              )
  );

  wire hi_pin_trigin = (
    ( cmp_top.TRIGIN                              ) &
    ( cmp_top.iop.TRIGIN                          ) &
    ( cmp_top.iop.pad_misc.trigin                 ) &
    ( cmp_top.iop.pad_misc.io_trigin              ) &
    ( cmp_top.iop.io_trigin                       ) &
    ( cmp_top.iop.iobdg.io_trigin                 )
  );
   
  wire lo_pin_trigin = (
    (~cmp_top.TRIGIN                              ) &
    (~cmp_top.iop.TRIGIN                          ) &
    (~cmp_top.iop.pad_misc.trigin                 ) &
    (~cmp_top.iop.pad_misc.io_trigin              ) &
    (~cmp_top.iop.io_trigin                       ) &
    (~cmp_top.iop.iobdg.io_trigin                 )
  );
   


  ////////////////////////////////////////////////////////////////
  // 'top' signals track delivery from ctu port to clusters's port
  ////////////////////////////////////////////////////////////////

  // arst
  wire hi_top_cmp_arst_l = (
    ( cmp_top.iop.ctu.cmp_arst_l                  ) & 
    ( cmp_top.iop.cmp_arst_l                      ) &  
    ( cmp_top.iop.flop_rptrs.cmp_agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xa0.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xa1.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xb0.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xb1.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xc0.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xc1.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xc2.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xc3.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xc4.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xc5.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xc6.agrst_l          ) & 
    ( cmp_top.iop.flop_rptrs.xc7.agrst_l          )
  );

  wire lo_top_cmp_arst_l = (
    (~cmp_top.iop.ctu.cmp_arst_l                  ) &
    (~cmp_top.iop.cmp_arst_l                      ) &
    (~cmp_top.iop.flop_rptrs.cmp_agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xa0.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xa1.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xb0.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xb1.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xc0.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xc1.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xc2.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xc3.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xc4.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xc5.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xc6.agrst_l          ) &
    (~cmp_top.iop.flop_rptrs.xc7.agrst_l          )
  );

  wire hi_top_dram_arst_l = (
    ( cmp_top.iop.ctu.dram_arst_l                 ) &
    ( cmp_top.iop.dram_arst_l                     )
  );

  wire lo_top_dram_arst_l = (
    (~cmp_top.iop.ctu.dram_arst_l                 ) &
    (~cmp_top.iop.dram_arst_l                     )
  );

  wire hi_top_jbus_arst_l = (
    ( cmp_top.iop.ctu.jbus_arst_l                 ) &
    ( cmp_top.iop.jbus_arst_l                     )
  );

  wire lo_top_jbus_arst_l = (
    (~cmp_top.iop.ctu.jbus_arst_l                 ) &
    (~cmp_top.iop.jbus_arst_l                     )
  );

  // adbginit
  wire hi_top_cmp_adbginit_l = (
    ( cmp_top.iop.ctu.cmp_adbginit_l              ) & 
    ( cmp_top.iop.cmp_adbginit_l                  ) &  
    ( cmp_top.iop.flop_rptrs.cmp_agdbginit_l      ) & 
    ( cmp_top.iop.flop_rptrs.xa0.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xa1.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xb0.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xb1.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xc0.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xc1.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xc2.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xc3.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xc4.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xc5.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xc6.adbginit_l       ) & 
    ( cmp_top.iop.flop_rptrs.xc7.adbginit_l       )
  );

  wire lo_top_cmp_adbginit_l = (
    (~cmp_top.iop.ctu.cmp_adbginit_l              ) &
    (~cmp_top.iop.cmp_adbginit_l                  ) &
    (~cmp_top.iop.flop_rptrs.cmp_agdbginit_l      ) &
    (~cmp_top.iop.flop_rptrs.xa0.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xa1.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xb0.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xb1.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xc0.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xc1.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xc2.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xc3.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xc4.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xc5.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xc6.adbginit_l       ) &
    (~cmp_top.iop.flop_rptrs.xc7.adbginit_l       )
  );

  wire hi_top_dram_adbginit_l = (
    ( cmp_top.iop.ctu.dram_adbginit_l             ) &
    ( cmp_top.iop.dram_adbginit_l                 )
  );

  wire lo_top_dram_adbginit_l = (
    (~cmp_top.iop.ctu.dram_adbginit_l             ) &
    (~cmp_top.iop.dram_adbginit_l                 )
  );

  wire hi_top_jbus_adbginit_l = (
    ( cmp_top.iop.ctu.jbus_adbginit_l             ) &
    ( cmp_top.iop.jbus_adbginit_l                 )
  );

  wire lo_top_jbus_adbginit_l = (
    (~cmp_top.iop.ctu.jbus_adbginit_l             ) &
    (~cmp_top.iop.jbus_adbginit_l                 )
  );

  // grst
  wire hi_top_cmp_grst_l = (
    ( cmp_top.iop.ctu.cmp_grst_out_l              ) &
    ( cmp_top.iop.cmp_grst_out_l                  ) &
    ( cmp_top.iop.rpt_cmp_grst_l_c0               ) & 
    ( cmp_top.iop.rpt_cmp_grst_l_c1               ) & 
    ( cmp_top.iop.rpt_cmp_grst_l_c2               ) & 
    ( cmp_top.iop.rpt_cmp_grst_l_c3               ) & 
    ( cmp_top.iop.rpt_cmp_grst_l_c4               ) & 
    ( cmp_top.iop.rpt_cmp_grst_l_c5               ) & 
    ( cmp_top.iop.rpt_cmp_grst_l_c6               ) & 
    ( cmp_top.iop.rpt_cmp_grst_l_c7               )
  );

  wire lo_top_cmp_grst_l = (
    (~cmp_top.iop.ctu.cmp_grst_out_l              ) &
    (~cmp_top.iop.cmp_grst_out_l                  ) &
    (~cmp_top.iop.rpt_cmp_grst_l_c0               ) & 
    (~cmp_top.iop.rpt_cmp_grst_l_c1               ) & 
    (~cmp_top.iop.rpt_cmp_grst_l_c2               ) & 
    (~cmp_top.iop.rpt_cmp_grst_l_c3               ) & 
    (~cmp_top.iop.rpt_cmp_grst_l_c4               ) & 
    (~cmp_top.iop.rpt_cmp_grst_l_c5               ) & 
    (~cmp_top.iop.rpt_cmp_grst_l_c6               ) & 
    (~cmp_top.iop.rpt_cmp_grst_l_c7               )
  );

  wire hi_top_dram_grst_l = (
    ( cmp_top.iop.ctu.dram_grst_out_l             ) &
    ( cmp_top.iop.dram_grst_l                     )
  );

  wire lo_top_dram_grst_l = (
    (~cmp_top.iop.ctu.dram_grst_out_l             ) &
    (~cmp_top.iop.dram_grst_l                     )
  );

  wire hi_top_jbus_grst_l = (
    ( cmp_top.iop.ctu.jbus_grst_out_l             ) &
    ( cmp_top.iop.jbus_grst_l                     )
  );

  wire lo_top_jbus_grst_l = (
    (~cmp_top.iop.ctu.jbus_grst_out_l             ) &
    (~cmp_top.iop.jbus_grst_l                     )
  );

  // gdbginit
  wire hi_top_cmp_gdbginit_l= (
    ( cmp_top.iop.ctu.cmp_gdbginit_out_l          ) &
    ( cmp_top.iop.cmp_gdbginit_out_l              ) &
    ( cmp_top.iop.rpt_cmp_gdbginit_l_c0           ) & 
    ( cmp_top.iop.rpt_cmp_gdbginit_l_c1           ) & 
    ( cmp_top.iop.rpt_cmp_gdbginit_l_c2           ) & 
    ( cmp_top.iop.rpt_cmp_gdbginit_l_c3           ) & 
    ( cmp_top.iop.rpt_cmp_gdbginit_l_c4           ) & 
    ( cmp_top.iop.rpt_cmp_gdbginit_l_c5           ) & 
    ( cmp_top.iop.rpt_cmp_gdbginit_l_c7           )
  );

  wire lo_top_cmp_gdbginit_l= (
    (~cmp_top.iop.ctu.cmp_gdbginit_out_l          ) &
    (~cmp_top.iop.cmp_gdbginit_out_l              ) &
    (~cmp_top.iop.rpt_cmp_gdbginit_l_c0           ) & 
    (~cmp_top.iop.rpt_cmp_gdbginit_l_c1           ) & 
    (~cmp_top.iop.rpt_cmp_gdbginit_l_c2           ) & 
    (~cmp_top.iop.rpt_cmp_gdbginit_l_c3           ) & 
    (~cmp_top.iop.rpt_cmp_gdbginit_l_c4           ) & 
    (~cmp_top.iop.rpt_cmp_gdbginit_l_c5           ) & 
    (~cmp_top.iop.rpt_cmp_gdbginit_l_c7           )
  );

  wire hi_top_dram_gdbginit_l= (
    ( cmp_top.iop.ctu.dram_gdbginit_out_l         ) &
    ( cmp_top.iop.dram_gdbginit_l                 )
  );

  wire lo_top_dram_gdbginit_l= (
    (~cmp_top.iop.ctu.dram_gdbginit_out_l         ) &
    (~cmp_top.iop.dram_gdbginit_l                 )
  );

  wire hi_top_jbus_gdbginit_l= (
    ( cmp_top.iop.ctu.jbus_gdbginit_out_l         ) &
    ( cmp_top.iop.jbus_gdbginit_l                 )
  );

  wire lo_top_jbus_gdbginit_l= (
    (~cmp_top.iop.ctu.jbus_gdbginit_out_l         ) &
    (~cmp_top.iop.jbus_gdbginit_l                 )
  );

  // DLL rst
  wire hi_top_dll_rst_l = (
    ( cmp_top.iop.ctu.ctu_ddr0_iodll_rst_l        ) &
    ( cmp_top.iop.ctu.ctu_ddr1_iodll_rst_l        ) &
    ( cmp_top.iop.ctu.ctu_ddr2_iodll_rst_l        ) &
    ( cmp_top.iop.ctu.ctu_ddr3_iodll_rst_l        ) &
    ( cmp_top.iop.ctu_ddr0_iodll_rst_l            ) &
    ( cmp_top.iop.ctu_ddr1_iodll_rst_l            ) &
    ( cmp_top.iop.ctu_ddr2_iodll_rst_l            ) &
    ( cmp_top.iop.ctu_ddr3_iodll_rst_l            )
  );

  wire lo_top_dll_rst_l = (
    (~cmp_top.iop.ctu.ctu_ddr0_iodll_rst_l        ) &
    (~cmp_top.iop.ctu.ctu_ddr1_iodll_rst_l        ) &
    (~cmp_top.iop.ctu.ctu_ddr2_iodll_rst_l        ) &
    (~cmp_top.iop.ctu.ctu_ddr3_iodll_rst_l        ) &
    (~cmp_top.iop.ctu_ddr0_iodll_rst_l            ) &
    (~cmp_top.iop.ctu_ddr1_iodll_rst_l            ) &
    (~cmp_top.iop.ctu_ddr2_iodll_rst_l            ) &
    (~cmp_top.iop.ctu_ddr3_iodll_rst_l            )
  );

  //test rst
  wire hi_top_tst_rst_l = (
    ( cmp_top.iop.ctu.ctu_tst_pre_grst_l          ) &
    ( cmp_top.iop.ctu_tst_pre_grst_l              )
  );

  wire lo_top_tst_rst_l = (
    (~cmp_top.iop.ctu.ctu_tst_pre_grst_l          ) &
    (~cmp_top.iop.ctu_tst_pre_grst_l              )
  );

   //refresh
  wire hi_top_refresh = (
    ( cmp_top.iop.ctu.ctu_dram_selfrsh            ) &
    ( cmp_top.iop.ctu_dram_selfrsh                )
  );

  wire lo_top_refresh = (
    (~cmp_top.iop.ctu.ctu_dram_selfrsh            ) &
    (~cmp_top.iop.ctu_dram_selfrsh                )
  );

 // gclk
  wire hi_top_cmp_gclk = (
    ( cmp_top.iop.ctu.cmp_gclk_out                ) &
    ( cmp_top.iop.cmp_gclk                        ) &
    ( cmp_top.iop.bw_clk_gl.gclk_cmp              ) &
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[0]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[1]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[2]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[3]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[4]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[5]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[6]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[7]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[0]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[1]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[2]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[3]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[4]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[5]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[6]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[7]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[0]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[1]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[2]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[3]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[4]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[5]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[6]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[7]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[0]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[1]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[2]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[3]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[4]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[5]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[6]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[7]      ) & 
    ( cmp_top.iop.cmp_gclk_c0_r[0]                ) & 
    ( cmp_top.iop.cmp_gclk_c0_r[1]                ) & 
    ( cmp_top.iop.cmp_gclk_c0_r[2]                ) & 
    ( cmp_top.iop.cmp_gclk_c0_r[3]                ) & 
    ( cmp_top.iop.cmp_gclk_c0_r[4]                ) & 
    ( cmp_top.iop.cmp_gclk_c0_r[5]                ) & 
    ( cmp_top.iop.cmp_gclk_c0_r[6]                ) & 
    ( cmp_top.iop.cmp_gclk_c0_r[7]                ) & 
    ( cmp_top.iop.cmp_gclk_c1_r[0]                ) & 
    ( cmp_top.iop.cmp_gclk_c1_r[1]                ) & 
    ( cmp_top.iop.cmp_gclk_c1_r[2]                ) & 
    ( cmp_top.iop.cmp_gclk_c1_r[3]                ) & 
    ( cmp_top.iop.cmp_gclk_c1_r[4]                ) & 
    ( cmp_top.iop.cmp_gclk_c1_r[5]                ) & 
    ( cmp_top.iop.cmp_gclk_c1_r[6]                ) & 
    ( cmp_top.iop.cmp_gclk_c1_r[7]                ) & 
    ( cmp_top.iop.cmp_gclk_c2_r[0]                ) & 
    ( cmp_top.iop.cmp_gclk_c2_r[1]                ) & 
    ( cmp_top.iop.cmp_gclk_c2_r[2]                ) & 
    ( cmp_top.iop.cmp_gclk_c2_r[3]                ) & 
    ( cmp_top.iop.cmp_gclk_c2_r[4]                ) & 
    ( cmp_top.iop.cmp_gclk_c2_r[5]                ) & 
    ( cmp_top.iop.cmp_gclk_c2_r[6]                ) & 
    ( cmp_top.iop.cmp_gclk_c2_r[7]                ) & 
    ( cmp_top.iop.cmp_gclk_c3_r[0]                ) & 
    ( cmp_top.iop.cmp_gclk_c3_r[1]                ) & 
    ( cmp_top.iop.cmp_gclk_c3_r[2]                ) & 
    ( cmp_top.iop.cmp_gclk_c3_r[3]                ) & 
    ( cmp_top.iop.cmp_gclk_c3_r[4]                ) & 
    ( cmp_top.iop.cmp_gclk_c3_r[5]                ) & 
    ( cmp_top.iop.cmp_gclk_c3_r[6]                ) & 
    ( cmp_top.iop.cmp_gclk_c3_r[7]                ) 
  );

  wire lo_top_cmp_gclk = (
    (~cmp_top.iop.ctu.cmp_gclk_out                ) &
    (~cmp_top.iop.cmp_gclk                        ) &
    (~cmp_top.iop.bw_clk_gl.gclk_cmp              ) &
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[0]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[1]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[2]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[3]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[4]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[5]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[6]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c0_r[7]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[0]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[1]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[2]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[3]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[4]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[5]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[6]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c1_r[7]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[0]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[1]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[2]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[3]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[4]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[5]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[6]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c2_r[7]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[0]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[1]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[2]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[3]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[4]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[5]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[6]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_cmp_c3_r[7]      ) & 
    (~cmp_top.iop.cmp_gclk_c0_r[0]                ) & 
    (~cmp_top.iop.cmp_gclk_c0_r[1]                ) & 
    (~cmp_top.iop.cmp_gclk_c0_r[2]                ) & 
    (~cmp_top.iop.cmp_gclk_c0_r[3]                ) & 
    (~cmp_top.iop.cmp_gclk_c0_r[4]                ) & 
    (~cmp_top.iop.cmp_gclk_c0_r[5]                ) & 
    (~cmp_top.iop.cmp_gclk_c0_r[6]                ) & 
    (~cmp_top.iop.cmp_gclk_c0_r[7]                ) & 
    (~cmp_top.iop.cmp_gclk_c1_r[0]                ) & 
    (~cmp_top.iop.cmp_gclk_c1_r[1]                ) & 
    (~cmp_top.iop.cmp_gclk_c1_r[2]                ) & 
    (~cmp_top.iop.cmp_gclk_c1_r[3]                ) & 
    (~cmp_top.iop.cmp_gclk_c1_r[4]                ) & 
    (~cmp_top.iop.cmp_gclk_c1_r[5]                ) & 
    (~cmp_top.iop.cmp_gclk_c1_r[6]                ) & 
    (~cmp_top.iop.cmp_gclk_c1_r[7]                ) & 
    (~cmp_top.iop.cmp_gclk_c2_r[0]                ) & 
    (~cmp_top.iop.cmp_gclk_c2_r[1]                ) & 
    (~cmp_top.iop.cmp_gclk_c2_r[2]                ) & 
    (~cmp_top.iop.cmp_gclk_c2_r[3]                ) & 
    (~cmp_top.iop.cmp_gclk_c2_r[4]                ) & 
    (~cmp_top.iop.cmp_gclk_c2_r[5]                ) & 
    (~cmp_top.iop.cmp_gclk_c2_r[6]                ) & 
    (~cmp_top.iop.cmp_gclk_c2_r[7]                ) & 
    (~cmp_top.iop.cmp_gclk_c3_r[0]                ) & 
    (~cmp_top.iop.cmp_gclk_c3_r[1]                ) & 
    (~cmp_top.iop.cmp_gclk_c3_r[2]                ) & 
    (~cmp_top.iop.cmp_gclk_c3_r[3]                ) & 
    (~cmp_top.iop.cmp_gclk_c3_r[4]                ) & 
    (~cmp_top.iop.cmp_gclk_c3_r[5]                ) & 
    (~cmp_top.iop.cmp_gclk_c3_r[6]                ) & 
    (~cmp_top.iop.cmp_gclk_c3_r[7]                ) 
  );

  wire hi_top_dram_gclk = (
    ( cmp_top.iop.ctu.dram_gclk_out               ) &
    ( cmp_top.iop.dram_gclk                       ) &
    ( cmp_top.iop.bw_clk_gl.gclk_ddr              ) &
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[0]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[1]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[2]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[3]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[4]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[5]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[6]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[7]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[0]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[1]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[2]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[3]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[4]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[5]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[6]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[7]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[0]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[1]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[2]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[3]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[4]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[5]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[6]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[7]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[0]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[1]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[2]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[3]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[4]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[5]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[6]      ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[7]      ) & 
    ( cmp_top.iop.dram_gclk_c0_r[0]               ) & 
    ( cmp_top.iop.dram_gclk_c0_r[1]               ) & 
    ( cmp_top.iop.dram_gclk_c0_r[2]               ) & 
    ( cmp_top.iop.dram_gclk_c0_r[3]               ) & 
    ( cmp_top.iop.dram_gclk_c0_r[4]               ) & 
    ( cmp_top.iop.dram_gclk_c0_r[5]               ) & 
    ( cmp_top.iop.dram_gclk_c0_r[6]               ) & 
    ( cmp_top.iop.dram_gclk_c0_r[7]               ) & 
    ( cmp_top.iop.dram_gclk_c1_r[0]               ) & 
    ( cmp_top.iop.dram_gclk_c1_r[1]               ) & 
    ( cmp_top.iop.dram_gclk_c1_r[2]               ) & 
    ( cmp_top.iop.dram_gclk_c1_r[3]               ) & 
    ( cmp_top.iop.dram_gclk_c1_r[4]               ) & 
    ( cmp_top.iop.dram_gclk_c1_r[5]               ) & 
    ( cmp_top.iop.dram_gclk_c1_r[6]               ) & 
    ( cmp_top.iop.dram_gclk_c1_r[7]               ) & 
    ( cmp_top.iop.dram_gclk_c2_r[0]               ) & 
    ( cmp_top.iop.dram_gclk_c2_r[1]               ) & 
    ( cmp_top.iop.dram_gclk_c2_r[2]               ) & 
    ( cmp_top.iop.dram_gclk_c2_r[3]               ) & 
    ( cmp_top.iop.dram_gclk_c2_r[4]               ) & 
    ( cmp_top.iop.dram_gclk_c2_r[5]               ) & 
    ( cmp_top.iop.dram_gclk_c2_r[6]               ) & 
    ( cmp_top.iop.dram_gclk_c2_r[7]               ) & 
    ( cmp_top.iop.dram_gclk_c3_r[0]               ) & 
    ( cmp_top.iop.dram_gclk_c3_r[1]               ) & 
    ( cmp_top.iop.dram_gclk_c3_r[2]               ) & 
    ( cmp_top.iop.dram_gclk_c3_r[3]               ) & 
    ( cmp_top.iop.dram_gclk_c3_r[4]               ) & 
    ( cmp_top.iop.dram_gclk_c3_r[5]               ) & 
    ( cmp_top.iop.dram_gclk_c3_r[6]               ) & 
    ( cmp_top.iop.dram_gclk_c3_r[7]               ) 
  );

  wire lo_top_dram_gclk = (
    (~cmp_top.iop.ctu.dram_gclk_out               ) &
    (~cmp_top.iop.dram_gclk                       ) &
    (~cmp_top.iop.bw_clk_gl.gclk_ddr              ) &
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[0]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[1]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[2]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[3]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[4]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[5]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[6]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c0_r[7]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[0]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[1]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[2]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[3]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[4]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[5]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[6]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c1_r[7]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[0]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[1]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[2]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[3]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[4]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[5]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[6]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c2_r[7]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[0]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[1]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[2]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[3]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[4]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[5]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[6]      ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_ddr_c3_r[7]      ) & 
    (~cmp_top.iop.dram_gclk_c0_r[0]               ) & 
    (~cmp_top.iop.dram_gclk_c0_r[1]               ) & 
    (~cmp_top.iop.dram_gclk_c0_r[2]               ) & 
    (~cmp_top.iop.dram_gclk_c0_r[3]               ) & 
    (~cmp_top.iop.dram_gclk_c0_r[4]               ) & 
    (~cmp_top.iop.dram_gclk_c0_r[5]               ) & 
    (~cmp_top.iop.dram_gclk_c0_r[6]               ) & 
    (~cmp_top.iop.dram_gclk_c0_r[7]               ) & 
    (~cmp_top.iop.dram_gclk_c1_r[0]               ) & 
    (~cmp_top.iop.dram_gclk_c1_r[1]               ) & 
    (~cmp_top.iop.dram_gclk_c1_r[2]               ) & 
    (~cmp_top.iop.dram_gclk_c1_r[3]               ) & 
    (~cmp_top.iop.dram_gclk_c1_r[4]               ) & 
    (~cmp_top.iop.dram_gclk_c1_r[5]               ) & 
    (~cmp_top.iop.dram_gclk_c1_r[6]               ) & 
    (~cmp_top.iop.dram_gclk_c1_r[7]               ) & 
    (~cmp_top.iop.dram_gclk_c2_r[0]               ) & 
    (~cmp_top.iop.dram_gclk_c2_r[1]               ) & 
    (~cmp_top.iop.dram_gclk_c2_r[2]               ) & 
    (~cmp_top.iop.dram_gclk_c2_r[3]               ) & 
    (~cmp_top.iop.dram_gclk_c2_r[4]               ) & 
    (~cmp_top.iop.dram_gclk_c2_r[5]               ) & 
    (~cmp_top.iop.dram_gclk_c2_r[6]               ) & 
    (~cmp_top.iop.dram_gclk_c2_r[7]               ) & 
    (~cmp_top.iop.dram_gclk_c3_r[0]               ) & 
    (~cmp_top.iop.dram_gclk_c3_r[1]               ) & 
    (~cmp_top.iop.dram_gclk_c3_r[2]               ) & 
    (~cmp_top.iop.dram_gclk_c3_r[3]               ) & 
    (~cmp_top.iop.dram_gclk_c3_r[4]               ) & 
    (~cmp_top.iop.dram_gclk_c3_r[5]               ) & 
    (~cmp_top.iop.dram_gclk_c3_r[6]               ) & 
    (~cmp_top.iop.dram_gclk_c3_r[7]               ) 
  );

  wire hi_top_jbus_gclk = (
    ( cmp_top.iop.ctu.jbus_gclk_out               ) &
    ( cmp_top.iop.jbus_gclk                       ) &
    ( cmp_top.iop.bw_clk_gl.gclk_jbus             ) &
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[0]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[1]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[2]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[3]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[4]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[5]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[6]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[7]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[0]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[1]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[2]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[3]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[4]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[5]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[6]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[7]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[0]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[1]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[2]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[3]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[4]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[5]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[6]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[7]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[0]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[1]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[2]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[3]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[4]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[5]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[6]     ) & 
    ( cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[7]     ) & 
    ( cmp_top.iop.jbus_gclk_c0_r[0]               ) & 
    ( cmp_top.iop.jbus_gclk_c0_r[1]               ) & 
    ( cmp_top.iop.jbus_gclk_c0_r[2]               ) & 
    ( cmp_top.iop.jbus_gclk_c0_r[3]               ) & 
    ( cmp_top.iop.jbus_gclk_c0_r[4]               ) & 
    ( cmp_top.iop.jbus_gclk_c0_r[5]               ) & 
    ( cmp_top.iop.jbus_gclk_c0_r[6]               ) & 
    ( cmp_top.iop.jbus_gclk_c0_r[7]               ) & 
    ( cmp_top.iop.jbus_gclk_c1_r[0]               ) & 
    ( cmp_top.iop.jbus_gclk_c1_r[1]               ) & 
    ( cmp_top.iop.jbus_gclk_c1_r[2]               ) & 
    ( cmp_top.iop.jbus_gclk_c1_r[3]               ) & 
    ( cmp_top.iop.jbus_gclk_c1_r[4]               ) & 
    ( cmp_top.iop.jbus_gclk_c1_r[5]               ) & 
    ( cmp_top.iop.jbus_gclk_c1_r[6]               ) & 
    ( cmp_top.iop.jbus_gclk_c1_r[7]               ) & 
    ( cmp_top.iop.jbus_gclk_c2_r[0]               ) & 
    ( cmp_top.iop.jbus_gclk_c2_r[1]               ) & 
    ( cmp_top.iop.jbus_gclk_c2_r[2]               ) & 
    ( cmp_top.iop.jbus_gclk_c2_r[3]               ) & 
    ( cmp_top.iop.jbus_gclk_c2_r[4]               ) & 
    ( cmp_top.iop.jbus_gclk_c2_r[5]               ) & 
    ( cmp_top.iop.jbus_gclk_c2_r[6]               ) & 
    ( cmp_top.iop.jbus_gclk_c2_r[7]               ) & 
    ( cmp_top.iop.jbus_gclk_c3_r[0]               ) & 
    ( cmp_top.iop.jbus_gclk_c3_r[1]               ) & 
    ( cmp_top.iop.jbus_gclk_c3_r[2]               ) & 
    ( cmp_top.iop.jbus_gclk_c3_r[3]               ) & 
    ( cmp_top.iop.jbus_gclk_c3_r[4]               ) & 
    ( cmp_top.iop.jbus_gclk_c3_r[5]               ) & 
    ( cmp_top.iop.jbus_gclk_c3_r[6]               ) & 
    ( cmp_top.iop.jbus_gclk_c3_r[7]               ) 
  );

  wire lo_top_jbus_gclk = (
    (~cmp_top.iop.ctu.jbus_gclk_out               ) &
    (~cmp_top.iop.jbus_gclk                       ) &
    (~cmp_top.iop.bw_clk_gl.gclk_jbus             ) &
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[0]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[1]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[2]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[3]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[4]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[5]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[6]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c0_r[7]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[0]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[1]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[2]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[3]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[4]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[5]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[6]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c1_r[7]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[0]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[1]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[2]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[3]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[4]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[5]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[6]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c2_r[7]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[0]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[1]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[2]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[3]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[4]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[5]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[6]     ) & 
    (~cmp_top.iop.bw_clk_gl.gclk_jbus_c3_r[7]     ) & 
    (~cmp_top.iop.jbus_gclk_c0_r[0]               ) & 
    (~cmp_top.iop.jbus_gclk_c0_r[1]               ) & 
    (~cmp_top.iop.jbus_gclk_c0_r[2]               ) & 
    (~cmp_top.iop.jbus_gclk_c0_r[3]               ) & 
    (~cmp_top.iop.jbus_gclk_c0_r[4]               ) & 
    (~cmp_top.iop.jbus_gclk_c0_r[5]               ) & 
    (~cmp_top.iop.jbus_gclk_c0_r[6]               ) & 
    (~cmp_top.iop.jbus_gclk_c0_r[7]               ) & 
    (~cmp_top.iop.jbus_gclk_c1_r[0]               ) & 
    (~cmp_top.iop.jbus_gclk_c1_r[1]               ) & 
    (~cmp_top.iop.jbus_gclk_c1_r[2]               ) & 
    (~cmp_top.iop.jbus_gclk_c1_r[3]               ) & 
    (~cmp_top.iop.jbus_gclk_c1_r[4]               ) & 
    (~cmp_top.iop.jbus_gclk_c1_r[5]               ) & 
    (~cmp_top.iop.jbus_gclk_c1_r[6]               ) & 
    (~cmp_top.iop.jbus_gclk_c1_r[7]               ) & 
    (~cmp_top.iop.jbus_gclk_c2_r[0]               ) & 
    (~cmp_top.iop.jbus_gclk_c2_r[1]               ) & 
    (~cmp_top.iop.jbus_gclk_c2_r[2]               ) & 
    (~cmp_top.iop.jbus_gclk_c2_r[3]               ) & 
    (~cmp_top.iop.jbus_gclk_c2_r[4]               ) & 
    (~cmp_top.iop.jbus_gclk_c2_r[5]               ) & 
    (~cmp_top.iop.jbus_gclk_c2_r[6]               ) & 
    (~cmp_top.iop.jbus_gclk_c2_r[7]               ) & 
    (~cmp_top.iop.jbus_gclk_c3_r[0]               ) & 
    (~cmp_top.iop.jbus_gclk_c3_r[1]               ) & 
    (~cmp_top.iop.jbus_gclk_c3_r[2]               ) & 
    (~cmp_top.iop.jbus_gclk_c3_r[3]               ) & 
    (~cmp_top.iop.jbus_gclk_c3_r[4]               ) & 
    (~cmp_top.iop.jbus_gclk_c3_r[5]               ) & 
    (~cmp_top.iop.jbus_gclk_c3_r[6]               ) & 
    (~cmp_top.iop.jbus_gclk_c3_r[7]               ) 
  );

  wire hi_top_jbus_gclk_dup = (
    ( cmp_top.iop.ctu.jbus_gclk_dup_out           ) &
    ( cmp_top.iop.jbus_gclk_dup_out               ) &
    ( cmp_top.iop.bw_clk_gl.clk_fdbk_in           ) &
    ( cmp_top.iop.bw_clk_gl.clk_fdbk_out          ) & 
    ( cmp_top.iop.jbus_gclk_dup                   ) & 
    ( cmp_top.iop.ctu.jbus_gclk_dup               ) 
  );

  wire lo_top_jbus_gclk_dup = (
    (~cmp_top.iop.ctu.jbus_gclk_dup_out           ) &
    (~cmp_top.iop.jbus_gclk_dup_out               ) &
    (~cmp_top.iop.bw_clk_gl.clk_fdbk_in           ) &
    (~cmp_top.iop.bw_clk_gl.clk_fdbk_out          ) & 
    (~cmp_top.iop.jbus_gclk_dup                   ) & 
    (~cmp_top.iop.ctu.jbus_gclk_dup               ) 
  );

  // sync
  wire hi_top_dram_rx = (
    ( cmp_top.iop.ctu.ctu_dram_rx_sync_out        ) &
    ( cmp_top.iop.ctu_dram_rx_sync_out            ) & 
    ( cmp_top.iop.flop_rptrs.ctu_dram_rx_sync     ) & 
    ( cmp_top.iop.flop_rptrs.dram_rx_sync_c0      ) & 
    ( cmp_top.iop.flop_rptrs.dram_rx_sync_c1      ) & 
    ( cmp_top.iop.flop_rptrs.dram_rx_sync_c2      ) & 
    ( cmp_top.iop.flop_rptrs.dram_rx_sync_c3      ) & 
    ( cmp_top.iop.flop_rptrs.dram_rx_sync_c4      ) & 
    ( cmp_top.iop.flop_rptrs.dram_rx_sync_c5      ) & 
    ( cmp_top.iop.flop_rptrs.dram_rx_sync_c6      ) & 
    ( cmp_top.iop.flop_rptrs.dram_rx_sync_c7      ) & 
    ( cmp_top.iop.rpt_cmp_dram_rx_sync_c1         ) & 
    ( cmp_top.iop.rpt_cmp_dram_rx_sync_c6         ) 
  );

  wire lo_top_dram_rx = (
    (~cmp_top.iop.ctu.ctu_dram_rx_sync_out        ) &
    (~cmp_top.iop.ctu_dram_rx_sync_out            ) & 
    (~cmp_top.iop.flop_rptrs.ctu_dram_rx_sync     ) & 
    (~cmp_top.iop.flop_rptrs.dram_rx_sync_c0      ) & 
    (~cmp_top.iop.flop_rptrs.dram_rx_sync_c1      ) & 
    (~cmp_top.iop.flop_rptrs.dram_rx_sync_c2      ) & 
    (~cmp_top.iop.flop_rptrs.dram_rx_sync_c3      ) & 
    (~cmp_top.iop.flop_rptrs.dram_rx_sync_c4      ) & 
    (~cmp_top.iop.flop_rptrs.dram_rx_sync_c5      ) & 
    (~cmp_top.iop.flop_rptrs.dram_rx_sync_c6      ) & 
    (~cmp_top.iop.flop_rptrs.dram_rx_sync_c7      ) & 
    (~cmp_top.iop.rpt_cmp_dram_rx_sync_c1         ) & 
    (~cmp_top.iop.rpt_cmp_dram_rx_sync_c6         ) 
  );

  wire hi_top_dram_tx = (
    ( cmp_top.iop.ctu.ctu_dram_tx_sync_out        ) &
    ( cmp_top.iop.ctu_dram_tx_sync_out            ) & 
    ( cmp_top.iop.flop_rptrs.ctu_dram_tx_sync     ) & 
    ( cmp_top.iop.flop_rptrs.dram_tx_sync_c0      ) & 
    ( cmp_top.iop.flop_rptrs.dram_tx_sync_c1      ) & 
    ( cmp_top.iop.flop_rptrs.dram_tx_sync_c2      ) & 
    ( cmp_top.iop.flop_rptrs.dram_tx_sync_c3      ) & 
    ( cmp_top.iop.flop_rptrs.dram_tx_sync_c4      ) & 
    ( cmp_top.iop.flop_rptrs.dram_tx_sync_c5      ) & 
    ( cmp_top.iop.flop_rptrs.dram_tx_sync_c6      ) & 
    ( cmp_top.iop.flop_rptrs.dram_tx_sync_c7      ) & 
    ( cmp_top.iop.rpt_cmp_dram_tx_sync_c1         ) & 
    ( cmp_top.iop.rpt_cmp_dram_tx_sync_c6         ) 
  );

  wire lo_top_dram_tx = (
    (~cmp_top.iop.ctu.ctu_dram_tx_sync_out        ) &
    (~cmp_top.iop.ctu_dram_tx_sync_out            ) & 
    (~cmp_top.iop.flop_rptrs.ctu_dram_tx_sync     ) & 
    (~cmp_top.iop.flop_rptrs.dram_tx_sync_c0      ) & 
    (~cmp_top.iop.flop_rptrs.dram_tx_sync_c1      ) & 
    (~cmp_top.iop.flop_rptrs.dram_tx_sync_c2      ) & 
    (~cmp_top.iop.flop_rptrs.dram_tx_sync_c3      ) & 
    (~cmp_top.iop.flop_rptrs.dram_tx_sync_c4      ) & 
    (~cmp_top.iop.flop_rptrs.dram_tx_sync_c5      ) & 
    (~cmp_top.iop.flop_rptrs.dram_tx_sync_c6      ) & 
    (~cmp_top.iop.flop_rptrs.dram_tx_sync_c7      ) & 
    (~cmp_top.iop.rpt_cmp_dram_tx_sync_c1         ) & 
    (~cmp_top.iop.rpt_cmp_dram_tx_sync_c6         ) 
  );

  wire hi_top_jbus_rx = (
    ( cmp_top.iop.ctu.ctu_jbus_rx_sync_out        ) &
    ( cmp_top.iop.ctu_jbus_rx_sync_out            ) & 
    ( cmp_top.iop.flop_rptrs.ctu_jbus_rx_sync     ) & 
    ( cmp_top.iop.flop_rptrs.jbus_rx_sync_c0      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_rx_sync_c1      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_rx_sync_c2      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_rx_sync_c3      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_rx_sync_c4      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_rx_sync_c5      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_rx_sync_c6      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_rx_sync_c7      ) & 
    ( cmp_top.iop.rpt_cmp_jbus_rx_sync_c1         ) & 
    ( cmp_top.iop.rpt_cmp_jbus_rx_sync_c4         ) & 
    ( cmp_top.iop.rpt_cmp_jbus_rx_sync_c6         ) 
  );

  wire lo_top_jbus_rx = (
    (~cmp_top.iop.ctu.ctu_jbus_rx_sync_out        ) &
    (~cmp_top.iop.ctu_jbus_rx_sync_out            ) & 
    (~cmp_top.iop.flop_rptrs.ctu_jbus_rx_sync     ) & 
    (~cmp_top.iop.flop_rptrs.jbus_rx_sync_c0      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_rx_sync_c1      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_rx_sync_c2      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_rx_sync_c3      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_rx_sync_c4      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_rx_sync_c5      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_rx_sync_c6      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_rx_sync_c7      ) & 
    (~cmp_top.iop.rpt_cmp_jbus_rx_sync_c1         ) & 
    (~cmp_top.iop.rpt_cmp_jbus_rx_sync_c4         ) & 
    (~cmp_top.iop.rpt_cmp_jbus_rx_sync_c6         ) 
  );

  wire hi_top_jbus_tx = (
    ( cmp_top.iop.ctu.ctu_jbus_tx_sync_out        ) &
    ( cmp_top.iop.ctu_jbus_tx_sync_out            ) & 
    ( cmp_top.iop.flop_rptrs.ctu_jbus_tx_sync     ) & 
    ( cmp_top.iop.flop_rptrs.jbus_tx_sync_c0      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_tx_sync_c1      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_tx_sync_c2      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_tx_sync_c3      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_tx_sync_c4      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_tx_sync_c5      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_tx_sync_c6      ) & 
    ( cmp_top.iop.flop_rptrs.jbus_tx_sync_c7      ) & 
    ( cmp_top.iop.rpt_cmp_jbus_tx_sync_c1         ) & 
    ( cmp_top.iop.rpt_cmp_jbus_tx_sync_c4         ) & 
    ( cmp_top.iop.rpt_cmp_jbus_tx_sync_c6         ) 
  );

  wire lo_top_jbus_tx = (
    (~cmp_top.iop.ctu.ctu_jbus_tx_sync_out        ) &
    (~cmp_top.iop.ctu_jbus_tx_sync_out            ) & 
    (~cmp_top.iop.flop_rptrs.ctu_jbus_tx_sync     ) & 
    (~cmp_top.iop.flop_rptrs.jbus_tx_sync_c0      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_tx_sync_c1      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_tx_sync_c2      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_tx_sync_c3      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_tx_sync_c4      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_tx_sync_c5      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_tx_sync_c6      ) & 
    (~cmp_top.iop.flop_rptrs.jbus_tx_sync_c7      ) & 
    (~cmp_top.iop.rpt_cmp_jbus_tx_sync_c1         ) & 
    (~cmp_top.iop.rpt_cmp_jbus_tx_sync_c4         ) & 
    (~cmp_top.iop.rpt_cmp_jbus_tx_sync_c6         ) 
  );

  // cken signals
  wire hi_top_cmp_cken = (
    ( cmp_top.iop.ctu.ctu_spc0_cmp_cken           ) &
    ( cmp_top.iop.ctu.ctu_spc1_cmp_cken           ) &
    ( cmp_top.iop.ctu.ctu_spc2_cmp_cken           ) &
    ( cmp_top.iop.ctu.ctu_spc3_cmp_cken           ) &
    ( cmp_top.iop.ctu.ctu_spc4_cmp_cken           ) &
    ( cmp_top.iop.ctu.ctu_spc5_cmp_cken           ) &
    ( cmp_top.iop.ctu.ctu_spc6_cmp_cken           ) &
    ( cmp_top.iop.ctu.ctu_spc7_cmp_cken           ) &
    ( cmp_top.iop.ctu.ctu_scdata0_cmp_cken        ) &
    ( cmp_top.iop.ctu.ctu_scdata1_cmp_cken        ) &
    ( cmp_top.iop.ctu.ctu_scdata2_cmp_cken        ) &
    ( cmp_top.iop.ctu.ctu_scdata3_cmp_cken        ) &
    ( cmp_top.iop.ctu.ctu_sctag0_cmp_cken         ) &
    ( cmp_top.iop.ctu.ctu_sctag1_cmp_cken         ) &
    ( cmp_top.iop.ctu.ctu_sctag2_cmp_cken         ) &
    ( cmp_top.iop.ctu.ctu_sctag3_cmp_cken         ) &
    ( cmp_top.iop.ctu.ctu_dram02_cmp_cken         ) &
    ( cmp_top.iop.ctu.ctu_dram13_cmp_cken         ) &
    ( cmp_top.iop.ctu.ctu_ccx_cmp_cken            ) &
    ( cmp_top.iop.ctu.ctu_fpu_cmp_cken            ) &
    ( cmp_top.iop.ctu.ctu_jbi_cmp_cken            ) &
    ( cmp_top.iop.ctu.ctu_iob_cmp_cken            ) &
    ( cmp_top.iop.ctu_spc0_cmp_cken               ) &
    ( cmp_top.iop.ctu_spc1_cmp_cken               ) &
    ( cmp_top.iop.ctu_spc2_cmp_cken               ) &
    ( cmp_top.iop.ctu_spc3_cmp_cken               ) &
    ( cmp_top.iop.ctu_spc4_cmp_cken               ) &
    ( cmp_top.iop.ctu_spc5_cmp_cken               ) &
    ( cmp_top.iop.ctu_spc6_cmp_cken               ) &
    ( cmp_top.iop.ctu_spc7_cmp_cken               ) &
    ( cmp_top.iop.ctu_scdata0_cmp_cken            ) &
    ( cmp_top.iop.ctu_scdata1_cmp_cken            ) &
    ( cmp_top.iop.ctu_scdata2_cmp_cken            ) &
    ( cmp_top.iop.ctu_scdata3_cmp_cken            ) &
    ( cmp_top.iop.ctu_sctag0_cmp_cken             ) &
    ( cmp_top.iop.ctu_sctag1_cmp_cken             ) &
    ( cmp_top.iop.ctu_sctag2_cmp_cken             ) &
    ( cmp_top.iop.ctu_sctag3_cmp_cken             ) &
    ( cmp_top.iop.ctu_dram02_cmp_cken             ) &
    ( cmp_top.iop.ctu_dram13_cmp_cken             ) &
    ( cmp_top.iop.ctu_ccx_cmp_cken                ) &
    ( cmp_top.iop.ctu_fpu_cmp_cken                ) &
    ( cmp_top.iop.ctu_jbi_cmp_cken                ) &
    ( cmp_top.iop.ctu_iob_cmp_cken                ) &
    ( cmp_top.iop.flop_rptrs.ctu_spc0_cken        ) &
    ( cmp_top.iop.flop_rptrs.ctu_spc1_cken        ) &
    ( cmp_top.iop.flop_rptrs.ctu_spc2_cken        ) &
    ( cmp_top.iop.flop_rptrs.ctu_spc3_cken        ) &
    ( cmp_top.iop.flop_rptrs.ctu_spc4_cken        ) &
    ( cmp_top.iop.flop_rptrs.ctu_spc5_cken        ) &
    ( cmp_top.iop.flop_rptrs.ctu_spc6_cken        ) &
    ( cmp_top.iop.flop_rptrs.ctu_spc7_cken        ) &
    ( cmp_top.iop.flop_rptrs.ctu_scdata0_cken     ) &
    ( cmp_top.iop.flop_rptrs.ctu_scdata1_cken     ) &
    ( cmp_top.iop.flop_rptrs.ctu_scdata2_cken     ) &
    ( cmp_top.iop.flop_rptrs.ctu_scdata3_cken     ) &
    ( cmp_top.iop.flop_rptrs.ctu_sctag0_cken      ) &
    ( cmp_top.iop.flop_rptrs.ctu_sctag1_cken      ) &
    ( cmp_top.iop.flop_rptrs.ctu_sctag2_cken      ) &
    ( cmp_top.iop.flop_rptrs.ctu_sctag3_cken      ) &
    ( cmp_top.iop.flop_rptrs.ctu_dram02_cken      ) &
    ( cmp_top.iop.flop_rptrs.ctu_dram13_cken      ) &
    ( cmp_top.iop.flop_rptrs.ctu_ccx_cken         ) &
    ( cmp_top.iop.flop_rptrs.ctu_fpu_cken         ) &
    ( cmp_top.iop.flop_rptrs.ctu_jbi_cken         ) &
    ( cmp_top.iop.flop_rptrs.ctu_iob_cken         ) &
    ( cmp_top.iop.flop_rptrs.gclk_spc0_cken       ) &
    ( cmp_top.iop.flop_rptrs.gclk_spc1_cken       ) &
    ( cmp_top.iop.flop_rptrs.gclk_spc2_cken       ) &
    ( cmp_top.iop.flop_rptrs.gclk_spc3_cken       ) &
    ( cmp_top.iop.flop_rptrs.gclk_spc4_cken       ) &
    ( cmp_top.iop.flop_rptrs.gclk_spc5_cken       ) &
    ( cmp_top.iop.flop_rptrs.gclk_spc6_cken       ) &
    ( cmp_top.iop.flop_rptrs.gclk_spc7_cken       ) &
    ( cmp_top.iop.flop_rptrs.gclk_scdata0_cken    ) &
    ( cmp_top.iop.flop_rptrs.gclk_scdata1_cken    ) &
    ( cmp_top.iop.flop_rptrs.gclk_scdata2_cken    ) &
    ( cmp_top.iop.flop_rptrs.gclk_scdata3_cken    ) &
    ( cmp_top.iop.flop_rptrs.gclk_sctag0_cken     ) &
    ( cmp_top.iop.flop_rptrs.gclk_sctag1_cken     ) &
    ( cmp_top.iop.flop_rptrs.gclk_sctag2_cken     ) &
    ( cmp_top.iop.flop_rptrs.gclk_sctag3_cken     ) &
    ( cmp_top.iop.flop_rptrs.gclk_dram02_cken     ) &
    ( cmp_top.iop.flop_rptrs.gclk_dram13_cken     ) &
    ( cmp_top.iop.flop_rptrs.gclk_ccx_cken        ) &
    ( cmp_top.iop.flop_rptrs.gclk_fpu_cken        ) &
    ( cmp_top.iop.flop_rptrs.gclk_jbi_cken        ) &
    ( cmp_top.iop.flop_rptrs.gclk_iob_cken        ) &
    ( cmp_top.iop.rpt_spc0_cmp_cken               ) &
    ( cmp_top.iop.rpt_spc1_cmp_cken               ) &
    ( cmp_top.iop.rpt_spc2_cmp_cken               ) &
    ( cmp_top.iop.rpt_spc3_cmp_cken               ) &
    ( cmp_top.iop.rpt_spc4_cmp_cken               ) &
    ( cmp_top.iop.rpt_spc5_cmp_cken               ) &
    ( cmp_top.iop.rpt_spc6_cmp_cken               ) &
    ( cmp_top.iop.rpt_spc7_cmp_cken               ) &
    ( cmp_top.iop.rpt_scdata0_cmp_cken            ) &
    ( cmp_top.iop.rpt_scdata1_cmp_cken            ) &
    ( cmp_top.iop.rpt_scdata2_cmp_cken            ) &
    ( cmp_top.iop.rpt_scdata3_cmp_cken            ) &
    ( cmp_top.iop.rpt_sctag0_cmp_cken             ) &
    ( cmp_top.iop.rpt_sctag1_cmp_cken             ) &
    ( cmp_top.iop.rpt_sctag2_cmp_cken             ) &
    ( cmp_top.iop.rpt_sctag3_cmp_cken             )
  );

  wire lo_top_cmp_cken = (
    (~cmp_top.iop.ctu.ctu_spc0_cmp_cken           ) &
    (~cmp_top.iop.ctu.ctu_spc1_cmp_cken           ) &
    (~cmp_top.iop.ctu.ctu_spc2_cmp_cken           ) &
    (~cmp_top.iop.ctu.ctu_spc3_cmp_cken           ) &
    (~cmp_top.iop.ctu.ctu_spc4_cmp_cken           ) &
    (~cmp_top.iop.ctu.ctu_spc5_cmp_cken           ) &
    (~cmp_top.iop.ctu.ctu_spc6_cmp_cken           ) &
    (~cmp_top.iop.ctu.ctu_spc7_cmp_cken           ) &
    (~cmp_top.iop.ctu.ctu_scdata0_cmp_cken        ) &
    (~cmp_top.iop.ctu.ctu_scdata1_cmp_cken        ) &
    (~cmp_top.iop.ctu.ctu_scdata2_cmp_cken        ) &
    (~cmp_top.iop.ctu.ctu_scdata3_cmp_cken        ) &
    (~cmp_top.iop.ctu.ctu_sctag0_cmp_cken         ) &
    (~cmp_top.iop.ctu.ctu_sctag1_cmp_cken         ) &
    (~cmp_top.iop.ctu.ctu_sctag2_cmp_cken         ) &
    (~cmp_top.iop.ctu.ctu_sctag3_cmp_cken         ) &
    (~cmp_top.iop.ctu.ctu_dram02_cmp_cken         ) &
    (~cmp_top.iop.ctu.ctu_dram13_cmp_cken         ) &
    (~cmp_top.iop.ctu.ctu_ccx_cmp_cken            ) &
    (~cmp_top.iop.ctu.ctu_fpu_cmp_cken            ) &
    (~cmp_top.iop.ctu.ctu_jbi_cmp_cken            ) &
    (~cmp_top.iop.ctu.ctu_iob_cmp_cken            ) &
    (~cmp_top.iop.ctu_spc0_cmp_cken               ) &
    (~cmp_top.iop.ctu_spc1_cmp_cken               ) &
    (~cmp_top.iop.ctu_spc2_cmp_cken               ) &
    (~cmp_top.iop.ctu_spc3_cmp_cken               ) &
    (~cmp_top.iop.ctu_spc4_cmp_cken               ) &
    (~cmp_top.iop.ctu_spc5_cmp_cken               ) &
    (~cmp_top.iop.ctu_spc6_cmp_cken               ) &
    (~cmp_top.iop.ctu_spc7_cmp_cken               ) &
    (~cmp_top.iop.ctu_scdata0_cmp_cken            ) &
    (~cmp_top.iop.ctu_scdata1_cmp_cken            ) &
    (~cmp_top.iop.ctu_scdata2_cmp_cken            ) &
    (~cmp_top.iop.ctu_scdata3_cmp_cken            ) &
    (~cmp_top.iop.ctu_sctag0_cmp_cken             ) &
    (~cmp_top.iop.ctu_sctag1_cmp_cken             ) &
    (~cmp_top.iop.ctu_sctag2_cmp_cken             ) &
    (~cmp_top.iop.ctu_sctag3_cmp_cken             ) &
    (~cmp_top.iop.ctu_dram02_cmp_cken             ) &
    (~cmp_top.iop.ctu_dram13_cmp_cken             ) &
    (~cmp_top.iop.ctu_ccx_cmp_cken                ) &
    (~cmp_top.iop.ctu_fpu_cmp_cken                ) &
    (~cmp_top.iop.ctu_jbi_cmp_cken                ) &
    (~cmp_top.iop.ctu_iob_cmp_cken                ) &
    (~cmp_top.iop.flop_rptrs.ctu_spc0_cken        ) &
    (~cmp_top.iop.flop_rptrs.ctu_spc1_cken        ) &
    (~cmp_top.iop.flop_rptrs.ctu_spc2_cken        ) &
    (~cmp_top.iop.flop_rptrs.ctu_spc3_cken        ) &
    (~cmp_top.iop.flop_rptrs.ctu_spc4_cken        ) &
    (~cmp_top.iop.flop_rptrs.ctu_spc5_cken        ) &
    (~cmp_top.iop.flop_rptrs.ctu_spc6_cken        ) &
    (~cmp_top.iop.flop_rptrs.ctu_spc7_cken        ) &
    (~cmp_top.iop.flop_rptrs.ctu_scdata0_cken     ) &
    (~cmp_top.iop.flop_rptrs.ctu_scdata1_cken     ) &
    (~cmp_top.iop.flop_rptrs.ctu_scdata2_cken     ) &
    (~cmp_top.iop.flop_rptrs.ctu_scdata3_cken     ) &
    (~cmp_top.iop.flop_rptrs.ctu_sctag0_cken      ) &
    (~cmp_top.iop.flop_rptrs.ctu_sctag1_cken      ) &
    (~cmp_top.iop.flop_rptrs.ctu_sctag2_cken      ) &
    (~cmp_top.iop.flop_rptrs.ctu_sctag3_cken      ) &
    (~cmp_top.iop.flop_rptrs.ctu_dram02_cken      ) &
    (~cmp_top.iop.flop_rptrs.ctu_dram13_cken      ) &
    (~cmp_top.iop.flop_rptrs.ctu_ccx_cken         ) &
    (~cmp_top.iop.flop_rptrs.ctu_fpu_cken         ) &
    (~cmp_top.iop.flop_rptrs.ctu_jbi_cken         ) &
    (~cmp_top.iop.flop_rptrs.ctu_iob_cken         ) &
    (~cmp_top.iop.flop_rptrs.gclk_spc0_cken       ) &
    (~cmp_top.iop.flop_rptrs.gclk_spc1_cken       ) &
    (~cmp_top.iop.flop_rptrs.gclk_spc2_cken       ) &
    (~cmp_top.iop.flop_rptrs.gclk_spc3_cken       ) &
    (~cmp_top.iop.flop_rptrs.gclk_spc4_cken       ) &
    (~cmp_top.iop.flop_rptrs.gclk_spc5_cken       ) &
    (~cmp_top.iop.flop_rptrs.gclk_spc6_cken       ) &
    (~cmp_top.iop.flop_rptrs.gclk_spc7_cken       ) &
    (~cmp_top.iop.flop_rptrs.gclk_scdata0_cken    ) &
    (~cmp_top.iop.flop_rptrs.gclk_scdata1_cken    ) &
    (~cmp_top.iop.flop_rptrs.gclk_scdata2_cken    ) &
    (~cmp_top.iop.flop_rptrs.gclk_scdata3_cken    ) &
    (~cmp_top.iop.flop_rptrs.gclk_sctag0_cken     ) &
    (~cmp_top.iop.flop_rptrs.gclk_sctag1_cken     ) &
    (~cmp_top.iop.flop_rptrs.gclk_sctag2_cken     ) &
    (~cmp_top.iop.flop_rptrs.gclk_sctag3_cken     ) &
    (~cmp_top.iop.flop_rptrs.gclk_dram02_cken     ) &
    (~cmp_top.iop.flop_rptrs.gclk_dram13_cken     ) &
    (~cmp_top.iop.flop_rptrs.gclk_ccx_cken        ) &
    (~cmp_top.iop.flop_rptrs.gclk_fpu_cken        ) &
    (~cmp_top.iop.flop_rptrs.gclk_jbi_cken        ) &
    (~cmp_top.iop.flop_rptrs.gclk_iob_cken        ) &
    (~cmp_top.iop.rpt_spc0_cmp_cken               ) &
    (~cmp_top.iop.rpt_spc1_cmp_cken               ) &
    (~cmp_top.iop.rpt_spc2_cmp_cken               ) &
    (~cmp_top.iop.rpt_spc3_cmp_cken               ) &
    (~cmp_top.iop.rpt_spc4_cmp_cken               ) &
    (~cmp_top.iop.rpt_spc5_cmp_cken               ) &
    (~cmp_top.iop.rpt_spc6_cmp_cken               ) &
    (~cmp_top.iop.rpt_spc7_cmp_cken               ) &
    (~cmp_top.iop.rpt_scdata0_cmp_cken            ) &
    (~cmp_top.iop.rpt_scdata1_cmp_cken            ) &
    (~cmp_top.iop.rpt_scdata2_cmp_cken            ) &
    (~cmp_top.iop.rpt_scdata3_cmp_cken            ) &
    (~cmp_top.iop.rpt_sctag0_cmp_cken             ) &
    (~cmp_top.iop.rpt_sctag1_cmp_cken             ) &
    (~cmp_top.iop.rpt_sctag2_cmp_cken             ) &
    (~cmp_top.iop.rpt_sctag3_cmp_cken             ) &
    (~cmp_top.iop.rpt_dram02_cmp_cken             ) &
    (~cmp_top.iop.rpt_dram13_cmp_cken             ) &
    (~cmp_top.iop.rpt_ccx_cmp_cken                ) &
    (~cmp_top.iop.rpt_fpu_cmp_cken                ) &
    (~cmp_top.iop.rpt_jbi_cmp_cken                ) &
    (~cmp_top.iop.rpt_iob_cmp_cken                )
  );

  wire hi_top_dram_cken = (
    ( cmp_top.iop.ctu.ctu_dram02_dram_cken        ) &
    ( cmp_top.iop.ctu.ctu_dram13_dram_cken        ) &
    ( cmp_top.iop.ctu.ctu_ddr0_dram_cken          ) &
    ( cmp_top.iop.ctu.ctu_ddr1_dram_cken          ) &
    ( cmp_top.iop.ctu.ctu_ddr2_dram_cken          ) &
    ( cmp_top.iop.ctu.ctu_ddr3_dram_cken          ) &
    ( cmp_top.iop.ctu_dram02_dram_cken            ) &
    ( cmp_top.iop.ctu_dram13_dram_cken            ) &
    ( cmp_top.iop.ctu_ddr0_dram_cken              ) &
    ( cmp_top.iop.ctu_ddr1_dram_cken              ) &
    ( cmp_top.iop.ctu_ddr2_dram_cken              ) &
    ( cmp_top.iop.ctu_ddr3_dram_cken              )
  );

  wire lo_top_dram_cken = (
    (~cmp_top.iop.ctu.ctu_dram02_dram_cken        ) &
    (~cmp_top.iop.ctu.ctu_dram13_dram_cken        ) &
    (~cmp_top.iop.ctu.ctu_ddr0_dram_cken          ) &
    (~cmp_top.iop.ctu.ctu_ddr1_dram_cken          ) &
    (~cmp_top.iop.ctu.ctu_ddr2_dram_cken          ) &
    (~cmp_top.iop.ctu.ctu_ddr3_dram_cken          ) &
    (~cmp_top.iop.ctu_dram02_dram_cken            ) &
    (~cmp_top.iop.ctu_dram13_dram_cken            ) &
    (~cmp_top.iop.ctu_ddr0_dram_cken              ) &
    (~cmp_top.iop.ctu_ddr1_dram_cken              ) &
    (~cmp_top.iop.ctu_ddr2_dram_cken              ) &
    (~cmp_top.iop.ctu_ddr3_dram_cken              )
  );

  wire hi_top_jbus_cken = (
    ( cmp_top.iop.ctu.ctu_dram02_jbus_cken        ) &
    ( cmp_top.iop.ctu.ctu_dram13_jbus_cken        ) &
    ( cmp_top.iop.ctu.ctu_jbi_jbus_cken           ) &
    ( cmp_top.iop.ctu.ctu_iob_jbus_cken           ) &
    ( cmp_top.iop.ctu.ctu_efc_jbus_cken           ) &
    ( cmp_top.iop.ctu_dram02_jbus_cken            ) &
    ( cmp_top.iop.ctu_dram13_jbus_cken            ) &
    ( cmp_top.iop.ctu_jbi_jbus_cken               ) &
    ( cmp_top.iop.ctu_iob_jbus_cken               ) &
    ( cmp_top.iop.ctu_efc_jbus_cken               )
  );

  wire lo_top_jbus_cken = (
    (~cmp_top.iop.ctu.ctu_dram02_jbus_cken        ) &
    (~cmp_top.iop.ctu.ctu_dram13_jbus_cken        ) &
    (~cmp_top.iop.ctu.ctu_jbi_jbus_cken           ) &
    (~cmp_top.iop.ctu.ctu_iob_jbus_cken           ) &
    (~cmp_top.iop.ctu.ctu_efc_jbus_cken           ) &
    (~cmp_top.iop.ctu_dram02_jbus_cken            ) &
    (~cmp_top.iop.ctu_dram13_jbus_cken            ) &
    (~cmp_top.iop.ctu_jbi_jbus_cken               ) &
    (~cmp_top.iop.ctu_iob_jbus_cken               ) &
    (~cmp_top.iop.ctu_efc_jbus_cken               )
  );

  wire hi_top_jpad_cken = (
    ( cmp_top.iop.ctu.ctu_jbusl_jbus_cken         ) &
    ( cmp_top.iop.ctu.ctu_jbusr_jbus_cken         ) &
    ( cmp_top.iop.ctu.ctu_misc_jbus_cken          ) &
    ( cmp_top.iop.ctu.ctu_dbg_jbus_cken           ) &
    ( cmp_top.iop.ctu_jbusl_jbus_cken             ) &
    ( cmp_top.iop.ctu_jbusr_jbus_cken             ) &
    ( cmp_top.iop.ctu_misc_jbus_cken              ) &
    ( cmp_top.iop.ctu_dbg_jbus_cken               )
  );

  wire lo_top_jpad_cken = (
    (~cmp_top.iop.ctu.ctu_jbusl_jbus_cken         ) &
    (~cmp_top.iop.ctu.ctu_jbusr_jbus_cken         ) &
    (~cmp_top.iop.ctu.ctu_misc_jbus_cken          ) &
    (~cmp_top.iop.ctu.ctu_dbg_jbus_cken           ) &
    (~cmp_top.iop.ctu_jbusl_jbus_cken             ) &
    (~cmp_top.iop.ctu_jbusr_jbus_cken             ) &
    (~cmp_top.iop.ctu_misc_jbus_cken              ) &
    (~cmp_top.iop.ctu_dbg_jbus_cken               )
  );

  // efc_start
   
  wire hi_top_efc_read = (
    ( cmp_top.iop.ctu.ctu_efc_read_start          ) &
    ( cmp_top.iop.ctu_efc_read_start              )
  );

  wire lo_top_efc_read = (
    (~cmp_top.iop.ctu.ctu_efc_read_start          ) &
    (~cmp_top.iop.ctu_efc_read_start              )
  );

  // mbisten
   
  wire hi_top_sctag0_mbisten = (
    ( cmp_top.iop.ctu.ctu_sctag0_mbisten          ) &
    ( cmp_top.iop.ctu_sctag0_mbisten              )
  );

  wire lo_top_sctag0_mbisten = (
    (~cmp_top.iop.ctu.ctu_sctag0_mbisten          ) &
    (~cmp_top.iop.ctu_sctag0_mbisten              )
  );

  wire hi_top_sctag1_mbisten = (
    ( cmp_top.iop.ctu.ctu_sctag1_mbisten          ) &
    ( cmp_top.iop.ctu_sctag1_mbisten              )
  );

  wire lo_top_sctag1_mbisten = (
    (~cmp_top.iop.ctu.ctu_sctag1_mbisten          ) &
    (~cmp_top.iop.ctu_sctag1_mbisten              )
  );

  wire hi_top_sctag2_mbisten = (
    ( cmp_top.iop.ctu.ctu_sctag2_mbisten          ) &
    ( cmp_top.iop.ctu_sctag2_mbisten              )
  );

  wire lo_top_sctag2_mbisten = (
    (~cmp_top.iop.ctu.ctu_sctag2_mbisten          ) &
    (~cmp_top.iop.ctu_sctag2_mbisten              )
  );

  wire hi_top_sctag3_mbisten = (
    ( cmp_top.iop.ctu.ctu_sctag3_mbisten          ) &
    ( cmp_top.iop.ctu_sctag3_mbisten              )
  );

  wire lo_top_sctag3_mbisten = (
    (~cmp_top.iop.ctu.ctu_sctag3_mbisten          ) &
    (~cmp_top.iop.ctu_sctag3_mbisten              )
  );

  wire hi_top_spc0_mbisten = (
    ( cmp_top.iop.ctu.ctu_spc0_mbisten            ) &
    ( cmp_top.iop.ctu_spc0_mbisten                )
  );

  wire lo_top_spc0_mbisten = (
    (~cmp_top.iop.ctu.ctu_spc0_mbisten            ) &
    (~cmp_top.iop.ctu_spc0_mbisten                )
  );

  wire hi_top_spc1_mbisten = (
    ( cmp_top.iop.ctu.ctu_spc1_mbisten            ) &
    ( cmp_top.iop.ctu_spc1_mbisten                )
  );

  wire lo_top_spc1_mbisten = (
    (~cmp_top.iop.ctu.ctu_spc1_mbisten            ) &
    (~cmp_top.iop.ctu_spc1_mbisten                )
  );

  wire hi_top_spc2_mbisten = (
    ( cmp_top.iop.ctu.ctu_spc2_mbisten            ) &
    ( cmp_top.iop.ctu_spc2_mbisten                )
  );

  wire lo_top_spc2_mbisten = (
    (~cmp_top.iop.ctu.ctu_spc2_mbisten            ) &
    (~cmp_top.iop.ctu_spc2_mbisten                )
  );

  wire hi_top_spc3_mbisten = (
    ( cmp_top.iop.ctu.ctu_spc3_mbisten            ) &
    ( cmp_top.iop.ctu_spc3_mbisten                )
  );

  wire lo_top_spc3_mbisten = (
    (~cmp_top.iop.ctu.ctu_spc3_mbisten            ) &
    (~cmp_top.iop.ctu_spc3_mbisten                )
  );

  wire hi_top_spc4_mbisten = (
    ( cmp_top.iop.ctu.ctu_spc4_mbisten            ) &
    ( cmp_top.iop.ctu_spc4_mbisten                )
  );

  wire lo_top_spc4_mbisten = (
    (~cmp_top.iop.ctu.ctu_spc4_mbisten            ) &
    (~cmp_top.iop.ctu_spc4_mbisten                )
  );

  wire hi_top_spc5_mbisten = (
    ( cmp_top.iop.ctu.ctu_spc5_mbisten            ) &
    ( cmp_top.iop.ctu_spc5_mbisten                )
  );

  wire lo_top_spc5_mbisten = (
    (~cmp_top.iop.ctu.ctu_spc5_mbisten            ) &
    (~cmp_top.iop.ctu_spc5_mbisten                )
  );

  wire hi_top_spc6_mbisten = (
    ( cmp_top.iop.ctu.ctu_spc6_mbisten            ) &
    ( cmp_top.iop.ctu_spc6_mbisten                )
  );

  wire lo_top_spc6_mbisten = (
    (~cmp_top.iop.ctu.ctu_spc6_mbisten            ) &
    (~cmp_top.iop.ctu_spc6_mbisten                )
  );

  wire hi_top_spc7_mbisten = (
    ( cmp_top.iop.ctu.ctu_spc7_mbisten            ) &
    ( cmp_top.iop.ctu_spc7_mbisten                )
  );

  wire lo_top_spc7_mbisten = (
    (~cmp_top.iop.ctu.ctu_spc7_mbisten            ) &
    (~cmp_top.iop.ctu_spc7_mbisten                )
  );

  ////////////////////////////////////////////////////////////////
  // 'cluster' signals tracks simultaneous switching of nodes
  // across multiple clusters
  ////////////////////////////////////////////////////////////////

  // arst
  wire hi_cluster_cmp_arst_l = (
    ( cmp_top.iop.iobdg.cmp_arst_l                ) & 
    ( cmp_top.iop.jbi.cmp_arst_l                  )   
  );

  wire lo_cluster_cmp_arst_l = (
    (~cmp_top.iop.iobdg.cmp_arst_l                ) &
    (~cmp_top.iop.jbi.cmp_arst_l                  )   
  );

  wire hi_cluster_dram_arst_l = (
    ( cmp_top.iop.dram02.dram_arst_l              ) &
    ( cmp_top.iop.dram13.dram_arst_l              ) &
    ( cmp_top.iop.pad_ddr0.dram_arst_l            ) &
    ( cmp_top.iop.pad_ddr1.dram_arst_l            ) &
    ( cmp_top.iop.pad_ddr2.dram_arst_l            ) &
    ( cmp_top.iop.pad_ddr3.dram_arst_l            )
  );

  wire lo_cluster_dram_arst_l = (
    (~cmp_top.iop.dram02.dram_arst_l              ) &
    (~cmp_top.iop.dram13.dram_arst_l              ) &
    (~cmp_top.iop.pad_ddr0.dram_arst_l            ) &
    (~cmp_top.iop.pad_ddr1.dram_arst_l            ) &
    (~cmp_top.iop.pad_ddr2.dram_arst_l            ) &
    (~cmp_top.iop.pad_ddr3.dram_arst_l            )
  );

  wire hi_cluster_jbus_arst_l = (
    ( cmp_top.iop.iobdg.jbus_arst_l               ) &
    ( cmp_top.iop.jbi.jbus_arst_l                 ) &   
    ( cmp_top.iop.pad_dbg.jbus_arst_l             ) & 
    ( cmp_top.iop.pad_dbg.por_l                   ) &
    ( cmp_top.iop.pad_jbusl.jbus_arst_l           ) & 
    ( cmp_top.iop.pad_jbusl.por_l                 ) & 
    ( cmp_top.iop.pad_jbusr.jbus_arst_l           ) & 
//  ( cmp_top.iop.pad_jbusr.hard_rst_l            ) & 
    ( cmp_top.iop.pad_jbusr.por_l                 ) & 
    ( cmp_top.iop.pad_misc.jbus_arst_l            ) 
  );

  wire lo_cluster_jbus_arst_l = (
    (~cmp_top.iop.iobdg.jbus_arst_l               ) &
    (~cmp_top.iop.jbi.jbus_arst_l                 ) &
    (~cmp_top.iop.pad_dbg.jbus_arst_l             ) &
    (~cmp_top.iop.pad_dbg.por_l                   ) &
    (~cmp_top.iop.pad_jbusl.jbus_arst_l           ) &
    (~cmp_top.iop.pad_jbusl.por_l                 ) &
    (~cmp_top.iop.pad_jbusr.jbus_arst_l           ) &
//  (~cmp_top.iop.pad_jbusr.hard_rst_l            ) &
    (~cmp_top.iop.pad_jbusr.por_l                 ) &
    (~cmp_top.iop.pad_misc.jbus_arst_l            ) 
  );

  // adbginit
  wire hi_cluster_cmp_adbginit_l= (
    ( cmp_top.iop.iobdg.cmp_adbginit_l            )
  );

  wire lo_cluster_cmp_adbginit_l= (
    (~cmp_top.iop.iobdg.cmp_adbginit_l            )
  );

  wire hi_cluster_dram_adbginit_l= (
    ( cmp_top.iop.dram02.dram_adbginit_l          ) &
    ( cmp_top.iop.dram13.dram_adbginit_l          ) &
    ( cmp_top.iop.pad_ddr0.dram_adbginit_l        ) &
    ( cmp_top.iop.pad_ddr1.dram_adbginit_l        ) &
    ( cmp_top.iop.pad_ddr2.dram_adbginit_l        ) &
    ( cmp_top.iop.pad_ddr3.dram_adbginit_l        )
  );

  wire lo_cluster_dram_adbginit_l= (
    (~cmp_top.iop.dram02.dram_adbginit_l          ) &
    (~cmp_top.iop.dram13.dram_adbginit_l          ) &
    (~cmp_top.iop.pad_ddr0.dram_adbginit_l        ) &
    (~cmp_top.iop.pad_ddr1.dram_adbginit_l        ) &
    (~cmp_top.iop.pad_ddr2.dram_adbginit_l        ) &
    (~cmp_top.iop.pad_ddr3.dram_adbginit_l        )
  );

  wire hi_cluster_jbus_adbginit_l= (
    ( cmp_top.iop.iobdg.jbus_adbginit_l           ) &
    ( cmp_top.iop.pad_dbg.jbus_adbginit_l         ) & 
    ( cmp_top.iop.pad_jbusl.jbus_adbginit_l       ) & 
    ( cmp_top.iop.pad_jbusr.jbus_adbginit_l       ) & 
    ( cmp_top.iop.pad_misc.jbus_adbginit_l        ) 
  );

  wire lo_cluster_jbus_adbginit_l= (
    (~cmp_top.iop.iobdg.jbus_adbginit_l           ) &
    (~cmp_top.iop.pad_dbg.jbus_adbginit_l         ) &
    (~cmp_top.iop.pad_jbusl.jbus_adbginit_l       ) &
    (~cmp_top.iop.pad_jbusr.jbus_adbginit_l       ) &
    (~cmp_top.iop.pad_misc.jbus_adbginit_l        ) 
  );

  // grst
  wire hi_cluster_cmp_grst_l = (
    ( cmp_top.iop.dram02.cmp_grst_l               ) &
    ( cmp_top.iop.dram13.cmp_grst_l               ) &
    ( cmp_top.iop.iobdg.cmp_grst_l                ) &
    ( cmp_top.iop.jbi.cmp_grst_l                  )
  );

  wire lo_cluster_cmp_grst_l = (
    (~cmp_top.iop.dram02.cmp_grst_l               ) &
    (~cmp_top.iop.dram13.cmp_grst_l               ) &
    (~cmp_top.iop.iobdg.cmp_grst_l                ) &
    (~cmp_top.iop.jbi.cmp_grst_l                  )
  );

  wire hi_cluster_dram_grst_l = (
    ( cmp_top.iop.dram02.dram_grst_l              ) &
    ( cmp_top.iop.dram13.dram_grst_l              ) &
    ( cmp_top.iop.pad_ddr0.dram_grst_l            ) &
    ( cmp_top.iop.pad_ddr1.dram_grst_l            ) &
    ( cmp_top.iop.pad_ddr2.dram_grst_l            ) &
    ( cmp_top.iop.pad_ddr3.dram_grst_l            ) 
  );

  wire lo_cluster_dram_grst_l = (
    (~cmp_top.iop.dram02.dram_grst_l              ) &
    (~cmp_top.iop.dram13.dram_grst_l              ) &
    (~cmp_top.iop.pad_ddr0.dram_grst_l            ) &
    (~cmp_top.iop.pad_ddr1.dram_grst_l            ) &
    (~cmp_top.iop.pad_ddr2.dram_grst_l            ) &
    (~cmp_top.iop.pad_ddr3.dram_grst_l            ) 
  );

  wire hi_cluster_jbus_grst_l = (
    ( cmp_top.iop.ctu.jbus_grst_l                 ) &
    ( cmp_top.iop.dram02.jbus_grst_l              ) &
    ( cmp_top.iop.dram13.jbus_grst_l              ) &
    ( cmp_top.iop.iobdg.jbus_grst_l               ) &
    ( cmp_top.iop.jbi.jbus_grst_l                 )
  );

  wire lo_cluster_jbus_grst_l = (
    (~cmp_top.iop.ctu.jbus_grst_l                 ) &
    (~cmp_top.iop.dram02.jbus_grst_l              ) &
    (~cmp_top.iop.dram13.jbus_grst_l              ) &
    (~cmp_top.iop.iobdg.jbus_grst_l               ) &
    (~cmp_top.iop.jbi.jbus_grst_l                 )
  );

  // gdbginit
  wire hi_cluster_cmp_gdbginit_l= (
    ( cmp_top.iop.iobdg.cmp_gdbginit_l            )
  );

  wire lo_cluster_cmp_gdbginit_l= (
    (~cmp_top.iop.iobdg.cmp_gdbginit_l            )
  );

  wire hi_cluster_dram_gdbginit_l= (
    ( cmp_top.iop.dram02.dram_gdbginit_l          ) &
    ( cmp_top.iop.dram13.dram_gdbginit_l          ) &
    ( cmp_top.iop.pad_ddr0.dram_gdbginit_l        ) &
    ( cmp_top.iop.pad_ddr1.dram_gdbginit_l        ) &
    ( cmp_top.iop.pad_ddr2.dram_gdbginit_l        ) &
    ( cmp_top.iop.pad_ddr3.dram_gdbginit_l        ) 
  );

  wire lo_cluster_dram_gdbginit_l= (
    (~cmp_top.iop.dram02.dram_gdbginit_l          ) &
    (~cmp_top.iop.dram13.dram_gdbginit_l          ) &
    (~cmp_top.iop.pad_ddr0.dram_gdbginit_l        ) &
    (~cmp_top.iop.pad_ddr1.dram_gdbginit_l        ) &
    (~cmp_top.iop.pad_ddr2.dram_gdbginit_l        ) &
    (~cmp_top.iop.pad_ddr3.dram_gdbginit_l        ) 
  );

  wire hi_cluster_jbus_gdbginit_l= (
    ( cmp_top.iop.iobdg.jbus_gdbginit_l           )
  );

  wire lo_cluster_jbus_gdbginit_l= (
    (~cmp_top.iop.iobdg.jbus_gdbginit_l           )
  );

  // local rst
  wire hi_cluster_cmp_rst_l = (
    ( cmp_top.iop.dram02.cmp_rst_l                ) &
    ( cmp_top.iop.dram13.cmp_rst_l                ) &
    ( cmp_top.iop.iobdg.cmp_rst_l                 ) &
    ( cmp_top.iop.jbi.cmp_rst_l_ff0               ) &
    ( cmp_top.iop.jbi.cmp_rst_l_ff1               ) 
  );

  wire lo_cluster_cmp_rst_l = (
    (~cmp_top.iop.dram02.cmp_rst_l                ) &
    (~cmp_top.iop.dram13.cmp_rst_l                ) &
    (~cmp_top.iop.iobdg.cmp_rst_l                 ) &
    (~cmp_top.iop.jbi.cmp_rst_l_ff0               ) &
    (~cmp_top.iop.jbi.cmp_rst_l_ff1               ) 
  );

  wire hi_cluster_dram_rst_l = (
    ( cmp_top.iop.dram02.dram_rst_l               ) &
    ( cmp_top.iop.dram13.dram_rst_l               ) &
    ( cmp_top.iop.pad_ddr0.rst_l                  ) &
    ( cmp_top.iop.pad_ddr1.rst_l                  ) &
    ( cmp_top.iop.pad_ddr2.rst_l                  ) &
    ( cmp_top.iop.pad_ddr3.rst_l                  ) 
  );

  wire lo_cluster_dram_rst_l = (
    (~cmp_top.iop.dram02.dram_rst_l               ) &
    (~cmp_top.iop.dram13.dram_rst_l               ) &
    (~cmp_top.iop.pad_ddr0.rst_l                  ) &
    (~cmp_top.iop.pad_ddr1.rst_l                  ) &
    (~cmp_top.iop.pad_ddr2.rst_l                  ) &
    (~cmp_top.iop.pad_ddr3.rst_l                  ) 
  );

  wire hi_cluster_jbus_rst_l = (
    ( cmp_top.iop.ctu.jbus_rst_l                  ) &
    ( cmp_top.iop.dram02.jbus_rst_l               ) &
    ( cmp_top.iop.dram13.jbus_rst_l               ) &
    ( cmp_top.iop.iobdg.rst_l                     ) &
    ( cmp_top.iop.jbi.jbus_rst_l                  )
  );

  wire lo_cluster_jbus_rst_l = (
    (~cmp_top.iop.ctu.jbus_rst_l                  ) &
    (~cmp_top.iop.dram02.jbus_rst_l               ) &
    (~cmp_top.iop.dram13.jbus_rst_l               ) &
    (~cmp_top.iop.iobdg.rst_l                     ) &
    (~cmp_top.iop.jbi.jbus_rst_l                  )
  );

  wire hi_cluster_rst_l = (
    ( hi_cluster_cmp_rst_l                        ) &
    ( hi_cluster_dram_rst_l                       ) &
    ( hi_cluster_jbus_rst_l                       )
  );

  wire lo_cluster_rst_l = (
    ( lo_cluster_cmp_rst_l                        ) &
    ( lo_cluster_dram_rst_l                       ) &
    ( lo_cluster_jbus_rst_l                       )
  );

  // DLL rst
  wire hi_cluster_dll_rst_l = (
    ( cmp_top.iop.pad_ddr0.ctu_ddr0_iodll_rst_l   ) &
    ( cmp_top.iop.pad_ddr1.ctu_ddr1_iodll_rst_l   ) &
    ( cmp_top.iop.pad_ddr2.ctu_ddr2_iodll_rst_l   ) &
    ( cmp_top.iop.pad_ddr3.ctu_ddr3_iodll_rst_l   )
  );

  wire lo_cluster_dll_rst_l = (
    (~cmp_top.iop.pad_ddr0.ctu_ddr0_iodll_rst_l   ) &
    (~cmp_top.iop.pad_ddr1.ctu_ddr1_iodll_rst_l   ) &
    (~cmp_top.iop.pad_ddr2.ctu_ddr2_iodll_rst_l   ) &
    (~cmp_top.iop.pad_ddr3.ctu_ddr3_iodll_rst_l   )
  );

  //test rst
  wire hi_cluster_tst_rst_l = (
    ( cmp_top.iop.iobdg.ctu_tst_pre_grst_l        ) &
    ( cmp_top.iop.jbi.ctu_tst_pre_grst_l          )
  );

  wire lo_cluster_tst_rst_l = (
    (~cmp_top.iop.iobdg.ctu_tst_pre_grst_l        ) &
    (~cmp_top.iop.jbi.ctu_tst_pre_grst_l          )
  );

  //refresh
  wire hi_cluster_refresh = (
    ( cmp_top.iop.dram02.clspine_dram_selfrsh     ) &
    ( cmp_top.iop.dram13.clspine_dram_selfrsh     )
  );

  wire lo_cluster_refresh = (
    (~cmp_top.iop.dram02.clspine_dram_selfrsh     ) &
    (~cmp_top.iop.dram13.clspine_dram_selfrsh     )
  );

  // gclk
  wire hi_cluster_cmp_gclk = (
    ( cmp_top.iop.dram02.cmp_gclk                 ) &
    ( cmp_top.iop.dram13.cmp_gclk                 ) &
    ( cmp_top.iop.iobdg.cmp_gclk                  ) &
    ( cmp_top.iop.jbi.cmp_gclk                    ) &
    ( cmp_top.iop.ctu.cmp_gclk                    ) &
    ( cmp_top.iop.ctu.cmp_gclk_cts                )
  );

  wire lo_cluster_cmp_gclk = (
    (~cmp_top.iop.dram02.cmp_gclk                 ) &
    (~cmp_top.iop.dram13.cmp_gclk                 ) &
    (~cmp_top.iop.iobdg.cmp_gclk                  ) &
    (~cmp_top.iop.jbi.cmp_gclk                    ) &   
    (~cmp_top.iop.ctu.cmp_gclk                    ) &
    (~cmp_top.iop.ctu.cmp_gclk_cts                )
  );

  wire hi_cluster_dram_gclk = (
    ( cmp_top.iop.dram02.dram_gclk                ) &
    ( cmp_top.iop.dram13.dram_gclk                ) &
    ( cmp_top.iop.pad_ddr0.dram_gclk[0]           ) &
    ( cmp_top.iop.pad_ddr0.dram_gclk[1]           ) &
    ( cmp_top.iop.pad_ddr1.dram_gclk[0]           ) &
    ( cmp_top.iop.pad_ddr1.dram_gclk[1]           ) &
    ( cmp_top.iop.pad_ddr2.dram_gclk[0]           ) &
    ( cmp_top.iop.pad_ddr2.dram_gclk[1]           ) &
    ( cmp_top.iop.pad_ddr3.dram_gclk[0]           ) &
    ( cmp_top.iop.pad_ddr3.dram_gclk[1]           ) &
    ( cmp_top.iop.ctu.dram_gclk_cts               )
  );

  wire lo_cluster_dram_gclk = (
    (~cmp_top.iop.dram02.dram_gclk                ) &
    (~cmp_top.iop.dram13.dram_gclk                ) &
    (~cmp_top.iop.pad_ddr0.dram_gclk[0]           ) &
    (~cmp_top.iop.pad_ddr0.dram_gclk[1]           ) &
    (~cmp_top.iop.pad_ddr1.dram_gclk[0]           ) &
    (~cmp_top.iop.pad_ddr1.dram_gclk[1]           ) &
    (~cmp_top.iop.pad_ddr2.dram_gclk[0]           ) &
    (~cmp_top.iop.pad_ddr2.dram_gclk[1]           ) &
    (~cmp_top.iop.pad_ddr3.dram_gclk[0]           ) &
    (~cmp_top.iop.pad_ddr3.dram_gclk[1]           ) &
    (~cmp_top.iop.ctu.dram_gclk_cts               )
  );

  wire hi_cluster_jbus_gclk = (
    ( cmp_top.iop.dram02.jbus_gclk                ) &
    ( cmp_top.iop.dram13.jbus_gclk                ) &
    ( cmp_top.iop.iobdg.jbus_gclk                 ) &
    ( cmp_top.iop.jbi.jbus_gclk                   ) &
    ( cmp_top.iop.pad_dbg.jbus_gclk               ) & 
    ( cmp_top.iop.pad_jbusl.jbus_gclk             ) & 
    ( cmp_top.iop.pad_jbusr.jbus_gclk             ) & 
    ( cmp_top.iop.pad_misc.jbus_gclk              ) &
    ( cmp_top.iop.ctu.jbus_gclk                   ) &
    ( cmp_top.iop.ctu.jbus_gclk_cts               )
  );

  wire lo_cluster_jbus_gclk = (
    (~cmp_top.iop.dram02.jbus_gclk                ) &
    (~cmp_top.iop.dram13.jbus_gclk                ) &
    (~cmp_top.iop.iobdg.jbus_gclk                 ) &
    (~cmp_top.iop.jbi.jbus_gclk                   ) &
    (~cmp_top.iop.pad_dbg.jbus_gclk               ) & 
    (~cmp_top.iop.pad_jbusl.jbus_gclk             ) & 
    (~cmp_top.iop.pad_jbusr.jbus_gclk             ) & 
    (~cmp_top.iop.pad_misc.jbus_gclk              ) &
    (~cmp_top.iop.ctu.jbus_gclk                   ) &
    (~cmp_top.iop.ctu.jbus_gclk_cts               )
  );

  // sync
  wire hi_cluster_dram_tx = (
    ( cmp_top.iop.dram02.clspine_dram_tx_sync     ) &
    ( cmp_top.iop.dram13.clspine_dram_tx_sync     )
  );

  wire lo_cluster_dram_tx = (
    (~cmp_top.iop.dram02.clspine_dram_tx_sync     ) &
    (~cmp_top.iop.dram13.clspine_dram_tx_sync     )
  );

  wire hi_cluster_dram_rx = (
    ( cmp_top.iop.dram02.clspine_dram_rx_sync     ) &
    ( cmp_top.iop.dram13.clspine_dram_rx_sync     )   
  );

  wire lo_cluster_dram_rx = (
    (~cmp_top.iop.dram02.clspine_dram_rx_sync     ) &
    (~cmp_top.iop.dram13.clspine_dram_rx_sync     )   
  );

  wire hi_cluster_jbus_tx = (
    ( cmp_top.iop.dram02.clspine_jbus_tx_sync     ) &
    ( cmp_top.iop.dram13.clspine_jbus_tx_sync     ) &
    ( cmp_top.iop.iobdg.clspine_jbus_tx_sync      ) &
    ( cmp_top.iop.jbi.ctu_jbi_tx_en               )
  );

  wire lo_cluster_jbus_tx = (
    (~cmp_top.iop.dram02.clspine_jbus_tx_sync     ) &
    (~cmp_top.iop.dram13.clspine_jbus_tx_sync     ) &
    (~cmp_top.iop.iobdg.clspine_jbus_tx_sync      ) &
    (~cmp_top.iop.jbi.ctu_jbi_tx_en               )
  );

  wire hi_cluster_jbus_rx = (
    ( cmp_top.iop.dram02.clspine_jbus_rx_sync     ) &
    ( cmp_top.iop.dram13.clspine_jbus_rx_sync     ) &
    ( cmp_top.iop.iobdg.clspine_jbus_rx_sync      ) &
    ( cmp_top.iop.jbi.ctu_jbi_rx_en               )
  );

  wire lo_cluster_jbus_rx = (
    (~cmp_top.iop.dram02.clspine_jbus_rx_sync     ) &
    (~cmp_top.iop.dram13.clspine_jbus_rx_sync     ) &
    (~cmp_top.iop.iobdg.clspine_jbus_rx_sync      ) &
    (~cmp_top.iop.jbi.ctu_jbi_rx_en               )
  );

  // cken
  wire hi_cluster_cmp_cken = (
    ( cmp_top.iop.dram02.clk_dram_cmp_cken        ) &
    ( cmp_top.iop.dram13.clk_dram_cmp_cken        ) &
    ( cmp_top.iop.iobdg.clk_iob_cmp_cken          ) &
    ( cmp_top.iop.jbi.clk_jbi_cmp_cken            )
  );

  wire lo_cluster_cmp_cken = (
    (~cmp_top.iop.dram02.clk_dram_cmp_cken        ) &
    (~cmp_top.iop.dram13.clk_dram_cmp_cken        ) &
    (~cmp_top.iop.iobdg.clk_iob_cmp_cken          ) &
    (~cmp_top.iop.jbi.clk_jbi_cmp_cken            )
  );

  wire hi_cluster_dram_cken = (
    ( cmp_top.iop.dram02.clk_dram_dram_cken       ) &
    ( cmp_top.iop.dram13.clk_dram_dram_cken       ) &
    ( cmp_top.iop.pad_ddr0.clk_ddr0_cken          ) &
    ( cmp_top.iop.pad_ddr1.clk_ddr1_cken          ) &
    ( cmp_top.iop.pad_ddr2.clk_ddr2_cken          ) &
    ( cmp_top.iop.pad_ddr3.clk_ddr3_cken          )
  );

  wire lo_cluster_dram_cken = (
    (~cmp_top.iop.dram02.clk_dram_dram_cken       ) &
    (~cmp_top.iop.dram13.clk_dram_dram_cken       ) &
    (~cmp_top.iop.pad_ddr0.clk_ddr0_cken          ) &
    (~cmp_top.iop.pad_ddr1.clk_ddr1_cken          ) &
    (~cmp_top.iop.pad_ddr2.clk_ddr2_cken          ) &
    (~cmp_top.iop.pad_ddr3.clk_ddr3_cken          )
  );

  wire hi_cluster_jbus_cken = (
    ( cmp_top.iop.dram02.clk_dram_jbus_cken       ) &
    ( cmp_top.iop.dram13.clk_dram_jbus_cken       ) &
    ( cmp_top.iop.iobdg.clk_iob_jbus_cken         ) &
    ( cmp_top.iop.jbi.clk_jbi_jbus_cken           )
  );

  wire lo_cluster_jbus_cken = (
    (~cmp_top.iop.dram02.clk_dram_jbus_cken       ) &
    (~cmp_top.iop.dram13.clk_dram_jbus_cken       ) &
    (~cmp_top.iop.iobdg.clk_iob_jbus_cken         ) &
    (~cmp_top.iop.jbi.clk_jbi_jbus_cken           )
  );

  wire hi_cluster_jpad_cken = (
    ( cmp_top.iop.pad_jbusl.clk_jbusl_cken        ) &
    ( cmp_top.iop.pad_jbusr.clk_jbusr_cken        ) &
    ( cmp_top.iop.pad_misc.clk_misc_cken          ) &
    ( cmp_top.iop.pad_dbg.clk_jbusl_cken          )
  );

  wire lo_cluster_jpad_cken = (
    (~cmp_top.iop.pad_jbusl.clk_jbusl_cken        ) &
    (~cmp_top.iop.pad_jbusr.clk_jbusr_cken        ) &
    (~cmp_top.iop.pad_misc.clk_misc_cken          ) &
    (~cmp_top.iop.pad_dbg.clk_jbusl_cken          )
  );

  // 'all' signals are composite from different types of above signals
  wire hi_all_cmp_arst_l = (
    ( hi_top_cmp_arst_l                           ) & 
    ( hi_cluster_cmp_arst_l                       )
  );

  wire lo_all_cmp_arst_l = (
    ( lo_top_cmp_arst_l                           ) & 
    ( lo_cluster_cmp_arst_l                       )
  );

  wire hi_all_dram_arst_l = (
    ( hi_top_dram_arst_l                          ) & 
    ( hi_cluster_dram_arst_l                      )
  );

  wire lo_all_dram_arst_l = (
    ( lo_top_dram_arst_l                          ) & 
    ( lo_cluster_dram_arst_l                      )
  );

  wire hi_all_jbus_arst_l = (
    ( hi_top_jbus_arst_l                          ) & 
    ( hi_cluster_jbus_arst_l                      )
  );

  wire lo_all_jbus_arst_l = (
    ( lo_top_jbus_arst_l                          ) & 
    ( lo_cluster_jbus_arst_l                      )
  );

  wire hi_all_arst_l = (
    ( hi_pin_pwron_rst_l                          ) & 
    ( hi_all_cmp_arst_l                           ) &
    ( hi_all_dram_arst_l                          ) &
    ( hi_all_jbus_arst_l                          )
  );

  wire lo_all_arst_l = (
    ( lo_pin_pwron_rst_l                          ) & 
    ( lo_all_cmp_arst_l                           ) &
    ( lo_all_dram_arst_l                          ) &
    ( lo_all_jbus_arst_l                          )
  );

  wire hi_all_cmp_adbginit_l= (
    ( hi_top_cmp_adbginit_l                       ) & 
    ( hi_cluster_cmp_adbginit_l                   )
  );

  wire lo_all_cmp_adbginit_l= (
    ( lo_top_cmp_adbginit_l                       ) & 
    ( lo_cluster_cmp_adbginit_l                   )
  );

  wire hi_all_dram_adbginit_l= (
    ( hi_top_dram_adbginit_l                      ) & 
    ( hi_cluster_dram_adbginit_l                  )
  );

  wire lo_all_dram_adbginit_l= (
    ( lo_top_dram_adbginit_l                      ) & 
    ( lo_cluster_dram_adbginit_l                  )
  );

  wire hi_all_jbus_adbginit_l= (
    ( hi_top_jbus_adbginit_l                      ) & 
    ( hi_cluster_jbus_adbginit_l                  )
  );

  wire lo_all_jbus_adbginit_l= (
    ( lo_top_jbus_adbginit_l                      ) & 
    ( lo_cluster_jbus_adbginit_l                  )
  );

  wire hi_all_adbginit_l= (
    ( hi_all_cmp_adbginit_l                       ) &
    ( hi_all_dram_adbginit_l                      ) &
    ( hi_all_jbus_adbginit_l                      )
  );

  wire lo_all_adbginit_l= (
    ( lo_all_cmp_adbginit_l                       ) &
    ( lo_all_dram_adbginit_l                      ) &
    ( lo_all_jbus_adbginit_l                      )
  );

  wire hi_all_cmp_grst_l = (
    ( hi_top_cmp_grst_l                           ) & 
    ( hi_cluster_cmp_grst_l                       ) &
    ( hi_cluster_cmp_rst_l                        ) 
  );

  wire lo_all_cmp_grst_l = (
    ( lo_top_cmp_grst_l                           ) & 
    ( lo_cluster_cmp_grst_l                       ) &
    ( lo_cluster_cmp_rst_l                        ) 
  );

  wire hi_all_dram_grst_l = (
    ( hi_top_dram_grst_l                          ) & 
    ( hi_cluster_dram_grst_l                      ) &
    ( hi_cluster_dram_rst_l                       ) 
  );

  wire lo_all_dram_grst_l = (
    ( lo_top_dram_grst_l                          ) & 
    ( lo_cluster_dram_grst_l                      ) &
    ( lo_cluster_dram_rst_l                       )
  );

  wire hi_all_jbus_grst_l = (
    ( hi_top_jbus_grst_l                          ) & 
    ( hi_cluster_jbus_grst_l                      ) &
    ( hi_cluster_jbus_rst_l                       )
  );

  wire lo_all_jbus_grst_l = (
    ( lo_top_jbus_grst_l                          ) & 
    ( lo_cluster_jbus_grst_l                      ) &
    ( lo_cluster_jbus_rst_l                       )
    );

  wire hi_all_cmp_gdbginit_l= (
    ( hi_top_cmp_gdbginit_l                       ) & 
    ( hi_cluster_cmp_gdbginit_l                   )
  );

  wire lo_all_cmp_gdbginit_l= (
    ( lo_top_cmp_gdbginit_l                       ) & 
    ( lo_cluster_cmp_gdbginit_l                   )
  );

  wire hi_all_dram_gdbginit_l= (
    ( hi_top_dram_gdbginit_l                      ) & 
    ( hi_cluster_dram_gdbginit_l                  )
  );

  wire lo_all_dram_gdbginit_l= (
    ( lo_top_dram_gdbginit_l                      ) & 
    ( lo_cluster_dram_gdbginit_l                  )
  );

  wire hi_all_jbus_gdbginit_l= (
    ( hi_top_jbus_gdbginit_l                      ) & 
    ( hi_cluster_jbus_gdbginit_l                  )
  );

  wire lo_all_jbus_gdbginit_l= (
    ( lo_top_jbus_gdbginit_l                      ) & 
    ( lo_cluster_jbus_gdbginit_l                  )
    );

  wire hi_all_dll_rst_l = (
    ( hi_top_dll_rst_l                            ) & 
    ( hi_cluster_dll_rst_l                        )
    );

  wire lo_all_dll_rst_l = (
    ( lo_top_dll_rst_l                            ) & 
    ( lo_cluster_dll_rst_l                        )
    );

  wire hi_all_tst_rst_l = (
    ( hi_top_tst_rst_l                            ) & 
    ( hi_cluster_tst_rst_l                        )
    );

  wire lo_all_tst_rst_l = (
    ( lo_top_tst_rst_l                            ) & 
    ( lo_cluster_tst_rst_l                        )
    );

  wire hi_all_refresh = (
    ( hi_top_refresh                              ) & 
    ( hi_cluster_refresh                          )
    );

  wire lo_all_refresh = (
    ( lo_top_refresh                              ) & 
    ( lo_cluster_refresh                          )
    );

  wire hi_all_cmp_gclk = (
    ( hi_top_cmp_gclk                             ) &
    ( hi_cluster_cmp_gclk                         )
    );

  wire lo_all_cmp_gclk = (
    ( lo_top_cmp_gclk                             ) &
    ( lo_cluster_cmp_gclk                         )  
  );

  wire hi_all_dram_gclk = (
    ( hi_top_dram_gclk                            ) &
    ( hi_cluster_dram_gclk                        )
    );

  wire lo_all_dram_gclk = (
    ( lo_top_dram_gclk                            ) &
    ( lo_cluster_dram_gclk                        )  
  );

  wire hi_all_jbus_gclk = (
    ( hi_top_jbus_gclk                            ) &
    ( hi_cluster_jbus_gclk                        )
    );

  wire lo_all_jbus_gclk = (
    ( lo_top_jbus_gclk                            ) &
    ( lo_cluster_jbus_gclk                        )  
  );

  wire hi_all_jbus_gclk_dup = (
    ( hi_top_jbus_gclk_dup                        )
    );

  wire lo_all_jbus_gclk_dup = (
    ( lo_top_jbus_gclk_dup                        )
  );

  wire hi_all_dram_rx = (
    ( hi_top_dram_rx                              ) &
    ( hi_cluster_dram_rx                          )
  );

  wire lo_all_dram_rx = (
    ( lo_top_dram_rx                              ) &
    ( lo_cluster_dram_rx                          )
  );

  wire hi_all_dram_tx = (
    ( hi_top_dram_tx                              ) &
    ( hi_cluster_dram_tx                          )
  );

  wire lo_all_dram_tx = (
    ( lo_top_dram_tx                              ) &
    ( lo_cluster_dram_tx                          )
  );

  wire hi_all_jbus_rx = (
    ( hi_top_jbus_rx                              ) &
    ( hi_cluster_jbus_rx                          )
  );

  wire lo_all_jbus_rx = (
    ( lo_top_jbus_rx                              ) &
    ( lo_cluster_jbus_rx                          )
  );

  wire hi_all_jbus_tx = (
    ( hi_top_jbus_tx                              ) &
    ( hi_cluster_jbus_tx                          )
  );

  wire lo_all_jbus_tx = (
    ( lo_top_jbus_tx                              ) &
    ( lo_cluster_jbus_tx                          )
  );

  wire hi_all_cmp_cken = (
    ( hi_top_cmp_cken                             ) & 
    ( hi_cluster_cmp_cken                         ) 
  );

  wire lo_all_cmp_cken = (
    ( lo_top_cmp_cken                             ) & 
    ( lo_cluster_cmp_cken                         ) 
  );

  wire hi_all_dram_cken = (
    ( hi_top_dram_cken                            ) & 
    ( hi_cluster_dram_cken                        ) 
  );

  wire lo_all_dram_cken = (
    ( lo_top_dram_cken                            ) & 
    ( lo_cluster_dram_cken                        )
  );

  wire hi_all_jbus_cken = (
    ( hi_top_jbus_cken                            ) & 
    ( hi_cluster_jbus_cken                        )
  );

  wire lo_all_jbus_cken = (
    ( lo_top_jbus_cken                            ) & 
    ( lo_cluster_jbus_cken                        )
    );

  wire hi_all_jpad_cken = (
    ( hi_top_jpad_cken                            ) & 
    ( hi_cluster_jpad_cken                        )
  );

  wire lo_all_jpad_cken = (
    ( lo_top_jpad_cken                            ) & 
    ( lo_cluster_jpad_cken                        )
    );

  // ssi_clk
  wire hi_all_ssi_clk = (
    ( cmp_top.iop.ctu.ctu_jbi_ssiclk              ) &
    ( cmp_top.iop.ctu_jbi_ssiclk                  ) &
    ( cmp_top.iop.jbi.ctu_jbi_ssiclk              ) &
    ( cmp_top.iop.jbi.jbi_io_ssi_sck              ) &
    ( cmp_top.iop.jbi_io_ssi_sck                  ) &
    ( cmp_top.iop.pad_misc.jbi_io_ssi_sck         ) &
    ( cmp_top.iop.pad_misc.ssi_sck                ) &
    ( cmp_top.iop.SSI_SCK                         )
  );

  wire lo_all_ssi_clk = (
    (~cmp_top.iop.ctu.ctu_jbi_ssiclk              ) &
    (~cmp_top.iop.ctu_jbi_ssiclk                  ) &
    (~cmp_top.iop.jbi.ctu_jbi_ssiclk              ) &
    (~cmp_top.iop.jbi.jbi_io_ssi_sck              ) &
    (~cmp_top.iop.jbi_io_ssi_sck                  ) &
    (~cmp_top.iop.pad_misc.jbi_io_ssi_sck         ) &
    (~cmp_top.iop.pad_misc.ssi_sck                ) &
    (~cmp_top.iop.SSI_SCK                         )
  );

  wire hi_all_efc_read = (
    ( hi_top_efc_read                             ) 
  );

  wire lo_all_efc_read = (
    ( lo_top_efc_read                             ) 
  );

  wire hi_all_sctag0_mbisten = (
    ( hi_top_sctag0_mbisten                       ) 
  );

  wire lo_all_sctag0_mbisten = (
    ( lo_top_sctag0_mbisten                       ) 
  );

  wire hi_all_sctag1_mbisten = (
    ( hi_top_sctag1_mbisten                       ) 
  );

  wire lo_all_sctag1_mbisten = (
    ( lo_top_sctag1_mbisten                       ) 
  );

  wire hi_all_sctag2_mbisten = (
    ( hi_top_sctag2_mbisten                       ) 
  );

  wire lo_all_sctag2_mbisten = (
    ( lo_top_sctag2_mbisten                       ) 
  );

  wire hi_all_sctag3_mbisten = (
    ( hi_top_sctag3_mbisten                       ) 
  );

  wire lo_all_sctag3_mbisten = (
    ( lo_top_sctag0_mbisten                       ) 
  );

  wire hi_all_spc0_mbisten = (
    ( hi_top_spc0_mbisten                         ) 
  );

  wire lo_all_spc0_mbisten = (
    ( lo_top_spc0_mbisten                         ) 
  );

  wire hi_all_spc1_mbisten = (
    ( hi_top_spc1_mbisten                         ) 
  );

  wire lo_all_spc1_mbisten = (
    ( lo_top_spc1_mbisten                         ) 
  );

  wire hi_all_spc2_mbisten = (
    ( hi_top_spc2_mbisten                         ) 
  );

  wire lo_all_spc2_mbisten = (
    ( lo_top_spc2_mbisten                         ) 
  );

  wire hi_all_spc3_mbisten = (
    ( hi_top_spc3_mbisten                         ) 
  );

  wire lo_all_spc3_mbisten = (
    ( lo_top_spc3_mbisten                         ) 
  );

  wire hi_all_spc4_mbisten = (
    ( hi_top_spc4_mbisten                         ) 
  );

  wire lo_all_spc4_mbisten = (
    ( lo_top_spc4_mbisten                         ) 
  );

  wire hi_all_spc5_mbisten = (
    ( hi_top_spc5_mbisten                         ) 
  );

  wire lo_all_spc5_mbisten = (
    ( lo_top_spc5_mbisten                         ) 
  );

  wire hi_all_spc6_mbisten = (
    ( hi_top_spc6_mbisten                         ) 
  );

  wire lo_all_spc6_mbisten = (
    ( lo_top_spc6_mbisten                         ) 
  );

  wire hi_all_spc7_mbisten = (
    ( hi_top_spc7_mbisten                         ) 
  );

  wire lo_all_spc7_mbisten = (
    ( lo_top_spc7_mbisten                         ) 
  );

  ////////////////////////////////////////////////////////////////
  // clock select controls
  ////////////////////////////////////////////////////////////////

  wire hi_cmp_clk_div_rst  =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_cmp_clk_ddiv.rst_l ;
  wire lo_cmp_clk_div_rst  = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_cmp_clk_ddiv.rst_l ;

  wire hi_dram_clk_div_rst =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.init_div_l ;
  wire lo_dram_clk_div_rst = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.init_div_l ;

  wire hi_jbus_clk_div_rst =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.init_div_l ;
  wire lo_jbus_clk_div_rst = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.init_div_l ;

  wire hi_jdup_clk_div_rst =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.jdup_init_div_l ;
  wire lo_jdup_clk_div_rst = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.jdup_init_div_l ;


  wire hi_cmp_clk_sel_div  =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_mux.xcsm1.selg ;
  wire lo_cmp_clk_sel_div  = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_mux.xcsm1.selg ;

  wire hi_dram_clk_sel_div =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_mux.x0.selg ;
  wire lo_dram_clk_sel_div = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_mux.x0.selg ;

  wire hi_jbus_clk_sel_div =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_mux.x1.selg ;
  wire lo_jbus_clk_sel_div = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_mux.x1.selg ;

  wire hi_jdup_clk_sel_div =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_mux.x2.selg ;
  wire lo_jdup_clk_sel_div = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_mux.x2.selg ;


  wire hi_jbus_clk_sel_dup = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.init_div_ff_l ;
  wire lo_jbus_clk_sel_dup =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.init_div_ff_l ;

  wire hi_cmp_clk_sel_byp  =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_cmp.bypclk_sync ;
  wire lo_cmp_clk_sel_byp  = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_cmp.bypclk_sync ;

  wire hi_dram_clk_sel_byp =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_dram.bypclk_sync ;
  wire lo_dram_clk_sel_byp = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_dram.bypclk_sync ;

  wire hi_jbus_clk_sel_byp =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_jbus.bypclk_sync ;
  wire lo_jbus_clk_sel_byp = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_jbus.bypclk_sync ;


  wire hi_cmp_clk_sel_tck  =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_cmp.tck_sync ;
  wire lo_cmp_clk_sel_tck  = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_cmp.tck_sync ;

  wire hi_dram_clk_sel_tck =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_dram.tck_sync ;
  wire lo_dram_clk_sel_tck = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_dram.tck_sync ;

  wire hi_jbus_clk_sel_tck =  cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_jbus.tck_sync ;
  wire lo_jbus_clk_sel_tck = ~cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_clksw.u_jbus.tck_sync ;

  ////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////
//  wire pin_test_mode ;

//  assign cmp_top.iop.TEST_MODE = pin_test_mode ;
   
  wire hi_cluster_test_mode = (
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) &

    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) &

    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) &

    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  )
  ) ;
    
  wire lo_cluster_test_mode = (
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I0.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr0.ddr0_ddr_ch.I1.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) &

    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr1.ddr1_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) &

    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I0.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    ( cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) & 
    (~cmp_top.iop.pad_ddr2.ddr2_ddr_ch.I1.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe    ) &

    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I0.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I0.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I1.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I2.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig0.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig1.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig2.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad0.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad1.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    ( cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad2.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  ) & 
    (~cmp_top.iop.pad_ddr3.ddr3_ddr_ch_b.I1.I3.ddr_6sig3.dq_pad3.sstl_dq_pad.bw_io_ddr_pad_txrx.oe  )
  ) ;

  wire hi_global_shift_enable = (
    ( cmp_top.iop.global_shift_enable )
  );
   
  wire lo_global_shift_enable = (
    (~cmp_top.iop.global_shift_enable )
  );

  wire hi_pad_shift_dr = (
    ( cmp_top.iop.ctu_ddr0_shift_dr   ) &
    ( cmp_top.iop.ctu_ddr1_shift_dr   ) &
    ( cmp_top.iop.ctu_ddr2_shift_dr   ) &
    ( cmp_top.iop.ctu_ddr3_shift_dr   ) &
    ( cmp_top.iop.ctu_jbusl_shift_dr  ) &
    ( cmp_top.iop.ctu_jbusr_shift_dr  ) &
    ( cmp_top.iop.ctu_debug_shift_dr  ) &
    ( cmp_top.iop.ctu_misc_shift_dr   )
  );
   
  wire lo_pad_shift_dr = (
    (~cmp_top.iop.ctu_ddr0_shift_dr   ) &
    (~cmp_top.iop.ctu_ddr1_shift_dr   ) &
    (~cmp_top.iop.ctu_ddr2_shift_dr   ) &
    (~cmp_top.iop.ctu_ddr3_shift_dr   ) &
    (~cmp_top.iop.ctu_jbusl_shift_dr  ) &
    (~cmp_top.iop.ctu_jbusr_shift_dr  ) &
    (~cmp_top.iop.ctu_debug_shift_dr  ) &
    (~cmp_top.iop.ctu_misc_shift_dr   )
  );
   
  wire hi_pad_update_dr = (
    ( cmp_top.iop.ctu_ddr0_update_dr   ) &
    ( cmp_top.iop.ctu_ddr1_update_dr   ) &
    ( cmp_top.iop.ctu_ddr2_update_dr   ) &
    ( cmp_top.iop.ctu_ddr3_update_dr   ) &
    ( cmp_top.iop.ctu_jbusl_update_dr  ) &
    ( cmp_top.iop.ctu_jbusr_update_dr  ) &
    ( cmp_top.iop.ctu_debug_update_dr  ) &
    ( cmp_top.iop.ctu_misc_update_dr   )
  );
   
  wire lo_pad_update_dr = (
    (~cmp_top.iop.ctu_ddr0_update_dr   ) &
    (~cmp_top.iop.ctu_ddr1_update_dr   ) &
    (~cmp_top.iop.ctu_ddr2_update_dr   ) &
    (~cmp_top.iop.ctu_ddr3_update_dr   ) &
    (~cmp_top.iop.ctu_jbusl_update_dr  ) &
    (~cmp_top.iop.ctu_jbusr_update_dr  ) &
    (~cmp_top.iop.ctu_debug_update_dr  ) &
    (~cmp_top.iop.ctu_misc_update_dr   )
  );
   
  wire hi_pad_hiz_l = (
    ( cmp_top.iop.ctu_ddr0_hiz_l   ) &
    ( cmp_top.iop.ctu_ddr1_hiz_l   ) &
    ( cmp_top.iop.ctu_ddr2_hiz_l   ) &
    ( cmp_top.iop.ctu_ddr3_hiz_l   ) &
    ( cmp_top.iop.ctu_jbusl_hiz_l  ) &
    ( cmp_top.iop.ctu_jbusr_hiz_l  ) &
    ( cmp_top.iop.ctu_debug_hiz_l  ) &
    ( cmp_top.iop.ctu_misc_hiz_l   )
  );
   
  wire lo_pad_hiz_l = (
    (~cmp_top.iop.ctu_ddr0_hiz_l   ) &
    (~cmp_top.iop.ctu_ddr1_hiz_l   ) &
    (~cmp_top.iop.ctu_ddr2_hiz_l   ) &
    (~cmp_top.iop.ctu_ddr3_hiz_l   ) &
    (~cmp_top.iop.ctu_jbusl_hiz_l  ) &
    (~cmp_top.iop.ctu_jbusr_hiz_l  ) &
    (~cmp_top.iop.ctu_debug_hiz_l  ) &
    (~cmp_top.iop.ctu_misc_hiz_l   )
  );
   


//-----------------------------------------------------------

  integer i;
  reg  [`NUM_EN-1:0] lcl_cken_array_n;
  reg  [`NUM_EN-1:0] lcl_cken_array;
  reg  [7:0]	   dly_ctr_n;
  reg  [7:0]	   dly_ctr;
  reg  [5:0]	   lcl_stop_id_n;
  reg  [5:0]	   lcl_stop_id;
  reg  [5:0]	   dbg_ctr_n;
  reg  [5:0]	   dbg_ctr;
  reg  [7:0]	   stop_wait_n;
  reg  [7:0]	   stop_wait;

  reg  [5:0]       dbg_dly_stop;

  reg  [2:0]       cs,ns;


  // clk div monitor and freq change 
  reg  [5:0]       pll_cntr_c;
  reg  [5:0]       pll_cntr_d;
  reg  [5:0]       pll_cntr_j;
  reg  [5:0]       cdiv_cntr;
  reg  [5:0]       ddiv_cntr;
  reg  [5:0]       jdiv_cntr;

  reg  [5:0]       cdiv_gold;
  reg  [5:0]       ddiv_gold;
  reg  [5:0]       jdiv_gold;

  reg              wait_wake;
  reg              start_mon;
  reg              start_mon_cmp;
  reg              start_mon_jbus;
  reg              start_mon_dram;
  reg              start_mon_dly;
  reg  [15:0]      wake_cnt;
  reg              turn_off_cken_mon;

  reg [2048:0] pc_str;
  reg [63:0]  tmp_val;
  integer     f_div_cnt,num_f_change;
  reg  [5:0]  cmp_div_array[100:0];
  reg  [5:0]  dram_div_array[100:0];
  reg  [5:0]  jbus_div_array[100:0];
      

  initial begin
    turn_off_cken_mon = 0;
    freq_chng = 0;
   if ( $test$plusargs("ctu_mon_on")) begin

    turn_off_cken_mon = 1;
    if (! $value$plusargs("clk_stop=%d", clk_stop)) begin
      clk_stop = 0 ;
    end

    if (! $value$plusargs("clk_stop_simult=%d", clk_stop_simult)) begin
      clk_stop_simult = 0 ;
    end


    if (! $value$plusargs("dbg_delay=%d", dbg_delay)) begin
      dbg_delay = 5'h1f ;
    end

    if (! $value$plusargs("cken_delay=%d", cken_delay)) begin
      cken_delay = 7'h7f ;
    end

    if (! $value$plusargs("stop_id=%d", stop_id)) begin
      stop_id = 0 ;
     if ((stop_id == 24) || (stop_id == 25) || (stop_id == 26) || (stop_id == 28))
       finish_test("Stop id should not be 24/25/26/28.pls correct stop id");
      
    end


    if (clk_stop_simult == 1'b1) begin 
      dbg_dly_stop = dbg_delay + 2;
    end else begin 
      dbg_dly_stop = dbg_delay + 5;
    end 

   end
   done = 0;
    
  end


  // Extracting the golden values for frequency divisors
  initial begin
   if ( !$test$plusargs("ctu_mon_off")) begin

     num_f_change = 0;
     wait_wake = 0;
     start_mon = 0;
     start_mon_dly = 0;
     start_mon_cmp = 0;
     start_mon_jbus = 0;
     start_mon_dram = 0;
        
         // This has to be done irrespective of freq change
         f_div_cnt = 0;
         if (!$test$plusargs("no_ctu_reg_slam")) begin
         cmp_div_array[f_div_cnt] = `CDIV_DEF_SLAM;
         dram_div_array[f_div_cnt] = `DDIV_DEF_SLAM;
         jbus_div_array[f_div_cnt] = `JDIV_DEF_SLAM;
         end else begin 
         cmp_div_array[f_div_cnt] = `CDIV_DEF;
         dram_div_array[f_div_cnt] = `DDIV_DEF;
         jbus_div_array[f_div_cnt] = `JDIV_DEF;
         end
         f_div_cnt = f_div_cnt + 1;
         num_f_change = f_div_cnt-1;

     if ( $test$plusargs("freq_change")) begin

         if($value$plusargs("cmp_div=%s", pc_str))       $display ("%t: cmp_div freq list %s", $time, pc_str);

         while ($parse (pc_str, "%d,", tmp_val))
          begin
             cmp_div_array[f_div_cnt] = tmp_val;
             $display ("%t: cmp_div %d", $time, cmp_div_array[f_div_cnt]);
             f_div_cnt = f_div_cnt + 1;
          end
      
         if($value$plusargs("dram_div=%s", pc_str))       $display ("%t: dram_div freq list %s", $time, pc_str);

         f_div_cnt = 1;
         while ($parse (pc_str, "%d,", tmp_val))
          begin
             dram_div_array[f_div_cnt] = tmp_val;
             $display ("%t: dram_div %d", $time, dram_div_array[f_div_cnt]);
             f_div_cnt = f_div_cnt + 1;
          end
      
         if($value$plusargs("jbus_div=%s", pc_str))       $display ("%t: jbus_div freq list %s", $time, pc_str);

         f_div_cnt = 1;
         while ($parse (pc_str, "%d,", tmp_val))
          begin
             jbus_div_array[f_div_cnt] = tmp_val;
             $display ("%t: jbus_div %d", $time, jbus_div_array[f_div_cnt]);
             f_div_cnt = f_div_cnt + 1;
          end
             num_f_change = f_div_cnt-1;
             f_div_cnt = 0;
 
      cdiv_gold =  cmp_div_array[f_div_cnt];
      ddiv_gold =  dram_div_array[f_div_cnt];
      jdiv_gold =  jbus_div_array[f_div_cnt];

      pll_cntr_c=  0;
      cdiv_cntr =  0;
      jdiv_cntr =  0;


     end // freq_change
         f_div_cnt = 0;

  end
end


// State machine to track clock stop

always @(posedge clk) begin

 if (!rst_l) begin 
  cs                <=  `IDLE;
  lcl_cken_array    <=  0;
  dly_ctr           <=  0;
  lcl_stop_id       <=  0;
  dbg_ctr           <=  0;
  stop_wait         <=  0;
 end else begin
  cs                <=  ns;
  lcl_cken_array    <=  lcl_cken_array_n;
  dly_ctr           <=  dly_ctr_n;
  lcl_stop_id       <=  lcl_stop_id_n;
  dbg_ctr           <=  dbg_ctr_n;
  stop_wait         <=  stop_wait_n;
 end 

end

always @(dly_ctr or lcl_stop_id or dbg_ctr or cs or posedge trig or cken_array[`NUM_EN-1:0] or lcl_cken_array[`NUM_EN-1:0]) begin 
 
if ( $test$plusargs("ctu_mon_on")) begin
 
 ns                  = cs;
 lcl_cken_array_n    = lcl_cken_array;
 dly_ctr_n           = dly_ctr;
 lcl_stop_id_n       = lcl_stop_id;
 dbg_ctr_n           = dbg_ctr;
 stop_wait_n         = stop_wait;

 case (cs) 

   `IDLE : begin 
         
            if ((trig == 1'b1) & !done) begin 
              ns = `DBG_DELAY;
              dbg_ctr_n = 0;
                  for (i=0; i<`NUM_EN; i=i+1) begin 
                    lcl_cken_array_n[i] = 1'b1;
                  end
                    lcl_cken_array_n[28] = 1'b0;
                    lcl_cken_array_n[26:24] = 1'b0;

              // Monitor the parameters for 1-1, error if they dont match
                if ( clk_stop !== clkdis ) begin 
                  $display("ERROR : In CTU CLK_STOP parameter programming");
                  $display("ERROR : clk_stop run arg = %x, clkdis (rtl) = %x\n",clk_stop,clkdis);
                  finish_test("Program the CTU run args and rtl parameters same");
                end

                if ( clk_stop_simult !== ossdis ) begin 
                  $display("ERROR : In CTU CLK_STOP parameter programming");
                  $display("ERROR : clk_stop_simult run arg = %x, ossdis (rtl) = %x\n",clk_stop_simult,ossdis);
                  finish_test("Program the CTU run args and rtl parameters same");
                end

                if ( dbg_delay !== dbg_dly ) begin 
                  $display("ERROR : In CTU CLK_STOP parameter programming");
                  $display("ERROR : dbg_delay run arg = %x, dbg_dly (rtl) = %x\n",dbg_delay,dbg_dly);
                  finish_test("Program the CTU run args and rtl parameters same");
                end

                if ( cken_delay !== cken_dly ) begin 
                  $display("ERROR : In CTU CLK_STOP parameter programming");
                  $display("ERROR : cken_delay run arg = %x, cken_dly (rtl) = %x\n",cken_delay,cken_dly);
                  finish_test("Program the CTU run args and rtl parameters same");
                end

                if ( stop_id !== stp_id ) begin 
                  $display("ERROR : In CTU CLK_STOP parameter programming");
                  $display("ERROR : stop_id run arg = %x, stp_id (rtl) = %x\n",stop_id,stp_id);
                  finish_test("Program the CTU run args and rtl parameters same");
                end

            end
           end

   `DBG_DELAY : begin


              if ( dbg_ctr == dbg_dly_stop ) begin 

                if (clkdis && ossdis) // stop at the same time
                  ns = `STOP_SIML;
                else if (clkdis && !ossdis) begin // stop with dly
                  ns = `STOP_DLY; // first one stops after dbg_dly, next ones after cken_dly
                  lcl_cken_array_n[stp_id] = 1'b0;
                  lcl_stop_id_n = (stp_id>33) 
                                       ? 0
                                       :(stp_id == 23) 
                                              ?  stp_id+4 
                                              : (stp_id == 27) 
                                                  ?  stp_id+2 
                                                  :  stp_id +1;
                end else 
                  ns = `STOP_NO;
              end else 
                  dbg_ctr_n = dbg_ctr + 1;

                  for (i=0; i<`NUM_EN; i=i+1) begin 
                    if (cken_array[i] != lcl_cken_array[i]) begin 
                      $display("ERROR : In CTU CLK STOP, Clock stop before DBG_DELAY");
                      $display("ERROR : DBG_DELAY = %d, clk %d stop at cntr = %d\n",dbg_dly,i,dbg_ctr);
                      finish_test("Clock stop before DBG_DELAY");
                    end
                  end

           end

   `STOP_SIML : begin

                if (|cken_array[`NUM_EN-1:0]) begin 
                  for (i=0; i<`NUM_EN; i=i+1) begin 
                    if (cken_array[i] != 1'b0) begin 
                      $display("ERROR : In CTU CLK STOP, Clock did not stop after DBG_DLY");
                      $display("ERROR : DBG_DLY = %d, clk %d stop at cntr = %d\n",dbg_dly,i,dbg_ctr);
                      finish_test("All Clock did not stop  simultaneously after DBG_DLY");
                    end
                  end
                end else begin 
                  ns = `IDLE;
                  $display("CLK_STOP Correctly\n");
                  $display ("%t: (PASS) GOOD TRAP for clock stop case", $time);
                  $display ("%t:  Simulation -> PASS (HIT GOOD TRAP)", $time);
                  done = 1;
                end

           end

   `STOP_NO : begin

               if (stop_wait == 100) begin
                if (&cken_array[`NUM_EN-1:0]) begin 
                  for (i=0; i<`NUM_EN; i=i+1) begin 
                    //if (cken_array[i] != 1'b1) begin 
                    if (cken_array[i] != lcl_cken_array[i]) begin 
                      $display("ERROR : In CTU CLK STOP, Clock stop when it shouldnt");
                      $display("ERROR : DBG_DLY = %d, clk %d stop at cntr = %d\n",dbg_dly,i,dbg_ctr);
                      finish_test("Clock stop  when it shouldnt");
                    end
                  end
                end else begin 
                  ns = `IDLE;
                  $display("CLK_STOP Correctly\n");
                  $display ("%t: (PASS) GOOD TRAP for clock stop case", $time);
                  $display ("%t:  Simulation -> PASS (HIT GOOD TRAP)", $time);
                end
               end else 
                stop_wait_n = stop_wait+1;

           end
 
   `CKEN_DLY : begin
              if ( dly_ctr == (cken_dly)) begin 
                  ns = `STOP_DLY;
                  lcl_cken_array_n[lcl_stop_id] = 1'b0;
                  lcl_stop_id_n = (lcl_stop_id>33) 
                                       ? 0
                                       :(lcl_stop_id == 23) 
                                              ?  lcl_stop_id+4 
                                              : (lcl_stop_id == 27) 
                                                  ?  lcl_stop_id+2 
                                                  :  lcl_stop_id +1;
                  dly_ctr_n = 0;
              end else
                  dly_ctr_n = dly_ctr + 1;

                  for (i=0; i<`NUM_EN; i=i+1) begin 
                   if (lcl_cken_array[i] != cken_array[i]) begin
                      $display("ERROR : In CTU CLK STOP, Clock stop sequence not correct");
                      $display("ERROR : cken_dly = %d, clk %d stop at cntr = %d\n", cken_dly,i,dly_ctr);
                      finish_test("Clock stop before CKEN_DLY");
                    end
                  end
            
           end

   `STOP_DLY : begin
                if (|(cken_array[`NUM_EN-1:0] | lcl_cken_array[`NUM_EN-1:0])) begin
                  for (i=0; i<`NUM_EN; i=i+1) begin
                   if (lcl_cken_array[i] != cken_array[i]) begin
                      $display("ERROR : In CTU CLK STOP, Clock stop sequence not correct");
                      $display("ERROR : clk %d did not stop\n", i);
                      finish_test("Clock stop sequence not correct");
                    end
                  end
                  ns = `CKEN_DLY;
                end else begin 
                  ns = `IDLE;
                  $display("CLK_STOP Correctly\n");
                  $display ("%t: (PASS) GOOD TRAP for clock stop case", $time);
                  $display ("%t:  Simulation -> PASS (HIT GOOD TRAP)", $time);
                  done = 1;
                end
           end
    default    : ns = `IDLE;
 endcase
end
end

always @(negedge J_RST_L)
begin 
    freq_chng = PWRON_RST_L & freq_change;
end

always @(J_RST_L or posedge wake_thrd)
begin 

  if (J_RST_L & PWRON_RST_L) 
    wait_wake = 1;
  else begin 
    wait_wake = 0;
    start_mon = 0;
    start_mon_dly = 0;
  end

  if (wake_thrd & wait_wake) begin 
    start_mon = 1;
    start_mon_dly = #20 1;
    if(f_div_cnt > num_f_change) begin 
      $display("\n\n************    CHECK IF FREQ CHANGE & MULTIPLE WARM RESET's ARE PRESENT IN THE DIAG************    ");
      $display("************    You can Use  -sim_run_args=+ctu_mon_off  to turn off ctu monitor **********\n");
      $display("ERROR : num_f_change = %d ,f_div_cnt =%d \n", num_f_change,f_div_cnt);
      finish_test(" Number of frequency change exceeded programmed");
    end
    f_div_cnt = (freq_chng) ? f_div_cnt + 1 : f_div_cnt; 
    cdiv_gold =  cmp_div_array[f_div_cnt];
    ddiv_gold =  dram_div_array[f_div_cnt];
    jdiv_gold =  jbus_div_array[f_div_cnt];
    if ( $test$plusargs("freq_change")) begin // only if freq change
    end 
  end else begin 
    start_mon = 0;
    start_mon_dly = 0;
  end

end

always @(posedge cmp_gclk)
begin 
 start_mon_cmp <= start_mon;
end

always @(posedge dram_gclk)
begin 
 start_mon_dram <= start_mon;
end

always @(posedge jbus_gclk)
begin 
 start_mon_jbus <= start_mon;
end


always @(posedge sctag0_tr or posedge  sctag1_tr  or posedge  sctag2_tr
          or posedge sctag3_tr  or posedge jbi_tr   or posedge iob_tr
          or posedge iob_l2_tr or posedge dram02_tr or posedge dram13_tr)
begin 
  if (sctag0_tr) 
   $display ("%t: sctag0_tr observed ", $time);
  else if (sctag1_tr)
   $display ("%t: sctag1_tr observed ", $time);
  else if (sctag2_tr)
   $display ("%t: sctag2_tr observed ", $time);
  else if (sctag3_tr)
   $display ("%t: sctag3_tr observed ", $time);
  else if (jbi_tr)
   $display ("%t: jbi_tr observed ", $time);
  else if (iob_tr)
   $display ("%t: iob_tr observed ", $time);
  else if (iob_l2_tr)
   $display ("%t: iob_l2_tr observed ", $time);
  else if (dram02_tr)
   $display ("%t: dram02_tr observed ", $time);
  else if (dram13_tr)
   $display ("%t: dram13_tr observed ", $time);

end 


  //wire        dram_gclk = cmp_top.iop.ctu.dram_gclk_out;
  //wire        jbus_gclk = cmp_top.iop.ctu.jbus_gclk_out;

// CDIV
always @(pll_clk or start_mon_cmp)
begin 
 if (start_mon_cmp) begin
  #1;
  if ((cdiv_cntr == 2) && cmp_gclk) begin 
    pll_cntr_c  <= #3 1;
  end else begin 
    pll_cntr_c  <= #3 pll_cntr_c+1;
  end
 end else 
    pll_cntr_c  <= #3 0;
end

always @(cmp_gclk or start_mon_cmp) 
begin 
 if (start_mon_cmp) begin
  cdiv_cntr  <= #2 cdiv_cntr+1;
  if (cdiv_cntr == 2) begin 
   cdiv_cntr <= #2 1;
   // checking
    if (pll_cntr_c != 2*cdiv_gold) begin 
        $display("ERROR : CDIV not matched ; Expected  = %d ,Actual =%d \n", cdiv_gold,pll_cntr_c/2);
        finish_test(" CDIV Mismatch (Programmed v/s Actual) ");
    end else begin 
        //$display("CDIV Match");
    end
  end // if (cdiv_cntr == 2)
 end else  //  if (start_mon_cmp) begin
   cdiv_cntr <= #2 0;

end


// DDIV
always @(pll_clk or start_mon_dram) 
begin 
 if (start_mon_dram) begin
  #1;
  if ((ddiv_cntr == 2) && dram_gclk) begin 
    pll_cntr_d  <= #3 1;
  end else begin 
    pll_cntr_d  <= #3 pll_cntr_d+1;
  end
 end else 
    pll_cntr_d  <= #3 0;
end

always @(dram_gclk or start_mon_dram) 
begin 
 if (start_mon_dram) begin
  ddiv_cntr  <= #2 ddiv_cntr+1;
  if (ddiv_cntr == 2) begin 
   ddiv_cntr <= #2 1;
 
   if (pll_cntr_d != 2*ddiv_gold) begin 
       $display("ERROR : DDIV not matched ; Expected  = %d ,Actual =%d \n", ddiv_gold,pll_cntr_d/2);
       finish_test(" DDIV Mismatch (Programmed v/s Actual) ");
   end else begin 
       //$display("DDIV Match");
   end
  end
 end else 
   ddiv_cntr <= #1 0;
end

// JDIV
always @(pll_clk or start_mon_jbus) 
begin 
 if (start_mon_jbus) begin
  #1;
  if ((jdiv_cntr == 2) && jbus_gclk) begin 
    pll_cntr_j  <= #3 1;
  end else begin 
    pll_cntr_j  <= #3 pll_cntr_j+1;
  end
 end else 
    pll_cntr_j  <= #3 0;
end

always @(jbus_gclk or start_mon_jbus) 
begin 
 if (start_mon_jbus) begin
  jdiv_cntr  <= #2 jdiv_cntr+1;
  if (jdiv_cntr == 2) begin 
   jdiv_cntr <= #2 1;
 
   if (pll_cntr_j != 2*jdiv_gold) begin 
       $display("ERROR : JDIV not matched ; Expected  = %d ,Actual =%d \n", jdiv_gold,pll_cntr_j/2);
       finish_test(" JDIV Mismatch (Programmed v/s Actual) ");
   end else begin 
       //$display("JDIV Match");
   end
  end
 end else 
   jdiv_cntr <= #2 0;
end


// Monitor that the signals dont change : level monitor of CTU SAT``

//always @(hi_pin_clk_stretch or lo_pin_clk_stretch )
//begin 
//if ( $test$plusargs("ctu_mon_on")) begin
// if (start_mon_dly == 1'b1) begin 
//   $display("ERROR : hi_pin_clk_stretch or lo_pin_clk_stretch toggled when it shouldnt ; hi_pin_clk_stretch= %h ,lo_pin_clk_stretch =%d \n", hi_pin_clk_stretch,lo_pin_clk_stretch);
//   $display("****NOTE : IF YOUR TEST INTEND TO TOGGLE THESE SIGNALS ******\n");
//   $display("****  use "ctu_mon_on" as run argument******\n");
//   finish_test(" DDIV Mismatch (Programmed v/s Actual) ");
// end
//end
//end


   ctu_level_mon hi_lo_toggle1 ( .hi  (hi_pin_clk_stretch), .lo (lo_pin_clk_stretch), .mon_en (start_mon_dly), .mon_num (1),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle2 ( .hi  (hi_pin_j_rst_l), .lo (lo_pin_j_rst_l), .mon_en (start_mon_dly), .mon_num (2),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle3 ( .hi  (hi_pin_pll_char_in), .lo (lo_pin_pll_char_in), .mon_en (start_mon_dly), .mon_num (3),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle4 ( .hi  (hi_pin_pwron_rst_l), .lo (lo_pin_pwron_rst_l), .mon_en (start_mon_dly), .mon_num (4),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle5 ( .hi  (hi_pin_trst_l), .lo (lo_pin_trst_l), .mon_en (start_mon_dly), .mon_num (5),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle6 ( .hi  (hi_pin_tms), .lo (lo_pin_tms), .mon_en (start_mon_dly), .mon_num (6),.off_on(turn_off_cken_mon));
   ctu_level_mon hi_lo_toggle7 ( .hi  (hi_pin_test_mode), .lo (lo_pin_test_mode), .mon_en (start_mon_dly), .mon_num (7),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle8 ( .hi  (hi_pin_trigin), .lo (lo_pin_trigin), .mon_en (start_mon_dly), .mon_num (8),.off_on(turn_off_cken_mon));
   ctu_level_mon hi_lo_toggle9 ( .hi  (hi_all_cmp_arst_l), .lo (lo_all_cmp_arst_l), .mon_en (start_mon_dly), .mon_num (9),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle10 ( .hi  (hi_all_dram_arst_l), .lo (lo_all_dram_arst_l), .mon_en (start_mon_dly), .mon_num (10),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle11 ( .hi  (hi_all_jbus_arst_l), .lo (lo_all_dram_arst_l), .mon_en (start_mon_dly), .mon_num (11),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle12 ( .hi  (hi_all_arst_l), .lo (lo_all_arst_l), .mon_en (start_mon_dly), .mon_num (12),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle13 ( .hi  (hi_all_cmp_adbginit_l), .lo (lo_all_cmp_adbginit_l), .mon_en (start_mon_dly), .mon_num (13),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle14 ( .hi  (hi_all_dram_adbginit_l), .lo (lo_all_dram_adbginit_l), .mon_en (start_mon_dly), .mon_num (14),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle15 ( .hi  (hi_all_jbus_adbginit_l), .lo (lo_all_jbus_adbginit_l), .mon_en (start_mon_dly), .mon_num (15),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle62 ( .hi  (hi_all_adbginit_l), .lo (lo_all_adbginit_l), .mon_en (start_mon_dly), .mon_num (62),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle16 ( .hi  (hi_all_cmp_grst_l), .lo (lo_all_cmp_grst_l), .mon_en (start_mon_dly), .mon_num (16),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle17 ( .hi  (hi_all_dram_grst_l), .lo (lo_all_dram_grst_l), .mon_en (start_mon_dly), .mon_num (17),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle18 ( .hi  (hi_all_jbus_grst_l), .lo (lo_all_jbus_grst_l), .mon_en (start_mon_dly), .mon_num (18),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle19 ( .hi  (hi_all_cmp_gdbginit_l), .lo (lo_all_cmp_gdbginit_l), .mon_en (start_mon_dly), .mon_num (19),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle20 ( .hi  (hi_all_dram_gdbginit_l), .lo (lo_all_dram_gdbginit_l), .mon_en (start_mon_dly), .mon_num (20),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle21 ( .hi  (hi_all_jbus_gdbginit_l), .lo (lo_all_jbus_gdbginit_l), .mon_en (start_mon_dly), .mon_num (21),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle22 ( .hi  (hi_all_dll_rst_l), .lo (lo_all_dll_rst_l), .mon_en (start_mon_dly), .mon_num (22),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle23 ( .hi  (hi_all_tst_rst_l), .lo (lo_all_tst_rst_l), .mon_en (start_mon_dly), .mon_num (23),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle24 ( .hi  (hi_all_refresh), .lo (lo_all_refresh), .mon_en (start_mon_dly), .mon_num (24),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle25 ( .hi  (hi_all_cmp_cken), .lo (lo_all_cmp_cken), .mon_en (start_mon_dly), .mon_num (25),.off_on(turn_off_cken_mon));
   ctu_level_mon hi_lo_toggle26 ( .hi  (hi_all_dram_cken), .lo (lo_all_dram_cken), .mon_en (start_mon_dly), .mon_num (26),.off_on(turn_off_cken_mon));
   ctu_level_mon hi_lo_toggle27 ( .hi  (hi_all_jbus_cken), .lo (lo_all_jbus_cken), .mon_en (start_mon_dly), .mon_num (27),.off_on(turn_off_cken_mon));
   ctu_level_mon hi_lo_toggle28 ( .hi  (hi_all_jpad_cken), .lo (lo_all_jpad_cken), .mon_en (start_mon_dly), .mon_num (28),.off_on(turn_off_cken_mon));
   ctu_level_mon hi_lo_toggle29 ( .hi  (hi_all_efc_read), .lo (lo_all_efc_read), .mon_en (start_mon_dly), .mon_num (29),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle30 ( .hi  (hi_all_sctag0_mbisten), .lo (lo_all_sctag0_mbisten), .mon_en (start_mon_dly), .mon_num (30),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle31 ( .hi  (hi_all_sctag1_mbisten), .lo (lo_all_sctag1_mbisten), .mon_en (start_mon_dly), .mon_num (31),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle32 ( .hi  (hi_all_sctag2_mbisten), .lo (lo_all_sctag2_mbisten), .mon_en (start_mon_dly), .mon_num (32),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle33 ( .hi  (hi_all_sctag3_mbisten), .lo (lo_all_sctag3_mbisten), .mon_en (start_mon_dly), .mon_num (33),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle34 ( .hi  (hi_all_spc0_mbisten), .lo (lo_all_spc0_mbisten), .mon_en (start_mon_dly), .mon_num (34),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle35 ( .hi  (hi_all_spc1_mbisten), .lo (lo_all_spc1_mbisten), .mon_en (start_mon_dly), .mon_num (35),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle36 ( .hi  (hi_all_spc2_mbisten), .lo (lo_all_spc2_mbisten), .mon_en (start_mon_dly), .mon_num (36),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle37 ( .hi  (hi_all_spc3_mbisten), .lo (lo_all_spc3_mbisten), .mon_en (start_mon_dly), .mon_num (37),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle38 ( .hi  (hi_all_spc4_mbisten), .lo (lo_all_spc4_mbisten), .mon_en (start_mon_dly), .mon_num (38),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle39 ( .hi  (hi_all_spc5_mbisten), .lo (lo_all_spc5_mbisten), .mon_en (start_mon_dly), .mon_num (39),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle40 ( .hi  (hi_all_spc6_mbisten), .lo (lo_all_spc6_mbisten), .mon_en (start_mon_dly), .mon_num (40),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle41 ( .hi  (hi_all_spc7_mbisten), .lo (lo_all_spc7_mbisten), .mon_en (start_mon_dly), .mon_num (41),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle42 ( .hi  (hi_cmp_clk_div_rst), .lo (lo_cmp_clk_div_rst), .mon_en (start_mon_dly), .mon_num (42),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle43 ( .hi  (hi_dram_clk_div_rst), .lo (lo_dram_clk_div_rst), .mon_en (start_mon_dly), .mon_num (43),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle44 ( .hi  (hi_jbus_clk_div_rst), .lo (lo_jbus_clk_div_rst), .mon_en (start_mon_dly), .mon_num (44),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle45 ( .hi  (hi_jdup_clk_div_rst), .lo (lo_jdup_clk_div_rst), .mon_en (start_mon_dly), .mon_num (45),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle46 ( .hi  (hi_cmp_clk_sel_div), .lo (lo_cmp_clk_sel_div), .mon_en (start_mon_dly), .mon_num (46),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle47 ( .hi  (hi_dram_clk_sel_div), .lo (lo_dram_clk_sel_div), .mon_en (start_mon_dly), .mon_num (47),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle48 ( .hi  (hi_jbus_clk_sel_div), .lo (lo_jbus_clk_sel_div), .mon_en (start_mon_dly), .mon_num (48),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle49 ( .hi  (hi_jdup_clk_sel_div), .lo (lo_jdup_clk_sel_div), .mon_en (start_mon_dly), .mon_num (49),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle50 ( .hi  (hi_jbus_clk_sel_dup), .lo (lo_jbus_clk_sel_dup), .mon_en (start_mon_dly), .mon_num (50),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle51 ( .hi  (hi_cmp_clk_sel_byp), .lo (lo_cmp_clk_sel_byp), .mon_en (start_mon_dly), .mon_num (51),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle52 ( .hi  (hi_dram_clk_sel_byp), .lo (lo_dram_clk_sel_byp), .mon_en (start_mon_dly), .mon_num (52),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle53 ( .hi  (hi_jbus_clk_sel_byp), .lo (lo_jbus_clk_sel_byp), .mon_en (start_mon_dly), .mon_num (53),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle54 ( .hi  (hi_cmp_clk_sel_tck), .lo (lo_cmp_clk_sel_tck), .mon_en (start_mon_dly), .mon_num (54),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle55 ( .hi  (hi_dram_clk_sel_tck), .lo (lo_dram_clk_sel_tck), .mon_en (start_mon_dly), .mon_num (55),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle56 ( .hi  (hi_jbus_clk_sel_tck), .lo (lo_jbus_clk_sel_tck), .mon_en (start_mon_dly), .mon_num (56),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle57 ( .hi  (hi_cluster_test_mode), .lo (lo_cluster_test_mode), .mon_en (start_mon_dly), .mon_num (57),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle58 ( .hi  (hi_global_shift_enable), .lo (lo_global_shift_enable), .mon_en (start_mon_dly), .mon_num (58),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle59 ( .hi  (hi_pad_shift_dr), .lo (lo_pad_shift_dr), .mon_en (start_mon_dly), .mon_num (59),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle60 ( .hi  (hi_pad_update_dr), .lo (lo_pad_update_dr), .mon_en (start_mon_dly), .mon_num (60),.off_on(1'b0));
   ctu_level_mon hi_lo_toggle61 ( .hi  (hi_pad_hiz_l), .lo (lo_pad_hiz_l), .mon_en (start_mon_dly), .mon_num (61),.off_on(1'b0));



//=====================================================================
// This task allows some more clocks and kills the test
//=====================================================================
task finish_test;
input [512:0] message;
//input [2:0]   id;

begin
  $display("%0d ERROR: CTU Monitor %s", $time, message);
  //@(posedge clk);
  //@(posedge clk);
  //@(posedge clk);
  $error ("ctu_mon", "CTU monitor exited") ;
end
endtask


endmodule

