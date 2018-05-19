// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: cmp_mem.v
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

module cmp_mem (/*AUTOARG*/);
  integer handle;
  reg [29:0] data;
  reg [1023:0] file;
  integer 	suc;


  ////////////////////////////////////////
  // Create & Initialize the DIMM Modules
  reg [31:0] dimm_config;
  reg [6:0]  mem_dat_load_config;

  initial begin
`ifdef RTL_SPARC0
    file  = "mem.image";
`else
    if ($test$plusargs("RANK_DIMM"))
      mem_dat_load_config[0] = 1;
    else
      mem_dat_load_config[0] = 0;
    if ($test$plusargs("STACK_DIMM"))
      mem_dat_load_config[1] = 1;
    else
      mem_dat_load_config[1] = 0;
    if ($test$plusargs("DIMM_SIZE_256"))
      mem_dat_load_config[2] = 1;
    else
      mem_dat_load_config[2] = 0;
    if ($test$plusargs("DIMM_SIZE_512"))
      mem_dat_load_config[3] = 1;
    else
      mem_dat_load_config[3] = 0;
    if ($test$plusargs("DIMM_SIZE_1G"))
      mem_dat_load_config[4] = 1;
    else
      mem_dat_load_config[4] = 0;
    if ($test$plusargs("DIMM_SIZE_2G"))
      mem_dat_load_config[5] = 1;
    else
      mem_dat_load_config[5] = 0;
    if ($test$plusargs("MEM_PARTIAL"))
      mem_dat_load_config[6] = 1;
    else
      mem_dat_load_config[6] = 0;

       //$display("\n%d: Info->Mem_dat_load_config in cmp_mem : %0x\n", $time, mem_dat_load_config);

 case(mem_dat_load_config)
      7'b0000001 : file  = "mem1.data";
      7'b0000010 : file  = "mem1.data";
      7'b0000011 : file  = "mem2.data";
      7'b1000001 : file  = "mem1_partial.data";
      7'b1000010 : file  = "mem1_partial.data";
      7'b0000011 : file  = "mem2_partial.data";
      7'b0000101 : file  = "mem1_256Mb.data";
      7'b0000110 : file  = "mem1_256Mb.data";
      7'b0000111 : file  = "mem2_256Mb.data";
      7'b0001001 : file  = "mem1_512Mb.data";
      7'b0001010 : file  = "mem1_512Mb.data";
      7'b0001011 : file  = "mem2_512Mb.data";
      7'b0010001 : file  = "mem1_1G.data";
      7'b0010010 : file  = "mem1_1G.data";
      7'b0010011 : file  = "mem2_1G.data";
      7'b0100001 : file  = "mem1.data";
      7'b0100010 : file  = "mem1.data";
      7'b0100011 : file  = "mem2.data";
      default    : file  = "mem.data";
 endcase



`endif

`ifdef DENALI_ON
  `ifdef DRAM_SAT
  `else
   // Load only at cmp and above levels
   //rekesh will add the config for denali.
     dimm_config = 32'h0;
     file = "mem.image";
     $init_dram(file, dimm_config);
   `endif // DRAM_SAT
`else
    dimm_config = 32'h0;
    if ($test$plusargs("2CHANNEL_01"))        dimm_config = dimm_config | 32'h10;   // 2ch_01   bit 4
    else if ($test$plusargs("2CHANNEL_23"))   dimm_config = dimm_config | 32'h20;   // 2ch_23   bit 5
    else if ($test$plusargs("2CHANNEL_03"))   dimm_config = dimm_config | 32'h8000; // 2ch_03   bit 31
    else if ($test$plusargs("2CHANNEL_21") || $test$plusargs("2CHANNEL_12") )
                                              dimm_config = dimm_config | 32'h4000; // 2ch_21   bit 30

`ifdef DRAM_SAT

    if      ($test$plusargs("DIMM_SIZE_2G"))  dimm_config = dimm_config | 32'h1003;
    else if ($test$plusargs("DIMM_SIZE_1G"))  dimm_config = dimm_config | 32'h1002;
    else if ($test$plusargs("DIMM_SIZE_512")) dimm_config = dimm_config | 32'h0001;
    else if ($test$plusargs("DIMM_SIZE_256")) dimm_config = dimm_config | 32'h0000;
    else                                      dimm_config = dimm_config | 32'h1003;

    if ($test$plusargs("STACK_DIMM"))         dimm_config = dimm_config | 32'h40;
    if ($test$plusargs("RANK_DIMM"))          dimm_config = dimm_config | 32'h80;
    if ($test$plusargs("LO_STACK_RANK_BIT"))  dimm_config = dimm_config | 32'h100;

`else	// DRAM_SAT

    if      ($test$plusargs("DIMM_SIZE_2G"))  dimm_config = dimm_config | 32'h1005;
    else if ($test$plusargs("DIMM_SIZE_1G"))  dimm_config = dimm_config | 32'h1004;
    else if ($test$plusargs("DIMM_SIZE_512")) dimm_config = dimm_config | 32'h0003;
    else if ($test$plusargs("DIMM_SIZE_256")) dimm_config = dimm_config | 32'h0002;
    else                                      dimm_config = dimm_config | 32'h1005;

`endif	// DRAM_SAT

`ifdef INFINEON

     `DRAMPATH0.dimm0.U00.handle = 0;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U01.handle = 1;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U02.handle = 2;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U03.handle = 3;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U05.handle = 4;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U06.handle = 5;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U07.handle = 6;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U08.handle = 7;//$config_mem(40, 4);

     `DRAMPATH0.dimm0.U09.handle = 8;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U10.handle = 9;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U11.handle = 10;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U12.handle = 11;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U14.handle = 12;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U15.handle = 13;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U16.handle = 14;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U17.handle = 15;//$config_mem(40, 4);

     `DRAMPATH0.dimm1.U00.handle = 16;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U01.handle = 17;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U02.handle = 18;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U03.handle = 19;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U05.handle = 20;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U06.handle = 21;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U07.handle = 22;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U08.handle = 23;//$config_mem(40, 4);

     `DRAMPATH0.dimm1.U09.handle = 24;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U10.handle = 25;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U11.handle = 26;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U12.handle = 27;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U14.handle = 28;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U15.handle = 29;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U16.handle = 30;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U17.handle = 31;//$config_mem(40, 4);
	//channel 1
     `DRAMPATH1.dimm0.U00.handle = 32;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U01.handle = 33;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U02.handle = 34;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U03.handle = 35;// $config_mem(40, 4);
     `DRAMPATH1.dimm0.U05.handle = 36;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U06.handle = 37;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U07.handle = 38;// $config_mem(40, 4);
     `DRAMPATH1.dimm0.U08.handle = 39;//$config_mem(40, 4);

     `DRAMPATH1.dimm0.U09.handle = 40;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U10.handle = 41;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U11.handle = 42;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U12.handle = 43;// $config_mem(40, 4);
     `DRAMPATH1.dimm0.U14.handle = 44;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U15.handle = 45;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U16.handle = 46;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U17.handle = 47;//$config_mem(40, 4);

     `DRAMPATH1.dimm1.U00.handle = 48;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U01.handle = 49;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U02.handle = 50;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U03.handle = 51;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U05.handle = 52;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U06.handle = 53;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U07.handle = 54;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U08.handle = 55;//$config_mem(40, 4);

     `DRAMPATH1.dimm1.U09.handle = 56;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U10.handle = 57;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U11.handle = 58;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U12.handle = 59;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U14.handle = 60;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U15.handle = 61;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U16.handle = 62;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U17.handle = 63;// $config_mem(40, 4);
	//channel 2
     `DRAMPATH2.dimm0.U00.handle = 64;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U01.handle = 65;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U02.handle = 66;// $config_mem(40, 4);
     `DRAMPATH2.dimm0.U03.handle = 67;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U05.handle = 68;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U06.handle = 69;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U07.handle = 70;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U08.handle = 71;//$config_mem(40, 4);

     `DRAMPATH2.dimm0.U09.handle = 72;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U10.handle = 73;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U11.handle = 74;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U12.handle = 75;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U14.handle = 76;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U15.handle = 77;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U16.handle = 78;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U17.handle = 79;//$config_mem(40, 4);

     `DRAMPATH2.dimm1.U00.handle = 80;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U01.handle = 81;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U02.handle = 82;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U03.handle = 83;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U05.handle = 84;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U06.handle = 85;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U07.handle = 86;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U08.handle = 87;//$config_mem(40, 4);

     `DRAMPATH2.dimm1.U09.handle = 88;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U10.handle = 89;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U11.handle = 90;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U12.handle = 91;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U14.handle = 92;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U15.handle = 93;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U16.handle = 94;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U17.handle = 95;//$config_mem(40, 4);
	//channel 3
     `DRAMPATH3.dimm0.U00.handle = 96;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U01.handle = 97;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U02.handle = 98;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U03.handle = 99;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U05.handle = 100;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U06.handle = 101;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U07.handle = 102;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U08.handle = 103;//$config_mem(40, 4);

     `DRAMPATH3.dimm0.U09.handle = 104;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U10.handle = 105;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U11.handle = 106;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U12.handle = 107;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U14.handle = 108;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U15.handle = 109;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U16.handle = 110;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U17.handle = 111;//$config_mem(40, 4);

     `DRAMPATH3.dimm1.U00.handle = 112;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U01.handle = 113;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U02.handle = 114;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U03.handle = 115;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U05.handle = 116;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U06.handle = 117;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U07.handle = 118;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U08.handle = 119;//$config_mem(40, 4);

     `DRAMPATH3.dimm1.U09.handle = 120;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U10.handle = 121;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U11.handle = 122;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U12.handle = 123;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U14.handle = 124;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U15.handle = 125;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U16.handle = 126;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U17.handle = 127;//$config_mem(40, 4);
     //ecc
     `DRAMPATH0.dimm0.U04.handle = 128;//$config_mem(40, 4);
     `DRAMPATH0.dimm0.U13.handle = 129;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U04.handle = 130;//$config_mem(40, 4);
     `DRAMPATH0.dimm1.U13.handle = 131;//$config_mem(40, 4);

     `DRAMPATH1.dimm0.U04.handle = 132;//$config_mem(40, 4);
     `DRAMPATH1.dimm0.U13.handle = 133;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U04.handle = 134;//$config_mem(40, 4);
     `DRAMPATH1.dimm1.U13.handle = 135;//$config_mem(40, 4);

     `DRAMPATH2.dimm0.U04.handle = 136;//$config_mem(40, 4);
     `DRAMPATH2.dimm0.U13.handle = 137;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U04.handle = 138;//$config_mem(40, 4);
     `DRAMPATH2.dimm1.U13.handle = 139;//$config_mem(40, 4);

     `DRAMPATH3.dimm0.U04.handle = 140;//$config_mem(40, 4);
     `DRAMPATH3.dimm0.U13.handle = 141;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U04.handle = 142;//$config_mem(40, 4);
     `DRAMPATH3.dimm1.U13.handle = 143;//$config_mem(40, 4);

