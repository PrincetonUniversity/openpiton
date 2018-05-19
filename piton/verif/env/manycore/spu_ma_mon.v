// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_ma_mon.v
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

module spu_ma_mon (/*AUTOARG*/
   // Inputs
   clk, wrmi_mamul_1sthalf, wrmi_mamul_2ndhalf, 
        wrmi_maaeqb_1sthalf, wrmi_maaeqb_2ndhalf,
        iptr, iminus_lenminus1, mul_data
   );


input clk;
input wrmi_mamul_1sthalf;
input wrmi_mamul_2ndhalf;
input wrmi_maaeqb_1sthalf;
input wrmi_maaeqb_2ndhalf;
input [6:0] iptr;
input [6:0] iminus_lenminus1;
input [63:0] mul_data;


always @(negedge clk)
begin

  if (wrmi_mamul_1sthalf | wrmi_maaeqb_1sthalf) begin
   $display("%0d:spu_ma> ",$time,"M[",iptr,"] = %h",mul_data);
`ifdef MODELSIM   
   $display(0,"SPU_MON_M[",iptr,"] = %h",mul_data);
`else
   $info(0,"SPU_MON_M[",iptr,"] = %h",mul_data);
`endif
  end

  if (wrmi_mamul_2ndhalf | wrmi_maaeqb_2ndhalf) begin
   $display("%0d:spu_ma> ",$time,"M[",iminus_lenminus1,"] = %h",mul_data);
`ifdef MODELSIM
   $display(0,"SPU_MON_M[",iminus_lenminus1,"] = %h",mul_data);
`else
   $info(0,"SPU_MON_M[",iminus_lenminus1,"] = %h",mul_data);
`endif
  end

end //always


endmodule
