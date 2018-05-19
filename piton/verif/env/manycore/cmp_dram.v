// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cmp_dram.v
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

module cmp_dram( /*AUTOARG*/
   // Inouts
   DRAM0_CB, DRAM0_DQ, DRAM0_DQS, DRAM1_CB, DRAM1_DQ, DRAM1_DQS, 
   DRAM2_CB, DRAM2_DQ, DRAM2_DQS, DRAM3_CB, DRAM3_DQ, DRAM3_DQS, 
   DRAM02_SDA, DRAM13_SDA, 
   // Inputs
   dram_gclk, cmp_grst, XXWP, XXSA, DRAM_FAIL_PART, DRAM_FAIL_OVER, 
   DRAM3_WE_L, DRAM3_RST_L, DRAM3_RAS_L, DRAM3_CS_L, DRAM3_CK_P, 
   DRAM3_CK_N, DRAM3_CKE, DRAM3_CAS_L, DRAM3_BA, DRAM3_ADDR, 
   DRAM2_WE_L, DRAM2_RST_L, DRAM2_RAS_L, DRAM2_CS_L, DRAM2_CK_P, 
   DRAM2_CK_N, DRAM2_CKE, DRAM2_CAS_L, DRAM2_BA, DRAM2_ADDR, 
   DRAM1_WE_L, DRAM1_RST_L, DRAM1_RAS_L, DRAM1_CS_L, DRAM1_CK_P, 
   DRAM1_CK_N, DRAM1_CKE, DRAM1_CAS_L, DRAM1_BA, DRAM1_ADDR, 
   DRAM0_WE_L, DRAM0_RST_L, DRAM0_RAS_L, DRAM0_CS_L, DRAM0_CK_P, 
   DRAM0_CK_N, DRAM0_CKE, DRAM0_CAS_L, DRAM0_BA, DRAM0_ADDR, 
   DRAM02_SCL, DRAM13_SCL
   );
   
   inout [15:0]		DRAM0_CB;		// To/From mem0 of ch_mem.v
   inout [127:0]	DRAM0_DQ;		// To/From mem0 of ch_mem.v, ...
   inout [35:0]		DRAM0_DQS;		// To/From mem0 of ch_mem.v
   inout [15:0]		DRAM1_CB;		// To/From mem1 of ch_mem.v
   inout [127:0]	DRAM1_DQ;		// To/From mem1 of ch_mem.v, ...
   inout [35:0]		DRAM1_DQS;		// To/From mem1 of ch_mem.v
   inout [15:0]		DRAM2_CB;		// To/From mem2 of ch_mem.v
   inout [127:0]	DRAM2_DQ;		// To/From mem2 of ch_mem.v, ...
   inout [35:0]		DRAM2_DQS;		// To/From mem2 of ch_mem.v
   inout [15:0]		DRAM3_CB;		// To/From mem3 of ch_mem.v
   inout [127:0]	DRAM3_DQ;		// To/From mem3 of ch_mem.v, ...
   inout [35:0]		DRAM3_DQS;		// To/From mem3 of ch_mem.v

   inout 		DRAM02_SDA;
   inout 		DRAM13_SDA;
   input		DRAM02_SCL;
   input		DRAM13_SCL;

   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   // End of automatics
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input [14:0]		DRAM0_ADDR;		// To mem0 of ch_mem.v, ...
   input [2:0]		DRAM0_BA;		// To mem0 of ch_mem.v, ...
   input		DRAM0_CAS_L;		// To mem0 of ch_mem.v, ...
   input		DRAM0_CKE;		// To mem0 of ch_mem.v, ...
   input [3:0]		DRAM0_CK_N;		// To mem0 of ch_mem.v
   input [3:0]		DRAM0_CK_P;		// To mem0 of ch_mem.v
   input [3:0]		DRAM0_CS_L;		// To mem0 of ch_mem.v, ...
   input		DRAM0_RAS_L;		// To mem0 of ch_mem.v, ...
   input		DRAM0_RST_L;		// To mem0 of ch_mem.v, ...
   input		DRAM0_WE_L;		// To mem0 of ch_mem.v, ...
   input [14:0]		DRAM1_ADDR;		// To mem1 of ch_mem.v, ...
   input [2:0]		DRAM1_BA;		// To mem1 of ch_mem.v, ...
   input		DRAM1_CAS_L;		// To mem1 of ch_mem.v, ...
   input		DRAM1_CKE;		// To mem1 of ch_mem.v, ...
   input [3:0]		DRAM1_CK_N;		// To mem1 of ch_mem.v
   input [3:0]		DRAM1_CK_P;		// To mem1 of ch_mem.v
   input [3:0]		DRAM1_CS_L;		// To mem1 of ch_mem.v, ...
   input		DRAM1_RAS_L;		// To mem1 of ch_mem.v, ...
   input		DRAM1_RST_L;		// To mem1 of ch_mem.v, ...
   input		DRAM1_WE_L;		// To mem1 of ch_mem.v, ...
   input [14:0]		DRAM2_ADDR;		// To mem2 of ch_mem.v, ...
   input [2:0]		DRAM2_BA;		// To mem2 of ch_mem.v, ...
   input		DRAM2_CAS_L;		// To mem2 of ch_mem.v, ...
   input		DRAM2_CKE;		// To mem2 of ch_mem.v, ...
   input [3:0]		DRAM2_CK_N;		// To mem2 of ch_mem.v
   input [3:0]		DRAM2_CK_P;		// To mem2 of ch_mem.v
   input [3:0]		DRAM2_CS_L;		// To mem2 of ch_mem.v, ...
   input		DRAM2_RAS_L;		// To mem2 of ch_mem.v, ...
   input		DRAM2_RST_L;		// To mem2 of ch_mem.v, ...
   input		DRAM2_WE_L;		// To mem2 of ch_mem.v, ...
   input [14:0]		DRAM3_ADDR;		// To mem3 of ch_mem.v, ...
   input [2:0]		DRAM3_BA;		// To mem3 of ch_mem.v, ...
   input		DRAM3_CAS_L;		// To mem3 of ch_mem.v, ...
   input		DRAM3_CKE;		// To mem3 of ch_mem.v, ...
   input [3:0]		DRAM3_CK_N;		// To mem3 of ch_mem.v
   input [3:0]		DRAM3_CK_P;		// To mem3 of ch_mem.v
   input [3:0]		DRAM3_CS_L;		// To mem3 of ch_mem.v, ...
   input		DRAM3_RAS_L;		// To mem3 of ch_mem.v, ...
   input		DRAM3_RST_L;		// To mem3 of ch_mem.v, ...
   input		DRAM3_WE_L;		// To mem3 of ch_mem.v, ...
   input		DRAM_FAIL_OVER;		// To dimm_if_mon0 of dimm_if_mon.v, ...
   input [5:0]		DRAM_FAIL_PART;		// To dimm_if_mon0 of dimm_if_mon.v, ...
   input [2:0]		XXSA;			// To mem0 of ch_mem.v, ...
   input		XXWP;			// To mem0 of ch_mem.v, ...
   input		cmp_grst;		// To cmp_dram_mon of cmp_dram_mon.v
   input		dram_gclk;		// To cmp_dram_mon of cmp_dram_mon.v, ...
   // End of automatics
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			DRAM01;			// To/From mem0 of ch_mem.v
   wire			DRAM23;			// To/From mem1 of ch_mem.v
   wire			DRAM45;			// To/From mem2 of ch_mem.v
   wire			DRAM67;			// To/From mem3 of ch_mem.v
   // End of automatics

   // Local regs
   wire                 DRAM0_ENB_ERROR;
   wire                 DRAM1_ENB_ERROR;
   wire                 DRAM2_ENB_ERROR;
   wire                 DRAM3_ENB_ERROR;
   wire                 DRAM0_FAIL_OVER;
   wire                 DRAM1_FAIL_OVER;
   wire                 DRAM2_FAIL_OVER;
   wire                 DRAM3_FAIL_OVER;
   wire [5:0]           DRAM0_FAIL_PART;
   wire [5:0]           DRAM1_FAIL_PART;
   wire [5:0]           DRAM2_FAIL_PART;
   wire [5:0]           DRAM3_FAIL_PART;

   integer              am_id00, am_id01, am_id02, am_id03, am_id04, am_id05, am_id06;
   integer              am_id07, am_id08, am_id09, am_id10, am_id11, am_id12, am_id13; 
   integer              am_id14, am_id15, am_id16, am_id17, am_id18, am_id19, am_id20;
   integer              am_id21, am_id22, am_id23, am_id24, am_id25, am_id26, am_id27;
   integer              am_id28, am_id29, am_id30, am_id31, am_id32, am_id33, am_id34;
   integer              am_id35;
   integer              bm_id00, bm_id01, bm_id02, bm_id03, bm_id04, bm_id05, bm_id06;
   integer              bm_id07, bm_id08, bm_id09, bm_id10, bm_id11, bm_id12, bm_id13; 
   integer              bm_id14, bm_id15, bm_id16, bm_id17, bm_id18, bm_id19, bm_id20;
   integer              bm_id21, bm_id22, bm_id23, bm_id24, bm_id25, bm_id26, bm_id27;
   integer              bm_id28, bm_id29, bm_id30, bm_id31, bm_id32, bm_id33, bm_id34;
   integer              bm_id35;
   integer              cm_id00, cm_id01, cm_id02, cm_id03, cm_id04, cm_id05, cm_id06;
   integer              cm_id07, cm_id08, cm_id09, cm_id10, cm_id11, cm_id12, cm_id13; 
   integer              cm_id14, cm_id15, cm_id16, cm_id17, cm_id18, cm_id19, cm_id20;
   integer              cm_id21, cm_id22, cm_id23, cm_id24, cm_id25, cm_id26, cm_id27;
   integer              cm_id28, cm_id29, cm_id30, cm_id31, cm_id32, cm_id33, cm_id34;
   integer              cm_id35;
   integer              dm_id00, dm_id01, dm_id02, dm_id03, dm_id04, dm_id05, dm_id06;
   integer              dm_id07, dm_id08, dm_id09, dm_id10, dm_id11, dm_id12, dm_id13; 
   integer              dm_id14, dm_id15, dm_id16, dm_id17, dm_id18, dm_id19, dm_id20;
   integer              dm_id21, dm_id22, dm_id23, dm_id24, dm_id25, dm_id26, dm_id27;
   integer              dm_id28, dm_id29, dm_id30, dm_id31, dm_id32, dm_id33, dm_id34;
   integer              dm_id35;
   integer              sam_id00, sam_id01, sam_id02, sam_id03, sam_id04, sam_id05, sam_id06;
   integer              sam_id07, sam_id08, sam_id09, sam_id10, sam_id11, sam_id12, sam_id13; 
   integer              sam_id14, sam_id15, sam_id16, sam_id17, sam_id18, sam_id19, sam_id20;
   integer              sam_id21, sam_id22, sam_id23, sam_id24, sam_id25, sam_id26, sam_id27;
   integer              sam_id28, sam_id29, sam_id30, sam_id31, sam_id32, sam_id33, sam_id34;
   integer              sam_id35;
   integer              sbm_id00, sbm_id01, sbm_id02, sbm_id03, sbm_id04, sbm_id05, sbm_id06;
   integer              sbm_id07, sbm_id08, sbm_id09, sbm_id10, sbm_id11, sbm_id12, sbm_id13; 
   integer              sbm_id14, sbm_id15, sbm_id16, sbm_id17, sbm_id18, sbm_id19, sbm_id20;
   integer              sbm_id21, sbm_id22, sbm_id23, sbm_id24, sbm_id25, sbm_id26, sbm_id27;
   integer              sbm_id28, sbm_id29, sbm_id30, sbm_id31, sbm_id32, sbm_id33, sbm_id34;
   integer              sbm_id35;
   integer              scm_id00, scm_id01, scm_id02, scm_id03, scm_id04, scm_id05, scm_id06;
   integer              scm_id07, scm_id08, scm_id09, scm_id10, scm_id11, scm_id12, scm_id13; 
   integer              scm_id14, scm_id15, scm_id16, scm_id17, scm_id18, scm_id19, scm_id20;
   integer              scm_id21, scm_id22, scm_id23, scm_id24, scm_id25, scm_id26, scm_id27;
   integer              scm_id28, scm_id29, scm_id30, scm_id31, scm_id32, scm_id33, scm_id34;
   integer              scm_id35;
   integer              sdm_id00, sdm_id01, sdm_id02, sdm_id03, sdm_id04, sdm_id05, sdm_id06;
   integer              sdm_id07, sdm_id08, sdm_id09, sdm_id10, sdm_id11, sdm_id12, sdm_id13; 
   integer              sdm_id14, sdm_id15, sdm_id16, sdm_id17, sdm_id18, sdm_id19, sdm_id20;
   integer              sdm_id21, sdm_id22, sdm_id23, sdm_id24, sdm_id25, sdm_id26, sdm_id27;
   integer              sdm_id28, sdm_id29, sdm_id30, sdm_id31, sdm_id32, sdm_id33, sdm_id34;
   integer              sdm_id35;
   integer              ram_id00, ram_id01, ram_id02, ram_id03, ram_id04, ram_id05, ram_id06;
   integer              ram_id07, ram_id08, ram_id09, ram_id10, ram_id11, ram_id12, ram_id13; 
   integer              ram_id14, ram_id15, ram_id16, ram_id17, ram_id18, ram_id19, ram_id20;
   integer              ram_id21, ram_id22, ram_id23, ram_id24, ram_id25, ram_id26, ram_id27;
   integer              ram_id28, ram_id29, ram_id30, ram_id31, ram_id32, ram_id33, ram_id34;
   integer              ram_id35;
   integer              rbm_id00, rbm_id01, rbm_id02, rbm_id03, rbm_id04, rbm_id05, rbm_id06;
   integer              rbm_id07, rbm_id08, rbm_id09, rbm_id10, rbm_id11, rbm_id12, rbm_id13; 
   integer              rbm_id14, rbm_id15, rbm_id16, rbm_id17, rbm_id18, rbm_id19, rbm_id20;
   integer              rbm_id21, rbm_id22, rbm_id23, rbm_id24, rbm_id25, rbm_id26, rbm_id27;
   integer              rbm_id28, rbm_id29, rbm_id30, rbm_id31, rbm_id32, rbm_id33, rbm_id34;
   integer              rbm_id35;
   integer              rcm_id00, rcm_id01, rcm_id02, rcm_id03, rcm_id04, rcm_id05, rcm_id06;
   integer              rcm_id07, rcm_id08, rcm_id09, rcm_id10, rcm_id11, rcm_id12, rcm_id13; 
   integer              rcm_id14, rcm_id15, rcm_id16, rcm_id17, rcm_id18, rcm_id19, rcm_id20;
   integer              rcm_id21, rcm_id22, rcm_id23, rcm_id24, rcm_id25, rcm_id26, rcm_id27;
   integer              rcm_id28, rcm_id29, rcm_id30, rcm_id31, rcm_id32, rcm_id33, rcm_id34;
   integer              rcm_id35;
   integer              rdm_id00, rdm_id01, rdm_id02, rdm_id03, rdm_id04, rdm_id05, rdm_id06;
   integer              rdm_id07, rdm_id08, rdm_id09, rdm_id10, rdm_id11, rdm_id12, rdm_id13; 
   integer              rdm_id14, rdm_id15, rdm_id16, rdm_id17, rdm_id18, rdm_id19, rdm_id20;
   integer              rdm_id21, rdm_id22, rdm_id23, rdm_id24, rdm_id25, rdm_id26, rdm_id27;
   integer              rdm_id28, rdm_id29, rdm_id30, rdm_id31, rdm_id32, rdm_id33, rdm_id34;
   integer              rdm_id35;
   integer              rsam_id00, rsam_id01, rsam_id02, rsam_id03, rsam_id04, rsam_id05, rsam_id06;
   integer              rsam_id07, rsam_id08, rsam_id09, rsam_id10, rsam_id11, rsam_id12, rsam_id13; 
   integer              rsam_id14, rsam_id15, rsam_id16, rsam_id17, rsam_id18, rsam_id19, rsam_id20;
   integer              rsam_id21, rsam_id22, rsam_id23, rsam_id24, rsam_id25, rsam_id26, rsam_id27;
   integer              rsam_id28, rsam_id29, rsam_id30, rsam_id31, rsam_id32, rsam_id33, rsam_id34;
   integer              rsam_id35;
   integer              rsbm_id00, rsbm_id01, rsbm_id02, rsbm_id03, rsbm_id04, rsbm_id05, rsbm_id06;
   integer              rsbm_id07, rsbm_id08, rsbm_id09, rsbm_id10, rsbm_id11, rsbm_id12, rsbm_id13; 
   integer              rsbm_id14, rsbm_id15, rsbm_id16, rsbm_id17, rsbm_id18, rsbm_id19, rsbm_id20;
   integer              rsbm_id21, rsbm_id22, rsbm_id23, rsbm_id24, rsbm_id25, rsbm_id26, rsbm_id27;
   integer              rsbm_id28, rsbm_id29, rsbm_id30, rsbm_id31, rsbm_id32, rsbm_id33, rsbm_id34;
   integer              rsbm_id35;
   integer              rscm_id00, rscm_id01, rscm_id02, rscm_id03, rscm_id04, rscm_id05, rscm_id06;
   integer              rscm_id07, rscm_id08, rscm_id09, rscm_id10, rscm_id11, rscm_id12, rscm_id13; 
   integer              rscm_id14, rscm_id15, rscm_id16, rscm_id17, rscm_id18, rscm_id19, rscm_id20;
   integer              rscm_id21, rscm_id22, rscm_id23, rscm_id24, rscm_id25, rscm_id26, rscm_id27;
   integer              rscm_id28, rscm_id29, rscm_id30, rscm_id31, rscm_id32, rscm_id33, rscm_id34;
   integer              rscm_id35;
   integer              rsdm_id00, rsdm_id01, rsdm_id02, rsdm_id03, rsdm_id04, rsdm_id05, rsdm_id06;
   integer              rsdm_id07, rsdm_id08, rsdm_id09, rsdm_id10, rsdm_id11, rsdm_id12, rsdm_id13; 
   integer              rsdm_id14, rsdm_id15, rsdm_id16, rsdm_id17, rsdm_id18, rsdm_id19, rsdm_id20;
   integer              rsdm_id21, rsdm_id22, rsdm_id23, rsdm_id24, rsdm_id25, rsdm_id26, rsdm_id27;
   integer              rsdm_id28, rsdm_id29, rsdm_id30, rsdm_id31, rsdm_id32, rsdm_id33, rsdm_id34;
   integer              rsdm_id35;

   integer              avid0, avid1, avid2, avid3, avid4;
   integer              bvid0, bvid1, bvid2, bvid3, bvid4;
   integer              cvid0, cvid1, cvid2, cvid3, cvid4;
   integer              dvid0, dvid1, dvid2, dvid3, dvid4;
   integer              savid0, savid1, savid2, savid3, savid4;
   integer              sbvid0, sbvid1, sbvid2, sbvid3, sbvid4;
   integer              scvid0, scvid1, scvid2, scvid3, scvid4;
   integer              sdvid0, sdvid1, sdvid2, sdvid3, sdvid4;

   integer              ravid0, ravid1, ravid2, ravid3, ravid4;
   integer              rbvid0, rbvid1, rbvid2, rbvid3, rbvid4;
   integer              rcvid0, rcvid1, rcvid2, rcvid3, rcvid4;
   integer              rdvid0, rdvid1, rdvid2, rdvid3, rdvid4;
   integer              rsavid0, rsavid1, rsavid2, rsavid3, rsavid4;
   integer              rsbvid0, rsbvid1, rsbvid2, rsbvid3, rsbvid4;
   integer              rscvid0, rscvid1, rscvid2, rscvid3, rscvid4;
   integer              rsdvid0, rsdvid1, rsdvid2, rsdvid3, rsdvid4;

   integer              vid5, vid6; 
   integer              svid5, svid6;

   integer              rvid5, rvid6; 
   integer              rsvid5, rsvid6;
   integer              success;

   reg       [3:0]      cas_latency;