`else // INFINEON

     `DRAMPATH0.dimm0.datah = 0;
     `DRAMPATH0.dimm0.ecch = 128;
     `DRAMPATH0.dimm1.datah = 16;
     `DRAMPATH0.dimm1.ecch = 130;

     `DRAMPATH1.dimm0.datah = 32;
     `DRAMPATH1.dimm0.ecch = 132;
     `DRAMPATH1.dimm1.datah = 48;
     `DRAMPATH1.dimm1.ecch = 134;

     `DRAMPATH2.dimm0.datah = 64;
     `DRAMPATH2.dimm0.ecch = 136;
     `DRAMPATH2.dimm1.datah = 80;
     `DRAMPATH2.dimm1.ecch = 138;

     `DRAMPATH3.dimm0.datah = 96;
     `DRAMPATH3.dimm0.ecch = 140;
     `DRAMPATH3.dimm1.datah = 112;
     `DRAMPATH3.dimm1.ecch = 142;

`endif // INFINEON

`ifdef DRAM_SAT
`ifdef STACK_DIMM
	 //stack dimm
	`DRAMPATH0.dimms0.U00.handle = 0+144;//`DRAMPATH0.dimm0.U00.handle;
	`DRAMPATH0.dimms0.U01.handle = 1+144;//`DRAMPATH0.dimm0.U01.handle;
        `DRAMPATH0.dimms0.U02.handle = 2+144;//`DRAMPATH0.dimm0.U02.handle;
        `DRAMPATH0.dimms0.U03.handle = 3+144;//`DRAMPATH0.dimm0.U03.handle;
        `DRAMPATH0.dimms0.U05.handle = 4+144;//`DRAMPATH0.dimm0.U05.handle;
        `DRAMPATH0.dimms0.U06.handle = 5+144;//`DRAMPATH0.dimm0.U06.handle;
        `DRAMPATH0.dimms0.U07.handle = 6+144;//`DRAMPATH0.dimm0.U07.handle;
        `DRAMPATH0.dimms0.U08.handle = 7+144;//`DRAMPATH0.dimm0.U08.handle;

        `DRAMPATH0.dimms0.U09.handle = 8+144;//`DRAMPATH0.dimm0.U09.handle;
        `DRAMPATH0.dimms0.U10.handle = 9+144;//`DRAMPATH0.dimm0.U10.handle;
        `DRAMPATH0.dimms0.U11.handle = 10+144;//`DRAMPATH0.dimm0.U11.handle;
        `DRAMPATH0.dimms0.U12.handle = 11+144;//`DRAMPATH0.dimm0.U12.handle;
        `DRAMPATH0.dimms0.U14.handle = 12+144;//`DRAMPATH0.dimm0.U14.handle;
        `DRAMPATH0.dimms0.U15.handle = 13+144;//`DRAMPATH0.dimm0.U15.handle;
        `DRAMPATH0.dimms0.U16.handle = 14+144;//`DRAMPATH0.dimm0.U16.handle;
        `DRAMPATH0.dimms0.U17.handle = 15+144;//`DRAMPATH0.dimm0.U17.handle;

        `DRAMPATH0.dimms1.U00.handle = 16+144;//`DRAMPATH0.dimm1.U00.handle;
        `DRAMPATH0.dimms1.U01.handle = 17+144;//`DRAMPATH0.dimm1.U01.handle;
        `DRAMPATH0.dimms1.U02.handle = 18+144;//`DRAMPATH0.dimm1.U02.handle;
        `DRAMPATH0.dimms1.U03.handle = 19+144;//`DRAMPATH0.dimm1.U03.handle;
        `DRAMPATH0.dimms1.U05.handle = 20+144;//`DRAMPATH0.dimm1.U05.handle;
        `DRAMPATH0.dimms1.U06.handle = 21+144;//`DRAMPATH0.dimm1.U06.handle;
        `DRAMPATH0.dimms1.U07.handle = 22+144;//`DRAMPATH0.dimm1.U07.handle;
	`DRAMPATH0.dimms1.U08.handle = 23+144;//`DRAMPATH0.dimm1.U08.handle;

        `DRAMPATH0.dimms1.U09.handle = 24+144;//`DRAMPATH0.dimm1.U09.handle;
        `DRAMPATH0.dimms1.U10.handle = 25+144;//`DRAMPATH0.dimm1.U10.handle;
        `DRAMPATH0.dimms1.U11.handle = 26+144;//`DRAMPATH0.dimm1.U11.handle;
        `DRAMPATH0.dimms1.U12.handle = 27+144;//`DRAMPATH0.dimm1.U12.handle;
        `DRAMPATH0.dimms1.U14.handle = 28+144;//`DRAMPATH0.dimm1.U14.handle;
        `DRAMPATH0.dimms1.U15.handle = 29+144;//`DRAMPATH0.dimm1.U15.handle;
        `DRAMPATH0.dimms1.U16.handle = 30+144;//`DRAMPATH0.dimm1.U16.handle;
        `DRAMPATH0.dimms1.U17.handle = 31+144;//`DRAMPATH0.dimm1.U17.handle;
	//channel 1
	`DRAMPATH1.dimms0.U00.handle = 32+144;//`DRAMPATH1.dimm0.U00.handle;
	`DRAMPATH1.dimms0.U01.handle = 33+144;//`DRAMPATH1.dimm0.U01.handle;
	`DRAMPATH1.dimms0.U02.handle = 34+144;//`DRAMPATH1.dimm0.U02.handle;
	`DRAMPATH1.dimms0.U03.handle = 35+144;//`DRAMPATH1.dimm0.U03.handle;
	`DRAMPATH1.dimms0.U05.handle = 36+144;//`DRAMPATH1.dimm0.U05.handle;
	`DRAMPATH1.dimms0.U06.handle = 37+144;//`DRAMPATH1.dimm0.U06.handle;
	`DRAMPATH1.dimms0.U07.handle = 38+144;//`DRAMPATH1.dimm0.U07.handle;
	`DRAMPATH1.dimms0.U08.handle = 39+144;//`DRAMPATH1.dimm0.U08.handle;

	`DRAMPATH1.dimms0.U09.handle = 40+144;//`DRAMPATH1.dimm0.U09.handle;
	`DRAMPATH1.dimms0.U10.handle = 41+144;//`DRAMPATH1.dimm0.U10.handle;
	`DRAMPATH1.dimms0.U11.handle = 42+144;//`DRAMPATH1.dimm0.U11.handle;
	`DRAMPATH1.dimms0.U12.handle = 43+144;//`DRAMPATH1.dimm0.U12.handle;
	`DRAMPATH1.dimms0.U14.handle = 44+144;//`DRAMPATH1.dimm0.U14.handle;
	`DRAMPATH1.dimms0.U15.handle = 45+144;//`DRAMPATH1.dimm0.U15.handle;
	`DRAMPATH1.dimms0.U16.handle = 46+144;//`DRAMPATH1.dimm0.U16.handle;
	`DRAMPATH1.dimms0.U17.handle = 47+144;//`DRAMPATH1.dimm0.U17.handle;

	`DRAMPATH1.dimms1.U00.handle = 48+144;//`DRAMPATH1.dimm1.U00.handle;
	`DRAMPATH1.dimms1.U01.handle = 49+144;//`DRAMPATH1.dimm1.U01.handle;
	`DRAMPATH1.dimms1.U02.handle = 50+144;//`DRAMPATH1.dimm1.U02.handle;
	`DRAMPATH1.dimms1.U03.handle = 51+144;//`DRAMPATH1.dimm1.U03.handle;
	`DRAMPATH1.dimms1.U05.handle = 52+144;//`DRAMPATH1.dimm1.U05.handle;
	`DRAMPATH1.dimms1.U06.handle = 53+144;//`DRAMPATH1.dimm1.U06.handle;
	`DRAMPATH1.dimms1.U07.handle = 54+144;//`DRAMPATH1.dimm1.U07.handle;
	`DRAMPATH1.dimms1.U08.handle = 55+144;//`DRAMPATH1.dimm1.U08.handle;

	`DRAMPATH1.dimms1.U09.handle = 56+144;//`DRAMPATH1.dimm1.U09.handle;
	`DRAMPATH1.dimms1.U10.handle = 57+144;//`DRAMPATH1.dimm1.U10.handle;
	`DRAMPATH1.dimms1.U11.handle = 58+144;//`DRAMPATH1.dimm1.U11.handle;
	`DRAMPATH1.dimms1.U12.handle = 59+144;//`DRAMPATH1.dimm1.U12.handle;
	`DRAMPATH1.dimms1.U14.handle = 60+144;//`DRAMPATH1.dimm1.U14.handle;
	`DRAMPATH1.dimms1.U15.handle = 61+144;//`DRAMPATH1.dimm1.U15.handle;
	`DRAMPATH1.dimms1.U16.handle = 62+144;//`DRAMPATH1.dimm1.U16.handle;
	`DRAMPATH1.dimms1.U17.handle = 63+144;//`DRAMPATH1.dimm1.U17.handle;
	//channel 2
	`DRAMPATH2.dimms0.U00.handle = 64+144;//`DRAMPATH2.dimm0.U00.handle;
	`DRAMPATH2.dimms0.U01.handle = 65+144;//`DRAMPATH2.dimm0.U01.handle;
	`DRAMPATH2.dimms0.U02.handle = 66+144;//`DRAMPATH2.dimm0.U02.handle;
	`DRAMPATH2.dimms0.U03.handle = 67+144;//`DRAMPATH2.dimm0.U03.handle;
	`DRAMPATH2.dimms0.U05.handle = 68+144;//`DRAMPATH2.dimm0.U05.handle;
	`DRAMPATH2.dimms0.U06.handle = 69+144;//`DRAMPATH2.dimm0.U06.handle;
	`DRAMPATH2.dimms0.U07.handle = 70+144;//`DRAMPATH2.dimm0.U07.handle;
	`DRAMPATH2.dimms0.U08.handle = 71+144;//`DRAMPATH2.dimm0.U08.handle;

	`DRAMPATH2.dimms0.U09.handle = 72+144;//`DRAMPATH2.dimm0.U09.handle;
	`DRAMPATH2.dimms0.U10.handle = 73+144;//`DRAMPATH2.dimm0.U10.handle;
	`DRAMPATH2.dimms0.U11.handle = 74+144;//`DRAMPATH2.dimm0.U11.handle;
	`DRAMPATH2.dimms0.U12.handle = 75+144;//`DRAMPATH2.dimm0.U12.handle;
	`DRAMPATH2.dimms0.U14.handle = 76+144;//`DRAMPATH2.dimm0.U14.handle;
	`DRAMPATH2.dimms0.U15.handle = 77+144;//`DRAMPATH2.dimm0.U15.handle;
	`DRAMPATH2.dimms0.U16.handle = 78+144;//`DRAMPATH2.dimm0.U16.handle;
	`DRAMPATH2.dimms0.U17.handle = 79+144;//`DRAMPATH2.dimm0.U17.handle;

	`DRAMPATH2.dimms1.U00.handle = 80+144;//`DRAMPATH2.dimm1.U00.handle;
	`DRAMPATH2.dimms1.U01.handle = 81+144;//`DRAMPATH2.dimm1.U01.handle;
	`DRAMPATH2.dimms1.U02.handle = 82+144;//`DRAMPATH2.dimm1.U02.handle;
	`DRAMPATH2.dimms1.U03.handle = 83+144;//`DRAMPATH2.dimm1.U03.handle;
	`DRAMPATH2.dimms1.U05.handle = 84+144;//`DRAMPATH2.dimm1.U05.handle;
	`DRAMPATH2.dimms1.U06.handle = 85+144;//`DRAMPATH2.dimm1.U06.handle;
	`DRAMPATH2.dimms1.U07.handle = 86+144;//`DRAMPATH2.dimm1.U07.handle;
	`DRAMPATH2.dimms1.U08.handle = 87+144;//`DRAMPATH2.dimm1.U08.handle;

	`DRAMPATH2.dimms1.U09.handle = 88+144;//`DRAMPATH2.dimm1.U09.handle;
	`DRAMPATH2.dimms1.U10.handle = 89+144;//`DRAMPATH2.dimm1.U10.handle;
	`DRAMPATH2.dimms1.U11.handle = 90+144;//`DRAMPATH2.dimm1.U11.handle;
	`DRAMPATH2.dimms1.U12.handle = 91+144;//`DRAMPATH2.dimm1.U12.handle;
	`DRAMPATH2.dimms1.U14.handle = 92+144;//`DRAMPATH2.dimm1.U14.handle;
	`DRAMPATH2.dimms1.U15.handle = 93+144;//`DRAMPATH2.dimm1.U15.handle;
	`DRAMPATH2.dimms1.U16.handle = 94+144;//`DRAMPATH2.dimm1.U16.handle;
	`DRAMPATH2.dimms1.U17.handle = 95+144;//`DRAMPATH2.dimm1.U17.handle;
	//channel 3
	`DRAMPATH3.dimms0.U00.handle = 96+144;//`DRAMPATH3.dimm0.U00.handle;
	`DRAMPATH3.dimms0.U01.handle = 97+144;//`DRAMPATH3.dimm0.U01.handle;
	`DRAMPATH3.dimms0.U02.handle = 98+144;//`DRAMPATH3.dimm0.U02.handle;
	`DRAMPATH3.dimms0.U03.handle = 99+144;//`DRAMPATH3.dimm0.U03.handle;
	`DRAMPATH3.dimms0.U05.handle = 100+144;//`DRAMPATH3.dimm0.U05.handle;
	`DRAMPATH3.dimms0.U06.handle = 101+144;//`DRAMPATH3.dimm0.U06.handle;
	`DRAMPATH3.dimms0.U07.handle = 102+144;//`DRAMPATH3.dimm0.U07.handle;
	`DRAMPATH3.dimms0.U08.handle = 103+144;//`DRAMPATH3.dimm0.U08.handle;

	`DRAMPATH3.dimms0.U09.handle = 104+144;//`DRAMPATH3.dimm0.U09.handle;
	`DRAMPATH3.dimms0.U10.handle = 105+144;//`DRAMPATH3.dimm0.U10.handle;
	`DRAMPATH3.dimms0.U11.handle = 106+144;//`DRAMPATH3.dimm0.U11.handle;
	`DRAMPATH3.dimms0.U12.handle = 107+144;//`DRAMPATH3.dimm0.U12.handle;
	`DRAMPATH3.dimms0.U14.handle = 108+144;//`DRAMPATH3.dimm0.U14.handle;
	`DRAMPATH3.dimms0.U15.handle = 109+144;//`DRAMPATH3.dimm0.U15.handle;
	`DRAMPATH3.dimms0.U16.handle = 110+144;//`DRAMPATH3.dimm0.U16.handle;
	`DRAMPATH3.dimms0.U17.handle = 111+144;//`DRAMPATH3.dimm0.U17.handle;

	`DRAMPATH3.dimms1.U00.handle = 112+144;//`DRAMPATH3.dimm1.U00.handle;
	`DRAMPATH3.dimms1.U01.handle = 113+144;//`DRAMPATH3.dimm1.U01.handle;
	`DRAMPATH3.dimms1.U02.handle = 114+144;//`DRAMPATH3.dimm1.U02.handle;
	`DRAMPATH3.dimms1.U03.handle = 115+144;//`DRAMPATH3.dimm1.U03.handle;
	`DRAMPATH3.dimms1.U05.handle = 116+144;//`DRAMPATH3.dimm1.U05.handle;
	`DRAMPATH3.dimms1.U06.handle = 117+144;//`DRAMPATH3.dimm1.U06.handle;
	`DRAMPATH3.dimms1.U07.handle = 118+144;//`DRAMPATH3.dimm1.U07.handle;
	`DRAMPATH3.dimms1.U08.handle = 119+144;//`DRAMPATH3.dimm1.U08.handle;

	`DRAMPATH3.dimms1.U09.handle = 120+144;//`DRAMPATH3.dimm1.U09.handle;
	`DRAMPATH3.dimms1.U10.handle = 121+144;//`DRAMPATH3.dimm1.U10.handle;
	`DRAMPATH3.dimms1.U11.handle = 122+144;//`DRAMPATH3.dimm1.U11.handle;
	`DRAMPATH3.dimms1.U12.handle = 123+144;//`DRAMPATH3.dimm1.U12.handle;
	`DRAMPATH3.dimms1.U14.handle = 124+144;//`DRAMPATH3.dimm1.U14.handle;
	`DRAMPATH3.dimms1.U15.handle = 125+144;//`DRAMPATH3.dimm1.U15.handle;
	`DRAMPATH3.dimms1.U16.handle = 126+144;//`DRAMPATH3.dimm1.U16.handle;
	`DRAMPATH3.dimms1.U17.handle = 127+144;//`DRAMPATH3.dimm1.U17.handle;
	//ecc
	`DRAMPATH0.dimms0.U04.handle = 128+144;//`DRAMPATH0.dimm0.U04.handle;
	`DRAMPATH0.dimms0.U13.handle = 129+144;//`DRAMPATH0.dimm0.U13.handle;
	`DRAMPATH0.dimms1.U04.handle = 130+144;//`DRAMPATH0.dimm1.U04.handle;
	`DRAMPATH0.dimms1.U13.handle = 131+144;//`DRAMPATH0.dimm1.U13.handle;

	`DRAMPATH1.dimms0.U04.handle = 132+144;//`DRAMPATH1.dimm0.U04.handle;
	`DRAMPATH1.dimms0.U13.handle = 133+144;//`DRAMPATH1.dimm0.U13.handle;
	`DRAMPATH1.dimms1.U04.handle = 134+144;//`DRAMPATH1.dimm1.U04.handle;
	`DRAMPATH1.dimms1.U13.handle = 135+144;//`DRAMPATH1.dimm1.U13.handle;

	`DRAMPATH2.dimms0.U04.handle = 136+144;//`DRAMPATH2.dimm0.U04.handle;
	`DRAMPATH2.dimms0.U13.handle = 137+144;//`DRAMPATH2.dimm0.U13.handle;
	`DRAMPATH2.dimms1.U04.handle = 138+144;//`DRAMPATH2.dimm1.U04.handle;
	`DRAMPATH2.dimms1.U13.handle = 139+144;//`DRAMPATH2.dimm1.U13.handle;

	`DRAMPATH3.dimms0.U04.handle = 140+144;//`DRAMPATH3.dimm0.U04.handle;
	`DRAMPATH3.dimms0.U13.handle = 141+144;//`DRAMPATH3.dimm0.U13.handle;
	`DRAMPATH3.dimms1.U04.handle = 142+144;//`DRAMPATH3.dimm1.U04.handle;
	`DRAMPATH3.dimms1.U13.handle = 143+144;//`DRAMPATH3.dimm1.U13.handle;
`endif

`ifdef RANK_DIMM
	//rank dimm  0 & 1
	`DRAMPATH0.dimmr0.U00.handle = 0+288;//`DRAMPATH0.dimm0.U00.handle;
	`DRAMPATH0.dimmr0.U01.handle = 1+288;//`DRAMPATH0.dimm0.U01.handle;
        `DRAMPATH0.dimmr0.U02.handle = 2+288;//`DRAMPATH0.dimm0.U02.handle;
        `DRAMPATH0.dimmr0.U03.handle = 3+288;//`DRAMPATH0.dimm0.U03.handle;
        `DRAMPATH0.dimmr0.U05.handle = 4+288;//`DRAMPATH0.dimm0.U05.handle;
        `DRAMPATH0.dimmr0.U06.handle = 5+288;//`DRAMPATH0.dimm0.U06.handle;
        `DRAMPATH0.dimmr0.U07.handle = 6+288;//`DRAMPATH0.dimm0.U07.handle;
        `DRAMPATH0.dimmr0.U08.handle = 7+288;//`DRAMPATH0.dimm0.U08.handle;

        `DRAMPATH0.dimmr0.U09.handle = 8+288;//`DRAMPATH0.dimm0.U09.handle;
        `DRAMPATH0.dimmr0.U10.handle = 9+288;//`DRAMPATH0.dimm0.U10.handle;
        `DRAMPATH0.dimmr0.U11.handle = 10+288;//`DRAMPATH0.dimm0.U11.handle;
        `DRAMPATH0.dimmr0.U12.handle = 11+288;//`DRAMPATH0.dimm0.U12.handle;
        `DRAMPATH0.dimmr0.U14.handle = 12+288;//`DRAMPATH0.dimm0.U14.handle;
        `DRAMPATH0.dimmr0.U15.handle = 13+288;//`DRAMPATH0.dimm0.U15.handle;
        `DRAMPATH0.dimmr0.U16.handle = 14+288;//`DRAMPATH0.dimm0.U16.handle;
        `DRAMPATH0.dimmr0.U17.handle = 15+288;//`DRAMPATH0.dimm0.U17.handle;

        `DRAMPATH0.dimmr1.U00.handle = 16+288;//`DRAMPATH0.dimm1.U00.handle;
        `DRAMPATH0.dimmr1.U01.handle = 17+288;//`DRAMPATH0.dimm1.U01.handle;
        `DRAMPATH0.dimmr1.U02.handle = 18+288;//`DRAMPATH0.dimm1.U02.handle;
        `DRAMPATH0.dimmr1.U03.handle = 19+288;//`DRAMPATH0.dimm1.U03.handle;
        `DRAMPATH0.dimmr1.U05.handle = 20+288;//`DRAMPATH0.dimm1.U05.handle;
        `DRAMPATH0.dimmr1.U06.handle = 21+288;//`DRAMPATH0.dimm1.U06.handle;
        `DRAMPATH0.dimmr1.U07.handle = 22+288;//`DRAMPATH0.dimm1.U07.handle;
	`DRAMPATH0.dimmr1.U08.handle = 23+288;//`DRAMPATH0.dimm1.U08.handle;

        `DRAMPATH0.dimmr1.U09.handle = 24+288;//`DRAMPATH0.dimm1.U09.handle;
        `DRAMPATH0.dimmr1.U10.handle = 25+288;//`DRAMPATH0.dimm1.U10.handle;
        `DRAMPATH0.dimmr1.U11.handle = 26+288;//`DRAMPATH0.dimm1.U11.handle;
        `DRAMPATH0.dimmr1.U12.handle = 27+288;//`DRAMPATH0.dimm1.U12.handle;
        `DRAMPATH0.dimmr1.U14.handle = 28+288;//`DRAMPATH0.dimm1.U14.handle;
        `DRAMPATH0.dimmr1.U15.handle = 29+288;//`DRAMPATH0.dimm1.U15.handle;
        `DRAMPATH0.dimmr1.U16.handle = 30+288;//`DRAMPATH0.dimm1.U16.handle;
        `DRAMPATH0.dimmr1.U17.handle = 31+288;//`DRAMPATH0.dimm1.U17.handle;
	//channel 1
	`DRAMPATH1.dimmr0.U00.handle = 32+288;//`DRAMPATH1.dimm0.U00.handle;
	`DRAMPATH1.dimmr0.U01.handle = 33+288;//`DRAMPATH1.dimm0.U01.handle;
	`DRAMPATH1.dimmr0.U02.handle = 34+288;//`DRAMPATH1.dimm0.U02.handle;
	`DRAMPATH1.dimmr0.U03.handle = 35+288;//`DRAMPATH1.dimm0.U03.handle;
	`DRAMPATH1.dimmr0.U05.handle = 36+288;//`DRAMPATH1.dimm0.U05.handle;
	`DRAMPATH1.dimmr0.U06.handle = 37+288;//`DRAMPATH1.dimm0.U06.handle;
	`DRAMPATH1.dimmr0.U07.handle = 38+288;//`DRAMPATH1.dimm0.U07.handle;
	`DRAMPATH1.dimmr0.U08.handle = 39+288;//`DRAMPATH1.dimm0.U08.handle;

	`DRAMPATH1.dimmr0.U09.handle = 40+288;//`DRAMPATH1.dimm0.U09.handle;
	`DRAMPATH1.dimmr0.U10.handle = 41+288;//`DRAMPATH1.dimm0.U10.handle;
	`DRAMPATH1.dimmr0.U11.handle = 42+288;//`DRAMPATH1.dimm0.U11.handle;
	`DRAMPATH1.dimmr0.U12.handle = 43+288;//`DRAMPATH1.dimm0.U12.handle;
	`DRAMPATH1.dimmr0.U14.handle = 44+288;//`DRAMPATH1.dimm0.U14.handle;
	`DRAMPATH1.dimmr0.U15.handle = 45+288;//`DRAMPATH1.dimm0.U15.handle;
	`DRAMPATH1.dimmr0.U16.handle = 46+288;//`DRAMPATH1.dimm0.U16.handle;
	`DRAMPATH1.dimmr0.U17.handle = 47+288;//`DRAMPATH1.dimm0.U17.handle;

	`DRAMPATH1.dimmr1.U00.handle = 48+288;//`DRAMPATH1.dimm1.U00.handle;
	`DRAMPATH1.dimmr1.U01.handle = 49+288;//`DRAMPATH1.dimm1.U01.handle;
	`DRAMPATH1.dimmr1.U02.handle = 50+288;//`DRAMPATH1.dimm1.U02.handle;
	`DRAMPATH1.dimmr1.U03.handle = 51+288;//`DRAMPATH1.dimm1.U03.handle;
	`DRAMPATH1.dimmr1.U05.handle = 52+288;//`DRAMPATH1.dimm1.U05.handle;
	`DRAMPATH1.dimmr1.U06.handle = 53+288;//`DRAMPATH1.dimm1.U06.handle;
	`DRAMPATH1.dimmr1.U07.handle = 54+288;//`DRAMPATH1.dimm1.U07.handle;
	`DRAMPATH1.dimmr1.U08.handle = 55+288;//`DRAMPATH1.dimm1.U08.handle;

	`DRAMPATH1.dimmr1.U09.handle = 56+288;//`DRAMPATH1.dimm1.U09.handle;
	`DRAMPATH1.dimmr1.U10.handle = 57+288;//`DRAMPATH1.dimm1.U10.handle;
	`DRAMPATH1.dimmr1.U11.handle = 58+288;//`DRAMPATH1.dimm1.U11.handle;
	`DRAMPATH1.dimmr1.U12.handle = 59+288;//`DRAMPATH1.dimm1.U12.handle;
	`DRAMPATH1.dimmr1.U14.handle = 60+288;//`DRAMPATH1.dimm1.U14.handle;
	`DRAMPATH1.dimmr1.U15.handle = 61+288;//`DRAMPATH1.dimm1.U15.handle;
	`DRAMPATH1.dimmr1.U16.handle = 62+288;//`DRAMPATH1.dimm1.U16.handle;
	`DRAMPATH1.dimmr1.U17.handle = 63+288;//`DRAMPATH1.dimm1.U17.handle;
	//channel 2
	`DRAMPATH2.dimmr0.U00.handle = 64+288;//`DRAMPATH2.dimm0.U00.handle;
	`DRAMPATH2.dimmr0.U01.handle = 65+288;//`DRAMPATH2.dimm0.U01.handle;
	`DRAMPATH2.dimmr0.U02.handle = 66+288;//`DRAMPATH2.dimm0.U02.handle;
	`DRAMPATH2.dimmr0.U03.handle = 67+288;//`DRAMPATH2.dimm0.U03.handle;
	`DRAMPATH2.dimmr0.U05.handle = 68+288;//`DRAMPATH2.dimm0.U05.handle;
	`DRAMPATH2.dimmr0.U06.handle = 69+288;//`DRAMPATH2.dimm0.U06.handle;
	`DRAMPATH2.dimmr0.U07.handle = 70+288;//`DRAMPATH2.dimm0.U07.handle;
	`DRAMPATH2.dimmr0.U08.handle = 71+288;//`DRAMPATH2.dimm0.U08.handle;

	`DRAMPATH2.dimmr0.U09.handle = 72+288;//`DRAMPATH2.dimm0.U09.handle;
	`DRAMPATH2.dimmr0.U10.handle = 73+288;//`DRAMPATH2.dimm0.U10.handle;
	`DRAMPATH2.dimmr0.U11.handle = 74+288;//`DRAMPATH2.dimm0.U11.handle;
	`DRAMPATH2.dimmr0.U12.handle = 75+288;//`DRAMPATH2.dimm0.U12.handle;
	`DRAMPATH2.dimmr0.U14.handle = 76+288;//`DRAMPATH2.dimm0.U14.handle;
	`DRAMPATH2.dimmr0.U15.handle = 77+288;//`DRAMPATH2.dimm0.U15.handle;
	`DRAMPATH2.dimmr0.U16.handle = 78+288;//`DRAMPATH2.dimm0.U16.handle;
	`DRAMPATH2.dimmr0.U17.handle = 79+288;//`DRAMPATH2.dimm0.U17.handle;

	`DRAMPATH2.dimmr1.U00.handle = 80+288;//`DRAMPATH2.dimm1.U00.handle;
	`DRAMPATH2.dimmr1.U01.handle = 81+288;//`DRAMPATH2.dimm1.U01.handle;
	`DRAMPATH2.dimmr1.U02.handle = 82+288;//`DRAMPATH2.dimm1.U02.handle;
	`DRAMPATH2.dimmr1.U03.handle = 83+288;//`DRAMPATH2.dimm1.U03.handle;
	`DRAMPATH2.dimmr1.U05.handle = 84+288;//`DRAMPATH2.dimm1.U05.handle;
	`DRAMPATH2.dimmr1.U06.handle = 85+288;//`DRAMPATH2.dimm1.U06.handle;
	`DRAMPATH2.dimmr1.U07.handle = 86+288;//`DRAMPATH2.dimm1.U07.handle;
	`DRAMPATH2.dimmr1.U08.handle = 87+288;//`DRAMPATH2.dimm1.U08.handle;

	`DRAMPATH2.dimmr1.U09.handle = 88+288;//`DRAMPATH2.dimm1.U09.handle;
	`DRAMPATH2.dimmr1.U10.handle = 89+288;//`DRAMPATH2.dimm1.U10.handle;
	`DRAMPATH2.dimmr1.U11.handle = 90+288;//`DRAMPATH2.dimm1.U11.handle;
	`DRAMPATH2.dimmr1.U12.handle = 91+288;//`DRAMPATH2.dimm1.U12.handle;
	`DRAMPATH2.dimmr1.U14.handle = 92+288;//`DRAMPATH2.dimm1.U14.handle;
	`DRAMPATH2.dimmr1.U15.handle = 93+288;//`DRAMPATH2.dimm1.U15.handle;
	`DRAMPATH2.dimmr1.U16.handle = 94+288;//`DRAMPATH2.dimm1.U16.handle;
	`DRAMPATH2.dimmr1.U17.handle = 95+288;//`DRAMPATH2.dimm1.U17.handle;
	//channel 3
	`DRAMPATH3.dimmr0.U00.handle = 96+288;//`DRAMPATH3.dimm0.U00.handle;
	`DRAMPATH3.dimmr0.U01.handle = 97+288;//`DRAMPATH3.dimm0.U01.handle;
	`DRAMPATH3.dimmr0.U02.handle = 98+288;//`DRAMPATH3.dimm0.U02.handle;
	`DRAMPATH3.dimmr0.U03.handle = 99+288;//`DRAMPATH3.dimm0.U03.handle;
	`DRAMPATH3.dimmr0.U05.handle = 100+288;//`DRAMPATH3.dimm0.U05.handle;
	`DRAMPATH3.dimmr0.U06.handle = 101+288;//`DRAMPATH3.dimm0.U06.handle;
	`DRAMPATH3.dimmr0.U07.handle = 102+288;//`DRAMPATH3.dimm0.U07.handle;
	`DRAMPATH3.dimmr0.U08.handle = 103+288;//`DRAMPATH3.dimm0.U08.handle;

	`DRAMPATH3.dimmr0.U09.handle = 104+288;//`DRAMPATH3.dimm0.U09.handle;
	`DRAMPATH3.dimmr0.U10.handle = 105+288;//`DRAMPATH3.dimm0.U10.handle;
	`DRAMPATH3.dimmr0.U11.handle = 106+288;//`DRAMPATH3.dimm0.U11.handle;
	`DRAMPATH3.dimmr0.U12.handle = 107+288;//`DRAMPATH3.dimm0.U12.handle;
	`DRAMPATH3.dimmr0.U14.handle = 108+288;//`DRAMPATH3.dimm0.U14.handle;
	`DRAMPATH3.dimmr0.U15.handle = 109+288;//`DRAMPATH3.dimm0.U15.handle;
	`DRAMPATH3.dimmr0.U16.handle = 110+288;//`DRAMPATH3.dimm0.U16.handle;
	`DRAMPATH3.dimmr0.U17.handle = 111+288;//`DRAMPATH3.dimm0.U17.handle;

	`DRAMPATH3.dimmr1.U00.handle = 112+288;//`DRAMPATH3.dimm1.U00.handle;
	`DRAMPATH3.dimmr1.U01.handle = 113+288;//`DRAMPATH3.dimm1.U01.handle;
	`DRAMPATH3.dimmr1.U02.handle = 114+288;//`DRAMPATH3.dimm1.U02.handle;
	`DRAMPATH3.dimmr1.U03.handle = 115+288;//`DRAMPATH3.dimm1.U03.handle;
	`DRAMPATH3.dimmr1.U05.handle = 116+288;//`DRAMPATH3.dimm1.U05.handle;
	`DRAMPATH3.dimmr1.U06.handle = 117+288;//`DRAMPATH3.dimm1.U06.handle;
	`DRAMPATH3.dimmr1.U07.handle = 118+288;//`DRAMPATH3.dimm1.U07.handle;
	`DRAMPATH3.dimmr1.U08.handle = 119+288;//`DRAMPATH3.dimm1.U08.handle;

	`DRAMPATH3.dimmr1.U09.handle = 120+288;//`DRAMPATH3.dimm1.U09.handle;
	`DRAMPATH3.dimmr1.U10.handle = 121+288;//`DRAMPATH3.dimm1.U10.handle;
	`DRAMPATH3.dimmr1.U11.handle = 122+288;//`DRAMPATH3.dimm1.U11.handle;
	`DRAMPATH3.dimmr1.U12.handle = 123+288;//`DRAMPATH3.dimm1.U12.handle;
	`DRAMPATH3.dimmr1.U14.handle = 124+288;//`DRAMPATH3.dimm1.U14.handle;
	`DRAMPATH3.dimmr1.U15.handle = 125+288;//`DRAMPATH3.dimm1.U15.handle;
	`DRAMPATH3.dimmr1.U16.handle = 126+288;//`DRAMPATH3.dimm1.U16.handle;
	`DRAMPATH3.dimmr1.U17.handle = 127+288;//`DRAMPATH3.dimm1.U17.handle;
	//ecc
	`DRAMPATH0.dimmr0.U04.handle = 128+288;//`DRAMPATH0.dimm0.U04.handle;
	`DRAMPATH0.dimmr0.U13.handle = 129+288;//`DRAMPATH0.dimm0.U13.handle;
	`DRAMPATH0.dimmr1.U04.handle = 130+288;//`DRAMPATH0.dimm1.U04.handle;
	`DRAMPATH0.dimmr1.U13.handle = 131+288;//`DRAMPATH0.dimm1.U13.handle;

	`DRAMPATH1.dimmr0.U04.handle = 132+288;//`DRAMPATH1.dimm0.U04.handle;
	`DRAMPATH1.dimmr0.U13.handle = 133+288;//`DRAMPATH1.dimm0.U13.handle;
	`DRAMPATH1.dimmr1.U04.handle = 134+288;//`DRAMPATH1.dimm1.U04.handle;
	`DRAMPATH1.dimmr1.U13.handle = 135+288;//`DRAMPATH1.dimm1.U13.handle;

	`DRAMPATH2.dimmr0.U04.handle = 136+288;//`DRAMPATH2.dimm0.U04.handle;
	`DRAMPATH2.dimmr0.U13.handle = 137+288;//`DRAMPATH2.dimm0.U13.handle;
	`DRAMPATH2.dimmr1.U04.handle = 138+288;//`DRAMPATH2.dimm1.U04.handle;
	`DRAMPATH2.dimmr1.U13.handle = 139+288;//`DRAMPATH2.dimm1.U13.handle;

	`DRAMPATH3.dimmr0.U04.handle = 140+288;//`DRAMPATH3.dimm0.U04.handle;
	`DRAMPATH3.dimmr0.U13.handle = 141+288;//`DRAMPATH3.dimm0.U13.handle;
	`DRAMPATH3.dimmr1.U04.handle = 142+288;//`DRAMPATH3.dimm1.U04.handle;
	`DRAMPATH3.dimmr1.U13.handle = 143+288;//`DRAMPATH3.dimm1.U13.handle;

`ifdef STACK_DIMM
	//rank dimm  2 & 3
	`DRAMPATH0.dimmr2.U00.handle = 0+432;//`DRAMPATH0.dimm0.U00.handle;
	`DRAMPATH0.dimmr2.U01.handle = 1+432;//`DRAMPATH0.dimm0.U01.handle;
        `DRAMPATH0.dimmr2.U02.handle = 2+432;//`DRAMPATH0.dimm0.U02.handle;
        `DRAMPATH0.dimmr2.U03.handle = 3+432;//`DRAMPATH0.dimm0.U03.handle;
        `DRAMPATH0.dimmr2.U05.handle = 4+432;//`DRAMPATH0.dimm0.U05.handle;
        `DRAMPATH0.dimmr2.U06.handle = 5+432;//`DRAMPATH0.dimm0.U06.handle;
        `DRAMPATH0.dimmr2.U07.handle = 6+432;//`DRAMPATH0.dimm0.U07.handle;
        `DRAMPATH0.dimmr2.U08.handle = 7+432;//`DRAMPATH0.dimm0.U08.handle;

        `DRAMPATH0.dimmr2.U09.handle = 8+432;//`DRAMPATH0.dimm0.U09.handle;
        `DRAMPATH0.dimmr2.U10.handle = 9+432;//`DRAMPATH0.dimm0.U10.handle;
        `DRAMPATH0.dimmr2.U11.handle = 10+432;//`DRAMPATH0.dimm0.U11.handle;
        `DRAMPATH0.dimmr2.U12.handle = 11+432;//`DRAMPATH0.dimm0.U12.handle;
        `DRAMPATH0.dimmr2.U14.handle = 12+432;//`DRAMPATH0.dimm0.U14.handle;
        `DRAMPATH0.dimmr2.U15.handle = 13+432;//`DRAMPATH0.dimm0.U15.handle;
        `DRAMPATH0.dimmr2.U16.handle = 14+432;//`DRAMPATH0.dimm0.U16.handle;
        `DRAMPATH0.dimmr2.U17.handle = 15+432;//`DRAMPATH0.dimm0.U17.handle;

        `DRAMPATH0.dimmr3.U00.handle = 16+432;//`DRAMPATH0.dimm1.U00.handle;
        `DRAMPATH0.dimmr3.U01.handle = 17+432;//`DRAMPATH0.dimm1.U01.handle;
        `DRAMPATH0.dimmr3.U02.handle = 18+432;//`DRAMPATH0.dimm1.U02.handle;
        `DRAMPATH0.dimmr3.U03.handle = 19+432;//`DRAMPATH0.dimm1.U03.handle;
        `DRAMPATH0.dimmr3.U05.handle = 20+432;//`DRAMPATH0.dimm1.U05.handle;
        `DRAMPATH0.dimmr3.U06.handle = 21+432;//`DRAMPATH0.dimm1.U06.handle;
        `DRAMPATH0.dimmr3.U07.handle = 22+432;//`DRAMPATH0.dimm1.U07.handle;
	`DRAMPATH0.dimmr3.U08.handle = 23+432;//`DRAMPATH0.dimm1.U08.handle;

        `DRAMPATH0.dimmr3.U09.handle = 24+432;//`DRAMPATH0.dimm1.U09.handle;
        `DRAMPATH0.dimmr3.U10.handle = 25+432;//`DRAMPATH0.dimm1.U10.handle;
        `DRAMPATH0.dimmr3.U11.handle = 26+432;//`DRAMPATH0.dimm1.U11.handle;
        `DRAMPATH0.dimmr3.U12.handle = 27+432;//`DRAMPATH0.dimm1.U12.handle;
        `DRAMPATH0.dimmr3.U14.handle = 28+432;//`DRAMPATH0.dimm1.U14.handle;
        `DRAMPATH0.dimmr3.U15.handle = 29+432;//`DRAMPATH0.dimm1.U15.handle;
        `DRAMPATH0.dimmr3.U16.handle = 30+432;//`DRAMPATH0.dimm1.U16.handle;
        `DRAMPATH0.dimmr3.U17.handle = 31+432;//`DRAMPATH0.dimm1.U17.handle;
	//channel 1
	`DRAMPATH1.dimmr2.U00.handle = 32+432;//`DRAMPATH1.dimm0.U00.handle;
        `DRAMPATH1.dimmr2.U01.handle = 33+432;//`DRAMPATH1.dimm0.U01.handle;
	`DRAMPATH1.dimmr2.U02.handle = 34+432;//`DRAMPATH1.dimm0.U02.handle;
	`DRAMPATH1.dimmr2.U03.handle = 35+432;//`DRAMPATH1.dimm0.U03.handle;
	`DRAMPATH1.dimmr2.U05.handle = 36+432;//`DRAMPATH1.dimm0.U05.handle;
	`DRAMPATH1.dimmr2.U06.handle = 37+432;//`DRAMPATH1.dimm0.U06.handle;
	`DRAMPATH1.dimmr2.U07.handle = 38+432;//`DRAMPATH1.dimm0.U07.handle;
	`DRAMPATH1.dimmr2.U08.handle = 39+432;//`DRAMPATH1.dimm0.U08.handle;

	`DRAMPATH1.dimmr2.U09.handle = 40+432;//`DRAMPATH1.dimm0.U09.handle;
	`DRAMPATH1.dimmr2.U10.handle = 41+432;//`DRAMPATH1.dimm0.U10.handle;
	`DRAMPATH1.dimmr2.U11.handle = 42+432;//`DRAMPATH1.dimm0.U11.handle;
	`DRAMPATH1.dimmr2.U12.handle = 43+432;//`DRAMPATH1.dimm0.U12.handle;
	`DRAMPATH1.dimmr2.U14.handle = 44+432;//`DRAMPATH1.dimm0.U14.handle;
	`DRAMPATH1.dimmr2.U15.handle = 45+432;//`DRAMPATH1.dimm0.U15.handle;
	`DRAMPATH1.dimmr2.U16.handle = 46+432;//`DRAMPATH1.dimm0.U16.handle;
	`DRAMPATH1.dimmr2.U17.handle = 47+432;//`DRAMPATH1.dimm0.U17.handle;

	`DRAMPATH1.dimmr3.U00.handle = 48+432;//`DRAMPATH1.dimm1.U00.handle;
	`DRAMPATH1.dimmr3.U01.handle = 49+432;//`DRAMPATH1.dimm1.U01.handle;
	`DRAMPATH1.dimmr3.U02.handle = 50+432;//`DRAMPATH1.dimm1.U02.handle;
	`DRAMPATH1.dimmr3.U03.handle = 51+432;//`DRAMPATH1.dimm1.U03.handle;
	`DRAMPATH1.dimmr3.U05.handle = 52+432;//`DRAMPATH1.dimm1.U05.handle;
	`DRAMPATH1.dimmr3.U06.handle = 53+432;//`DRAMPATH1.dimm1.U06.handle;
	`DRAMPATH1.dimmr3.U07.handle = 54+432;//`DRAMPATH1.dimm1.U07.handle;
	`DRAMPATH1.dimmr3.U08.handle = 55+432;//`DRAMPATH1.dimm1.U08.handle;

	`DRAMPATH1.dimmr3.U09.handle = 56+432;//`DRAMPATH1.dimm1.U09.handle;
	`DRAMPATH1.dimmr3.U10.handle = 57+432;//`DRAMPATH1.dimm1.U10.handle;
	`DRAMPATH1.dimmr3.U11.handle = 58+432;//`DRAMPATH1.dimm1.U11.handle;
	`DRAMPATH1.dimmr3.U12.handle = 59+432;//`DRAMPATH1.dimm1.U12.handle;
	`DRAMPATH1.dimmr3.U14.handle = 60+432;//`DRAMPATH1.dimm1.U14.handle;
	`DRAMPATH1.dimmr3.U15.handle = 61+432;//`DRAMPATH1.dimm1.U15.handle;
	`DRAMPATH1.dimmr3.U16.handle = 62+432;//`DRAMPATH1.dimm1.U16.handle;
	`DRAMPATH1.dimmr3.U17.handle = 63+432;//`DRAMPATH1.dimm1.U17.handle;
	//channel 2
	`DRAMPATH2.dimmr2.U00.handle = 64+432;//`DRAMPATH2.dimm0.U00.handle;
	`DRAMPATH2.dimmr2.U01.handle = 65+432;//`DRAMPATH2.dimm0.U01.handle;
	`DRAMPATH2.dimmr2.U02.handle = 66+432;//`DRAMPATH2.dimm0.U02.handle;
	`DRAMPATH2.dimmr2.U03.handle = 67+432;//`DRAMPATH2.dimm0.U03.handle;
	`DRAMPATH2.dimmr2.U05.handle = 68+432;//`DRAMPATH2.dimm0.U05.handle;
	`DRAMPATH2.dimmr2.U06.handle = 69+432;//`DRAMPATH2.dimm0.U06.handle;
	`DRAMPATH2.dimmr2.U07.handle = 70+432;//`DRAMPATH2.dimm0.U07.handle;
	`DRAMPATH2.dimmr2.U08.handle = 71+432;//`DRAMPATH2.dimm0.U08.handle;

	`DRAMPATH2.dimmr2.U09.handle = 72+432;//`DRAMPATH2.dimm0.U09.handle;
	`DRAMPATH2.dimmr2.U10.handle = 73+432;//`DRAMPATH2.dimm0.U10.handle;
	`DRAMPATH2.dimmr2.U11.handle = 74+432;//`DRAMPATH2.dimm0.U11.handle;
	`DRAMPATH2.dimmr2.U12.handle = 75+432;//`DRAMPATH2.dimm0.U12.handle;
	`DRAMPATH2.dimmr2.U14.handle = 76+432;//`DRAMPATH2.dimm0.U14.handle;
	`DRAMPATH2.dimmr2.U15.handle = 77+432;//`DRAMPATH2.dimm0.U15.handle;
	`DRAMPATH2.dimmr2.U16.handle = 78+432;//`DRAMPATH2.dimm0.U16.handle;
	`DRAMPATH2.dimmr2.U17.handle = 79+432;//`DRAMPATH2.dimm0.U17.handle;

	`DRAMPATH2.dimmr3.U00.handle = 80+432;//`DRAMPATH2.dimm1.U00.handle;
	`DRAMPATH2.dimmr3.U01.handle = 81+432;//`DRAMPATH2.dimm1.U01.handle;
	`DRAMPATH2.dimmr3.U02.handle = 82+432;//`DRAMPATH2.dimm1.U02.handle;
	`DRAMPATH2.dimmr3.U03.handle = 83+432;//`DRAMPATH2.dimm1.U03.handle;
	`DRAMPATH2.dimmr3.U05.handle = 84+432;//`DRAMPATH2.dimm1.U05.handle;
	`DRAMPATH2.dimmr3.U06.handle = 85+432;//`DRAMPATH2.dimm1.U06.handle;
	`DRAMPATH2.dimmr3.U07.handle = 86+432;//`DRAMPATH2.dimm1.U07.handle;
	`DRAMPATH2.dimmr3.U08.handle = 87+432;//`DRAMPATH2.dimm1.U08.handle;

	`DRAMPATH2.dimmr3.U09.handle = 88+432;//`DRAMPATH2.dimm1.U09.handle;
	`DRAMPATH2.dimmr3.U10.handle = 89+432;//`DRAMPATH2.dimm1.U10.handle;
	`DRAMPATH2.dimmr3.U11.handle = 90+432;//`DRAMPATH2.dimm1.U11.handle;
	`DRAMPATH2.dimmr3.U12.handle = 91+432;//`DRAMPATH2.dimm1.U12.handle;
	`DRAMPATH2.dimmr3.U14.handle = 92+432;//`DRAMPATH2.dimm1.U14.handle;
	`DRAMPATH2.dimmr3.U15.handle = 93+432;//`DRAMPATH2.dimm1.U15.handle;
	`DRAMPATH2.dimmr3.U16.handle = 94+432;//`DRAMPATH2.dimm1.U16.handle;
	`DRAMPATH2.dimmr3.U17.handle = 95+432;//`DRAMPATH2.dimm1.U17.handle;
	//channel 3
	`DRAMPATH3.dimmr2.U00.handle = 96+432;//`DRAMPATH3.dimm0.U00.handle;
	`DRAMPATH3.dimmr2.U01.handle = 97+432;//`DRAMPATH3.dimm0.U01.handle;
	`DRAMPATH3.dimmr2.U02.handle = 98+432;//`DRAMPATH3.dimm0.U02.handle;
	`DRAMPATH3.dimmr2.U03.handle = 99+432;//`DRAMPATH3.dimm0.U03.handle;
	`DRAMPATH3.dimmr2.U05.handle = 100+432;//`DRAMPATH3.dimm0.U05.handle;
	`DRAMPATH3.dimmr2.U06.handle = 101+432;//`DRAMPATH3.dimm0.U06.handle;
	`DRAMPATH3.dimmr2.U07.handle = 102+432;//`DRAMPATH3.dimm0.U07.handle;
	`DRAMPATH3.dimmr2.U08.handle = 103+432;//`DRAMPATH3.dimm0.U08.handle;

	`DRAMPATH3.dimmr2.U09.handle = 104+432;//`DRAMPATH3.dimm0.U09.handle;
	`DRAMPATH3.dimmr2.U10.handle = 105+432;//`DRAMPATH3.dimm0.U10.handle;
	`DRAMPATH3.dimmr2.U11.handle = 106+432;//`DRAMPATH3.dimm0.U11.handle;
	`DRAMPATH3.dimmr2.U12.handle = 107+432;//`DRAMPATH3.dimm0.U12.handle;
	`DRAMPATH3.dimmr2.U14.handle = 108+432;//`DRAMPATH3.dimm0.U14.handle;
	`DRAMPATH3.dimmr2.U15.handle = 109+432;//`DRAMPATH3.dimm0.U15.handle;
	`DRAMPATH3.dimmr2.U16.handle = 110+432;//`DRAMPATH3.dimm0.U16.handle;
	`DRAMPATH3.dimmr2.U17.handle = 111+432;//`DRAMPATH3.dimm0.U17.handle;

	`DRAMPATH3.dimmr3.U00.handle = 112+432;//`DRAMPATH3.dimm1.U00.handle;
	`DRAMPATH3.dimmr3.U01.handle = 113+432;//`DRAMPATH3.dimm1.U01.handle;
	`DRAMPATH3.dimmr3.U02.handle = 114+432;//`DRAMPATH3.dimm1.U02.handle;
	`DRAMPATH3.dimmr3.U03.handle = 115+432;//`DRAMPATH3.dimm1.U03.handle;
	`DRAMPATH3.dimmr3.U05.handle = 116+432;//`DRAMPATH3.dimm1.U05.handle;
	`DRAMPATH3.dimmr3.U06.handle = 117+432;//`DRAMPATH3.dimm1.U06.handle;
	`DRAMPATH3.dimmr3.U07.handle = 118+432;//`DRAMPATH3.dimm1.U07.handle;
	`DRAMPATH3.dimmr3.U08.handle = 119+432;//`DRAMPATH3.dimm1.U08.handle;

	`DRAMPATH3.dimmr3.U09.handle = 120+432;//`DRAMPATH3.dimm1.U09.handle;
	`DRAMPATH3.dimmr3.U10.handle = 121+432;//`DRAMPATH3.dimm1.U10.handle;
	`DRAMPATH3.dimmr3.U11.handle = 122+432;//`DRAMPATH3.dimm1.U11.handle;
	`DRAMPATH3.dimmr3.U12.handle = 123+432;//`DRAMPATH3.dimm1.U12.handle;
	`DRAMPATH3.dimmr3.U14.handle = 124+432;//`DRAMPATH3.dimm1.U14.handle;
	`DRAMPATH3.dimmr3.U15.handle = 125+432;//`DRAMPATH3.dimm1.U15.handle;
	`DRAMPATH3.dimmr3.U16.handle = 126+432;//`DRAMPATH3.dimm1.U16.handle;
	`DRAMPATH3.dimmr3.U17.handle = 127+432;//`DRAMPATH3.dimm1.U17.handle;
	//ecc
	`DRAMPATH0.dimmr2.U04.handle = 128+432;//`DRAMPATH0.dimm0.U04.handle;
	`DRAMPATH0.dimmr2.U13.handle = 129+432;//`DRAMPATH0.dimm0.U13.handle;
	`DRAMPATH0.dimmr3.U04.handle = 130+432;//`DRAMPATH0.dimm1.U04.handle;
	`DRAMPATH0.dimmr3.U13.handle = 131+432;//`DRAMPATH0.dimm1.U13.handle;

	`DRAMPATH1.dimmr2.U04.handle = 132+432;//`DRAMPATH1.dimm0.U04.handle;
	`DRAMPATH1.dimmr2.U13.handle = 133+432;//`DRAMPATH1.dimm0.U13.handle;
	`DRAMPATH1.dimmr3.U04.handle = 134+432;//`DRAMPATH1.dimm1.U04.handle;
	`DRAMPATH1.dimmr3.U13.handle = 135+432;//`DRAMPATH1.dimm1.U13.handle;

	`DRAMPATH2.dimmr2.U04.handle = 136+432;//`DRAMPATH2.dimm0.U04.handle;
	`DRAMPATH2.dimmr2.U13.handle = 137+432;//`DRAMPATH2.dimm0.U13.handle;
	`DRAMPATH2.dimmr3.U04.handle = 138+432;//`DRAMPATH2.dimm1.U04.handle;
	`DRAMPATH2.dimmr3.U13.handle = 139+432;//`DRAMPATH2.dimm1.U13.handle;

	`DRAMPATH3.dimmr2.U04.handle = 140+432;//`DRAMPATH3.dimm0.U04.handle;
	`DRAMPATH3.dimmr2.U13.handle = 141+432;//`DRAMPATH3.dimm0.U13.handle;
	`DRAMPATH3.dimmr3.U04.handle = 142+432;//`DRAMPATH3.dimm1.U04.handle;
	`DRAMPATH3.dimmr3.U13.handle = 143+432;//`DRAMPATH3.dimm1.U13.handle;
`endif
`endif
`endif	// DRAM_SAT

       #1
       $display("\n(%0d): Info->Initializing Sparse Memory from: %0s\n", $time, file);
       /*$init_dram(file,
		  //channel 0
		  `DRAMPATH0.dimm0.U00.handle,
		  `DRAMPATH0.dimm0.U01.handle,
		  `DRAMPATH0.dimm0.U02.handle,
		  `DRAMPATH0.dimm0.U03.handle,
		  `DRAMPATH0.dimm0.U05.handle,
		  `DRAMPATH0.dimm0.U06.handle,
		  `DRAMPATH0.dimm0.U07.handle,
		  `DRAMPATH0.dimm0.U08.handle,

		  `DRAMPATH0.dimm0.U09.handle,
		  `DRAMPATH0.dimm0.U10.handle,
		  `DRAMPATH0.dimm0.U11.handle,
		  `DRAMPATH0.dimm0.U12.handle,
		  `DRAMPATH0.dimm0.U14.handle,
		  `DRAMPATH0.dimm0.U15.handle,
		  `DRAMPATH0.dimm0.U16.handle,
		  `DRAMPATH0.dimm0.U17.handle,

		  `DRAMPATH0.dimm1.U00.handle,
		  `DRAMPATH0.dimm1.U01.handle,
		  `DRAMPATH0.dimm1.U02.handle,
		  `DRAMPATH0.dimm1.U03.handle,
		  `DRAMPATH0.dimm1.U05.handle,
		  `DRAMPATH0.dimm1.U06.handle,
		  `DRAMPATH0.dimm1.U07.handle,
		  `DRAMPATH0.dimm1.U08.handle,

		  `DRAMPATH0.dimm1.U09.handle,
		  `DRAMPATH0.dimm1.U10.handle,
		  `DRAMPATH0.dimm1.U11.handle,
		  `DRAMPATH0.dimm1.U12.handle,
		  `DRAMPATH0.dimm1.U14.handle,
		  `DRAMPATH0.dimm1.U15.handle,
		  `DRAMPATH0.dimm1.U16.handle,
		  `DRAMPATH0.dimm1.U17.handle,

		     //channel 1
		  `DRAMPATH1.dimm0.U00.handle,
		  `DRAMPATH1.dimm0.U01.handle,
		  `DRAMPATH1.dimm0.U02.handle,
		  `DRAMPATH1.dimm0.U03.handle,
		  `DRAMPATH1.dimm0.U05.handle,
		  `DRAMPATH1.dimm0.U06.handle,
		  `DRAMPATH1.dimm0.U07.handle,
		  `DRAMPATH1.dimm0.U08.handle,

		  `DRAMPATH1.dimm0.U09.handle,
		  `DRAMPATH1.dimm0.U10.handle,
		  `DRAMPATH1.dimm0.U11.handle,
		  `DRAMPATH1.dimm0.U12.handle,
		  `DRAMPATH1.dimm0.U14.handle,
		  `DRAMPATH1.dimm0.U15.handle,
		  `DRAMPATH1.dimm0.U16.handle,
		  `DRAMPATH1.dimm0.U17.handle,

		  `DRAMPATH1.dimm1.U00.handle,
		  `DRAMPATH1.dimm1.U01.handle,
		  `DRAMPATH1.dimm1.U02.handle,
		  `DRAMPATH1.dimm1.U03.handle,
		  `DRAMPATH1.dimm1.U05.handle,
		  `DRAMPATH1.dimm1.U06.handle,
		  `DRAMPATH1.dimm1.U07.handle,
		  `DRAMPATH1.dimm1.U08.handle,

		  `DRAMPATH1.dimm1.U09.handle,
		  `DRAMPATH1.dimm1.U10.handle,
		  `DRAMPATH1.dimm1.U11.handle,
		  `DRAMPATH1.dimm1.U12.handle,
		  `DRAMPATH1.dimm1.U14.handle,
		  `DRAMPATH1.dimm1.U15.handle,
		  `DRAMPATH1.dimm1.U16.handle,
		  `DRAMPATH1.dimm1.U17.handle,
		     //channel 2
		  `DRAMPATH2.dimm0.U00.handle,
		  `DRAMPATH2.dimm0.U01.handle,
		  `DRAMPATH2.dimm0.U02.handle,
		  `DRAMPATH2.dimm0.U03.handle,
		  `DRAMPATH2.dimm0.U05.handle,
		  `DRAMPATH2.dimm0.U06.handle,
		  `DRAMPATH2.dimm0.U07.handle,
		  `DRAMPATH2.dimm0.U08.handle,

		  `DRAMPATH2.dimm0.U09.handle,
		  `DRAMPATH2.dimm0.U10.handle,
		  `DRAMPATH2.dimm0.U11.handle,
		  `DRAMPATH2.dimm0.U12.handle,
		  `DRAMPATH2.dimm0.U14.handle,
		  `DRAMPATH2.dimm0.U15.handle,
		  `DRAMPATH2.dimm0.U16.handle,
		  `DRAMPATH2.dimm0.U17.handle,

		  `DRAMPATH2.dimm1.U00.handle,
		  `DRAMPATH2.dimm1.U01.handle,
		  `DRAMPATH2.dimm1.U02.handle,
		  `DRAMPATH2.dimm1.U03.handle,
		  `DRAMPATH2.dimm1.U05.handle,
		  `DRAMPATH2.dimm1.U06.handle,
		  `DRAMPATH2.dimm1.U07.handle,
		  `DRAMPATH2.dimm1.U08.handle,

		  `DRAMPATH2.dimm1.U09.handle,
		  `DRAMPATH2.dimm1.U10.handle,
		  `DRAMPATH2.dimm1.U11.handle,
		  `DRAMPATH2.dimm1.U12.handle,
		  `DRAMPATH2.dimm1.U14.handle,
		  `DRAMPATH2.dimm1.U15.handle,
		  `DRAMPATH2.dimm1.U16.handle,
		  `DRAMPATH2.dimm1.U17.handle,
		     // channel 3
		  `DRAMPATH3.dimm0.U00.handle,
		  `DRAMPATH3.dimm0.U01.handle,
		  `DRAMPATH3.dimm0.U02.handle,
		  `DRAMPATH3.dimm0.U03.handle,
		  `DRAMPATH3.dimm0.U05.handle,
		  `DRAMPATH3.dimm0.U06.handle,
		  `DRAMPATH3.dimm0.U07.handle,
		  `DRAMPATH3.dimm0.U08.handle,

		  `DRAMPATH3.dimm0.U09.handle,
		  `DRAMPATH3.dimm0.U10.handle,
		  `DRAMPATH3.dimm0.U11.handle,
		  `DRAMPATH3.dimm0.U12.handle,
		  `DRAMPATH3.dimm0.U14.handle,
		  `DRAMPATH3.dimm0.U15.handle,
		  `DRAMPATH3.dimm0.U16.handle,
		  `DRAMPATH3.dimm0.U17.handle,

		  `DRAMPATH3.dimm1.U00.handle,
		  `DRAMPATH3.dimm1.U01.handle,
		  `DRAMPATH3.dimm1.U02.handle,
		  `DRAMPATH3.dimm1.U03.handle,
		  `DRAMPATH3.dimm1.U05.handle,
		  `DRAMPATH3.dimm1.U06.handle,
		  `DRAMPATH3.dimm1.U07.handle,
		  `DRAMPATH3.dimm1.U08.handle,

		  `DRAMPATH3.dimm1.U09.handle,
		  `DRAMPATH3.dimm1.U10.handle,
		  `DRAMPATH3.dimm1.U11.handle,
		  `DRAMPATH3.dimm1.U12.handle,
		  `DRAMPATH3.dimm1.U14.handle,
		  `DRAMPATH3.dimm1.U15.handle,
		  `DRAMPATH3.dimm1.U16.handle,
		  `DRAMPATH3.dimm1.U17.handle,
		     //ecc
		  `DRAMPATH0.dimm0.U04.handle,
		  `DRAMPATH0.dimm0.U13.handle,
		  `DRAMPATH0.dimm1.U04.handle,
		  `DRAMPATH0.dimm1.U13.handle,

		  `DRAMPATH1.dimm0.U04.handle,
		  `DRAMPATH1.dimm0.U13.handle,
		  `DRAMPATH1.dimm1.U04.handle,
		  `DRAMPATH1.dimm1.U13.handle,

		  `DRAMPATH2.dimm0.U04.handle,
		  `DRAMPATH2.dimm0.U13.handle,
		  `DRAMPATH2.dimm1.U04.handle,
		  `DRAMPATH2.dimm1.U13.handle,

		  `DRAMPATH3.dimm0.U04.handle,
		  `DRAMPATH3.dimm0.U13.handle,
		  `DRAMPATH3.dimm1.U04.handle,
		  `DRAMPATH3.dimm1.U13.handle,
		  dimm_config);
	*/
     $display("$time, init_dram dimm_config=%b, file=%s\n", dimm_config,file);
     $init_dram(file, dimm_config);

`endif // else
     end // initial begin

endmodule // cmp_mem


