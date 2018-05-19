// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: dimm_if_mon.v
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

module dimm_if_mon(/*AUTOARG*/
  // Inputs
  clk,
  DRAM_CK, DRAM_CKE, DRAM_RST_L,
  DRAM_CS_L, DRAM_BA, DRAM_ADDR, 
  DRAM_RAS_L, DRAM_CAS_L, DRAM_WE_L,
  DRAM_DQ, DRAM_CB, DRAM_DQS,
  DRAM_ENB_ERROR, DRAM_FAIL_OVER,
  DRAM_FAIL_PART
  );

  parameter AUTOREF_PERIOD = 1500;

  parameter ST_RAS  = 2'b00;
  parameter ST_CAS  = 2'b01;
  parameter ST_DATA = 2'b10;
  parameter ST_REL  = 2'b11;
  //parameter ENB_MECC_ERROR  = 1'b0;

  input         clk;
  input [7:0]   DRAM_CK;
  input         DRAM_CKE;
  input         DRAM_RST_L;
  input [1:0]   DRAM_CS_L;
  input [2:0]   DRAM_BA;
  input [14:0]  DRAM_ADDR;
  input         DRAM_RAS_L;
  input         DRAM_CAS_L;
  input         DRAM_WE_L;
  inout [127:0] DRAM_DQ;
  input [15:0]  DRAM_CB;
  input [35:0]  DRAM_DQS;
  input         DRAM_ENB_ERROR;
  input         DRAM_FAIL_OVER;
  input  [5:0]  DRAM_FAIL_PART;

  integer      ref_timer;
  integer      dq_dly;
  //reg          enable_errors;
  reg  [1:0]   error_st;
  reg          inject_err_s1;
  reg          inject_err_s1_1;
  reg          inject_err_s1_2;
  reg          inject_err_s1_3;
  reg          inject_err_s1_4;
  reg          inject_err_s1_5;
  wire         inject_err_s2;
  wire         inject_err_s2_d1;
  wire         inject_err_s2_d2;
  wire         inject_err_s2_d3;
  reg          inject_err_s3;
  reg          inject_err_s3_d1;
  reg          inject_err_s3_d2;
  reg          inject_err_s3_d3;
  reg  [127:0] data;
  reg  [15:0]  ecc;
  reg    [3:0] err_bits,err_bits1;
  wire   [3:0] synd_err_bits;
  reg    [3:0] inject_enable;
  reg          ecc_err_inject;
  wire          synd_ecc_err_inject;
  reg   [31:0] err_pos; 
  reg   [31:0] err_pos1; 
  reg   [31:0] synd_err_pos; 
  wire   [31:0] synd_err_pos1; 
  integer      flip_for_mecc;
  reg          ADDR_PARITY_ERR;
  reg          ENB_MECC_ERROR;
  reg          disable_mecc, disable_secc;
 
  reg  [2:0]   cas_latency;
  integer      stop_dq_dly;

  initial begin
    @(posedge DRAM_RST_L) ref_timer = 0;
    flip_for_mecc = 1;
  if ($test$plusargs("ADDR_PARITY_ERR")) begin
    ADDR_PARITY_ERR = 1;
  end else begin 
    ADDR_PARITY_ERR = 0;
  end
  if ($test$plusargs("ENB_MECC_ERROR")) begin
    ENB_MECC_ERROR = 1;
  end else begin 
    ENB_MECC_ERROR = 0;
  end
  end

 initial begin 
   err_pos = 0;
   err_pos1 = 0;
   ecc_err_inject = 1;
 end 