`ifdef DENALI_ON

initial begin

  /////////////////////////////////////////
  // Create Denali System Memory

  /////////////////////////
  // RANK 0, Stack 0

  // Channel 0
  #10 // wait for mem.image.
  am_id00 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U00");
  am_id01 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U01");
  am_id02 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U02");
  am_id03 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U03");
  am_id04 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U04");
  am_id05 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U05");
  am_id06 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U06");
  am_id07 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U07");
  am_id08 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U08");
  am_id09 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U09");
  am_id10 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U10");
  am_id11 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U11");
  am_id12 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U12");
  am_id13 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U13");
  am_id14 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U14");
  am_id15 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U15");
  am_id16 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U16");
  am_id17 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U17");

  am_id18 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U00");
  am_id19 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U01");
  am_id20 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U02");
  am_id21 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U03");
  am_id22 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U04");
  am_id23 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U05");
  am_id24 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U06");
  am_id25 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U07");
  am_id26 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U08");
  am_id27 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U09");
  am_id28 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U10");
  am_id29 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U11");
  am_id30 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U12");
  am_id31 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U13");
  am_id32 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U14");
  am_id33 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U15");
  am_id34 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U16");
  am_id35 = $mminstanceid("cmp_top.cmp_dram.mem0.dimm1.U17");
   
  // Channel 1 
  bm_id00 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U00");
  bm_id01 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U01");
  bm_id02 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U02");
  bm_id03 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U03");
  bm_id04 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U04");
  bm_id05 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U05");
  bm_id06 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U06");
  bm_id07 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U07");
  bm_id08 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U08");
  bm_id09 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U09");
  bm_id10 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U10");
  bm_id11 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U11");
  bm_id12 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U12");
  bm_id13 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U13");
  bm_id14 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U14");
  bm_id15 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U15");
  bm_id16 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U16");
  bm_id17 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U17");

  bm_id18 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U00");
  bm_id19 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U01");
  bm_id20 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U02");
  bm_id21 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U03");
  bm_id22 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U04");
  bm_id23 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U05");
  bm_id24 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U06");
  bm_id25 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U07");
  bm_id26 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U08");
  bm_id27 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U09");
  bm_id28 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U10");
  bm_id29 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U11");
  bm_id30 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U12");
  bm_id31 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U13");
  bm_id32 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U14");
  bm_id33 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U15");
  bm_id34 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U16");
  bm_id35 = $mminstanceid("cmp_top.cmp_dram.mem1.dimm1.U17");


  // Channe 2
  cm_id00 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U00");
  cm_id01 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U01");
  cm_id02 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U02");
  cm_id03 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U03");
  cm_id04 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U04");
  cm_id05 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U05");
  cm_id06 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U06");
  cm_id07 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U07");
  cm_id08 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U08");
  cm_id09 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U09");
  cm_id10 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U10");
  cm_id11 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U11");
  cm_id12 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U12");
  cm_id13 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U13");
  cm_id14 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U14");
  cm_id15 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U15");
  cm_id16 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U16");
  cm_id17 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U17");

  cm_id18 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U00");
  cm_id19 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U01");
  cm_id20 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U02");
  cm_id21 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U03");
  cm_id22 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U04");
  cm_id23 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U05");
  cm_id24 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U06");
  cm_id25 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U07");
  cm_id26 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U08");
  cm_id27 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U09");
  cm_id28 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U10");
  cm_id29 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U11");
  cm_id30 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U12");
  cm_id31 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U13");
  cm_id32 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U14");
  cm_id33 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U15");
  cm_id34 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U16");
  cm_id35 = $mminstanceid("cmp_top.cmp_dram.mem2.dimm1.U17");


  // channel 3 
  dm_id00 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U00");
  dm_id01 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U01");
  dm_id02 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U02");
  dm_id03 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U03");
  dm_id04 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U04");
  dm_id05 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U05");
  dm_id06 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U06");
  dm_id07 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U07");
  dm_id08 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U08");
  dm_id09 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U09");
  dm_id10 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U10");
  dm_id11 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U11");
  dm_id12 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U12");
  dm_id13 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U13");
  dm_id14 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U14");
  dm_id15 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U15");
  dm_id16 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U16");
  dm_id17 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U17");

  dm_id18 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U00");
  dm_id19 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U01");
  dm_id20 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U02");
  dm_id21 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U03");
  dm_id22 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U04");
  dm_id23 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U05");
  dm_id24 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U06");
  dm_id25 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U07");
  dm_id26 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U08");
  dm_id27 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U09");
  dm_id28 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U10");
  dm_id29 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U11");
  dm_id30 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U12");
  dm_id31 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U13");
  dm_id32 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U14");
  dm_id33 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U15");
  dm_id34 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U16");
  dm_id35 = $mminstanceid("cmp_top.cmp_dram.mem3.dimm1.U17");

  //////////////////////////////////////
  //workaround: for nested width problem
  
  // Channel 0
  avid4 = $mmcreatesysmem("sysmem","a_dimm144",36,1,1);
  success=$mmaddtosysmem(avid4,am_id13,0,0,0);
  success=$mmaddtosysmem(avid4,am_id04,1,0,0);
  success=$mmaddtosysmem(avid4,am_id31,2,0,0);
  success=$mmaddtosysmem(avid4,am_id22,3,0,0);

  success=$mmaddtosysmem(avid4,am_id17,4,0,0);
  success=$mmaddtosysmem(avid4,am_id16,5,0,0);
  success=$mmaddtosysmem(avid4,am_id15,6,0,0);
  success=$mmaddtosysmem(avid4,am_id14,7,0,0);
  success=$mmaddtosysmem(avid4,am_id12,8,0,0);
  success=$mmaddtosysmem(avid4,am_id11,9,0,0);
  success=$mmaddtosysmem(avid4,am_id10,10,0,0);
  success=$mmaddtosysmem(avid4,am_id09,11,0,0);
  success=$mmaddtosysmem(avid4,am_id08,12,0,0);
  success=$mmaddtosysmem(avid4,am_id07,13,0,0);
  success=$mmaddtosysmem(avid4,am_id06,14,0,0);
  success=$mmaddtosysmem(avid4,am_id05,15,0,0);
  success=$mmaddtosysmem(avid4,am_id03,16,0,0);
  success=$mmaddtosysmem(avid4,am_id02,17,0,0);
  success=$mmaddtosysmem(avid4,am_id01,18,0,0);
  success=$mmaddtosysmem(avid4,am_id00,19,0,0);

  success=$mmaddtosysmem(avid4,am_id35,20,0,0);
  success=$mmaddtosysmem(avid4,am_id34,21,0,0);
  success=$mmaddtosysmem(avid4,am_id33,22,0,0);
  success=$mmaddtosysmem(avid4,am_id32,23,0,0);
  success=$mmaddtosysmem(avid4,am_id30,24,0,0);
  success=$mmaddtosysmem(avid4,am_id29,25,0,0);
  success=$mmaddtosysmem(avid4,am_id28,26,0,0);
  success=$mmaddtosysmem(avid4,am_id27,27,0,0);
  success=$mmaddtosysmem(avid4,am_id26,28,0,0);
  success=$mmaddtosysmem(avid4,am_id25,29,0,0);
  success=$mmaddtosysmem(avid4,am_id24,30,0,0);
  success=$mmaddtosysmem(avid4,am_id23,31,0,0);
  success=$mmaddtosysmem(avid4,am_id21,32,0,0);
  success=$mmaddtosysmem(avid4,am_id20,33,0,0);
  success=$mmaddtosysmem(avid4,am_id19,34,0,0);
  success=$mmaddtosysmem(avid4,am_id18,35,0,0);


  // Channel 1
  bvid4 = $mmcreatesysmem("sysmem","b_dimm144",36,1,1);
  success=$mmaddtosysmem(bvid4,bm_id13,0,0,0);
  success=$mmaddtosysmem(bvid4,bm_id04,1,0,0);
  success=$mmaddtosysmem(bvid4,bm_id31,2,0,0);
  success=$mmaddtosysmem(bvid4,bm_id22,3,0,0);

  success=$mmaddtosysmem(bvid4,bm_id17,4,0,0);
  success=$mmaddtosysmem(bvid4,bm_id16,5,0,0);
  success=$mmaddtosysmem(bvid4,bm_id15,6,0,0);
  success=$mmaddtosysmem(bvid4,bm_id14,7,0,0);
  success=$mmaddtosysmem(bvid4,bm_id12,8,0,0);
  success=$mmaddtosysmem(bvid4,bm_id11,9,0,0);
  success=$mmaddtosysmem(bvid4,bm_id10,10,0,0);
  success=$mmaddtosysmem(bvid4,bm_id09,11,0,0);
  success=$mmaddtosysmem(bvid4,bm_id08,12,0,0);
  success=$mmaddtosysmem(bvid4,bm_id07,13,0,0);
  success=$mmaddtosysmem(bvid4,bm_id06,14,0,0);
  success=$mmaddtosysmem(bvid4,bm_id05,15,0,0);
  success=$mmaddtosysmem(bvid4,bm_id03,16,0,0);
  success=$mmaddtosysmem(bvid4,bm_id02,17,0,0);
  success=$mmaddtosysmem(bvid4,bm_id01,18,0,0);
  success=$mmaddtosysmem(bvid4,bm_id00,19,0,0);

  success=$mmaddtosysmem(bvid4,bm_id35,20,0,0);
  success=$mmaddtosysmem(bvid4,bm_id34,21,0,0);
  success=$mmaddtosysmem(bvid4,bm_id33,22,0,0);
  success=$mmaddtosysmem(bvid4,bm_id32,23,0,0);
  success=$mmaddtosysmem(bvid4,bm_id30,24,0,0);
  success=$mmaddtosysmem(bvid4,bm_id29,25,0,0);
  success=$mmaddtosysmem(bvid4,bm_id28,26,0,0);
  success=$mmaddtosysmem(bvid4,bm_id27,27,0,0);
  success=$mmaddtosysmem(bvid4,bm_id26,28,0,0);
  success=$mmaddtosysmem(bvid4,bm_id25,29,0,0);
  success=$mmaddtosysmem(bvid4,bm_id24,30,0,0);
  success=$mmaddtosysmem(bvid4,bm_id23,31,0,0);
  success=$mmaddtosysmem(bvid4,bm_id21,32,0,0);
  success=$mmaddtosysmem(bvid4,bm_id20,33,0,0);
  success=$mmaddtosysmem(bvid4,bm_id19,34,0,0);
  success=$mmaddtosysmem(bvid4,bm_id18,35,0,0);

  // Channel 2
  cvid4 = $mmcreatesysmem("sysmem","c_dimm144",36,1,1);
  success=$mmaddtosysmem(cvid4,cm_id13,0,0,0);
  success=$mmaddtosysmem(cvid4,cm_id04,1,0,0);
  success=$mmaddtosysmem(cvid4,cm_id31,2,0,0);
  success=$mmaddtosysmem(cvid4,cm_id22,3,0,0);

  success=$mmaddtosysmem(cvid4,cm_id17,4,0,0);
  success=$mmaddtosysmem(cvid4,cm_id16,5,0,0);
  success=$mmaddtosysmem(cvid4,cm_id15,6,0,0);
  success=$mmaddtosysmem(cvid4,cm_id14,7,0,0);
  success=$mmaddtosysmem(cvid4,cm_id12,8,0,0);
  success=$mmaddtosysmem(cvid4,cm_id11,9,0,0);
  success=$mmaddtosysmem(cvid4,cm_id10,10,0,0);
  success=$mmaddtosysmem(cvid4,cm_id09,11,0,0);
  success=$mmaddtosysmem(cvid4,cm_id08,12,0,0);
  success=$mmaddtosysmem(cvid4,cm_id07,13,0,0);
  success=$mmaddtosysmem(cvid4,cm_id06,14,0,0);
  success=$mmaddtosysmem(cvid4,cm_id05,15,0,0);
  success=$mmaddtosysmem(cvid4,cm_id03,16,0,0);
  success=$mmaddtosysmem(cvid4,cm_id02,17,0,0);
  success=$mmaddtosysmem(cvid4,cm_id01,18,0,0);
  success=$mmaddtosysmem(cvid4,cm_id00,19,0,0);

  success=$mmaddtosysmem(cvid4,cm_id35,20,0,0);
  success=$mmaddtosysmem(cvid4,cm_id34,21,0,0);
  success=$mmaddtosysmem(cvid4,cm_id33,22,0,0);
  success=$mmaddtosysmem(cvid4,cm_id32,23,0,0);
  success=$mmaddtosysmem(cvid4,cm_id30,24,0,0);
  success=$mmaddtosysmem(cvid4,cm_id29,25,0,0);
  success=$mmaddtosysmem(cvid4,cm_id28,26,0,0);
  success=$mmaddtosysmem(cvid4,cm_id27,27,0,0);
  success=$mmaddtosysmem(cvid4,cm_id26,28,0,0);
  success=$mmaddtosysmem(cvid4,cm_id25,29,0,0);
  success=$mmaddtosysmem(cvid4,cm_id24,30,0,0);
  success=$mmaddtosysmem(cvid4,cm_id23,31,0,0);
  success=$mmaddtosysmem(cvid4,cm_id21,32,0,0);
  success=$mmaddtosysmem(cvid4,cm_id20,33,0,0);
  success=$mmaddtosysmem(cvid4,cm_id19,34,0,0);
  success=$mmaddtosysmem(cvid4,cm_id18,35,0,0);


  // Channel 3
  dvid4 = $mmcreatesysmem("sysmem","d_dimm144",36,1,1);
  success=$mmaddtosysmem(dvid4,dm_id13,0,0,0);
  success=$mmaddtosysmem(dvid4,dm_id04,1,0,0);
  success=$mmaddtosysmem(dvid4,dm_id31,2,0,0);
  success=$mmaddtosysmem(dvid4,dm_id22,3,0,0);

  success=$mmaddtosysmem(dvid4,dm_id17,4,0,0);
  success=$mmaddtosysmem(dvid4,dm_id16,5,0,0);
  success=$mmaddtosysmem(dvid4,dm_id15,6,0,0);
  success=$mmaddtosysmem(dvid4,dm_id14,7,0,0);
  success=$mmaddtosysmem(dvid4,dm_id12,8,0,0);
  success=$mmaddtosysmem(dvid4,dm_id11,9,0,0);
  success=$mmaddtosysmem(dvid4,dm_id10,10,0,0);
  success=$mmaddtosysmem(dvid4,dm_id09,11,0,0);
  success=$mmaddtosysmem(dvid4,dm_id08,12,0,0);
  success=$mmaddtosysmem(dvid4,dm_id07,13,0,0);
  success=$mmaddtosysmem(dvid4,dm_id06,14,0,0);
  success=$mmaddtosysmem(dvid4,dm_id05,15,0,0);
  success=$mmaddtosysmem(dvid4,dm_id03,16,0,0);
  success=$mmaddtosysmem(dvid4,dm_id02,17,0,0);
  success=$mmaddtosysmem(dvid4,dm_id01,18,0,0);
  success=$mmaddtosysmem(dvid4,dm_id00,19,0,0);

  success=$mmaddtosysmem(dvid4,dm_id35,20,0,0);
  success=$mmaddtosysmem(dvid4,dm_id34,21,0,0);
  success=$mmaddtosysmem(dvid4,dm_id33,22,0,0);
  success=$mmaddtosysmem(dvid4,dm_id32,23,0,0);
  success=$mmaddtosysmem(dvid4,dm_id30,24,0,0);
  success=$mmaddtosysmem(dvid4,dm_id29,25,0,0);
  success=$mmaddtosysmem(dvid4,dm_id28,26,0,0);
  success=$mmaddtosysmem(dvid4,dm_id27,27,0,0);
  success=$mmaddtosysmem(dvid4,dm_id26,28,0,0);
  success=$mmaddtosysmem(dvid4,dm_id25,29,0,0);
  success=$mmaddtosysmem(dvid4,dm_id24,30,0,0);
  success=$mmaddtosysmem(dvid4,dm_id23,31,0,0);
  success=$mmaddtosysmem(dvid4,dm_id21,32,0,0);
  success=$mmaddtosysmem(dvid4,dm_id20,33,0,0);
  success=$mmaddtosysmem(dvid4,dm_id19,34,0,0);
  success=$mmaddtosysmem(dvid4,dm_id18,35,0,0);

`ifdef STACK_DIMM

  //////////////////////
  // RANK 0, STACK 1
  // Channel 0
  sam_id00 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U00");
  sam_id01 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U01");
  sam_id02 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U02");
  sam_id03 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U03");
  sam_id04 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U04");
  sam_id05 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U05");
  sam_id06 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U06");
  sam_id07 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U07");
  sam_id08 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U08");
  sam_id09 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U09");
  sam_id10 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U10");
  sam_id11 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U11");
  sam_id12 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U12");
  sam_id13 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U13");
  sam_id14 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U14");
  sam_id15 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U15");
  sam_id16 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U16");
  sam_id17 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms0.U17");

  sam_id18 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U00");
  sam_id19 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U01");
  sam_id20 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U02");
  sam_id21 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U03");
  sam_id22 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U04");
  sam_id23 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U05");
  sam_id24 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U06");
  sam_id25 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U07");
  sam_id26 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U08");
  sam_id27 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U09");
  sam_id28 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U10");
  sam_id29 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U11");
  sam_id30 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U12");
  sam_id31 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U13");
  sam_id32 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U14");
  sam_id33 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U15");
  sam_id34 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U16");
  sam_id35 = $mminstanceid("cmp_top.cmp_dram.mem0.dimms1.U17");

  // Channel 1
  sbm_id00 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U00");
  sbm_id01 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U01");
  sbm_id02 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U02");
  sbm_id03 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U03");
  sbm_id04 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U04");
  sbm_id05 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U05");
  sbm_id06 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U06");
  sbm_id07 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U07");
  sbm_id08 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U08");
  sbm_id09 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U09");
  sbm_id10 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U10");
  sbm_id11 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U11");
  sbm_id12 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U12");
  sbm_id13 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U13");
  sbm_id14 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U14");
  sbm_id15 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U15");
  sbm_id16 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U16");
  sbm_id17 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms0.U17");

  sbm_id18 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U00");
  sbm_id19 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U01");
  sbm_id20 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U02");
  sbm_id21 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U03");
  sbm_id22 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U04");
  sbm_id23 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U05");
  sbm_id24 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U06");
  sbm_id25 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U07");
  sbm_id26 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U08");
  sbm_id27 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U09");
  sbm_id28 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U10");
  sbm_id29 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U11");
  sbm_id30 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U12");
  sbm_id31 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U13");
  sbm_id32 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U14");
  sbm_id33 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U15");
  sbm_id34 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U16");
  sbm_id35 = $mminstanceid("cmp_top.cmp_dram.mem1.dimms1.U17");

  // Channel 2
  scm_id00 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U00");
  scm_id01 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U01");
  scm_id02 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U02");
  scm_id03 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U03");
  scm_id04 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U04");
  scm_id05 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U05");
  scm_id06 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U06");
  scm_id07 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U07");
  scm_id08 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U08");
  scm_id09 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U09");
  scm_id10 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U10");
  scm_id11 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U11");
  scm_id12 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U12");
  scm_id13 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U13");
  scm_id14 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U14");
  scm_id15 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U15");
  scm_id16 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U16");
  scm_id17 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms0.U17");

  scm_id18 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U00");
  scm_id19 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U01");
  scm_id20 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U02");
  scm_id21 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U03");
  scm_id22 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U04");
  scm_id23 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U05");
  scm_id24 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U06");
  scm_id25 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U07");
  scm_id26 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U08");
  scm_id27 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U09");
  scm_id28 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U10");
  scm_id29 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U11");
  scm_id30 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U12");
  scm_id31 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U13");
  scm_id32 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U14");
  scm_id33 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U15");
  scm_id34 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U16");
  scm_id35 = $mminstanceid("cmp_top.cmp_dram.mem2.dimms1.U17");

  // Channel 3
  sdm_id00 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U00");
  sdm_id01 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U01");
  sdm_id02 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U02");
  sdm_id03 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U03");
  sdm_id04 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U04");
  sdm_id05 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U05");
  sdm_id06 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U06");
  sdm_id07 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U07");
  sdm_id08 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U08");
  sdm_id09 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U09");
  sdm_id10 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U10");
  sdm_id11 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U11");
  sdm_id12 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U12");
  sdm_id13 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U13");
  sdm_id14 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U14");
  sdm_id15 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U15");
  sdm_id16 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U16");
  sdm_id17 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms0.U17");

  sdm_id18 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U00");
  sdm_id19 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U01");
  sdm_id20 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U02");
  sdm_id21 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U03");
  sdm_id22 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U04");
  sdm_id23 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U05");
  sdm_id24 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U06");
  sdm_id25 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U07");
  sdm_id26 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U08");
  sdm_id27 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U09");
  sdm_id28 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U10");
  sdm_id29 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U11");
  sdm_id30 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U12");
  sdm_id31 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U13");
  sdm_id32 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U14");
  sdm_id33 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U15");
  sdm_id34 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U16");
  sdm_id35 = $mminstanceid("cmp_top.cmp_dram.mem3.dimms1.U17");

  //////////////////////////////////////
  //workaround: for nested width problem
  
  // Channel 0
  savid4 = $mmcreatesysmem("sysmem","sa_dimm144",36,1,1);
  success=$mmaddtosysmem(savid4,sam_id13,0,0,0);
  success=$mmaddtosysmem(savid4,sam_id04,1,0,0);
  success=$mmaddtosysmem(savid4,sam_id31,2,0,0);
  success=$mmaddtosysmem(savid4,sam_id22,3,0,0);

  success=$mmaddtosysmem(savid4,sam_id17,4,0,0);
  success=$mmaddtosysmem(savid4,sam_id16,5,0,0);
  success=$mmaddtosysmem(savid4,sam_id15,6,0,0);
  success=$mmaddtosysmem(savid4,sam_id14,7,0,0);
  success=$mmaddtosysmem(savid4,sam_id12,8,0,0);
  success=$mmaddtosysmem(savid4,sam_id11,9,0,0);
  success=$mmaddtosysmem(savid4,sam_id10,10,0,0);
  success=$mmaddtosysmem(savid4,sam_id09,11,0,0);
  success=$mmaddtosysmem(savid4,sam_id08,12,0,0);
  success=$mmaddtosysmem(savid4,sam_id07,13,0,0);
  success=$mmaddtosysmem(savid4,sam_id06,14,0,0);
  success=$mmaddtosysmem(savid4,sam_id05,15,0,0);
  success=$mmaddtosysmem(savid4,sam_id03,16,0,0);
  success=$mmaddtosysmem(savid4,sam_id02,17,0,0);
  success=$mmaddtosysmem(savid4,sam_id01,18,0,0);
  success=$mmaddtosysmem(savid4,sam_id00,19,0,0);

  success=$mmaddtosysmem(savid4,sam_id35,20,0,0);
  success=$mmaddtosysmem(savid4,sam_id34,21,0,0);
  success=$mmaddtosysmem(savid4,sam_id33,22,0,0);
  success=$mmaddtosysmem(savid4,sam_id32,23,0,0);
  success=$mmaddtosysmem(savid4,sam_id30,24,0,0);
  success=$mmaddtosysmem(savid4,sam_id29,25,0,0);
  success=$mmaddtosysmem(savid4,sam_id28,26,0,0);
  success=$mmaddtosysmem(savid4,sam_id27,27,0,0);
  success=$mmaddtosysmem(savid4,sam_id26,28,0,0);
  success=$mmaddtosysmem(savid4,sam_id25,29,0,0);
  success=$mmaddtosysmem(savid4,sam_id24,30,0,0);
  success=$mmaddtosysmem(savid4,sam_id23,31,0,0);
  success=$mmaddtosysmem(savid4,sam_id21,32,0,0);
  success=$mmaddtosysmem(savid4,sam_id20,33,0,0);
  success=$mmaddtosysmem(savid4,sam_id19,34,0,0);
  success=$mmaddtosysmem(savid4,sam_id18,35,0,0);


  // Channel 1
  sbvid4 = $mmcreatesysmem("sysmem","sb_dimm144",36,1,1);
  success=$mmaddtosysmem(sbvid4,sbm_id13,0,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id04,1,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id31,2,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id22,3,0,0);

  success=$mmaddtosysmem(sbvid4,sbm_id17,4,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id16,5,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id15,6,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id14,7,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id12,8,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id11,9,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id10,10,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id09,11,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id08,12,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id07,13,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id06,14,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id05,15,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id03,16,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id02,17,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id01,18,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id00,19,0,0);

  success=$mmaddtosysmem(sbvid4,sbm_id35,20,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id34,21,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id33,22,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id32,23,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id30,24,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id29,25,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id28,26,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id27,27,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id26,28,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id25,29,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id24,30,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id23,31,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id21,32,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id20,33,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id19,34,0,0);
  success=$mmaddtosysmem(sbvid4,sbm_id18,35,0,0);

  // Channel 2
  scvid4 = $mmcreatesysmem("sysmem","sc_dimm144",36,1,1);
  success=$mmaddtosysmem(scvid4,scm_id13,0,0,0);
  success=$mmaddtosysmem(scvid4,scm_id04,1,0,0);
  success=$mmaddtosysmem(scvid4,scm_id31,2,0,0);
  success=$mmaddtosysmem(scvid4,scm_id22,3,0,0);

  success=$mmaddtosysmem(scvid4,scm_id17,4,0,0);
  success=$mmaddtosysmem(scvid4,scm_id16,5,0,0);
  success=$mmaddtosysmem(scvid4,scm_id15,6,0,0);
  success=$mmaddtosysmem(scvid4,scm_id14,7,0,0);
  success=$mmaddtosysmem(scvid4,scm_id12,8,0,0);
  success=$mmaddtosysmem(scvid4,scm_id11,9,0,0);
  success=$mmaddtosysmem(scvid4,scm_id10,10,0,0);
  success=$mmaddtosysmem(scvid4,scm_id09,11,0,0);
  success=$mmaddtosysmem(scvid4,scm_id08,12,0,0);
  success=$mmaddtosysmem(scvid4,scm_id07,13,0,0);
  success=$mmaddtosysmem(scvid4,scm_id06,14,0,0);
  success=$mmaddtosysmem(scvid4,scm_id05,15,0,0);
  success=$mmaddtosysmem(scvid4,scm_id03,16,0,0);
  success=$mmaddtosysmem(scvid4,scm_id02,17,0,0);
  success=$mmaddtosysmem(scvid4,scm_id01,18,0,0);
  success=$mmaddtosysmem(scvid4,scm_id00,19,0,0);

  success=$mmaddtosysmem(scvid4,scm_id35,20,0,0);
  success=$mmaddtosysmem(scvid4,scm_id34,21,0,0);
  success=$mmaddtosysmem(scvid4,scm_id33,22,0,0);
  success=$mmaddtosysmem(scvid4,scm_id32,23,0,0);
  success=$mmaddtosysmem(scvid4,scm_id30,24,0,0);
  success=$mmaddtosysmem(scvid4,scm_id29,25,0,0);
  success=$mmaddtosysmem(scvid4,scm_id28,26,0,0);
  success=$mmaddtosysmem(scvid4,scm_id27,27,0,0);
  success=$mmaddtosysmem(scvid4,scm_id26,28,0,0);
  success=$mmaddtosysmem(scvid4,scm_id25,29,0,0);
  success=$mmaddtosysmem(scvid4,scm_id24,30,0,0);
  success=$mmaddtosysmem(scvid4,scm_id23,31,0,0);
  success=$mmaddtosysmem(scvid4,scm_id21,32,0,0);
  success=$mmaddtosysmem(scvid4,scm_id20,33,0,0);
  success=$mmaddtosysmem(scvid4,scm_id19,34,0,0);
  success=$mmaddtosysmem(scvid4,scm_id18,35,0,0);


  // Channel 3
  sdvid4 = $mmcreatesysmem("sysmem","sd_dimm144",36,1,1);
  success=$mmaddtosysmem(sdvid4,sdm_id13,0,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id04,1,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id31,2,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id22,3,0,0);

  success=$mmaddtosysmem(sdvid4,sdm_id17,4,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id16,5,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id15,6,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id14,7,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id12,8,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id11,9,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id10,10,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id09,11,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id08,12,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id07,13,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id06,14,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id05,15,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id03,16,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id02,17,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id01,18,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id00,19,0,0);

  success=$mmaddtosysmem(sdvid4,sdm_id35,20,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id34,21,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id33,22,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id32,23,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id30,24,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id29,25,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id28,26,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id27,27,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id26,28,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id25,29,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id24,30,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id23,31,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id21,32,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id20,33,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id19,34,0,0);
  success=$mmaddtosysmem(sdvid4,sdm_id18,35,0,0);
