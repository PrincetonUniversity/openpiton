// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ch_mem.v
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
/////////////////////////////////////////////////////////////

module ch_mem ( /*AUTOARG*/
   // Inouts
   XXSDA, XXDQ, XXCB, XXDQS, 
   // Inputs
   XXRAS_L, XXCAS_L, XXWE_L, XXCS_L, XXRESET_L, XXADDR, XXBA, XXSA, 
   XXSCL, XXWP, XXCLK, XXCLK_L, XXCKE
   );
   
   input 	 XXRAS_L;	// Row address valid
   input 	 XXCAS_L;	// column address valid
   input 	 XXWE_L;	// Write Enable 
   input [3:0] 	 XXCS_L;	// Chip Select (DIMM select in this case)
   input 	 XXRESET_L;	// Reset DIMM module
   input [14:0]  XXADDR;	// Row/Column Addresses
   input [2:0]   XXBA;		// Bank select
   input [2:0]   XXSA;		// Serial Presence Reg address
   input  	 XXSCL;
   inout  	 XXSDA;
   input  	 XXWP;
   input [3:0]	 XXCLK;
   input [3:0] 	 XXCLK_L;
   input 	 XXCKE;
   

   // IOputs
   inout [127:0] XXDQ;		// Data bits
   inout [15:0]  XXCB;		// ECC parity bits
   inout [35:0]  XXDQS;	// Write data strobe
   
   ////////////////
   // Parameters
   //parameter TRACE_DELAY = 0000; //ps
   // the Trace delay is a plus arg , default 0.This is to delay the 
   // DIMM clock versus DRAM clock
   integer TRACE_DELAY;
   initial begin 
     if (! $value$plusargs("TRACE_DELAY=%d", TRACE_DELAY)) begin
       TRACE_DELAY = 0 ;
     end
   end
   
   ///////////////
   // Wires

   
   //`ifdef TRC_DELAY
   //parameter TRACE_DELAY = 1300; //ps

   wire [3:0]	 #TRACE_DELAY TDCLK   = XXCLK;
   wire [3:0] 	 #TRACE_DELAY TDCLK_L = XXCLK_L;

   //`else
   //parameter TRACE_DELAY = 0000; //ps
   //wire [3:0]	 #TRACE_DELAY TDCLK   = XXCLK;
   //wire [3:0] 	 #TRACE_DELAY TDCLK_L = XXCLK_L;
   //`endif

   wire [2:0] 	 tump = XXCLK_L[3:1];

 //`ifdef WIGGLE_DQS
   reg [35:0] dq_inv;
   reg [3:0] count;
   reg [2:0] count_dqs;
   reg wiggle, force_dqs;

   initial 
    begin 
     dq_inv = 0;
     count = 0;
     count_dqs = 0;
     wiggle = 0;
     force_dqs = 0;
    end

    // after the first write wiggle the dqs for sometime
    always @(XXCLK[3]) begin 
     if ($test$plusargs("WIGGLE_DQS")) begin
      dq_inv = ~dq_inv;
      count  <= (count > 0) ? count - 1 : count;
      count_dqs  <= (count_dqs > 0) ? count_dqs - 1 : count_dqs;
      if ( XXRAS_L && !XXCAS_L && !XXWE_L ) begin 
        wiggle <= 1'b1;
        count  <= 4'b1111;
      end
      if ( wiggle && (count == 0) && !force_dqs ) begin 
        force_dqs <= 1'b1;
        count_dqs <= 3'b111;
      end else if (count_dqs == 3'b001 ) begin 
        force_dqs <= 1'b0;
        wiggle <= 1'b0;
      end
    end
    end


   always @(posedge force_dqs or XXCLK[3]) begin 
     if ($test$plusargs("WIGGLE_DQS")) begin

     if(force_dqs == 1) begin 
       force XXDQS = dq_inv;
       $display("%0d : WIGGLE_DQS", $time);
     end else
       release XXDQS[35:0];
     end
   end

 
//  `endif
   
`ifdef DENALI_ON
    denali_ddrII dimm0( /*AUTOINST*/
		     // Outputs
		     // Inouts
		     .Dq		({XXCB[15: 8], XXDQ[127: 64]}), // Templated
     		     .Dqs		({XXDQS[35], XXDQS[26], 
					  XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
					  XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22],
					  XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
					  XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
		     // Inputs
		     .Addr		(XXADDR[14:0]),		 // Templated
		     .Ba		(XXBA[2:0]),		 // Templated
		     .Ck		(TDCLK[0]),		 // Templated
		     .Ck_n		(TDCLK_L[0]),		 // Templated
		     .Cke		(XXCKE),		 // Templated
		     .Cs_n		(XXCS_L[0]),		 // Templated
		     .Ras_n		(XXRAS_L),		 // Templated
		     .Cas_n		(XXCAS_L),		 // Templated
		     .We_n		(XXWE_L),		 // Templated
		     .Reset_n		(XXRESET_L));		 // Templated

    denali_ddrII  dimm1( /*AUTOINST*/
		      // Outputs
		      // Inouts
		      .Dq		({XXCB[7: 0], XXDQ[63: 0]}), // Templated
		      .Dqs		({XXDQS[17], XXDQS[8], 
					  XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
					  XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4],
					  XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
					  XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
		      // Inputs
		      .Addr		(XXADDR[14:0]),		 // Templated
		      .Ba		(XXBA[2:0]),		 // Templated
		      .Ck		(TDCLK[0]),		 // Templated
		      .Ck_n		(TDCLK_L[0]),		 // Templated
		      .Cke		(XXCKE),		 // Templated
		      .Cs_n		(XXCS_L[0]),		 // Templated
		      .Ras_n		(XXRAS_L),		 // Templated
		      .Cas_n		(XXCAS_L),		 // Templated
		      .We_n		(XXWE_L),		 // Templated
		      .Reset_n		(XXRESET_L));		 // Templated
   
`ifdef STACK_DIMM
   denali_ddrII dimms0( /*AUTOINST*/
		     // Outputs
		     // Inouts
		     .Dq		({XXCB[15: 8], XXDQ[127: 64]}), // Templated
		     .Dqs		({XXDQS[35], XXDQS[26], 
					  XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
					  XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22],
					  XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
					  XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
		     // Inputs
		     .Addr		(XXADDR[14:0]),		 // Templated
		     .Ba		(XXBA[2:0]),		 // Templated
		     .Ck		(TDCLK[1]),		 // Templated
		     .Ck_n		(TDCLK_L[1]),		 // Templated
		     .Cke		(XXCKE),		 // Templated
		     .Cs_n		(XXCS_L[1]),		 // Templated
		     .Ras_n		(XXRAS_L),		 // Templated
		     .Cas_n		(XXCAS_L),		 // Templated
		     .We_n		(XXWE_L),		 // Templated
		     .Reset_n		(XXRESET_L));		 // Templated


   denali_ddrII dimms1( /*AUTOINST*/
		     // Outputs
		     // Inouts
		     .Dq		({XXCB[7: 0], XXDQ[63: 0]}), // Templated
		     .Dqs		({XXDQS[17], XXDQS[8], 
					  XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
					  XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4],
					  XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
					  XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
		     // Inputs
		     .Addr		(XXADDR[14:0]),		 // Templated
		     .Ba		(XXBA[2:0]),		 // Templated
		     .Ck		(TDCLK[1]),		 // Templated
		     .Ck_n		(TDCLK_L[1]),		 // Templated
		     .Cke		(XXCKE),		 // Templated
		     .Cs_n		(XXCS_L[1]),		 // Templated
		     .Ras_n		(XXRAS_L),		 // Templated
		     .Cas_n		(XXCAS_L),		 // Templated
		     .We_n		(XXWE_L),		 // Templated
		     .Reset_n		(XXRESET_L));		 // Templated
`endif

`ifdef RANK_DIMM
   // RANK 1
   denali_ddrII dimmr0( /*AUTOINST*/
		     // Outputs
		     // Inouts
		     .Dq		({XXCB[15: 8], XXDQ[127: 64]}), // Templated
		     .Dqs		({XXDQS[35], XXDQS[26], 
					  XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
					  XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22],
					  XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
					  XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
		     // Inputs
		     .Addr		(XXADDR[14:0]),		 // Templated
		     .Ba		(XXBA[2:0]),		 // Templated
		     .Ck		(TDCLK[2]),		 // Templated
		     .Ck_n		(TDCLK_L[2]),		 // Templated
		     .Cke		(XXCKE),		 // Templated
		     .Cs_n		(XXCS_L[2]),		 // Templated
		     .Ras_n		(XXRAS_L),		 // Templated
		     .Cas_n		(XXCAS_L),		 // Templated
		     .We_n		(XXWE_L),		 // Templated
		     .Reset_n		(XXRESET_L));		 // Templated
   denali_ddrII dimmr1( /*AUTOINST*/
		     // Outputs
		     // Inouts
		     .Dq		({XXCB[7: 0], XXDQ[63: 0]}), // Templated
		     .Dqs		({XXDQS[17], XXDQS[8], 
					  XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
					  XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4],
					  XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
					  XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
		     // Inputs
		     .Addr		(XXADDR[14:0]),		 // Templated
		     .Ba		(XXBA[2:0]),		 // Templated
		     .Ck		(TDCLK[2]),		 // Templated
		     .Ck_n		(TDCLK_L[2]),		 // Templated
		     .Cke		(XXCKE),		 // Templated
		     .Cs_n		(XXCS_L[2]),		 // Templated
		     .Ras_n		(XXRAS_L),		 // Templated
		     .Cas_n		(XXCAS_L),		 // Templated
		     .We_n		(XXWE_L),		 // Templated
		     .Reset_n		(XXRESET_L));		 // Templated

`ifdef STACK_DIMM
   denali_ddrII dimmr2( /*AUTOINST*/
		     // Outputs
		     // Inouts
		     .Dq		({XXCB[15: 8], XXDQ[127: 64]}), // Templated
		     .Dqs		({XXDQS[35], XXDQS[26], 
					  XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
					  XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22],
					  XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
					  XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
		     // Inputs
		     .Addr		(XXADDR[14:0]),		 // Templated
		     .Ba		(XXBA[2:0]),		 // Templated
		     .Ck		(TDCLK[3]),		 // Templated
		     .Ck_n		(TDCLK_L[3]),		 // Templated
		     .Cke		(XXCKE),		 // Templated
		     .Cs_n		(XXCS_L[3]),		 // Templated
		     .Ras_n		(XXRAS_L),		 // Templated
		     .Cas_n		(XXCAS_L),		 // Templated
		     .We_n		(XXWE_L),		 // Templated
		     .Reset_n		(XXRESET_L));		 // Templated
   denali_ddrII dimmr3( /*AUTOINST*/
		     // Outputs
		     // Inouts
		     .Dq		({XXCB[7: 0], XXDQ[63: 0]}), // Templated
		     .Dqs		({XXDQS[17], XXDQS[8], 
					  XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
					  XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4],
					  XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
					  XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
		     // Inputs
		     .Addr		(XXADDR[14:0]),		 // Templated
		     .Ba		(XXBA[2:0]),		 // Templated
		     .Ck		(TDCLK[3]),		 // Templated
		     .Ck_n		(TDCLK_L[3]),		 // Templated
		     .Cke		(XXCKE),		 // Templated
		     .Cs_n		(XXCS_L[3]),		 // Templated
		     .Ras_n		(XXRAS_L),		 // Templated
		     .Cas_n		(XXCAS_L),		 // Templated
		     .We_n		(XXWE_L),		 // Templated
		     .Reset_n		(XXRESET_L));		 // Templated
`endif	// ifdef RANK_DIMM
`endif	// ifdef STACK_DIMM

`else // MICRO_ON

`ifdef DRAM_SAT

    DIMMx4 dimm0( 
		       .DQ		(XXDQ[127: 64]), // Templated
		       .CB		(XXCB[15: 8]), // Templated
		       .DQS		({XXDQS[26], 
					  XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
					  XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
		       .DM_RDQS		({XXDQS[35], 
					  XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
					  XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22]}),
		       //.Sda		(XXSDA),		 // Templated
		       // Inputs
		       .Addr		(XXADDR[14:0]),		 // Templated
`ifdef DRAM_BANK_BITS2
		       .BA		(XXBA[1:0]),		 // Templated
`else
		       .BA		(XXBA[2:0]),		 // Templated
`endif
		       .CK		({3{TDCLK[0]}}),	 // Templated
		       .bCK		({3{TDCLK_L[0]}}),	 // Templated
		       .CKE		(XXCKE),		 // Templated
		       .bCS		(XXCS_L[0]),		 // Templated
		       .bRAS		(XXRAS_L),		 // Templated
		       .bCAS		(XXCAS_L),		 // Templated
		       .bWE		(XXWE_L),		 // Templated
		       //.Reset_n		(XXRESET_L),		 // Templated
		       //.Sa		(XXSA[2:0]),		 // Templated
		       //.Scl		(XXSCL),		 // Templated
		       //.Wp		(XXWP),
		       .CS_SEL          (8'b0000_0000)
			 );		 // Templated

   DIMMx4 dimm1( 
		      .DQ		(XXDQ[63: 0]), // Templated
		      .CB		({XXCB[7: 0]}), // Templated
		      .DQS		({XXDQS[8], 
					  XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
					  XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
		      .DM_RDQS		({XXDQS[17], 
					  XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
					  XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4]}),
		      //.Sda		(XXSDA),		 // Templated
		      // Inputs
		      .Addr		(XXADDR[14:0]),		 // Templated
`ifdef DRAM_BANK_BITS2
		      .BA		(XXBA[1:0]),		 // Templated
`else
		      .BA		(XXBA[2:0]),		 // Templated
`endif
		      .CK		({3{TDCLK[0]}}),	 // Templated
		      .bCK		({3{TDCLK_L[0]}}),	 // Templated
		      .CKE		(XXCKE),		 // Templated
		      .bCS		(XXCS_L[0]),		 // Templated
		      .bRAS		(XXRAS_L),		 // Templated
		      .bCAS		(XXCAS_L),		 // Templated
		      .bWE		(XXWE_L),		 // Templated
		      //.Reset_n		(XXRESET_L),		 // Templated
		      //.Sa		(XXSA[2:0]),		 // Templated
		      //.Scl		(XXSCL),		 // Templated
		      //.Wp		(XXWP),
		      .CS_SEL           (8'b0000_0000)
			);

`ifdef STACK_DIMM
    DIMMx4 dimms0( 
		       .DQ		(XXDQ[127: 64]), // Templated
		       .CB		(XXCB[15: 8]), // Templated
		       .DQS		({XXDQS[26], 
					  XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
					  XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
		       .DM_RDQS		({XXDQS[35], 
					  XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
					  XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22]}),
		       //.Sda		(XXSDA),		 // Templated
		       // Inputs
		       .Addr		(XXADDR[14:0]),		 // Templated
`ifdef DRAM_BANK_BITS2
		       .BA		(XXBA[1:0]),		 // Templated
`else
		       .BA		(XXBA[2:0]),		 // Templated
`endif
		       .CK		({3{TDCLK[0]}}),	 // Templated
		       .bCK		({3{TDCLK_L[0]}}),	 // Templated
		       .CKE		(XXCKE),		 // Templated
		       .bCS		(XXCS_L[1]),		 // Templated
		       .bRAS		(XXRAS_L),		 // Templated
		       .bCAS		(XXCAS_L),		 // Templated
		       .bWE		(XXWE_L),		 // Templated
		       //.Reset_n		(XXRESET_L),		 // Templated
		       //.Sa		(XXSA[2:0]),		 // Templated
		       //.Scl		(XXSCL),		 // Templated
		       //.Wp		(XXWP),
		       .CS_SEL          (8'b0000_0001)
			 );		 // Templated

   DIMMx4 dimms1( 
		      .DQ		(XXDQ[63: 0]), // Templated
		      .CB		({XXCB[7: 0]}), // Templated
		      .DQS		({XXDQS[8], 
					  XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
					  XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
		      .DM_RDQS		({XXDQS[17], 
					  XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
					  XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4]}),
		      //.Sda		(XXSDA),		 // Templated
		      // Inputs
		      .Addr		(XXADDR[14:0]),		 // Templated
`ifdef DRAM_BANK_BITS2
		      .BA		(XXBA[1:0]),		 // Templated
`else
		       .BA		(XXBA[2:0]),		 // Templated
`endif
		      .CK		({3{TDCLK[0]}}),	 // Templated
		      .bCK		({3{TDCLK_L[0]}}),	 // Templated
		      .CKE		(XXCKE),		 // Templated
		      .bCS		(XXCS_L[1]),		 // Templated
		      .bRAS		(XXRAS_L),		 // Templated
		      .bCAS		(XXCAS_L),		 // Templated
		      .bWE		(XXWE_L),		 // Templated
		      //.Reset_n		(XXRESET_L),		 // Templated
		      //.Sa		(XXSA[2:0]),		 // Templated
		      //.Scl		(XXSCL),		 // Templated
		      //.Wp		(XXWP),
		      .CS_SEL           (8'b0000_0001)
			);
`endif

`ifdef RANK_DIMM
   //RANK
    DIMMx4 dimmr0(
		       .DQ		({XXDQ[127: 64]}), // Templated
		       .CB		({XXCB[15: 8]}), // Templated
		       .DQS		({XXDQS[26], 
					  XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
					  XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
		       .DM_RDQS		({XXDQS[35], 
					  XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
					  XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22]}),
		       //.Sda		(XXSDA),		 // Templated
		       // Inputs
		       .Addr		(XXADDR[14:0]),		 // Templated
`ifdef DRAM_BANK_BITS2
		       .BA		(XXBA[1:0]),		 // Templated
`else
		       .BA		(XXBA[2:0]),		 // Templated
`endif
		       .CK		({3{TDCLK[0]}}),	 // Templated
		       .bCK		({3{TDCLK_L[0]}}),	 // Templated
		       .CKE		(XXCKE),		 // Templated
		       .bCS		(XXCS_L[2]),		 // Templated
		       .bRAS		(XXRAS_L),		 // Templated
		       .bCAS		(XXCAS_L),		 // Templated
		       .bWE		(XXWE_L),		 // Templated
		       //.Reset_n		(XXRESET_L),		 // Templated
		       //.Sa		(XXSA[2:0]),		 // Templated
		       //.Scl		(XXSCL),		 // Templated
		       //.Wp		(XXWP),
		       .CS_SEL          (8'b0000_0010)
			);

   DIMMx4 dimmr1( 
		      .DQ		({XXDQ[63: 0]}), // Templated
		      .CB		({XXCB[7: 0]}), // Templated
		      .DQS		({XXDQS[8], 
					  XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
					  XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
		      .DM_RDQS		({XXDQS[17], 
					  XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
					  XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4]}),
		      //.Sda		(XXSDA),		 // Templated
		      // Inputs
		      .Addr		(XXADDR[14:0]),		 // Templated
`ifdef DRAM_BANK_BITS2
		      .BA		(XXBA[1:0]),		 // Templated
`else
		       .BA		(XXBA[2:0]),		 // Templated
`endif
		      .CK		({3{TDCLK[0]}}),	 // Templated
		      .bCK		({3{TDCLK_L[0]}}),	 // Templated
		      .CKE		(XXCKE),		 // Templated
		      .bCS		(XXCS_L[2]),		 // Templated
		      .bRAS		(XXRAS_L),		 // Templated
		      .bCAS		(XXCAS_L),		 // Templated
		      .bWE		(XXWE_L),		 // Templated
		      //.Reset_n		(XXRESET_L),		 // Templated
		      //.Sa		(XXSA[2:0]),		 // Templated
		      //.Scl		(XXSCL),		 // Templated
		      //.Wp		(XXWP),
		      .CS_SEL           (8'b0000_0010)
			);
   
`ifdef STACK_DIMM
    DIMMx4 dimmr2(
		       .DQ		({XXDQ[127: 64]}), // Templated
		       .CB		({XXCB[15: 8]}), // Templated
		       .DQS		({XXDQS[26], 
					  XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
					  XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
		       .DM_RDQS		({XXDQS[35], 
					  XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
					  XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22]}),
		       //.Sda		(XXSDA),		 // Templated
		       // Inputs
		       .Addr		(XXADDR[14:0]),		 // Templated
`ifdef DRAM_BANK_BITS2
		       .BA		(XXBA[1:0]),		 // Templated
`else
		       .BA		(XXBA[2:0]),		 // Templated
`endif
		       .CK		({3{TDCLK[0]}}),	 // Templated
		       .bCK		({3{TDCLK_L[0]}}),	 // Templated
		       .CKE		(XXCKE),		 // Templated
		       .bCS		(XXCS_L[3]),		 // Templated
		       .bRAS		(XXRAS_L),		 // Templated
		       .bCAS		(XXCAS_L),		 // Templated
		       .bWE		(XXWE_L),		 // Templated
		       //.Reset_n		(XXRESET_L),		 // Templated
		       //.Sa		(XXSA[2:0]),		 // Templated
		       //.Scl		(XXSCL),		 // Templated
		       //.Wp		(XXWP),
		       .CS_SEL          (8'b0000_0011)
			);

   DIMMx4 dimmr3( 
		      .DQ		({XXDQ[63: 0]}), // Templated
		      .CB		({XXCB[7: 0]}), // Templated
		      .DQS		({XXDQS[8], 
					  XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
					  XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
		      .DM_RDQS		({XXDQS[17], 
					  XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
					  XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4]}),
		      //.Sda		(XXSDA),		 // Templated
		      // Inputs
		      .Addr		(XXADDR[14:0]),		 // Templated
`ifdef DRAM_BANK_BITS2
		      .BA		(XXBA[1:0]),		 // Templated
`else
		       .BA		(XXBA[2:0]),		 // Templated
`endif
		      .CK		({3{TDCLK[0]}}),	 // Templated
		      .bCK		({3{TDCLK_L[0]}}),	 // Templated
		      .CKE		(XXCKE),		 // Templated
		      .bCS		(XXCS_L[3]),		 // Templated
		      .bRAS		(XXRAS_L),		 // Templated
		      .bCAS		(XXCAS_L),		 // Templated
		      .bWE		(XXWE_L),		 // Templated
		      //.Reset_n		(XXRESET_L),		 // Templated
		      //.Sa		(XXSA[2:0]),		 // Templated
		      //.Scl		(XXSCL),		 // Templated
		      //.Wp		(XXWP),
		      .CS_SEL           (8'b0000_0011)
			);
`endif 	// STACK_DIMM
`endif 	// RANK_DIMM

`else	// DRAM_SAT

    reg     dram_init_done;
    wire new_addr_bit1 = ~XXCS_L[2] | ~XXCS_L[3];
    wire new_addr_bit0 = ~XXCS_L[1] | ~XXCS_L[3];
    wire new_cs = XXCS_L[0] & XXCS_L[1] & XXCS_L[2] & XXCS_L[3];
    // TURN OFF REFRESHES AS IT CAUSES ERRORS IN THIS MODE
    wire new_XXRAS_L = XXRAS_L | (dram_init_done & ~XXRAS_L & ~XXCAS_L ? 1'b1 : 1'b0);
    wire new_XXCAS_L = XXCAS_L | (dram_init_done & ~XXRAS_L & ~XXCAS_L ? 1'b1 : 1'b0);

    initial dram_init_done = 1'b0;
    always @ (posedge XXCLK) begin
        if(dram_init_done) dram_init_done = 1'b1;
        if(~dram_init_done & ~XXRAS_L & XXCAS_L & XXWE_L) dram_init_done = 1'b1;
    end

`ifdef INFINEON
    RDIMM_1R_x4 dimm0(
                       .DQ              (XXDQ[127: 64]), // Templated
                       .CB              (XXCB[15: 8]), // Templated
                       .DQS             ({XXDQS[26],
                                          XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
                                          XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
                       .DM_RDQS         ({XXDQS[35],
                                          XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
                                          XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22]}),
                       //.Sda           (XXSDA),                 // Templated
                       // Inputs
                       .Addr            ({new_addr_bit1, new_addr_bit0, XXADDR[14:0]}), // Templated
`ifdef DRAM_BANK_BITS2 
                       .BA              (XXBA[1:0]),             // Templated
`else
                       .BA              (XXBA[2:0]),             // Templated
`endif  
                       .CK              ({3{TDCLK[0]}}),         // Templated
                       .bCK             ({3{TDCLK_L[0]}}),       // Templated
                       .CKE             ({XXCKE,XXCKE}),         // Templated
                       .bCS             ({new_cs,new_cs}),       // Templated
                       .bRAS            (new_XXRAS_L),           // Templated
                       .bCAS            (new_XXCAS_L),           // Templated
                       .bWE             (XXWE_L),                // Templated
                       //.Reset_n               (XXRESET_L),             // Templated
                       //.Sa            (XXSA[2:0]),             // Templated
                       //.Scl           (XXSCL),                 // Templated
                       //.Wp            (XXWP),
		       .ODT          (2'b00),
                       .CS_SEL          (8'b0000_0000)
                         );              // Templated

   RDIMM_1R_x4 dimm1(
                      .DQ               (XXDQ[63: 0]), // Templated
                      .CB               ({XXCB[7: 0]}), // Templated
                      .DQS              ({XXDQS[8],
                                          XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
                                          XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
                      .DM_RDQS          ({XXDQS[17],
                                          XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
                                          XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4]}),
                      //.Sda            (XXSDA),                 // Templated
                      // Inputs
                      .Addr             ({new_addr_bit1, new_addr_bit0, XXADDR[14:0]}),	// Templated
`ifdef DRAM_BANK_BITS2
                      .BA               (XXBA[1:0]),             // Templated
`else
                      .BA               (XXBA[2:0]),             // Templated
`endif
                      .CK               ({3{TDCLK[0]}}),         // Templated
                      .bCK              ({3{TDCLK_L[0]}}),       // Templated
                      .CKE              ({XXCKE,XXCKE}),         // Templated
                      .bCS              ({new_cs,new_cs}),       // Templated
                      .bRAS             (new_XXRAS_L),           // Templated
                      .bCAS             (new_XXCAS_L),           // Templated
                      .bWE              (XXWE_L),                // Templated
                      //.Reset_n                (XXRESET_L),             // Templated
                      //.Sa             (XXSA[2:0]),             // Templated
                      //.Scl            (XXSCL),                 // Templated
                      //.Wp             (XXWP),
		       .ODT          (2'b00),
                      .CS_SEL           (8'b0000_0000)
                        );
`else

    dimm dimm0(
                       .dataq            (XXDQ[127: 64]), // Templated
                       .ecc              (XXCB[15: 8]), // Templated
                       .dqs             ({XXDQS[26],
                                          XXDQS[30], XXDQS[21], XXDQS[29], XXDQS[20],
                                          XXDQS[28], XXDQS[19], XXDQS[27], XXDQS[18]}), // Templated
                       .dm_rdqs         ({XXDQS[35],
                                          XXDQS[34], XXDQS[25], XXDQS[33], XXDQS[24],
                                          XXDQS[32], XXDQS[23], XXDQS[31], XXDQS[22]}),
                       // Inputs
                       .addr            ({new_addr_bit1, new_addr_bit0, XXADDR[14:0]}), // Templated
`ifdef DRAM_BANK_BITS2 
                       .ba              (XXBA[1:0]),             // Templated
`else
                       .ba              (XXBA[2:0]),             // Templated
`endif  
                       .clk              ({3{TDCLK[0]}}),         // Templated
                       .cs             ({new_cs,new_cs}),       // Templated
                       .ras            (new_XXRAS_L),           // Templated
                       .cas            (new_XXCAS_L),           // Templated
                       .we             (XXWE_L),                // Templated
                       .cs_sel          (8'b0000_0000)
                         );              // Templated

   dimm dimm1(
                      .dataq               (XXDQ[63: 0]), // Templated
                      .ecc               ({XXCB[7: 0]}), // Templated
                      .dqs              ({XXDQS[8],
                                          XXDQS[12], XXDQS[3], XXDQS[11], XXDQS[2],
                                          XXDQS[10], XXDQS[1], XXDQS[9], XXDQS[0]}), // Templated
                      .dm_rdqs          ({XXDQS[17],
                                          XXDQS[16], XXDQS[7], XXDQS[15], XXDQS[6],
                                          XXDQS[14], XXDQS[5], XXDQS[13], XXDQS[4]}),
                      // Inputs
                      .addr             ({new_addr_bit1, new_addr_bit0, XXADDR[14:0]}),	// Templated
`ifdef DRAM_BANK_BITS2
                      .ba               (XXBA[1:0]),             // Templated
`else
                      .ba               (XXBA[2:0]),             // Templated
`endif
                      .clk               ({3{TDCLK[0]}}),         // Templated
                      .cs              ({new_cs,new_cs}),       // Templated
                      .ras             (new_XXRAS_L),           // Templated
                      .cas             (new_XXCAS_L),           // Templated
                      .we              (XXWE_L),                // Templated
                      .cs_sel           (8'b0000_0000)
                        );

`endif // ifdef INFINEON

`endif	// `elseif DRAM_SAT
`endif  // `elseif MICRO_ON

endmodule //

// Local Variables:
// verilog-library-directories:("." "../../../../verif/model/verilog/mem/dram/" "../../../../verif/model/verilog/mem/denali/")
// verilog-library-extensions:(".v" ".h")
// End:
