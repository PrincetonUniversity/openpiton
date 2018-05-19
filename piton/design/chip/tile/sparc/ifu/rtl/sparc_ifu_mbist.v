// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_mbist.v
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
///////////////////////////////////////////////////////////////////////////////
//
//    Description:        Memory BIST Controller for the L1 ICache and DCache
//    Block Type:         Control Block
//    Module:             mbist_engine
//
///////////////////////////////////////////////////////////////////////////////


module sparc_ifu_mbist(
  mbist_dcache_read,
  mbist_dcache_write,
  mbist_dcache_word,
  mbist_dcache_index,
  mbist_dcache_way,
  mbist_icache_read,
  mbist_icache_write,
  mbist_icache_index,
  mbist_icache_word,
  mbist_icache_way,
  mbist_icache_wdata,
  mbist_dcache_wdata,
  mbist_done,
  mbist_dcache_fail,
  mbist_icache_fail,
  rclk,
  mbist_start,
  mbist_ifq_run_bist,
  mbist_userdata_mode,
  mbist_bisi_mode,
  mbist_loop_mode,
  mbist_loop_on_address,
  mbist_stop_on_fail,
  mbist_stop_on_next_fail,
  mbist_dcache_data_in,
  mbist_icache_data_in,
  grst_l,
  arst_l,
  mbist_si,
  mbist_so,
  mbist_se
);




// /////////////////////////////////////////////////////////////////////////////
// Outputs
// /////////////////////////////////////////////////////////////////////////////

   output             mbist_dcache_read;
   output             mbist_dcache_write;
   output             mbist_dcache_word;
   output[6:0]        mbist_dcache_index;
   output[1:0]        mbist_dcache_way;

   output             mbist_icache_read;
   output             mbist_icache_write;
   output[7:0]        mbist_icache_index;
   output             mbist_icache_word;
   output[1:0]        mbist_icache_way;
   output             mbist_ifq_run_bist;

   output[7:0]        mbist_icache_wdata;
   output[7:0]        mbist_dcache_wdata;

   output             mbist_done;
   output             mbist_dcache_fail;
   output             mbist_icache_fail;

   output             mbist_so;
 


// /////////////////////////////////////////////////////////////////////////////
// Inputs
// /////////////////////////////////////////////////////////////////////////////

   input              rclk;
   input              mbist_si;
   input              mbist_se;

   input              grst_l;
   input              arst_l;

   input              mbist_start;
   input              mbist_userdata_mode;
   input              mbist_bisi_mode;
   input              mbist_loop_mode;
   input              mbist_loop_on_address;
   input              mbist_stop_on_fail;
   input              mbist_stop_on_next_fail;

   input[71:0]        mbist_dcache_data_in;
   input[67:0]        mbist_icache_data_in;


// /////////////////////////////////////////////////////////////////////////////
// Wires
// /////////////////////////////////////////////////////////////////////////////

  wire [7:0] config_in; 
  wire [7:0] config_out;        
  wire start_transition;        
  wire reset_engine;    
  wire loop;    
  wire run;     
  wire bisi;    
  wire userdata_mode;   
  wire stop_on_fail;    
  wire stop_on_next_fail;       
  wire loop_on_address;
  wire [7:0] userdata_in;       
  wire [7:0] userdata_out;      
  wire [6:0] useradd_in;        
  wire [6:0] useradd_out;       
  wire [20:0] control_in;       
  wire [20:0] control_out;      
  wire msb;     
  wire array_sel;       
  wire [1:0] data_control;      
  wire address_mix;     
  wire [2:0] march_element;     
  wire [9:0] array_address;    
  wire dcache_sel;      
  wire [1:0] read_write_control;        
  wire [20:0] qual_control_out; 
  wire four_cycle_march;        
  wire [9:0] add;      
  wire upaddress_march; 
  wire [10:0] mbist_address;    
  wire array_write;     
  wire array_read;      
  wire initialize;      
  wire fail;    
  wire true_data;       
  wire [7:0] data_pattern;      
  wire second_time_through;     
  wire icache_sel;      
  wire dc_read_pipe_out1;       
  wire dc_read_pipe_out2;       
  wire dcache_piped_read;       
  wire ic_read_pipe_out1;       
  wire ic_read_pipe_out2;       
  wire icache_piped_read;       
  wire [7:0] data_pipe_out1;    
  wire [7:0] data_pipe_out2;    
  wire [10:0] add_pipe_out1;    
  wire [10:0] add_pipe_out2;    
  wire [9:0] dcache_piped_address;      
  wire [10:0] icache_piped_address;     
  wire [1:0] fail_reg_in;       
  wire [1:0] fail_reg_out;      
  wire qual_dcache_fail;        
  wire qual_icache_fail;        
  wire beyond_last_fail;
  wire dcache_fail;     
  wire icache_fail;     
  wire mismatch, mbist_word_sel;        
  wire [71:0] expect_data;      
  wire [71:0] compare_data;     
  wire qual_fail, dcache_data_sel;       
  wire [10:0] fail_add_reg_in;  
  wire [10:0] fail_add_reg_out; 
  wire [71:0] fail_data_reg_in; 
  wire [71:0] fail_data_reg_out;        
  wire [20:0] fail_control_reg_in;
  wire [20:0] fail_control_reg_out;     
  wire mbist_icache_read_bf, mbist_icache_write_bf;
  wire [71:0] compare_data_bf;
  wire msb_rst, msb_d1_rst, msb_d2_rst, msb_d3_rst, mbist_done_int;
  wire msb_d1, msb_d2, msb_d3, msb_d4, mbist_reset_l, mbist_reset;


//// reset buffer ////

   dffrl_async rstff(.din (grst_l),
                     .q   (mbist_reset_l),
                     .clk (rclk), .se(mbist_se), .si(), .so(),
                     .rst_l (arst_l));

   assign       mbist_reset = ~mbist_reset_l;

// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Config Register
//
// /////////////////////////////////////////////////////////////////////////////
//
// A low to high transition on mbist_start will reset and start the engine.  
// mbist_start must remain active high for the duration of MBIST.  
// If mbist_start deasserts the engine will stop but not reset.
// Once MBIST has completed mbist_done will assert and the fail status
// signals will be valid.  
// To run MBIST again the mbist_start signal must transition low then high.
//
// Loop on Address will disable the address mix function.
//
// /////////////////////////////////////////////////////////////////////////////



  dff_s #(8) config_reg (
               .clk      ( rclk                  ),
               .din      ( config_in[7:0]       ),
               .q        ( config_out[7:0]      ), .se(mbist_se), .si(), .so());



  assign config_in[0]        =    mbist_start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign reset_engine        =    mbist_reset | start_transition   |  ((loop | loop_on_address)  &  mbist_done);
  assign run                 =    config_out[1]      &  ~mbist_done_int;
  assign mbist_ifq_run_bist  =    run;

  assign config_in[2]        =    start_transition   ?   mbist_bisi_mode:      config_out[2];
  assign bisi                =    config_out[2];

  assign config_in[3]        =    start_transition   ?   mbist_userdata_mode:  config_out[3];
  assign userdata_mode       =    config_out[3];

  assign config_in[4]        =    start_transition   ?   mbist_loop_mode:  config_out[4];
  assign loop                =    config_out[4];

  assign config_in[5]        =    start_transition   ?   mbist_stop_on_fail:  config_out[5];
  assign stop_on_fail        =    config_out[5];

  assign config_in[6]        =    start_transition   ?   mbist_stop_on_next_fail:  config_out[6];
  assign stop_on_next_fail   =    config_out[6];

  assign config_in[7]        =    start_transition   ?   mbist_loop_on_address:  config_out[7];
  assign loop_on_address     =    config_out[7];


  dff_s #(8) userdata_reg (
                 .clk      ( rclk                    ),
                 .din      ( userdata_in[7:0]       ),
                 .q        ( userdata_out[7:0]      ), .se(mbist_se), .si(), .so());


  assign userdata_in[7:0]    =    userdata_out[7:0];




  dff_s #(7) user_address_reg (
                 .clk      ( rclk                   ),
                 .din      ( useradd_in[6:0]       ),
                 .q        ( useradd_out[6:0]      ), .se(mbist_se), .si(), .so());

  assign useradd_in[6:0]    =    useradd_out[6:0];


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Control Register
//
// /////////////////////////////////////////////////////////////////////////////
// Remove Address mix disable before delivery
// /////////////////////////////////////////////////////////////////////////////


   dff_s #(21) control_reg  (
                      .clk   ( rclk                        ),
                      .din   ( control_in[20:0]           ),
                      .q     ( control_out[20:0]          ), .se(mbist_se), .si(), .so());

  assign   msb                       =     control_out[20];
  assign   array_sel                 =     control_out[19];
  assign   data_control[1:0]         =     userdata_mode ? 2'b11 : control_out[18:17];
  assign   address_mix               =     loop_on_address    ?   1'b1:   control_out[16];
  assign   mbist_word_sel            =     loop_on_address ? 1'b1 : control_out[15]; 
  assign   march_element[2:0]        =     control_out[14:12];
  assign   array_address[9:0]       =      loop_on_address    ?   {6'h3f, control_out[5:2]}:
                                           (dcache_sel & ~bisi)     ?   {1'd1, control_out[10:2]}: control_out[11:2];
  assign   read_write_control[1:0]   =     control_out[1:0];

  assign   qual_control_out[20:0]    =     {msb, array_sel, data_control[1:0], address_mix, mbist_word_sel, march_element[2:0], array_address[9:0], read_write_control[1:0]};

// added by Chandra

  wire [1:0] add_data_int;
  wire [20:0] add_data;
  wire [9:0] mbist_address_bf;

  assign add_data_int[1:0] = four_cycle_march ? 2'b01: 2'b10;
  assign add_data[20:0] = qual_control_out[20:0] + {19'd0, add_data_int};
  assign control_in[20:0] = {21{~run & ~reset_engine}} & qual_control_out | {21{run & ~reset_engine}} & add_data;

  assign   add[9:0]                  =     upaddress_march     ?   array_address[9:0]:    ~array_address[9:0];
  assign   mbist_address_bf[9:0]     =     loop_on_address     ?  {useradd_out[5:0], add[3:0]}: 
                                           address_mix         ?  (dcache_sel ? ({add[9:8], add[0], add[7:1]}) : ({add[9:8], add[6:0], add[7]})) :
                                                                    add[9:0];



  assign   array_write               =    ~run                 ?    1'b0:
                                           four_cycle_march    ?  (read_write_control[0] ^ read_write_control[1]):  read_write_control[1];
  assign   array_read                =    ~array_write        &&  run  &&  ~initialize;

  assign   mbist_done_int            =    (stop_on_fail  &&  fail)      ||  (stop_on_next_fail  &&  fail)         ||
                                          (bisi  &&  march_element[0])  ||  msb;

  assign   mbist_done 		     =    (stop_on_fail  &&  fail)      ||  (stop_on_next_fail  &&  fail)         ||
                                          (bisi  &&  march_element[0])  ||  msb_d4;

////////////
////////////

  wire [7:0] mbist_write_data_bf;

  assign   mbist_write_data_bf[7:0]     =     true_data           ?   data_pattern[7:0]:      ~data_pattern[7:0];
  assign   mbist_dcache_wdata[7:0]      =     mbist_write_data_bf[7:0];

  assign   second_time_through       =    ~loop_on_address    &&   address_mix;
  assign   initialize                =    (march_element[2:0] == 3'b000)  &&  ~second_time_through;
  assign   four_cycle_march          =    (march_element[2:0] == 3'h6)    ||  (march_element[2:0] == 3'h7);
  assign   upaddress_march           =    (march_element[2:0] == 3'h0)    ||  (march_element[2:0] == 3'h1) ||
                                          (march_element[2:0] == 3'h2)    ||  (march_element[2:0] == 3'h6);

  assign   true_data                 =     read_write_control[1] ^ ~march_element[0];
  assign   data_pattern[7:0]         =     userdata_mode                ?    userdata_out[7:0]:
                                           bisi                         ?    8'hFF:                    // true_data function will invert to 8'h00
                                          (data_control[1:0] == 2'h0)   ?    8'hAA:
                                          (data_control[1:0] == 2'h1)   ?    8'h99:
                                          (data_control[1:0] == 2'h2)   ?    8'hCC:
                                                                             8'h00;
  assign   dcache_sel                =    ~array_sel;
  assign   icache_sel                =     array_sel;

////////////
////////////

  assign   mbist_dcache_index[6:0]     =     mbist_address[6:0];
  assign   mbist_dcache_way[1:0]       =     (mbist_address[8:7] & {2{config_out[0]}});
  assign   mbist_dcache_word           =     mbist_address[10];
  assign   mbist_dcache_read           =     dcache_sel  &&  array_read;
  assign   mbist_dcache_write          =    (dcache_sel  ||  bisi) &&  array_write;

  assign   mbist_icache_index[7:0]     =     mbist_address[7:0];
  assign   mbist_icache_way[1:0]       =     (mbist_address[9:8] & {2{config_out[0]}});
  assign   mbist_icache_word           =     mbist_address[10];
  assign   mbist_icache_read_bf        =     icache_sel  &&  array_read;
  assign   mbist_icache_write_bf       =    (icache_sel  ||  bisi)  &&  array_write;

////////////////////////
////////////////////////

  assign msb_rst = msb & ~reset_engine;
  dff_s #(1) msb_d1_inst(
                   .clk      ( rclk                   ),
                   .din      ( msb_rst ),
                   .q        ( msb_d1 ), .se(mbist_se), .si(), .so());
  assign msb_d1_rst = msb_d1 & ~reset_engine;
  dff_s #(1) msb_d2_inst(
                   .clk      ( rclk                   ),
                   .din      ( msb_d1_rst ),
                   .q        ( msb_d2 ), .se(mbist_se), .si(), .so());
  assign msb_d2_rst = msb_d2 & ~reset_engine;
  dff_s #(1) msb_d3_inst(
                   .clk      ( rclk                   ),
                   .din      ( msb_d2_rst ),
                   .q        ( msb_d3 ), .se(mbist_se), .si(), .so());
  assign msb_d3_rst = msb_d3 & ~reset_engine;
  dff_s #(1) msb_d4_inst(
                   .clk      ( rclk                   ),
                   .din      ( msb_d3_rst ),
                   .q        ( msb_d4 ), .se(mbist_se), .si(), .so());

// /////////////////////////////////////////////////////////////////////////////
// Pipeline for Read, Data, and Address
// /////////////////////////////////////////////////////////////////////////////

  wire dc_read_pipe_out3, dc_read_pipe_out4, ic_read_pipe_out3, ic_read_pipe_out4;
  wire dc_read_pipe_out1_bf, dc_read_pipe_out2_bf, dc_read_pipe_out3_bf;
  wire ic_read_pipe_out1_bf, ic_read_pipe_out2_bf, ic_read_pipe_out3_bf;

  ////////////
  ////////////

  dff_s #(1) dc_read_pipe_reg1 (
                   .clk      ( rclk                   ),
                   .din      ( mbist_dcache_read      ),
                   .q        ( dc_read_pipe_out1      ), .se(mbist_se), .si(), .so());

  assign dc_read_pipe_out1_bf = dc_read_pipe_out1 & ~reset_engine;
 
  dff_s #(1) dc_read_pipe_reg2 (
                   .clk      ( rclk                   ),
                   .din      ( dc_read_pipe_out1_bf   ),
                   .q        ( dc_read_pipe_out2      ), .se(mbist_se), .si(), .so());

  assign dc_read_pipe_out2_bf = dc_read_pipe_out2 & ~reset_engine;

  dff_s #(1) dc_read_pipe_reg3 (
                   .clk      ( rclk                   ),
                   .din      ( dc_read_pipe_out2_bf   ),
                   .q        ( dc_read_pipe_out3      ), .se(mbist_se), .si(), .so());

  assign dc_read_pipe_out3_bf = dc_read_pipe_out3 & ~reset_engine;
  assign dcache_data_sel       =  dc_read_pipe_out3_bf;

  dff_s #(1) dc_read_pipe_reg4 (
                   .clk      ( rclk                   ),
                   .din      ( dc_read_pipe_out3_bf   ),
                   .q        ( dc_read_pipe_out4      ), .se(mbist_se), .si(), .so());

  assign dcache_piped_read       =  dc_read_pipe_out4 & ~reset_engine;

  ////////////
  ////////////

  dff_s #(1) ic_read_pipe_reg1 (
                   .clk      ( rclk                   ),
                   .din      ( mbist_icache_read_bf   ),
                   .q        ( ic_read_pipe_out1      ), .se(mbist_se), .si(), .so());

  assign ic_read_pipe_out1_bf = ic_read_pipe_out1 & ~reset_engine;
  assign mbist_icache_read = ic_read_pipe_out1;

  dff_s #(1) ic_read_pipe_reg2 (
                   .clk      ( rclk                   ),
                   .din      ( ic_read_pipe_out1_bf   ),
                   .q        ( ic_read_pipe_out2      ), .se(mbist_se), .si(), .so());

  assign ic_read_pipe_out2_bf = ic_read_pipe_out2 & ~reset_engine;

  dff_s #(1) ic_read_pipe_reg3 (
                   .clk      ( rclk                   ),
                   .din      ( ic_read_pipe_out2_bf   ),
                   .q        ( ic_read_pipe_out3      ), .se(mbist_se), .si(), .so());

  assign ic_read_pipe_out3_bf = ic_read_pipe_out3 & ~reset_engine;

  dff_s #(1) ic_read_pipe_reg4 (
                   .clk      ( rclk                   ),
                   .din      ( ic_read_pipe_out3_bf   ),
                   .q        ( ic_read_pipe_out4      ), .se(mbist_se), .si(), .so());


  assign icache_piped_read       =  ic_read_pipe_out4 & ~reset_engine;

  ////////////
  ////////////

  dff_s #(1) ic_write_pipe_reg1 (
                   .clk      ( rclk                    ),
                   .din      ( mbist_icache_write_bf  ),
                   .q        ( mbist_icache_write     ), .se(mbist_se), .si(), .so());

  ////////////
  ////////////

  wire [7:0] data_pipe_out3, data_pipe_out4;

  dff_s #(8) data_pipe_reg1 (
                   .clk      ( rclk                    ),
                   .din      ( mbist_write_data_bf[7:0]  ),
                   .q        ( data_pipe_out1[7:0]    ), .se(mbist_se), .si(), .so());

  assign mbist_icache_wdata = data_pipe_out1;

  dff_s #(8) data_pipe_reg2 (
                   .clk      ( rclk                    ),
                   .din      ( data_pipe_out1[7:0]    ),
                   .q        ( data_pipe_out2[7:0]    ), .se(mbist_se), .si(), .so());

  dff_s #(8) data_pipe_reg3 (
                   .clk      ( rclk                    ),
                   .din      ( data_pipe_out2[7:0]    ),
                   .q        ( data_pipe_out3[7:0]    ), .se(mbist_se), .si(), .so());

  dff_s #(8) data_pipe_reg4 (
                   .clk      ( rclk                    ),
                   .din      ( data_pipe_out3[7:0]    ),
                   .q        ( data_pipe_out4[7:0]    ), .se(mbist_se), .si(), .so());


////////////
////////////

  wire [10:0] add_pipe_out3, add_pipe_out4;
  wire mbist_word_sel_bf;

  assign mbist_word_sel_bf = loop_on_address ? useradd_out[6] : mbist_word_sel;

  dff_s #(11) add_pipe_reg1 (
                   .clk      ( rclk                        ),
                   .din      ( {mbist_word_sel_bf, mbist_address_bf[9:0]}        ),
                   .q        ( add_pipe_out1[10:0]        ), .se(mbist_se), .si(), .so());

  assign mbist_address = add_pipe_out1;

  dff_s #(11) add_pipe_reg2 (
                   .clk      ( rclk                    ),
                   .din      ( add_pipe_out1[10:0]    ),
                   .q        ( add_pipe_out2[10:0]    ), .se(mbist_se), .si(), .so());

  dff_s #(11) add_pipe_reg3 (
                   .clk      ( rclk                    ),
                   .din      ( add_pipe_out2[10:0]    ),
                   .q        ( add_pipe_out3[10:0]    ), .se(mbist_se), .si(), .so());

  dff_s #(11) add_pipe_reg4 (
                   .clk      ( rclk                    ),
                   .din      ( add_pipe_out3[10:0]    ),
                   .q        ( add_pipe_out4[10:0]    ), .se(mbist_se), .si(), .so());


  assign dcache_piped_address[9:0]   =  {add_pipe_out4[10], add_pipe_out4[8:0]};
  assign icache_piped_address[10:0]  =  add_pipe_out4[10:0];

// /////////////////////////////////////////////////////////////////////////////
// Shared Fail Detection
// /////////////////////////////////////////////////////////////////////////////

  dff_s #(2) fail_reg       (
                   .clk      ( rclk                ),
                   .din      ( fail_reg_in[1:0]   ),
                   .q        ( fail_reg_out[1:0]  ), .se(mbist_se), .si(), .so());


  assign    fail_reg_in[1:0]      =    reset_engine      ?    2'b0: {qual_dcache_fail,qual_icache_fail}  |  fail_reg_out[1:0];


  assign    qual_dcache_fail      =  (!stop_on_next_fail  || (stop_on_next_fail &&  beyond_last_fail))  &&  dcache_fail;
  assign    qual_icache_fail      =  (!stop_on_next_fail  || (stop_on_next_fail &&  beyond_last_fail))  &&  icache_fail;

  assign    dcache_fail           =    dcache_piped_read  &&  mismatch;
  assign    icache_fail           =    icache_piped_read  &&  mismatch;

// added by Chandra

//  assign expect_data[71:0] = { ({4{dcache_piped_read}} & data_pipe_out4[7:4]), 
//			        (icache_piped_read ? {2{data_pipe_out4[1:0]}} : data_pipe_out4[3:0]), {8{data_pipe_out4[7:0]}}};

  assign expect_data[71:0] = { ({4{dcache_piped_read}} & data_pipe_out4[7:4]), 
			        (icache_piped_read ? {2{data_pipe_out4[1:0]}} : data_pipe_out4[3:0]), {7{data_pipe_out4[7:0]}},
			        (icache_piped_read ? data_pipe_out4[7:4] : data_pipe_out4[3:0]), data_pipe_out4[3:0] };

  assign    compare_data_bf[71:0]    =    dcache_data_sel ?      mbist_dcache_data_in[71:0]:  {4'h0,mbist_icache_data_in[67:0]};

  dff_s #(72) compare_data_inst(
                   .clk      ( rclk                        ),
                   .din      ( compare_data_bf[71:0]   ),
                   .q        ( compare_data[71:0]  ), .se(mbist_se), .si(), .so());

  assign    mismatch              =    expect_data[71:0]   !=     compare_data[71:0];


  assign    mbist_dcache_fail     =    fail_reg_out[1];
  assign    mbist_icache_fail     =    fail_reg_out[0];

  assign    fail                  =   |fail_reg_out[1:0];
  assign    qual_fail             =    qual_dcache_fail  ||  qual_icache_fail;


// /////////////////////////////////////////////////////////////////////////////
// Fail Address and Data Capture and Control Reg Store
// /////////////////////////////////////////////////////////////////////////////



  dff_s #(11) fail_add_reg(
                   .clk      ( rclk                        ),
                   .din      ( fail_add_reg_in[10:0]   ),
                   .q        ( fail_add_reg_out[10:0]  ), .se(mbist_se), .si(), .so());


  assign fail_add_reg_in[10:0]     =  reset_engine              ?    11'b0:
                                      qual_dcache_fail          ?    {1'b0,dcache_piped_address[9:0]}:
                                      qual_icache_fail          ?    icache_piped_address[10:0]:
                                                                     fail_add_reg_out[10:0];


  dff_s #(72) fail_data_reg(
                   .clk      ( rclk                      ),
                   .din      ( fail_data_reg_in[71:0]   ),
                   .q        ( fail_data_reg_out[71:0]  ), .se(mbist_se), .si(), .so());


  assign fail_data_reg_in[71:0]     =  reset_engine     ?   72'b0:
                                       qual_fail        ?   compare_data[71:0]:
                                                            fail_data_reg_out[71:0];


  assign fail_control_reg_in[20:0]     = (reset_engine && !mbist_stop_on_next_fail)    ?   21'b0:
                                          qual_fail                                    ?   qual_control_out[20:0]:
                                                                                           fail_control_reg_out[20:0];

  dff_s #(21) fail_control_reg_inst(
                   .clk      ( rclk                         ),
                   .din      ( fail_control_reg_in[20:0]   ),
                   .q        ( fail_control_reg_out[20:0]  ), .se(mbist_se), .si(), .so());

////////

  assign  beyond_last_fail  =  qual_control_out[20:0]    >    fail_control_reg_out[20:0];


endmodule