`endif

`ifdef RANK_DIMM
  /////////////////////////
  // RANK 1, Stack 0
  // Channel 0
 
  ram_id00 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U00");
  ram_id01 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U01");
  ram_id02 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U02");
  ram_id03 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U03");
  ram_id04 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U04");
  ram_id05 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U05");
  ram_id06 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U06");
  ram_id07 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U07");
  ram_id08 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U08");
  ram_id09 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U09");
  ram_id10 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U10");
  ram_id11 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U11");
  ram_id12 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U12");
  ram_id13 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U13");
  ram_id14 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U14");
  ram_id15 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U15");
  ram_id16 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U16");
  ram_id17 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr0.U17");

  ram_id18 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U00");
  ram_id19 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U01");
  ram_id20 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U02");
  ram_id21 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U03");
  ram_id22 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U04");
  ram_id23 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U05");
  ram_id24 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U06");
  ram_id25 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U07");
  ram_id26 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U08");
  ram_id27 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U09");
  ram_id28 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U10");
  ram_id29 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U11");
  ram_id30 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U12");
  ram_id31 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U13");
  ram_id32 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U14");
  ram_id33 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U15");
  ram_id34 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U16");
  ram_id35 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr1.U17");
   
  // Channel 1 
  rbm_id00 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U00");
  rbm_id01 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U01");
  rbm_id02 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U02");
  rbm_id03 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U03");
  rbm_id04 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U04");
  rbm_id05 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U05");
  rbm_id06 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U06");
  rbm_id07 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U07");
  rbm_id08 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U08");
  rbm_id09 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U09");
  rbm_id10 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U10");
  rbm_id11 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U11");
  rbm_id12 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U12");
  rbm_id13 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U13");
  rbm_id14 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U14");
  rbm_id15 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U15");
  rbm_id16 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U16");
  rbm_id17 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr0.U17");

  rbm_id18 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U00");
  rbm_id19 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U01");
  rbm_id20 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U02");
  rbm_id21 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U03");
  rbm_id22 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U04");
  rbm_id23 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U05");
  rbm_id24 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U06");
  rbm_id25 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U07");
  rbm_id26 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U08");
  rbm_id27 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U09");
  rbm_id28 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U10");
  rbm_id29 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U11");
  rbm_id30 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U12");
  rbm_id31 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U13");
  rbm_id32 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U14");
  rbm_id33 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U15");
  rbm_id34 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U16");
  rbm_id35 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr1.U17");


  // Channe 2
  rcm_id00 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U00");
  rcm_id01 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U01");
  rcm_id02 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U02");
  rcm_id03 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U03");
  rcm_id04 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U04");
  rcm_id05 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U05");
  rcm_id06 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U06");
  rcm_id07 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U07");
  rcm_id08 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U08");
  rcm_id09 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U09");
  rcm_id10 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U10");
  rcm_id11 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U11");
  rcm_id12 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U12");
  rcm_id13 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U13");
  rcm_id14 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U14");
  rcm_id15 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U15");
  rcm_id16 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U16");
  rcm_id17 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr0.U17");

  rcm_id18 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U00");
  rcm_id19 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U01");
  rcm_id20 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U02");
  rcm_id21 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U03");
  rcm_id22 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U04");
  rcm_id23 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U05");
  rcm_id24 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U06");
  rcm_id25 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U07");
  rcm_id26 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U08");
  rcm_id27 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U09");
  rcm_id28 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U10");
  rcm_id29 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U11");
  rcm_id30 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U12");
  rcm_id31 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U13");
  rcm_id32 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U14");
  rcm_id33 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U15");
  rcm_id34 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U16");
  rcm_id35 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr1.U17");


  // channel 3 
  rdm_id00 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U00");
  rdm_id01 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U01");
  rdm_id02 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U02");
  rdm_id03 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U03");
  rdm_id04 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U04");
  rdm_id05 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U05");
  rdm_id06 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U06");
  rdm_id07 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U07");
  rdm_id08 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U08");
  rdm_id09 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U09");
  rdm_id10 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U10");
  rdm_id11 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U11");
  rdm_id12 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U12");
  rdm_id13 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U13");
  rdm_id14 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U14");
  rdm_id15 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U15");
  rdm_id16 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U16");
  rdm_id17 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr0.U17");

  rdm_id18 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U00");
  rdm_id19 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U01");
  rdm_id20 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U02");
  rdm_id21 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U03");
  rdm_id22 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U04");
  rdm_id23 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U05");
  rdm_id24 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U06");
  rdm_id25 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U07");
  rdm_id26 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U08");
  rdm_id27 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U09");
  rdm_id28 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U10");
  rdm_id29 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U11");
  rdm_id30 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U12");
  rdm_id31 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U13");
  rdm_id32 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U14");
  rdm_id33 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U15");
  rdm_id34 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U16");
  rdm_id35 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr1.U17");

  //////////////////////////////////////
  //workaround: for nested width problem
  
  // Channel 0
  ravid4 = $mmcreatesysmem("sysmem","ra_dimm144",36,1,1);
  success=$mmaddtosysmem(ravid4,ram_id13,0,0,0);
  success=$mmaddtosysmem(ravid4,ram_id04,1,0,0);
  success=$mmaddtosysmem(ravid4,ram_id31,2,0,0);
  success=$mmaddtosysmem(ravid4,ram_id22,3,0,0);

  success=$mmaddtosysmem(ravid4,ram_id17,4,0,0);
  success=$mmaddtosysmem(ravid4,ram_id16,5,0,0);
  success=$mmaddtosysmem(ravid4,ram_id15,6,0,0);
  success=$mmaddtosysmem(ravid4,ram_id14,7,0,0);
  success=$mmaddtosysmem(ravid4,ram_id12,8,0,0);
  success=$mmaddtosysmem(ravid4,ram_id11,9,0,0);
  success=$mmaddtosysmem(ravid4,ram_id10,10,0,0);
  success=$mmaddtosysmem(ravid4,ram_id09,11,0,0);
  success=$mmaddtosysmem(ravid4,ram_id08,12,0,0);
  success=$mmaddtosysmem(ravid4,ram_id07,13,0,0);
  success=$mmaddtosysmem(ravid4,ram_id06,14,0,0);
  success=$mmaddtosysmem(ravid4,ram_id05,15,0,0);
  success=$mmaddtosysmem(ravid4,ram_id03,16,0,0);
  success=$mmaddtosysmem(ravid4,ram_id02,17,0,0);
  success=$mmaddtosysmem(ravid4,ram_id01,18,0,0);
  success=$mmaddtosysmem(ravid4,ram_id00,19,0,0);

  success=$mmaddtosysmem(ravid4,ram_id35,20,0,0);
  success=$mmaddtosysmem(ravid4,ram_id34,21,0,0);
  success=$mmaddtosysmem(ravid4,ram_id33,22,0,0);
  success=$mmaddtosysmem(ravid4,ram_id32,23,0,0);
  success=$mmaddtosysmem(ravid4,ram_id30,24,0,0);
  success=$mmaddtosysmem(ravid4,ram_id29,25,0,0);
  success=$mmaddtosysmem(ravid4,ram_id28,26,0,0);
  success=$mmaddtosysmem(ravid4,ram_id27,27,0,0);
  success=$mmaddtosysmem(ravid4,ram_id26,28,0,0);
  success=$mmaddtosysmem(ravid4,ram_id25,29,0,0);
  success=$mmaddtosysmem(ravid4,ram_id24,30,0,0);
  success=$mmaddtosysmem(ravid4,ram_id23,31,0,0);
  success=$mmaddtosysmem(ravid4,ram_id21,32,0,0);
  success=$mmaddtosysmem(ravid4,ram_id20,33,0,0);
  success=$mmaddtosysmem(ravid4,ram_id19,34,0,0);
  success=$mmaddtosysmem(ravid4,ram_id18,35,0,0);


  // Channel 1
  rbvid4 = $mmcreatesysmem("sysmem","rb_dimm144",36,1,1);
  success=$mmaddtosysmem(rbvid4,rbm_id13,0,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id04,1,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id31,2,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id22,3,0,0);

  success=$mmaddtosysmem(rbvid4,rbm_id17,4,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id16,5,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id15,6,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id14,7,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id12,8,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id11,9,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id10,10,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id09,11,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id08,12,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id07,13,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id06,14,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id05,15,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id03,16,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id02,17,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id01,18,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id00,19,0,0);

  success=$mmaddtosysmem(rbvid4,rbm_id35,20,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id34,21,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id33,22,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id32,23,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id30,24,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id29,25,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id28,26,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id27,27,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id26,28,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id25,29,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id24,30,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id23,31,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id21,32,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id20,33,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id19,34,0,0);
  success=$mmaddtosysmem(rbvid4,rbm_id18,35,0,0);

  // Channel 2
  rcvid4 = $mmcreatesysmem("sysmem","rc_dimm144",36,1,1);
  success=$mmaddtosysmem(rcvid4,rcm_id13,0,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id04,1,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id31,2,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id22,3,0,0);

  success=$mmaddtosysmem(rcvid4,rcm_id17,4,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id16,5,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id15,6,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id14,7,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id12,8,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id11,9,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id10,10,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id09,11,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id08,12,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id07,13,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id06,14,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id05,15,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id03,16,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id02,17,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id01,18,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id00,19,0,0);

  success=$mmaddtosysmem(rcvid4,rcm_id35,20,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id34,21,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id33,22,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id32,23,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id30,24,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id29,25,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id28,26,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id27,27,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id26,28,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id25,29,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id24,30,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id23,31,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id21,32,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id20,33,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id19,34,0,0);
  success=$mmaddtosysmem(rcvid4,rcm_id18,35,0,0);


  // Channel 3
  rdvid4 = $mmcreatesysmem("sysmem","rd_dimm144",36,1,1);
  success=$mmaddtosysmem(rdvid4,rdm_id13,0,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id04,1,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id31,2,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id22,3,0,0);

  success=$mmaddtosysmem(rdvid4,rdm_id17,4,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id16,5,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id15,6,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id14,7,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id12,8,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id11,9,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id10,10,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id09,11,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id08,12,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id07,13,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id06,14,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id05,15,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id03,16,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id02,17,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id01,18,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id00,19,0,0);

  success=$mmaddtosysmem(rdvid4,rdm_id35,20,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id34,21,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id33,22,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id32,23,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id30,24,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id29,25,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id28,26,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id27,27,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id26,28,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id25,29,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id24,30,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id23,31,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id21,32,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id20,33,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id19,34,0,0);
  success=$mmaddtosysmem(rdvid4,rdm_id18,35,0,0);