/*
  always @ (posedge DRAM_CK) begin
    if ( !DRAM_CS_L && !DRAM_RAS_L && !DRAM_CAS_L) ref_timer = 0;
    else if (DRAM_RST_L) ref_timer = ref_timer + 1;
    if (ref_timer > AUTOREF_PERIOD) begin
      $display("%0d Error: %m : Autorefresh time has expired", $time);
      cmp_top.monitor.fail("Autorefresh time has expired");
    end
  end
*/
initial
 begin
    if (! $value$plusargs("force_cas_latency=%d", cas_latency)) begin
      cas_latency = 3 ;
    end
 end

  initial begin
    //enable_errors = 1'b0;
    error_st = ST_RAS;
    dq_dly = 0;
    inject_err_s1 = 1'b0;
    inject_err_s3 = 1'b0;
    data = 128'h0;
    ecc  = 16'h0;
    disable_mecc = 1'b0;
    disable_secc = 1'b0;
  end

  always @(clk) begin
    //if (DRAM_RST_L && enable_errors) begin
    if ( (DRAM_RST_L && DRAM_ENB_ERROR) || (DRAM_RST_L && DRAM_FAIL_OVER) ) begin
      case (error_st)
        ST_RAS: begin
          //$display ("%0d %m: Err injector state ST_RAS\n", $time);
          if ( !DRAM_RAS_L && DRAM_CAS_L && DRAM_WE_L &&
               // why restrict errors to Bank 0 only, inject in all banks.
               //!DRAM_CS_L[0] && (DRAM_BA[2:0] === 3'b000) ) 
               !DRAM_CS_L[0]  ) 
            error_st <= ST_CAS;
        end
        ST_CAS: begin
          //$display ("%0d %m: Err injector state ST_CAS\n", $time);
          if ( DRAM_RAS_L && !DRAM_CAS_L && !DRAM_WE_L &&
               // why restrict errors to Bank 0 only, inject in all banks.
               //!DRAM_CS_L[0] && (DRAM_BA[2:0] === 3'b000) ) 
               !DRAM_CS_L[0] ) 
            error_st <= ST_DATA;
        end
        ST_DATA: begin
          $display ("%0d %m: Err injector state ST_DATA\n", $time);

          case(cas_latency) 
           4: begin 
            stop_dq_dly = 4;
           end
           5: begin 
            stop_dq_dly = 6;
           end
           6: begin 
            stop_dq_dly = 8;
           end
           7: begin 
            stop_dq_dly = 10;
           end
           default: begin 
            stop_dq_dly = cas_latency-1;
           end
          endcase

          if (dq_dly == stop_dq_dly) begin
          //if (dq_dly == 2) begin
            inject_err_s1 <= 1'b1;
            dq_dly <= 0;
            error_st <= ST_REL;
          end
          else dq_dly <= dq_dly + 1;
        end
        ST_REL: begin
          //$display ("%0d %m: Err injector state ST_REL\n", $time);
          inject_err_s1 <= 1'b0;
          //release DRAM_DQ;
          error_st <= ST_RAS;
        end
        default: begin
          $display ("%0d %m: Err injector entered unknown state\n", $time);
          error_st <= ST_RAS;
        end
      endcase
    end
  end
  //assign #1506 inject_err_s2 = inject_err_s1;
  always @(clk) begin 
    inject_err_s1_1 <= inject_err_s1;
    inject_err_s1_2 <= inject_err_s1_1;
    inject_err_s1_3 <= inject_err_s1_2;
    inject_err_s1_4 <= inject_err_s1_3;
    inject_err_s1_5 <= inject_err_s1_4;
  end
  // for the default run the clks are updated and needed to add 155 ps to 
  // capture the data and inject error.
  // This need to be verified for the regression
  assign #1661 inject_err_s2 =  inject_err_s1_2;
  assign #1662 inject_err_s2_d1 =  inject_err_s1_3;
  assign #1663 inject_err_s2_d2 =  inject_err_s1_4;
  assign #1664 inject_err_s2_d3 =  inject_err_s1_5;

  // before adding CTU/ clock change
  //assign #1506 inject_err_s2 =  inject_err_s1_2;
  //assign #1507 inject_err_s2_d1 =  inject_err_s1_3;
  //assign #1508 inject_err_s2_d2 =  inject_err_s1_4;
  //assign #1509 inject_err_s2_d3 =  inject_err_s1_5;

//  always @ (posedge inject_err_s2 ) begin
//    data <= DRAM_DQ;
//    inject_err_s3 <= 1'b1;
//  end
//  always @ (negedge inject_err_s2) begin
//    inject_err_s3 = 1'b0;
//  end

  always @ (posedge inject_err_s2 or posedge inject_err_s2_d1 or posedge inject_err_s2_d2 or posedge inject_err_s2_d3  ) begin
    data <= DRAM_DQ;
    ecc  <= DRAM_CB;
    inject_enable =  $random & 4'hf;
    //inject_enable =   4'hf;
  if ($test$plusargs("ONE_ERROR")) begin
    inject_err_s3 <= (1'b1 && inject_err_s2);
    inject_err_s3_d1 <=  (1'b0 && inject_err_s2_d1);
    inject_err_s3_d2 <= (1'b0 && inject_err_s2_d2);
    inject_err_s3_d3 <= (1'b0 && inject_err_s2_d3);
  end else begin
    if ($test$plusargs("TWO_ERROR")) begin
      inject_err_s3 <= (1'b1 && inject_err_s2);
      inject_err_s3_d1 <=  (1'b0 && inject_err_s2_d1);
      inject_err_s3_d2 <= (1'b1 && inject_err_s2_d2);
      inject_err_s3_d3 <= (1'b0 && inject_err_s2_d3);
    end else begin
      inject_err_s3 <= (inject_enable[0] && inject_err_s2);
      inject_err_s3_d1 <=  (inject_enable[0] && inject_err_s2_d1);
      inject_err_s3_d2 <= (inject_enable[0] && inject_err_s2_d2);
      inject_err_s3_d3 <= (inject_enable[0] && inject_err_s2_d3);
    end
  end

  end
  always @ (negedge inject_err_s2) begin
    inject_err_s3 = 1'b0;
  end
  always @ (negedge inject_err_s2_d1) begin
    inject_err_s3_d1 = 1'b0;
  end
  always @ (negedge inject_err_s2_d2) begin
    inject_err_s3_d2 = 1'b0;
  end
  always @ (negedge inject_err_s2_d3) begin
    inject_err_s3_d3 = 1'b0;
  end


  always @ (posedge inject_err_s2_d3)
      flip_for_mecc = !flip_for_mecc;
  
  always @ (posedge inject_err_s3 or posedge inject_err_s3_d1 or posedge inject_err_s3_d2 or posedge inject_err_s3_d3) begin
    err_bits = $random & 4'hf;
    err_bits1 = $random & 4'hf;
  // If injecting error in each nibble
  if ($test$plusargs("EACH_NIBBLE_ERROR")) begin
    ecc_err_inject = (err_pos == 0) ? !ecc_err_inject : ecc_err_inject;
    err_pos = (err_pos == 124) ? 0 : (((err_pos >> 2) + 1)*4);
    err_pos1 = (err_pos1 == 124) ? 0 : (err_pos == 124) ? (((err_pos1 >> 2) + 1)*4) : err_pos1;
  end else begin 
    ecc_err_inject = $random & 1'b1;
    err_pos = ($random & 5'h1f) * 4;
    err_pos1 = ($random & 5'h1f) * 4;
  end 

    //force DRAM_DQ = data ^ (1'b1 << err_pos);
    if (DRAM_ENB_ERROR && DRAM_FAIL_OVER) begin 
      force DRAM_DQ = data ^ ((err_bits << err_pos) | (4'hf << (DRAM_FAIL_PART * 4)));
      $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, err_pos);
    end else if (DRAM_ENB_ERROR) begin 

     // This part of code to send only one error
     // So for mecc secc : ONLY_ONE_MECC_SECC, ADDR_PARITY_ERR
     // So for secc mecc : ONLY_ONE_SECC_MECC, ADDR_PARITY_ERR
     if ($test$plusargs("ONLY_ONE_MECC_SECC")) begin
     if (ADDR_PARITY_ERR && !disable_mecc) begin 
        force DRAM_CB = ~ecc; 
        $display ("%0d: Address parity inversion : Injecting Err by inverting ecc %x \n", $time, ecc);
        disable_mecc = 1;
     end else begin 
       if(!disable_secc) begin 
        disable_secc = 1;
        force DRAM_DQ = data ^ (err_bits << err_pos);
        $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, err_pos);
       end
     end
     end else if ($test$plusargs("ONLY_ONE_SECC_MECC")) begin
       if(!disable_secc) begin 
          disable_secc = 1;
          force DRAM_DQ = data ^ (err_bits << err_pos);
          $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, err_pos);
       end else begin 
       if (ADDR_PARITY_ERR && !disable_mecc) begin 
          force DRAM_CB = ~ecc; 
          $display ("%0d: Address parity inversion : Injecting Err by inverting ecc %x \n", $time, ecc);
          disable_mecc = 1;
       end
       end
     end else if ($test$plusargs("SYNDROME_TEST")) begin
      synd_err_pos = (synd_err_pos1 & 5'h1f) * 4;
       if(!synd_ecc_err_inject) begin   // this is a random number so inject data or ecc errors randomly
        force DRAM_DQ = data ^ (synd_err_bits << synd_err_pos);
        $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, synd_err_pos);
        $display ("%0d: Erred data %x at synd_err_pos %x with synd_err_bits %x\n", $time, DRAM_DQ, synd_err_pos,synd_err_bits);
       end else begin 
        force DRAM_CB = ecc  ^ (synd_err_bits << synd_err_pos[3:0]);
        $display ("%0d: Injecting Err on ecc %x at bit %d\n", $time, ecc, synd_err_pos[3:0]);
        $display ("%0d: Erred ecc %x at synd_err_pos %x with synd_err_bits %x\n", $time, DRAM_CB, synd_err_pos[3:0],synd_err_bits);
       end
     end else begin 
     // This is normal error injection
     if (ADDR_PARITY_ERR) begin 
        force DRAM_CB = ~ecc; 
        $display ("%0d: Address parity inversion : Injecting Err by inverting ecc %x \n", $time, ecc);
     end else begin 
      if (ENB_MECC_ERROR )  begin 
      //if (ENB_MECC_ERROR & flip_for_mecc)  begin 
        //force DRAM_DQ = ~(data ^ (err_bits << err_pos));
        // MECC is multiple errors in different chunks for data
        force DRAM_DQ = (data ^ (err_bits << err_pos) ^ (err_bits1 << err_pos1) );
        $display ("%0d: Injecting Err on data %x at bit %d %d\n", $time, data, err_pos,err_pos1);
      end else
       if(!ecc_err_inject) begin   // this is a random number so inject data or ecc errors randomly
        force DRAM_DQ = data ^ (err_bits << err_pos);
        $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, err_pos);
        $display ("%0d: Erred data %x at err_pos %x with err_bits %x\n", $time, DRAM_DQ, err_pos,err_bits);
       end else begin 
        force DRAM_CB = ecc  ^ (err_bits << err_pos[3:0]);
        $display ("%0d: Injecting Err on ecc %x at bit %d\n", $time, ecc, err_pos[3:0]);
        $display ("%0d: Erred ecc %x at err_pos %x with err_bits %x\n", $time, DRAM_CB, err_pos[3:0],err_bits);
       end
     end
     end

    end
    else if (DRAM_FAIL_OVER)
      force DRAM_DQ = data ^ (4'hf << (DRAM_FAIL_PART * 4));
    else
      force DRAM_DQ = data;
    //force DRAM_DQ[3:0] = ~data[3:0];
  end
  always @ (negedge inject_err_s3 or negedge inject_err_s3_d1 or negedge inject_err_s3_d2 or negedge inject_err_s3_d3 ) begin
    release DRAM_DQ[127:0];
    release DRAM_CB[15:0];
  end
  //assign DRAM_DQ[127:0] = (inject_err_s3) ? data[127:0] : 128'hZ;

endmodule