`ifdef STACK_DIMM
  //////////////////////
  // RANK 1, STACK 1
  // Channel 0

  rsam_id00 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U00");
  rsam_id01 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U01");
  rsam_id02 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U02");
  rsam_id03 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U03");
  rsam_id04 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U04");
  rsam_id05 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U05");
  rsam_id06 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U06");
  rsam_id07 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U07");
  rsam_id08 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U08");
  rsam_id09 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U09");
  rsam_id10 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U10");
  rsam_id11 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U11");
  rsam_id12 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U12");
  rsam_id13 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U13");
  rsam_id14 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U14");
  rsam_id15 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U15");
  rsam_id16 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U16");
  rsam_id17 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr2.U17");

  rsam_id18 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U00");
  rsam_id19 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U01");
  rsam_id20 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U02");
  rsam_id21 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U03");
  rsam_id22 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U04");
  rsam_id23 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U05");
  rsam_id24 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U06");
  rsam_id25 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U07");
  rsam_id26 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U08");
  rsam_id27 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U09");
  rsam_id28 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U10");
  rsam_id29 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U11");
  rsam_id30 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U12");
  rsam_id31 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U13");
  rsam_id32 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U14");
  rsam_id33 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U15");
  rsam_id34 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U16");
  rsam_id35 = $mminstanceid("cmp_top.cmp_dram.mem0.dimmr3.U17");

  // Channel 1
  rsbm_id00 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U00");
  rsbm_id01 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U01");
  rsbm_id02 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U02");
  rsbm_id03 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U03");
  rsbm_id04 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U04");
  rsbm_id05 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U05");
  rsbm_id06 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U06");
  rsbm_id07 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U07");
  rsbm_id08 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U08");
  rsbm_id09 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U09");
  rsbm_id10 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U10");
  rsbm_id11 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U11");
  rsbm_id12 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U12");
  rsbm_id13 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U13");
  rsbm_id14 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U14");
  rsbm_id15 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U15");
  rsbm_id16 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U16");
  rsbm_id17 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr2.U17");

  rsbm_id18 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U00");
  rsbm_id19 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U01");
  rsbm_id20 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U02");
  rsbm_id21 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U03");
  rsbm_id22 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U04");
  rsbm_id23 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U05");
  rsbm_id24 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U06");
  rsbm_id25 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U07");
  rsbm_id26 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U08");
  rsbm_id27 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U09");
  rsbm_id28 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U10");
  rsbm_id29 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U11");
  rsbm_id30 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U12");
  rsbm_id31 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U13");
  rsbm_id32 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U14");
  rsbm_id33 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U15");
  rsbm_id34 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U16");
  rsbm_id35 = $mminstanceid("cmp_top.cmp_dram.mem1.dimmr3.U17");

  // Channel 2
  rscm_id00 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U00");
  rscm_id01 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U01");
  rscm_id02 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U02");
  rscm_id03 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U03");
  rscm_id04 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U04");
  rscm_id05 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U05");
  rscm_id06 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U06");
  rscm_id07 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U07");
  rscm_id08 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U08");
  rscm_id09 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U09");
  rscm_id10 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U10");
  rscm_id11 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U11");
  rscm_id12 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U12");
  rscm_id13 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U13");
  rscm_id14 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U14");
  rscm_id15 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U15");
  rscm_id16 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U16");
  rscm_id17 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr2.U17");

  rscm_id18 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U00");
  rscm_id19 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U01");
  rscm_id20 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U02");
  rscm_id21 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U03");
  rscm_id22 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U04");
  rscm_id23 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U05");
  rscm_id24 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U06");
  rscm_id25 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U07");
  rscm_id26 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U08");
  rscm_id27 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U09");
  rscm_id28 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U10");
  rscm_id29 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U11");
  rscm_id30 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U12");
  rscm_id31 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U13");
  rscm_id32 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U14");
  rscm_id33 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U15");
  rscm_id34 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U16");
  rscm_id35 = $mminstanceid("cmp_top.cmp_dram.mem2.dimmr3.U17");

  // Channel 3
  rsdm_id00 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U00");
  rsdm_id01 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U01");
  rsdm_id02 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U02");
  rsdm_id03 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U03");
  rsdm_id04 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U04");
  rsdm_id05 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U05");
  rsdm_id06 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U06");
  rsdm_id07 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U07");
  rsdm_id08 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U08");
  rsdm_id09 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U09");
  rsdm_id10 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U10");
  rsdm_id11 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U11");
  rsdm_id12 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U12");
  rsdm_id13 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U13");
  rsdm_id14 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U14");
  rsdm_id15 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U15");
  rsdm_id16 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U16");
  rsdm_id17 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr2.U17");

  rsdm_id18 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U00");
  rsdm_id19 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U01");
  rsdm_id20 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U02");
  rsdm_id21 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U03");
  rsdm_id22 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U04");
  rsdm_id23 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U05");
  rsdm_id24 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U06");
  rsdm_id25 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U07");
  rsdm_id26 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U08");
  rsdm_id27 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U09");
  rsdm_id28 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U10");
  rsdm_id29 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U11");
  rsdm_id30 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U12");
  rsdm_id31 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U13");
  rsdm_id32 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U14");
  rsdm_id33 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U15");
  rsdm_id34 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U16");
  rsdm_id35 = $mminstanceid("cmp_top.cmp_dram.mem3.dimmr3.U17");


  //////////////////////////////////////
  //workaround: for nested width problem
  
  // Channel 0
  rsavid4 = $mmcreatesysmem("sysmem","rsa_dimm144",36,1,1);
  success=$mmaddtosysmem(rsavid4,rsam_id13,0,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id04,1,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id31,2,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id22,3,0,0);

  success=$mmaddtosysmem(rsavid4,rsam_id17,4,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id16,5,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id15,6,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id14,7,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id12,8,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id11,9,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id10,10,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id09,11,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id08,12,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id07,13,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id06,14,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id05,15,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id03,16,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id02,17,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id01,18,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id00,19,0,0);

  success=$mmaddtosysmem(rsavid4,rsam_id35,20,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id34,21,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id33,22,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id32,23,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id30,24,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id29,25,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id28,26,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id27,27,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id26,28,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id25,29,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id24,30,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id23,31,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id21,32,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id20,33,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id19,34,0,0);
  success=$mmaddtosysmem(rsavid4,rsam_id18,35,0,0);


  // Channel 1
  rsbvid4 = $mmcreatesysmem("sysmem","rsb_dimm144",36,1,1);
  success=$mmaddtosysmem(rsbvid4,rsbm_id13,0,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id04,1,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id31,2,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id22,3,0,0);

  success=$mmaddtosysmem(rsbvid4,rsbm_id17,4,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id16,5,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id15,6,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id14,7,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id12,8,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id11,9,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id10,10,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id09,11,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id08,12,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id07,13,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id06,14,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id05,15,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id03,16,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id02,17,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id01,18,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id00,19,0,0);

  success=$mmaddtosysmem(rsbvid4,rsbm_id35,20,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id34,21,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id33,22,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id32,23,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id30,24,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id29,25,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id28,26,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id27,27,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id26,28,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id25,29,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id24,30,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id23,31,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id21,32,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id20,33,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id19,34,0,0);
  success=$mmaddtosysmem(rsbvid4,rsbm_id18,35,0,0);

  // Channel 2
  rscvid4 = $mmcreatesysmem("sysmem","rsc_dimm144",36,1,1);
  success=$mmaddtosysmem(rscvid4,rscm_id13,0,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id04,1,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id31,2,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id22,3,0,0);

  success=$mmaddtosysmem(rscvid4,rscm_id17,4,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id16,5,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id15,6,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id14,7,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id12,8,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id11,9,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id10,10,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id09,11,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id08,12,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id07,13,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id06,14,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id05,15,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id03,16,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id02,17,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id01,18,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id00,19,0,0);

  success=$mmaddtosysmem(rscvid4,rscm_id35,20,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id34,21,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id33,22,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id32,23,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id30,24,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id29,25,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id28,26,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id27,27,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id26,28,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id25,29,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id24,30,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id23,31,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id21,32,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id20,33,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id19,34,0,0);
  success=$mmaddtosysmem(rscvid4,rscm_id18,35,0,0);


  // Channel 3
  rsdvid4 = $mmcreatesysmem("sysmem","rsd_dimm144",36,1,1);
  success=$mmaddtosysmem(rsdvid4,rsdm_id13,0,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id04,1,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id31,2,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id22,3,0,0);

  success=$mmaddtosysmem(rsdvid4,rsdm_id17,4,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id16,5,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id15,6,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id14,7,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id12,8,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id11,9,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id10,10,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id09,11,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id08,12,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id07,13,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id06,14,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id05,15,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id03,16,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id02,17,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id01,18,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id00,19,0,0);

  success=$mmaddtosysmem(rsdvid4,rsdm_id35,20,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id34,21,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id33,22,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id32,23,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id30,24,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id29,25,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id28,26,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id27,27,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id26,28,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id25,29,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id24,30,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id23,31,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id21,32,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id20,33,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id19,34,0,0);
  success=$mmaddtosysmem(rsdvid4,rsdm_id18,35,0,0);
`endif	// ifdef STACK_DIMM
`endif	// ifdef RANK_DIMM

  if($test$plusargs("RANK_DIMM")) begin
    if($test$plusargs("STACK_DIMM")) begin
      //////////////////////////////////////
      //Ranked and Stacked Syatem Memory 
      rsvid5 = $mmcreatesysmem("sysmem","rank_stack_unsc",1,16,1);
      success=$mmaddtosysmem(rsvid5,avid4,0,0,0);
      success=$mmaddtosysmem(rsvid5,savid4,0,1,0);
      success=$mmaddtosysmem(rsvid5,ravid4,0,2,0);
      success=$mmaddtosysmem(rsvid5,rsavid4,0,3,0);
      success=$mmaddtosysmem(rsvid5,bvid4,0,4,0);
      success=$mmaddtosysmem(rsvid5,sbvid4,0,5,0);
      success=$mmaddtosysmem(rsvid5,rbvid4,0,6,0);
      success=$mmaddtosysmem(rsvid5,rsbvid4,0,7,0);
      success=$mmaddtosysmem(rsvid5,cvid4,0,8,0);
      success=$mmaddtosysmem(rsvid5,scvid4,0,9,0);
      success=$mmaddtosysmem(rsvid5,rcvid4,0,10,0);
      success=$mmaddtosysmem(rsvid5,rscvid4,0,11,0);
      success=$mmaddtosysmem(rsvid5,dvid4,0,12,0);
      success=$mmaddtosysmem(rsvid5,sdvid4,0,13,0);
      success=$mmaddtosysmem(rsvid5,rdvid4,0,14,0);
      success=$mmaddtosysmem(rsvid5,rsdvid4,0,15,0);

      // adding a DRAM bank bit and changing RAS to 15
      // debugging with rank
      //svid6 = $mmaddressmap("rank_stack_sc",rsvid5,"29 28 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 27 26 25 31 30 1 0");
      // added the Col width bit as 25, DRAM bank now 8 => 26,27,28,  STACK,RANK 29,30, L2 Bank 31 32
      // correct
      svid6 = $mmaddressmap("rank_stack_sc",rsvid5,"30 29 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 28 27 26 32 31 1 0");
      //svid6 = $mmaddressmap("rank_stack_sc",rsvid5,"28 27 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 26 25 30 29 1 0");
      //svid6 = $mmaddressmap("rank_stack_sc",rsvid5,"26 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 25 24 23 28 27 2 1 0");
    end
    else begin
      //////////////////////////////////////
      //Unranked and Stacked Syatem Memory 
      rvid5 = $mmcreatesysmem("sysmem","rank_unsc",1,8,1);
      success=$mmaddtosysmem(rvid5,avid4,0,0,0);
      success=$mmaddtosysmem(rvid5,ravid4,0,1,0);
      success=$mmaddtosysmem(rvid5,bvid4,0,2,0);
      success=$mmaddtosysmem(rvid5,rbvid4,0,3,0);
      success=$mmaddtosysmem(rvid5,cvid4,0,4,0);
      success=$mmaddtosysmem(rvid5,rcvid4,0,5,0);
      success=$mmaddtosysmem(rvid5,dvid4,0,6,0);
      success=$mmaddtosysmem(rvid5,rdvid4,0,7,0);

      // adding a DRAM bank bit and changing RAS to 15
      svid6 = $mmaddressmap("rank_sc",rvid5,"29 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 28 27 26 31 30 1 0");
      //svid6 = $mmaddressmap("rank_sc",rvid5,"27 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 26 25 29 28 1 0");
      //svid6 = $mmaddressmap("rank_sc",rvid5,"25 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 24 23 27 26 2 1 0");
    end
  end
  else if($test$plusargs("STACK_DIMM")) begin
    //////////////////////////////////////
    //Unranked and Stacked Syatem Memory 
    svid5 = $mmcreatesysmem("sysmem","stack_unsc",1,8,1);
    success=$mmaddtosysmem(svid5,avid4,0,0,0);
    success=$mmaddtosysmem(svid5,savid4,0,1,0);
    success=$mmaddtosysmem(svid5,bvid4,0,2,0);
    success=$mmaddtosysmem(svid5,sbvid4,0,3,0);
    success=$mmaddtosysmem(svid5,cvid4,0,4,0);
    success=$mmaddtosysmem(svid5,scvid4,0,5,0);
    success=$mmaddtosysmem(svid5,dvid4,0,6,0);
    success=$mmaddtosysmem(svid5,sdvid4,0,7,0);

    // adding a DRAM bank bit and changing RAS to 15
    svid6 = $mmaddressmap("stack_sc",svid5,"29 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 28 27 26 31 30 1 0");
    //svid6 = $mmaddressmap("stack_sc",svid5,"27 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 26 25 29 28 1 0");
    //svid6 = $mmaddressmap("stack_sc",svid5,"22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 25 24 23 27 26 2 1 0");
  end 
  else begin
    //////////////////////////////////////
    //Unranked and Unstacked Syatem Memory 
    vid5 = $mmcreatesysmem("sysmem","single_unsc",1,4,1);
    success=$mmaddtosysmem(vid5,avid4,0,0,0);
    success=$mmaddtosysmem(vid5,bvid4,0,1,0);
    success=$mmaddtosysmem(vid5,cvid4,0,2,0);
    success=$mmaddtosysmem(vid5,dvid4,0,3,0);

    // adding a DRAM bank bit and changing RAS to 15
    // as discussed with sunil 
    // 28,27,26 => DRAM Bank , 30,29 => L2 Bank
    vid6 = $mmaddressmap("single_sc",vid5,"25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 28 27 26 30 29 1 0");
    //vid6 = $mmaddressmap("single_sc",vid5,"24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 26 25 28 27 1 0");
    //vid6 = $mmaddressmap("single_sc",vid5,"22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 24 23 26 25 2 1 0");
  end // NOT STACK_DIMM

end

//////////////////////////////
// Pre Load the denali memory
initial begin
  if($test$plusargs("RANK_DIMM")) begin
    if($test$plusargs("STACK_DIMM")) begin

    `ifdef DRAM_SAT
      #12 success = $mmload("rank_stack_sc", "./denali.data");
    `else
      #12 success = $mmload("rank_stack_sc", "./denali.image");
    `endif
    //$display("%0d: After loading denali.dat to memory variable success = %d\n", $time, success);
    end 
    else begin
      #12 success = $mmload("rank_sc", "./denali.data");
    end
  end
  else if($test$plusargs("STACK_DIMM")) begin
    #12 success = $mmload("stack_sc", "./denali.data");
  end 
  else begin
    #12 success = $mmload("single_sc", "./denali.data");
  end
end

////////////////////////////////
// Enable denali error Injection
initial begin
#1
  if($test$plusargs("DENALI_ERROR")) begin
    if($test$plusargs("RANK_DIMM")) begin
      if($test$plusargs("STACK_DIMM")) begin
        success = $mmerrinject(rsavid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
        success = $mmerrinject(rsbvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
        success = $mmerrinject(rscvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
        success = $mmerrinject(rsdvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
      end
      success = $mmerrinject(ravid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
      success = $mmerrinject(rbvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
      success = $mmerrinject(rcvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
      success = $mmerrinject(rdvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
    end
    if($test$plusargs("STACK_DIMM")) begin
      success = $mmerrinject(savid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
      success = $mmerrinject(sbvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
      success = $mmerrinject(scvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
      success = $mmerrinject(sdvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
    end
    success = $mmerrinject(avid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
    success = $mmerrinject(bvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
    success = $mmerrinject(cvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
    success = $mmerrinject(dvid4, "-seed 0 -reads 1 2 -bits 1 -percent 100");
  end
end

`endif // DENALI_ON

   /*
    ch_mem AUTO_TEMPLATE (
    // Outputs
    .XXDQ                      (DRAM@_DQ[127:0]),
    .XXCB                      (DRAM@_CB[15:0]),
    .XXDQS                     (DRAM@_DQS[35:0]),
    .XXSDA                     (DRAM@"(+ 0 (* 2 @))"@"(+ 1 (* 2 @))"),
    // Inputs
    .XXRAS_L                   (DRAM@_RAS_L),
    .XXCAS_L                   (DRAM@_CAS_L),
    .XXWE_L                    (DRAM@_WE_L),
    .XXCS_L                    (DRAM@_CS_L[3:0]),
    .XXRESET_L                 (DRAM@_RST_L),
    .XXADDR                    (DRAM@_ADDR[14:0]),
    .XXBA                      (DRAM@_BA[2:0]),
    .XXCLK_L                   (DRAM@_CK_N[3:0]),
    .XXCLK                     (DRAM@_CK_P[3:0]),
    .XXCKE                     (DRAM@_CKE),
    .XXSCL                     (DRAM@"(+ 0 (* 2 @))"@"(+ 1 (* 2 @))"));
    */

   ch_mem mem0 (/*AUTOINST*/
		// Inouts
		.XXSDA			(DRAM01),		 // Templated
		.XXDQ			(DRAM0_DQ[127:0]),	 // Templated
		.XXCB			(DRAM0_CB[15:0]),	 // Templated
		.XXDQS			(DRAM0_DQS[35:0]),	 // Templated
		// Inputs
		.XXRAS_L		(DRAM0_RAS_L),		 // Templated
		.XXCAS_L		(DRAM0_CAS_L),		 // Templated
		.XXWE_L			(DRAM0_WE_L),		 // Templated
		.XXCS_L			(DRAM0_CS_L[3:0]),	 // Templated
		.XXRESET_L		(DRAM0_RST_L),		 // Templated
		.XXADDR			(DRAM0_ADDR[14:0]),	 // Templated
		.XXBA			(DRAM0_BA[2:0]),	 // Templated
		.XXSA			(XXSA[2:0]),
		.XXSCL			(DRAM01),		 // Templated
		.XXWP			(XXWP),
		.XXCLK			(DRAM0_CK_P[3:0]),	 // Templated
		.XXCLK_L		(DRAM0_CK_N[3:0]),	 // Templated
		.XXCKE			(DRAM0_CKE));		 // Templated
   ch_mem mem1 (/*AUTOINST*/
		// Inouts
		.XXSDA			(DRAM23),		 // Templated
		.XXDQ			(DRAM1_DQ[127:0]),	 // Templated
		.XXCB			(DRAM1_CB[15:0]),	 // Templated
		.XXDQS			(DRAM1_DQS[35:0]),	 // Templated
		// Inputs
		.XXRAS_L		(DRAM1_RAS_L),		 // Templated
		.XXCAS_L		(DRAM1_CAS_L),		 // Templated
		.XXWE_L			(DRAM1_WE_L),		 // Templated
		.XXCS_L			(DRAM1_CS_L[3:0]),	 // Templated
		.XXRESET_L		(DRAM1_RST_L),		 // Templated
		.XXADDR			(DRAM1_ADDR[14:0]),	 // Templated
		.XXBA			(DRAM1_BA[2:0]),	 // Templated
		.XXSA			(XXSA[2:0]),
		.XXSCL			(DRAM23),		 // Templated
		.XXWP			(XXWP),
		.XXCLK			(DRAM1_CK_P[3:0]),	 // Templated
		.XXCLK_L		(DRAM1_CK_N[3:0]),	 // Templated
		.XXCKE			(DRAM1_CKE));		 // Templated
   /*
    ch_mem AUTO_TEMPLATE (
    // Outputs
    .XXDQ                      (DRAM@_DQ[127:0]), 
    .XXCB                      (DRAM@_CB[15:0]),
    .XXDQS                     (DRAM@_DQS[35:0]), 
    .XXSDA                     (DRAM@"(+ 0 (* 2 @))"@"(+ 1 (* 2 @))"),
    // Inputs
    .XXRAS_L                   (DRAM@_RAS_L),
    .XXCAS_L                   (DRAM@_CAS_L),
    .XXWE_L                    (DRAM@_WE_L),
    .XXCS_L                    (DRAM@_CS_L[3:0]),
    .XXRESET_L                 (DRAM@_RST_L),
    .XXADDR                    (DRAM@_ADDR[14:0]),
    .XXBA                      (DRAM@_BA[2:0]),
    .XXCLK_L                   (DRAM@_CK_N[3:0]),
    .XXCLK                     (DRAM@_CK_P[3:0]),
    .XXCKE                     (DRAM@_CKE),
    .XXSCL                     (DRAM@"(+ 0 (* 2 @))"@"(+ 1 (* 2 @))"));
    */

   ch_mem mem2 (/*AUTOINST*/
		// Inouts
		.XXSDA			(DRAM45),		 // Templated
		.XXDQ			(DRAM2_DQ[127:0]),	 // Templated
		.XXCB			(DRAM2_CB[15:0]),	 // Templated
		.XXDQS			(DRAM2_DQS[35:0]),	 // Templated
		// Inputs
		.XXRAS_L		(DRAM2_RAS_L),		 // Templated
		.XXCAS_L		(DRAM2_CAS_L),		 // Templated
		.XXWE_L			(DRAM2_WE_L),		 // Templated
		.XXCS_L			(DRAM2_CS_L[3:0]),	 // Templated
		.XXRESET_L		(DRAM2_RST_L),		 // Templated
		.XXADDR			(DRAM2_ADDR[14:0]),	 // Templated
		.XXBA			(DRAM2_BA[2:0]),	 // Templated
		.XXSA			(XXSA[2:0]),
		.XXSCL			(DRAM45),		 // Templated
		.XXWP			(XXWP),
		.XXCLK			(DRAM2_CK_P[3:0]),	 // Templated
		.XXCLK_L		(DRAM2_CK_N[3:0]),	 // Templated
		.XXCKE			(DRAM2_CKE));		 // Templated
   /*
    ch_mem AUTO_TEMPLATE (
    // Outputs
    .XXDQ                      (DRAM@_DQ[127:0]),
    .XXCB                      (DRAM@_CB[15:0]),
    .XXDQS                     (DRAM@_DQS[35:0]),
    .XXSDA                     (DRAM@"(+ 0 (* 2 @))"@"(+ 1 (* 2 @))"),
    // Inputs
    .XXRAS_L                   (DRAM@_RAS_L),
    .XXCAS_L                   (DRAM@_CAS_L),
    .XXWE_L                    (DRAM@_WE_L),
    .XXCS_L                    (DRAM@_CS_L[3:0]),
    .XXRESET_L                 (DRAM@_RST_L),
    .XXADDR                    (DRAM@_ADDR[14:0]),
    .XXBA                      (DRAM@_BA[2:0]),
    .XXCLK_L                   (DRAM@_CK_N[3:0]),
    .XXCLK                     (DRAM@_CK_P[3:0]),
    .XXCKE                     (DRAM@_CKE),
    .XXSCL                     (DRAM@"(+ 0 (* 2 @))"@"(+ 1 (* 2 @))"));
    */

   ch_mem mem3 (/*AUTOINST*/
		// Inouts
		.XXSDA			(DRAM67),		 // Templated
		.XXDQ			(DRAM3_DQ[127:0]),	 // Templated
		.XXCB			(DRAM3_CB[15:0]),	 // Templated
		.XXDQS			(DRAM3_DQS[35:0]),	 // Templated
		// Inputs
		.XXRAS_L		(DRAM3_RAS_L),		 // Templated
		.XXCAS_L		(DRAM3_CAS_L),		 // Templated
		.XXWE_L			(DRAM3_WE_L),		 // Templated
		.XXCS_L			(DRAM3_CS_L[3:0]),	 // Templated
		.XXRESET_L		(DRAM3_RST_L),		 // Templated
		.XXADDR			(DRAM3_ADDR[14:0]),	 // Templated
		.XXBA			(DRAM3_BA[2:0]),	 // Templated
		.XXSA			(XXSA[2:0]),
		.XXSCL			(DRAM67),		 // Templated
		.XXWP			(XXWP),
		.XXCLK			(DRAM3_CK_P[3:0]),	 // Templated
		.XXCLK_L		(DRAM3_CK_N[3:0]),	 // Templated
		.XXCKE			(DRAM3_CKE));		 // Templated


// don't include DRAM monitors when compiling for MSS SAT environment
`ifdef MSS_SAT
`else

    /* cmp_dram_mon AUTO_TEMPLATE (
    .clk (dram_gclk),
    .dram_pad0_cs_l(DRAM0_CS_L[1:0]),
    .dram_pad1_cs_l(DRAM1_CS_L[1:0]),
    .dram_pad2_cs_l(DRAM2_CS_L[1:0]),
    .dram_pad3_cs_l(DRAM3_CS_L[1:0]),
    .rst_l(cmp_grst));
    */
	cmp_dram_mon cmp_dram_mon (/*AUTOINST*/
			// Inputs
			.clk	(dram_gclk),		 // Templated
			.dram_pad0_cs_l(DRAM0_CS_L[1:0]),	 // Templated
			.dram_pad1_cs_l(DRAM1_CS_L[1:0]),	 // Templated
			.dram_pad2_cs_l(DRAM2_CS_L[1:0]),	 // Templated
			.dram_pad3_cs_l(DRAM3_CS_L[1:0]),	 // Templated
			.rst_l	(cmp_grst));		 // Templated
    /* dimm_if_mon AUTO_TEMPLATE (
    .clk		(dram_gclk),
    .DRAM_CK		({4{DRAM@_CK_P[3], DRAM@_CK_N[3]}}),
    .DRAM_CKE		(DRAM@_CKE),
    .DRAM_RST_L	(DRAM@_RST_L),
    .DRAM_CS_L		(DRAM@_CS_L[1:0]),
    .DRAM_BA		(DRAM@_BA[2:0]),
    .DRAM_ADDR		(DRAM@_ADDR[14:0]),
    .DRAM_RAS_L	(DRAM@_RAS_L),
    .DRAM_CAS_L	(DRAM@_CAS_L),
    .DRAM_WE_L		(DRAM@_WE_L),
    .DRAM_DQ		(DRAM@_DQ[127:0]),
    .DRAM_CB		(DRAM@_CB[15:0]),
    .DRAM_DQS		(DRAM@_DQS[35:0]),
    .DRAM_ENB_ERROR	(DRAM@_ENB_ERROR));
    .DRAM_FAIL_OVER	(DRAM@_FAIL_OVER));
    .DRAM_FAIL_PART	(DRAM@_FAIL_PART));
    */

	dimm_if_mon dimm_if_mon0 (/*AUTOINST*/
			// Inouts
			.DRAM_DQ	(DRAM0_DQ[127:0]),	 // Templated
			// Inputs
			.clk	(dram_gclk),		 // Templated
			.DRAM_CK	({4{DRAM0_CK_P[3], DRAM0_CK_N[3]}}), // Templated
			.DRAM_CKE	(DRAM0_CKE),		 // Templated
			.DRAM_RST_L(DRAM0_RST_L),		 // Templated
			.DRAM_CS_L	(DRAM0_CS_L[1:0]),	 // Templated
			.DRAM_BA	(DRAM0_BA[2:0]),	 // Templated
			.DRAM_ADDR	(DRAM0_ADDR[14:0]),	 // Templated
			.DRAM_RAS_L(DRAM0_RAS_L),		 // Templated
			.DRAM_CAS_L(DRAM0_CAS_L),		 // Templated
			.DRAM_WE_L	(DRAM0_WE_L),		 // Templated
			.DRAM_CB	(DRAM0_CB[15:0]),	 // Templated
			.DRAM_DQS	(DRAM0_DQS[35:0]),	 // Templated
			.DRAM_ENB_ERROR(DRAM0_ENB_ERROR),	 // Templated
			.DRAM_FAIL_OVER(DRAM_FAIL_OVER),
			.DRAM_FAIL_PART(DRAM_FAIL_PART[5:0]));
	dimm_if_mon dimm_if_mon1 (/*AUTOINST*/
			// Inouts
			.DRAM_DQ	(DRAM1_DQ[127:0]),	 // Templated
			// Inputs
			.clk	(dram_gclk),		 // Templated
			.DRAM_CK	({4{DRAM1_CK_P[3], DRAM1_CK_N[3]}}), // Templated
			.DRAM_CKE	(DRAM1_CKE),		 // Templated
			.DRAM_RST_L(DRAM1_RST_L),		 // Templated
			.DRAM_CS_L	(DRAM1_CS_L[1:0]),	 // Templated
			.DRAM_BA	(DRAM1_BA[2:0]),	 // Templated
			.DRAM_ADDR	(DRAM1_ADDR[14:0]),	 // Templated
			.DRAM_RAS_L(DRAM1_RAS_L),		 // Templated
			.DRAM_CAS_L(DRAM1_CAS_L),		 // Templated
			.DRAM_WE_L	(DRAM1_WE_L),		 // Templated
			.DRAM_CB	(DRAM1_CB[15:0]),	 // Templated
			.DRAM_DQS	(DRAM1_DQS[35:0]),	 // Templated
			.DRAM_ENB_ERROR(DRAM1_ENB_ERROR),	 // Templated
			.DRAM_FAIL_OVER(DRAM_FAIL_OVER),
			.DRAM_FAIL_PART(DRAM_FAIL_PART[5:0]));
	dimm_if_mon dimm_if_mon2 (/*AUTOINST*/
			// Inouts
			.DRAM_DQ	(DRAM2_DQ[127:0]),	 // Templated
			// Inputs
			.clk	(dram_gclk),		 // Templated
			.DRAM_CK	({4{DRAM2_CK_P[3], DRAM2_CK_N[3]}}), // Templated
			.DRAM_CKE	(DRAM2_CKE),		 // Templated
			.DRAM_RST_L(DRAM2_RST_L),		 // Templated
			.DRAM_CS_L	(DRAM2_CS_L[1:0]),	 // Templated
			.DRAM_BA	(DRAM2_BA[2:0]),	 // Templated
			.DRAM_ADDR	(DRAM2_ADDR[14:0]),	 // Templated
			.DRAM_RAS_L(DRAM2_RAS_L),		 // Templated
			.DRAM_CAS_L(DRAM2_CAS_L),		 // Templated
			.DRAM_WE_L	(DRAM2_WE_L),		 // Templated
			.DRAM_CB	(DRAM2_CB[15:0]),	 // Templated
			.DRAM_DQS	(DRAM2_DQS[35:0]),	 // Templated
			.DRAM_ENB_ERROR(DRAM2_ENB_ERROR),	 // Templated
			.DRAM_FAIL_OVER(DRAM_FAIL_OVER),
			.DRAM_FAIL_PART(DRAM_FAIL_PART[5:0]));
	dimm_if_mon dimm_if_mon3 (/*AUTOINST*/
			// Inouts
			.DRAM_DQ	(DRAM3_DQ[127:0]),	 // Templated
			// Inputs
			.clk	(dram_gclk),		 // Templated
			.DRAM_CK	({4{DRAM3_CK_P[3], DRAM3_CK_N[3]}}), // Templated
			.DRAM_CKE	(DRAM3_CKE),		 // Templated
			.DRAM_RST_L(DRAM3_RST_L),		 // Templated
			.DRAM_CS_L	(DRAM3_CS_L[1:0]),	 // Templated
			.DRAM_BA	(DRAM3_BA[2:0]),	 // Templated
			.DRAM_ADDR	(DRAM3_ADDR[14:0]),	 // Templated
			.DRAM_RAS_L(DRAM3_RAS_L),		 // Templated
			.DRAM_CAS_L(DRAM3_CAS_L),		 // Templated
			.DRAM_WE_L	(DRAM3_WE_L),		 // Templated
			.DRAM_CB	(DRAM3_CB[15:0]),	 // Templated
			.DRAM_DQS	(DRAM3_DQS[35:0]),	 // Templated
			.DRAM_ENB_ERROR(DRAM3_ENB_ERROR),	 // Templated
			.DRAM_FAIL_OVER(DRAM_FAIL_OVER),
			.DRAM_FAIL_PART(DRAM_FAIL_PART[5:0]));

`endif


  initial begin
   if ( $test$plusargs("CMP_DRAM_ENB_ERROR") ) begin 
    force `TOP_MOD.cmp_dram.DRAM0_ENB_ERROR = 1'b1;
    force `TOP_MOD.cmp_dram.DRAM1_ENB_ERROR = 1'b1;
    force `TOP_MOD.cmp_dram.DRAM2_ENB_ERROR = 1'b1;
    force `TOP_MOD.cmp_dram.DRAM3_ENB_ERROR = 1'b1;
   end
/*
    DRAM0_FAIL_OVER = 1'b0;
    DRAM1_FAIL_OVER = 1'b0;
    DRAM2_FAIL_OVER = 1'b0;
    DRAM3_FAIL_OVER = 1'b0;
    DRAM0_FAIL_PART = 6'h0;
    DRAM1_FAIL_PART = 6'h0;
    DRAM2_FAIL_PART = 6'h0;
    DRAM3_FAIL_PART = 6'h0;
*/
  end

`ifdef DENALI_ON

  //////////////////////////////////
  // Task to enable error injection
  //
  task enb_errors;
    input [3:0]  ch;
    input [17:0] comp;
    input [31:0] seed;
    input [3:0]  bits;
    integer m_id;
    integer status;
    begin
      $display("%0d: Enabling error injection:- ch[%0d], component[%0d]\n", $time, ch, comp);
      if (ch[0]) begin
        if (comp[0]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U00");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[1]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U01");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[2]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U02");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[3]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U03");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[4]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U04");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[5]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U05");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[6]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U06");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[7]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U07");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[8]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U08");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[9]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U09");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[10]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U10");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[11]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U11");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[12]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U12");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[13]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U13");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[14]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U14");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[15]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U15");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[16]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U16");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[17]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem0.dimm0.U17");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
      end
      if (ch[1]) begin
        if (comp[0]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U00");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[1]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U01");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[2]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U02");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[3]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U03");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[4]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U04");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[5]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U05");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[6]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U06");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[7]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U07");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[8]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U08");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[9]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U09");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[10]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U10");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[11]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U11");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[12]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U12");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[13]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U13");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[14]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U14");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[15]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U15");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[16]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U16");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[17]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem1.dimm0.U17");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
      end
      if (ch[2]) begin
        if (comp[0]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U00");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[1]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U01");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[2]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U02");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[3]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U03");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[4]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U04");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[5]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U05");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[6]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U06");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[7]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U07");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[8]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U08");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[9]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U09");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[10]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U10");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[11]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U11");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[12]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U12");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[13]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U13");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[14]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U14");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[15]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U15");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[16]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U16");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[17]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem2.dimm0.U17");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
      end
      if (ch[3]) begin
        if (comp[0]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U00");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[1]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U01");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[2]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U02");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[3]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U03");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[4]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U04");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[5]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U05");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[6]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U06");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[7]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U07");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[8]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U08");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[9]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U09");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[10]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U10");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[11]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U11");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[12]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U12");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[13]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U13");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[14]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U14");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[15]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U15");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[16]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U16");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
        if (comp[17]) begin
          m_id = $mminstanceid("cmp_top.cmp_dram.mem3.dimm0.U17");
          status = $mmerrinject(m_id, "-seed 0 -reads 2 4 -bits 1 -percent 100");
        end
      end
    end
  endtask

`endif // DENALI_ON

`ifdef GATE_SIM_DRAM
reg     dram_i2c_enabled;

initial
begin
  if ($test$plusargs("LO_STACK_RANK_BIT")) begin
    force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_bank_low_sel_u_dffrl_async_ns_0_.q = 1'b1 ;
    force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_bank_low_sel_u_dffrl_async_ns_0_.q = 1'b1 ;
    force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_bank_low_sel_u_dffrl_async_ns_0_.q = 1'b1 ;
    force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_bank_low_sel_u_dffrl_async_ns_0_.q = 1'b1 ;

  end
end

initial
begin
  if (!$test$plusargs("no_dram_slam_init"))  begin 
    dram_i2c_enabled = 1'b0;
    if ( ($test$plusargs("RANK_DIMM")) && ($test$plusargs("STACK_DIMM")) && ($test$plusargs("DRAM_I2C") == 0) ) begin
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_rank1_present_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_rank1_present_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_rank1_present_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_rank1_present_u_dffrl_async_ns_0_.q = 1'b1;

      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_stacked_dimm_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_stacked_dimm_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_stacked_dimm_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_stacked_dimm_u_dffrl_async_ns_0_.q = 1'b1;

      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b1;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b0;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b1;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b0;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b1;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b0;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b1;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b0;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
    end
    else if ( ($test$plusargs("RANK_DIMM")) && ($test$plusargs("DRAM_I2C") == 0) ) begin
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_rank1_present_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_rank1_present_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_rank1_present_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_rank1_present_u_dffrl_async_ns_0_.q = 1'b1;

      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b0;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b1;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b0;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b1;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b0;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b1;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b0;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b1;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
    end
    else if ( ($test$plusargs("STACK_DIMM")) && ($test$plusargs("DRAM_I2C") == 0) ) begin
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_stacked_dimm_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_stacked_dimm_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_stacked_dimm_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_stacked_dimm_u_dffrl_async_ns_0_.q = 1'b1;

      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b0;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b1;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b0;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b1;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b0;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b1;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_tot_ranks_2_ = 1'b0;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_tot_ranks_1_ = 1'b1;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_tot_ranks_0_ = 1'b0;
    end

    if ($test$plusargs("DRAM_SCRUB")) begin
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_data_scrub_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_data_scrub_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_data_scrub_u_dffrl_async_ns_0_.q = 1'b1;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_data_scrub_u_dffrl_async_ns_0_.q = 1'b1;

      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_11_.q = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_10_.q = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_9_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_8_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_7_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_6_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_5_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_4_.q  = 1'b1 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_3_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_2_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_1_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_0_.q  = 1'b0 ;
  
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_11_.q = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_10_.q = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_9_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_8_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_7_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_6_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_5_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_4_.q  = 1'b1 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_3_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_2_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_1_.q  = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_0_.q  = 1'b0 ;
  
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_11_.q = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_10_.q = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_9_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_8_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_7_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_6_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_5_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_4_.q  = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_3_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_2_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_1_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_0_.q  = 1'b0 ;
  
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_11_.q = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_10_.q = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_9_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_8_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_7_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_6_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_5_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_4_.q  = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_3_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_2_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_1_.q  = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_freq_scrb_u_dffsl_async_ns_0_.q  = 1'b0 ;
    end

    if ($test$plusargs("DIMM_SIZE_1G"))  begin
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b1 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b0 ;

      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b1 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b0 ;

      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b0 ;

      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b0 ;
    end
    else if ($test$plusargs("DIMM_SIZE_512"))  begin
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b1 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b0 ;

      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b1 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b0 ;

      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b0 ;

      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b0 ;

      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_eight_bank_present_u_dffsl_async_ns_0_.q = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_eight_bank_present_u_dffsl_async_ns_0_.q = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_eight_bank_present_u_dffsl_async_ns_0_.q = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_eight_bank_present_u_dffsl_async_ns_0_.q = 1'b0 ;
    end
    else if ($test$plusargs("DIMM_SIZE_256"))  begin
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b0 ;
      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b1 ;

      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b1 ;

      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b1 ;

      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_3_.q = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_2_.q = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_1_.q = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ras_addr_bits_u_dffsl_async_ns_0_.q = 1'b1 ;

      force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_eight_bank_present_u_dffsl_async_ns_0_.q = 1'b0 ;
      force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_eight_bank_present_u_dffsl_async_ns_0_.q = 1'b0 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_eight_bank_present_u_dffsl_async_ns_0_.q = 1'b0 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_eight_bank_present_u_dffsl_async_ns_0_.q = 1'b0 ;
    end
    else        begin
      // use default  = 2G b
    end
    
    if ($test$plusargs("2CHANNEL_01")) begin
      #1300000 force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_ch_enabled_u_dffrl_async_ns_0_.q = 1'b1 ;
      force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_ch_enabled_u_dffrl_async_ns_0_.q = 1'b1 ;
    end
    else if ($test$plusargs("2CHANNEL_23")) begin
      #1300000 force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_ch_enabled_u_dffrl_async_ns_0_.q = 1'b1 ;
      force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_ch_enabled_u_dffrl_async_ns_0_.q = 1'b1 ;
    end


  end // of no_dram_slam_init
end

initial
 begin
    if (! $value$plusargs("force_cas_latency=%d", cas_latency)) begin
      cas_latency = 3 ;
    end
 end

always @(posedge `DCTLPATH0.dram_rclk)       
begin                                                              

  if($test$plusargs("NO_BYPASS_POR_WAIT")) begin
   if($test$plusargs("BYPASS_WMR_WAIT")) begin
    // if warm reset and waiting for 200 us clocks 
    if({`DCTLPATH0.ch0_que_pos [4],
	`DCTLPATH0.ch0_que_pos [3],
	`DCTLPATH0.ch0_que_pos [2],
	`DCTLPATH0.ch0_que_pos [1],
	`DCTLPATH0.ch0_que_pos [0]} == 5'he)
    begin
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;

        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;

        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;

        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;
    end else begin 
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_;

        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_;

        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_;

        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_;
    end
   end
  end else begin
    force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_pad_clk_enable_u_dffrl_ns_0_.q = 1'b1 ;
    force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_pad_clk_enable_u_dffrl_ns_0_.q = 1'b1 ;
    force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_pad_clk_enable_u_dffrl_ns_0_.q = 1'b1 ;
    force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_pad_clk_enable_u_dffrl_ns_0_.q = 1'b1 ;

    force `DCTLPATH0.dramctl0_dram_dctl_dram_que_ff_cke_enable_u_dffrl_ns_0_.q = 1'b1 ;
    force `DCTLPATH0.dramctl1_dram_dctl_dram_que_ff_cke_enable_u_dffrl_ns_0_.q = 1'b1 ;
    force `DCTLPATH1.dramctl0_dram_dctl_dram_que_ff_cke_enable_u_dffrl_ns_0_.q = 1'b1 ;
    force `DCTLPATH1.dramctl1_dram_dctl_dram_que_ff_cke_enable_u_dffrl_ns_0_.q = 1'b1 ;

    if({`DCTLPATH0.ch0_que_pos [4],
	`DCTLPATH0.ch0_que_pos [3],
	`DCTLPATH0.ch0_que_pos [2],
	`DCTLPATH0.ch0_que_pos [1],
	`DCTLPATH0.ch0_que_pos [0]} == 5'h0)
    begin
       if(`DCTLPATH0.dramctl0_dram_dctl_dram_que_que_hw_selfrsh == 1'b0 ) 
       begin 
      	force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_init = 1'b1;
      	force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_init = 1'b1;
      	force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_init = 1'b1;
      	force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_init = 1'b1;

      	force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
      	force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
      	force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
      	force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
      	force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;

      	force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
      	force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
      	force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
      	force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
      	force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;

      	force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
      	force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
      	force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
      	force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
      	force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;

      	force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
      	force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
      	force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
      	force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
      	force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;
       end
    end
    if({`DCTLPATH0.ch0_que_pos [4],
	`DCTLPATH0.ch0_que_pos [3],
	`DCTLPATH0.ch0_que_pos [2],
	`DCTLPATH0.ch0_que_pos [1],
	`DCTLPATH0.ch0_que_pos [0]} == 5'h1)
    begin
      	release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_init;
      	release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_init;
      	release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_init;
      	release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_init;

        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_;

        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_;

        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_;
        
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_;
    end

    // if warm reset and waiting for 200 us clocks
    if({`DCTLPATH0.ch0_que_pos [4],
        `DCTLPATH0.ch0_que_pos [3],
        `DCTLPATH0.ch0_que_pos [2],
        `DCTLPATH0.ch0_que_pos [1],
        `DCTLPATH0.ch0_que_pos [0]} == 5'he)
    begin
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
        force `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;

        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
        force `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;

        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
        force `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;

        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_ = 1'b0;
        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_ = 1'b0;
        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_ = 1'b1;
        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_ = 1'b1;
        force `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_ = 1'b1;
    end else begin
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH0.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_;

        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH0.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_;

        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH1.dramctl0_dram_dctl_dram_que_que_bank_idle_cnt_4_;

        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_0_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_1_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_2_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_3_;
        release `DCTLPATH1.dramctl1_dram_dctl_dram_que_que_bank_idle_cnt_4_;
    end
  end
end	// always
`else // ifdef GATE_SIM_DRAM

//////////////////////////////////////
// These are hacks, remove them later

reg [5:0] dv_cnt;
reg [5:0] rtw_dly_reg;
initial
 begin
    if (!$value$plusargs("SYSTEM_DV_MATCH=%d", dv_cnt)) begin
      dv_cnt = 2 ;
    end
   case(dv_cnt)  
    3 :  rtw_dly_reg = 1; 
    4 :  rtw_dly_reg = 2;
    default : rtw_dly_reg = 0; 
   endcase 

    if ($test$plusargs("SYSTEM_DV_MATCH")) begin
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_data_del_cnt = dv_cnt;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_data_del_cnt = dv_cnt;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_data_del_cnt = dv_cnt;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_data_del_cnt = dv_cnt;
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.rtw_dly_reg = rtw_dly_reg;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.rtw_dly_reg = rtw_dly_reg;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.rtw_dly_reg = rtw_dly_reg;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.rtw_dly_reg = rtw_dly_reg;
    end

 end

reg	dram_i2c_enabled;
// set the corresponding registers to achieve this
initial 
begin
    if ($test$plusargs("LO_STACK_RANK_BIT")) begin
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_addr_bank_low_sel = 1'b1;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_addr_bank_low_sel = 1'b1;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_addr_bank_low_sel = 1'b1;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_addr_bank_low_sel = 1'b1;
    end
end

initial 
begin
// This is included to keep the DRAM SAT tests transperent to the 
// no_slam_init related changes. no_slam_init is now in dram.config,
// so by default there is no slamming, but we need slamming in rank,stack/etc
// regressions, so add this SLAM_INIT_CMP, so as to nothing changes for SAT
`ifdef DRAM_SAT
  if ($test$plusargs("SLAM_INIT_CMP")) begin 
`else
  if (!$test$plusargs("no_dram_slam_init")) begin 
`endif // ifdef DRAM_SAT

    dram_i2c_enabled = 1'b0;
    if ( ($test$plusargs("RANK_DIMM")) && ($test$plusargs("STACK_DIMM")) &&
			($test$plusargs("DRAM_I2C") == 0) ) begin
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_rank1_present = 1'b1;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_rank1_present = 1'b1;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_rank1_present = 1'b1;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_rank1_present = 1'b1;
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.chip_config_reg[0] = 1'b1;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.chip_config_reg[0] = 1'b1;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.chip_config_reg[0] = 1'b1;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.chip_config_reg[0] = 1'b1;
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h4;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h4;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h4;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h4;
    end
    else if ( ($test$plusargs("RANK_DIMM")) && ($test$plusargs("DRAM_I2C") == 0) ) begin
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_rank1_present = 1'b1;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_rank1_present = 1'b1;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_rank1_present = 1'b1;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_rank1_present = 1'b1;
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h2;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h2;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h2;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h2;
    end
    else if ( ($test$plusargs("STACK_DIMM")) && ($test$plusargs("DRAM_I2C") == 0) ) begin
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.chip_config_reg[0] = 1'b1;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.chip_config_reg[0] = 1'b1;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.chip_config_reg[0] = 1'b1;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.chip_config_reg[0] = 1'b1;
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h2;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h2;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h2;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_tot_ranks[2:0] = 3'h2;
    end

    if ($test$plusargs("DRAM_SCRUB")) begin
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_data_scrub_enabled = 1'b1;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_data_scrub_enabled = 1'b1;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_data_scrub_enabled = 1'b1;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_data_scrub_enabled = 1'b1;
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.chip_config_reg[20:9] =12'h10;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.chip_config_reg[20:9] =12'h10;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.chip_config_reg[20:9] =12'h10;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.chip_config_reg[20:9] =12'h10;
    end

    if ($test$plusargs("DIMM_SIZE_1G"))  begin 
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.chip_config_reg[8:5] =12'he;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.chip_config_reg[8:5] =12'he;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.chip_config_reg[8:5] =12'he;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.chip_config_reg[8:5] =12'he;
    end
    else if ($test$plusargs("DIMM_SIZE_512"))  begin 
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.chip_config_reg[8:5] =12'he;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.chip_config_reg[8:5] =12'he;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.chip_config_reg[8:5] =12'he;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.chip_config_reg[8:5] =12'he;
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_eight_bank_mode  = 1'b0;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_eight_bank_mode  = 1'b0;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_eight_bank_mode  = 1'b0;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_eight_bank_mode  = 1'b0;
    end
    else if ($test$plusargs("DIMM_SIZE_256"))  begin 
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.chip_config_reg[8:5] =12'hd;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.chip_config_reg[8:5] =12'hd;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.chip_config_reg[8:5] =12'hd;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.chip_config_reg[8:5] =12'hd;
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_eight_bank_mode  = 1'b0;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_eight_bank_mode  = 1'b0;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_eight_bank_mode  = 1'b0;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_eight_bank_mode  = 1'b0;
    end 
    else        begin 
      // use default  = 2G b
    end                              

`ifdef  TWO_CH_DELAY_LONG_VERSION
`define TWO_CHANNEL_DELAY #1300000
`else
`define TWO_CHANNEL_DELAY #600000
`endif

    if ($test$plusargs("2CHANNEL_01")) begin
    	`TWO_CHANNEL_DELAY  
        //force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_channel_disabled = 1'b1;
    	//force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_channel_disabled = 1'b1;
        force `DRAM_PATH2.que_channel_disabled = 1'b1;
    	force `DRAM_PATH3.que_channel_disabled = 1'b1;
    end
    else if ($test$plusargs("2CHANNEL_23")) begin
    	`TWO_CHANNEL_DELAY 
        //force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_channel_disabled = 1'b1;
    	//force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_channel_disabled = 1'b1;
        force `DRAM_PATH0.que_channel_disabled = 1'b1;
        force `DRAM_PATH1.que_channel_disabled = 1'b1;
    end
    else if ($test$plusargs("2CHANNEL_03")) begin
    	`TWO_CHANNEL_DELAY 
        //force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_channel_disabled = 1'b1;
    	//force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_channel_disabled = 1'b1;
        force `DRAM_PATH2.que_channel_disabled = 1'b1;
        force `DRAM_PATH1.que_channel_disabled = 1'b1;
    end
    else if ($test$plusargs("2CHANNEL_21") || $test$plusargs("2CHANNEL_12") ) begin
    	`TWO_CHANNEL_DELAY 
        //force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_channel_disabled = 1'b1;
    	//force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_channel_disabled = 1'b1;
        force `DRAM_PATH0.que_channel_disabled = 1'b1;
        force `DRAM_PATH3.que_channel_disabled = 1'b1;
    end
 end // no_slam_init

end

initial
 begin 
    if (! $value$plusargs("force_cas_latency=%d", cas_latency)) begin
      cas_latency = 3 ;
    end
 end

// This is env fix so that logic does not have to wait 200us on POR
always @(posedge `DCTLPATH0.dramctl0.dram_dctl.dram_que.clk)
begin
  if($test$plusargs("NO_BYPASS_POR_WAIT")) begin
   if($test$plusargs("BYPASS_WMR_WAIT")) begin
    // if warm reset and waiting for 200 us clocks 
    if(`DCTLPATH0.dramctl0.dram_dctl.dram_que.que_pos == 5'he)
    begin
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
    end else begin 
      release `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt;
      release `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt;
      release `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt;
      release `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt;
    end
   end
  end else begin 
      	force `DCTLPATH0.dramctl0.dram_dctl.dram_que.dram_io_clk_enable = 1'b1;
      	force `DCTLPATH0.dramctl1.dram_dctl.dram_que.dram_io_clk_enable = 1'b1;
      	force `DCTLPATH1.dramctl0.dram_dctl.dram_que.dram_io_clk_enable = 1'b1;
      	force `DCTLPATH1.dramctl1.dram_dctl.dram_que.dram_io_clk_enable = 1'b1;
      	force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_cke_reg = 1'b1;
      	force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_cke_reg = 1'b1;
      	force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_cke_reg = 1'b1;
      	force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_cke_reg = 1'b1;

    // If I2C read disabled or enabled and rd_done then init
    if(`DCTLPATH0.dramctl0.dram_dctl.dram_que.que_pos == 5'h0) 
    begin
    // when warm reset then dont force
    if(`DCTLPATH0.dramctl0.dram_dctl.dram_que.que_hw_selfrsh == 1'b0 ) 
     begin 
       // If we need to change the default parameters and issue que_init from diag
       if (!$test$plusargs("QUE_INIT_FROM_DIAG")) begin 
      	force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_init = 1'b1;
      	force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_init = 1'b1;
      	force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_init = 1'b1;
      	force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_init = 1'b1;
       end
      if($test$plusargs("force_cas_latency")) begin
      	force `DCTLPATH0.dramctl0.dram_dctl.dram_que.mode_reg[6:4] = cas_latency;
      	force `DCTLPATH0.dramctl1.dram_dctl.dram_que.mode_reg[6:4] = cas_latency;
      	force `DCTLPATH1.dramctl0.dram_dctl.dram_que.mode_reg[6:4] = cas_latency;
      	force `DCTLPATH1.dramctl1.dram_dctl.dram_que.mode_reg[6:4] = cas_latency;
        // In DRAM SAT register update is done, this is only for cmp
        `ifdef DRAM_SAT
        `else
      	force `DCTLPATH0.dramctl0.dram_dctl.dram_que.rp_reg = cas_latency;
      	force `DCTLPATH0.dramctl1.dram_dctl.dram_que.rp_reg = cas_latency;
      	force `DCTLPATH1.dramctl0.dram_dctl.dram_que.rp_reg = cas_latency;
      	force `DCTLPATH1.dramctl1.dram_dctl.dram_que.rp_reg = cas_latency;
        `endif
      	//force `DCTLPATH0.dramctl0.dram_dctl.dram_que.dal_reg = 4'hc;
      	//force `DCTLPATH0.dramctl1.dram_dctl.dram_que.dal_reg = 4'hc;
      	//force `DCTLPATH1.dramctl0.dram_dctl.dram_que.dal_reg = 4'hc;
      	//force `DCTLPATH1.dramctl1.dram_dctl.dram_que.dal_reg = 4'hc;
      end
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
     end
    end
    if(`DCTLPATH0.dramctl0.dram_dctl.dram_que.que_pos == 5'h1) 
    begin
      release `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_init;
      release `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_init;
      release `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_init;
      release `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_init;
      //release `DCTLPATH0.dramctl0.dram_dctl.dram_que.dram_io_clk_enable;
      //release `DCTLPATH0.dramctl1.dram_dctl.dram_que.dram_io_clk_enable;
      //release `DCTLPATH1.dramctl0.dram_dctl.dram_que.dram_io_clk_enable;
      //release `DCTLPATH1.dramctl1.dram_dctl.dram_que.dram_io_clk_enable;
      //release `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_cke_reg;
      //release `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_cke_reg;
      //release `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_cke_reg;
      //release `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_cke_reg;
      release `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt;
      release `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt;
      release `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt;
      release `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt;
    end

    // if warm reset and waiting for 200 us clocks 
    if(`DCTLPATH0.dramctl0.dram_dctl.dram_que.que_pos == 5'he)
    begin
      force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
      force `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
      force `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
      force `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt = 5'h1c;
    end else begin 
      release `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt;
      release `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt;
      release `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt;
      release `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt;
    end


 end // NO_BYPASS_POR_WAIT

end // end always

// Added for bumping up the scrub counter
always @(posedge `DCTLPATH0.dramctl0.dram_dctl.dram_que.clk)
begin
if ($test$plusargs("SCRB_ADDR_BUMPUP")) begin 
    if(`DCTLPATH0.dramctl0.dram_dctl.dram_que.que_scrb_write_req == 1'b1)
    begin

      // If CAS is 2 ( que_scrb_cas_addr = 3) , bump it to 1fc
       //if(`DCTLPATH0.dramctl0.dram_dctl.dram_que.que_scrb_cas_addr == 9'h2)
       if(`DCTLPATH0.dramctl0.dram_dctl.dram_que.que_scrb_cas_addr == 9'h1)
        force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_scrb_cas_addr = 9'h1fe;

      // If RAS is 2 ( que_scrb_ras_addr = 3) , bump it to 7ffc
       if(`DCTLPATH0.dramctl0.dram_dctl.dram_que.que_scrb_ras_addr == 15'h2)
        force `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_scrb_ras_addr = 15'h7ffe;
       
    end
    else
    begin
        release `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_scrb_cas_addr;
        release `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_scrb_ras_addr;
    end
end // testplus arg

end // end always

//`ifdef WARM_RESET
initial 
  begin 
  if($test$plusargs("WARM_RESET")) begin

  if($test$plusargs("POWER_THROTTLE")) begin
   #6000000;
  end
   
   #300000;
   #1905670;
   //force `DCTLPATH0.dram_arst_l = 1'b1; This is not changed for warm reset.
   force `DCTLPATH0.clspine_dram_selfrsh = 1'b1; // set refresh = 1 for warm refresh
   #2000;
   force `DCTLPATH0.jbus_grst_l = 1'b0;
   force `DCTLPATH0.cmp_grst_l = 1'b0;
   #2000;
   //force `DCTLPATH0.clspine_dram_selfrsh = 1'b1; // set refresh = 1 for warm refresh
   #1000000;
   //#250000;
   force `DCTLPATH0.dram_grst_l = 1'b0;
   #700000;
   force `DCTLPATH0.jbus_grst_l = 1'b1;
   force `DCTLPATH0.cmp_grst_l = 1'b1;
   force `DCTLPATH0.dram_grst_l = 1'b1;
   #2000;
   force `DCTLPATH0.clspine_dram_selfrsh = 1'b0; // set refresh = 1 for warm refresh
   #700000;
   release `DCTLPATH0.jbus_grst_l;
   release `DCTLPATH0.cmp_grst_l;
   release `DCTLPATH0.dram_grst_l;

  end
 end

//`endif

`endif	// ifdef GATE_SIM_DRAM

endmodule //
// Local Variables:
// verilog-library-directories:("." "../../../design/rtl" "../../../design/dram/rtl""../../../design/pad_ddr02/rtl"  "../../../design/pad_ddr13/rtl")
// verilog-library-extensions:(".v" ".h")
// End:

