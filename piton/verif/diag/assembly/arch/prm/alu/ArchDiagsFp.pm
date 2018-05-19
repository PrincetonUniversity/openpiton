# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: ArchDiagsFp.pm
# Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
# 
# The above named program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public
# License version 2 as published by the Free Software Foundation.
# 
# The above named program is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this work; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
# 
# ========== Copyright Header End ============================================

package ArchDiagsFp;
use Getopt::Long;
use Math::BigInt;
use strict;

our $locked_regs = 0;
our $single = "";
our $ILLIMM = 0x80000000;
our $RAND64 = "0xffffffffffffffff";
our $argnum = "";
################################################################################
# constructor
################################################################################

sub new
{
  my $class = shift;
  my $self  = {};
  print ("Creating a ArchDiagsFp object\n") if ($main::debug);
  bless ($self, $class);
  

  $self -> {FPUALU} -> {ADDSUB}       =  {};
  $self -> {FPUALU} -> {MULDIV}       =  {};

  $self ->  setupInstInfo();
  $self ->  setupFormatInfo();



  return $self;
}

########################################################### 
# setup instruction info  
########################################################### 
sub setupInstInfo
{
  my $self = shift;

  $self -> {FPUALU} -> {ADDSUB} -> {format} =  "3";
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {fadds}  -> {op3} = "0b110100", 
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {faddd}  -> {op3} = "0b010000";
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {fsubs}  -> {op3} = "0b001000";
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {fsubd}  -> {op3} = "0b011000";
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {fadds}  -> {opf} = "0b001000001", 
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {faddd}  -> {opf} = "0b001000010";
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {fsubs}  -> {opf} = "0b001000101";
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {fsubd}  -> {opf} = "0b001000110";
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {fadds}  -> {single} = "1",
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {faddd}  -> {single} = "0";
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {fsubs}  -> {single} = "1";
  $self -> {FPUALU} -> {ADDSUB} -> {opcode} -> {fsubd}  -> {single} = "0";


  $self -> {FPUALU} -> {MULDIV} -> {format} = "3";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fmuls}   -> {op3} = "0b110100",
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fmuld}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fsmuld}  -> {op3} = "0b110100";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fdivs}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fdivd}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fmuls}   -> {opf} = "0b001001001",
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fmuld}   -> {opf} = "0b001001010";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fsmuld}  -> {opf} = "0b001101001";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fdivs}   -> {opf} = "0b001001110";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fdivd}   -> {opf} = "0b001001111";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fmuls}   -> {single} = "1",
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fmuld}   -> {single} = "0";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fsmuld}  -> {single} = "0";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fdivs}   -> {single} = "1";
  $self -> {FPUALU} -> {MULDIV} -> {opcode} -> {fdivd}   -> {single} = "0";

  ## partioned add/sub 
  $self -> {FPUALU} -> {PADDSUB} -> {format} = "3";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd16}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd16s}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd32}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd32s}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub16}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub16s}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub32}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub32s}  -> {op3} = "0b110110";

  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd16}   -> {opf} = "0b001010000";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd16s}  -> {opf} = "0b001010001";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd32}   -> {opf} = "0b001010010";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd32s}  -> {opf} = "0b001010011";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub16}   -> {opf} = "0b001010100";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub16s}  -> {opf} = "0b001010101";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub32}   -> {opf} = "0b001010110";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub32s}  -> {opf} = "0b001010111";

  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd16}   -> {single} = "0";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd16s}  -> {single} = "1";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd32}   -> {single} = "0";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpadd32s}  -> {single} = "1";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub16}   -> {single} = "0";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub16s}  -> {single} = "1";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub32}   -> {single} = "0";
  $self -> {FPUALU} -> {PADDSUB} -> {opcode} -> {fpsub32s}  -> {single} = "1";

  ## alignment  instructions - set gsr.offset
  $self -> {FPUALU} -> {ALIGN} -> {format} = "3"; 
  $self -> {FPUALU} -> {ALIGN} -> {opcode} -> {alignaddr}   -> {op3} = "0b110110"; ## int reg
  $self -> {FPUALU} -> {ALIGN} -> {opcode} -> {alignaddrl}  -> {op3} = "0b110110"; ## int reg
  $self -> {FPUALU} -> {ALIGN} -> {opcode} -> {faligndata}  -> {op3} = "0b110110";

  $self -> {FPUALU} -> {ALIGN} -> {opcode} -> {alignaddr}   -> {opf} = "0b000011000"; ## int reg
  $self -> {FPUALU} -> {ALIGN} -> {opcode} -> {alignaddrl}  -> {opf} = "0b000011010"; ## int reg
  $self -> {FPUALU} -> {ALIGN} -> {opcode} -> {faligndata}  -> {opf} = "0b001001000";

  $self -> {FPUALU} -> {ALIGN} -> {opcode} -> {alignaddr}   -> {single} = "1"; ## int reg
  $self -> {FPUALU} -> {ALIGN} -> {opcode} -> {alignaddrl}  -> {single} = "1"; ## int reg
  $self -> {FPUALU} -> {ALIGN} -> {opcode} -> {faligndata}  -> {single} = "0";

  ### logical operate instrucions 
  $self -> {FPUALU} -> {FILL} -> {format} = "3";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fzero}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fzeros}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fone}    -> {op3} = "0b110110";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fones}   -> {op3} = "0b110110";

  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fzero}   -> {opf} = "0b001100000";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fzeros}  -> {opf} = "0b001100001";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fone}    -> {opf} = "0b001111110";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fones}   -> {opf} = "0b001111111";

  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fzero}   -> {single} = "0";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fzeros}  -> {single} = "1";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fone}    -> {single} = "0";
  $self -> {FPUALU} -> {FILL} -> {opcode} -> {fones}   -> {single} = "1";

  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc1}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc1s}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc2}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc2s}  -> {op3} = "0b110110";

  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc1}   -> {opf} = "0b001110101";
  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc1s}  -> {opf} = "0b001110101";
  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc2}   -> {opf} = "0b001111000";
  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc2s}  -> {opf} = "0b001111001";

  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc1}   -> {single} = "0";
  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc1s}  -> {single} = "1";
  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc2}   -> {single} = "0";
  $self -> {FPUALU} -> {COPY} -> {opcode} -> {fsrc2s}  -> {single} = "1";

  $self -> {FPUALU} -> {NOT} -> {format} = "3";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot1}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot1s}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot2}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot2s}  -> {op3} = "0b110110";

  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot1}   -> {opf} = "0b001101010";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot1s}  -> {opf} = "0b001101011";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot2}   -> {opf} = "0b001100110";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot2s}  -> {opf} = "0b001100111";

  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot1}   -> {single} = "0";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot1s}  -> {single} = "1";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot2}   -> {single} = "0";
  $self -> {FPUALU} -> {NOT} -> {opcode} -> {fnot2s}  -> {single} = "1";

  $self -> {FPUALU} -> {OR} -> {format} = "3";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {for}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {fors}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {fnor}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {fnors} -> {op3} = "0b110110";

  $self -> {FPUALU} -> {OR} -> {opcode} -> {for}   -> {opf} = "0b001111100";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {fors}  -> {opf} = "0b001111101";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {fnor}  -> {opf} = "0b001111110";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {fnors} -> {opf} = "0b001111111";

  $self -> {FPUALU} -> {OR} -> {opcode} -> {for}   -> {single} = "0";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {fors}  -> {single} = "1";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {fnor}  -> {single} = "0";
  $self -> {FPUALU} -> {OR} -> {opcode} -> {fnors} -> {single} = "1";

  $self -> {FPUALU} -> {AND} -> {format} = "3";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fand}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fands}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fnand}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fnands} -> {op3} = "0b110110";

  $self -> {FPUALU} -> {AND} -> {opcode} -> {fand}   -> {opf} = "0b001110000";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fands}  -> {opf} = "0b001110001";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fnand}  -> {opf} = "0b001110010";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fnands} -> {opf} = "0b001110011";

  $self -> {FPUALU} -> {AND} -> {opcode} -> {fand}   -> {single} = "0";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fands}  -> {single} = "1";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fnand}  -> {single} = "0";
  $self -> {FPUALU} -> {AND} -> {opcode} -> {fnands} -> {single} = "1";

  $self -> {FPUALU} -> {XOR} -> {format} = "3";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxor}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxors}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxnor}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxnors} -> {op3} = "0b110110";

  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxor}   -> {opf} = "0b001111100";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxors}  -> {opf} = "0b001111101";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxnor}  -> {opf} = "0b001111110";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxnors} -> {opf} = "0b001111111";

  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxor}   -> {single} = "0";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxors}  -> {single} = "1";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxnor}  -> {single} = "0";
  $self -> {FPUALU} -> {XOR} -> {opcode} -> {fxnors} -> {single} = "1";

  $self -> {FPUALU} -> {ORNOT} -> {format} = "3";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot1}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot1s}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot2}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot2s}  -> {op3} = "0b110110";

  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot1}   -> {opf} = "0b001111100";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot1s}  -> {opf} = "0b001111101";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot2}   -> {opf} = "0b001111110";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot2s}  -> {opf} = "0b001111111";

  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot1}   -> {single} = "0";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot1s}  -> {single} = "1";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot2}   -> {single} = "0";
  $self -> {FPUALU} -> {ORNOT} -> {opcode} -> {fornot2s}  -> {single} = "1";

  $self -> {FPUALU} -> {ANDNOT} -> {format} = "3";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot1}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot1s}  -> {op3} = "0b110110";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot2}   -> {op3} = "0b110110";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot2s}  -> {op3} = "0b110110";

  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot1}   -> {opf} = "0b001111100";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot1s}  -> {opf} = "0b001111101";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot2}   -> {opf} = "0b001111110";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot2s}  -> {opf} = "0b001111111";

  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot1}   -> {single} = "0";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot1s}  -> {single} = "1";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot2}   -> {single} = "0";
  $self -> {FPUALU} -> {ANDNOT} -> {opcode} -> {fandnot2s}  -> {single} = "1";

  $self -> {FPUALU} -> {CMP} -> {format} = "3";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmps}   -> {op3} = "0b110101";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmpd}   -> {op3} = "0b110101";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmpes}  -> {op3} = "0b110101";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmped}  -> {op3} = "0b110101";

  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmps}   -> {opf} = "0b001010001";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmpd}   -> {opf} = "0b001010010";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmpes}  -> {opf} = "0b001010101";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmped}  -> {opf} = "0b001010110";

  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmps}   -> {single} = "1";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmpd}   -> {single} = "0";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmpes}  -> {single} = "1";
  $self -> {FPUALU} -> {CMP} -> {opcode} -> {fcmped}  -> {single} = "0";

  $self -> {FPUALU} -> {MOV} -> {format} = "3";
  $self -> {FPUALU} -> {MOV} -> {opcode} -> {fmovs}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {MOV} -> {opcode} -> {fmovd}   -> {op3} = "0b110100";

  $self -> {FPUALU} -> {MOV} -> {opcode} -> {fmovs}   -> {opf} = "0b000000001";
  $self -> {FPUALU} -> {MOV} -> {opcode} -> {fmovd}   -> {opf} = "0b000000010";
  
  $self -> {FPUALU} -> {MOV} -> {opcode} -> {fmovs}   -> {single} = "1";
  $self -> {FPUALU} -> {MOV} -> {opcode} -> {fmovd}   -> {single} = "0";

  $self -> {FPUALU} -> {NEG} -> {format} = "3";
  $self -> {FPUALU} -> {NEG} -> {opcode} -> {fnegs}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {NEG} -> {opcode} -> {fnegd}   -> {op3} = "0b110100";

  $self -> {FPUALU} -> {NEG} -> {opcode} -> {fnegs}   -> {opf} = "0b000000101";
  $self -> {FPUALU} -> {NEG} -> {opcode} -> {fnegd}   -> {opf} = "0b000000110";
  
  $self -> {FPUALU} -> {NEG} -> {opcode} -> {fnegs}   -> {single} = "1";
  $self -> {FPUALU} -> {NEG} -> {opcode} -> {fnegd}   -> {single} = "0";

  $self -> {FPUALU} -> {ABS} -> {format} = "3";
  $self -> {FPUALU} -> {ABS} -> {opcode} -> {fabss}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {ABS} -> {opcode} -> {fabsd}   -> {op3} = "0b110100";

  $self -> {FPUALU} -> {ABS} -> {opcode} -> {fabss}   -> {opf} = "0b000001001";
  $self -> {FPUALU} -> {ABS} -> {opcode} -> {fabsd}   -> {opf} = "0b000001010";
  
  $self -> {FPUALU} -> {ABS} -> {opcode} -> {fabss}   -> {single} = "1";
  $self -> {FPUALU} -> {ABS} -> {opcode} -> {fabsd}   -> {single} = "0";

  $self -> {FPUALU} -> {FP2INT} -> {format} = "3";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fstox}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fdtox}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fstoi}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fdtoi}   -> {op3} = "0b110100";

  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fstox}   -> {opf} = "0b010000001";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fdtox}   -> {opf} = "0b010000001";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fstoi}   -> {opf} = "0b011010001";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fdtoi}   -> {opf} = "0b011010010";

  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fstox}   -> {single} = "1";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fdtox}   -> {single} = "0";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fstoi}   -> {single} = "1";
  $self -> {FPUALU} -> {FP2INT} -> {opcode} -> {fdtoi}   -> {single} = "0";

  $self -> {FPUALU} -> {FP2FP} -> {format} = "3";
  $self -> {FPUALU} -> {FP2FP} -> {opcode} -> {fstod}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {FP2FP} -> {opcode} -> {fdtos}   -> {op3} = "0b110100";

  $self -> {FPUALU} -> {FP2FP} -> {opcode} -> {fstod}   -> {opf} = "0b011001001";
  $self -> {FPUALU} -> {FP2FP} -> {opcode} -> {fdtos}   -> {opf} = "0b011000110";

  $self -> {FPUALU} -> {FP2FP} -> {opcode} -> {fstod}   -> {single} = "1";
  $self -> {FPUALU} -> {FP2FP} -> {opcode} -> {fdtos}   -> {single} = "0";

  $self -> {FPUALU} -> {INT2FP} -> {format} = "3";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fxtos}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fxtod}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fitos}   -> {op3} = "0b110100";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fitod}   -> {op3} = "0b110100";

  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fxtos}   -> {opf} = "0b010000100";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fxtod}   -> {opf} = "0b010001000";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fitos}   -> {opf} = "0b011000100";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fitod}   -> {opf} = "0b011000100";

  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fxtos}   -> {single} = "0";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fxtod}   -> {single} = "0";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fitos}   -> {single} = "1";
  $self -> {FPUALU} -> {INT2FP} -> {opcode} -> {fitod}   -> {single} = "1";


}

########################################################### 
# setup rs1,rs2, rd and imm13 info
########################################################### 
sub setupReg
{
  my $self = shift;

 if($single)
 {
   $self -> {RS1} = [0..31];
   $self -> {RS2} = [0..31];
   $self -> {RD}  = [0..31];
   $self -> {RS1Walk1} = [ 0, 1, 2, 4, 8, 16 ];
   $self -> {RS2Walk1} = [ 0, 1, 2, 4, 8, 16 ];
   $self -> {RDWalk1}  = [ 0, 1, 2, 4, 8, 16 ];
 }
 else
 {
   $self -> {RS1} = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,
                      32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62];
   $self -> {RS2} = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,
                      32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62];
   $self -> {RD}  = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,
                      32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62];
   $self -> {RS1Walk1} = [ 0, 2, 4, 8, 16 ];
   $self -> {RS2Walk1} = [ 0, 2, 4, 8, 16 ];
   $self -> {RDWalk1}  = [ 0, 2, 4, 8, 16 ];
 }
}

################################################################
sub setupFormatInfo
{
  my $self = shift;

   $self  -> {inst} -> {rs1}   -> {value} = 0;
   $self  -> {inst} -> {rs2}   -> {value} = 0;
   $self  -> {inst} -> {rd}    -> {value} = 0;
   $self  -> {inst} -> {op3}   -> {value} = 0;
   $self  -> {inst} -> {opf}   -> {value} = 0;
   $self  -> {inst} -> {const} -> {value} = 2;
   $self  -> {inst} -> {fccn}  -> {value} = 0;

   $self  -> {inst} -> {rs1}   -> {shift} = 14;
   $self  -> {inst} -> {rs2}   -> {shift} = 0;
   $self  -> {inst} -> {rd}    -> {shift} = 25;
   $self  -> {inst} -> {op3}   -> {shift} = 19;
   $self  -> {inst} -> {opf}   -> {shift} = 5;
   $self  -> {inst} -> {const} -> {shift} = 30;
   $self  -> {inst} -> {fccn}  -> {shift} = 25;

   $self ->  {inst} -> {opcode}     = "";
   $self ->  {inst} -> {group}       = "";
   $self ->  {inst} -> {assembly}   = "";
}

################################################################
# generage opcode
################################################################
sub genOpcode
{
  my $self = shift;

  if($self ->  {inst} -> {group} eq "CMP")
  {
   $self -> {inst} -> {opcode} =
             ($self  -> {inst} -> {const} -> {value} << $self  -> {inst} -> {const} -> {shift}) +
             ($self  -> {inst} -> {fccn}  -> {value} << $self  -> {inst} -> {fccn}  -> {shift}) +
             ($self  -> {inst} -> {op3}   -> {value} << $self  -> {inst} -> {op3}   -> {shift}) +
             ($self  -> {inst} -> {rs1}   -> {value} << $self  -> {inst} -> {rs1}   -> {shift}) +
             ($self  -> {inst} -> {rs2}   -> {value} << $self  -> {inst} -> {rs2}   -> {shift}) +
             ($self  -> {inst} -> {opf}   -> {value} << $self  -> {inst} -> {opf}   -> {shift});
   }
   else
   {
   $self -> {inst} -> {opcode} =
             ($self  -> {inst} -> {const} -> {value} << $self  -> {inst} -> {const} -> {shift}) +
             ($self  -> {inst} -> {rd}    -> {value} << $self  -> {inst} -> {rd}    -> {shift}) +
             ($self  -> {inst} -> {op3}   -> {value} << $self  -> {inst} -> {op3}   -> {shift}) +
             ($self  -> {inst} -> {rs1}   -> {value} << $self  -> {inst} -> {rs1}   -> {shift}) +
             ($self  -> {inst} -> {rs2}   -> {value} << $self  -> {inst} -> {rs2}   -> {shift}) +
             ($self  -> {inst} -> {opf}   -> {value} << $self  -> {inst} -> {opf}   -> {shift});
   }
}


##################################################################
# randomize parameters
##################################################################  

sub randomize
{
  my $self = shift;
  my $index;
  my $instSel;
  my @array;

  if( $self-> {opt} -> {inst} eq "ALL")
  {
    # randomize inst
    @array = (); 
    @array = keys (%{$self -> {FPUALU}});
    $index = int rand @array;
    $instSel = $array[$index];
    $self-> {inst} -> {group} = $instSel;
  }
  else
  {
   $instSel = $self-> {opt} -> {inst};
   $self-> {inst} -> {group} = $self-> {opt} -> {inst};
  }
  printf ("! Instruction selected : %s \n", $instSel) if ($main::debug); 

  # randomize opcode
  @array = ();
  @array = keys (%{$self -> {FPUALU} -> {$instSel} -> {opcode}});
  $index = int rand @array;
   
  $self -> {inst} -> {op3} -> {value} = $self -> {FPUALU} -> {$instSel} -> {opcode} -> {$array[$index]} -> {op3};
  $self -> {inst} -> {opf} -> {value} = $self -> {FPUALU} -> {$instSel} -> {opcode} -> {$array[$index]} -> {opf};
  printf ("! Op3 selected      : %s \n", $self->{inst}-> {op3}-> {value} ) if ($main::debug); 
  printf ("! Opf selected      : %s \n", $self->{inst}-> {opf}-> {value} ) if ($main::debug); 
  $self -> {inst} -> {op3} -> {value} =  oct ($self -> {inst} -> {op3} -> {value});
  $self -> {inst} -> {opf} -> {value} =  oct ($self -> {inst} -> {opf} -> {value});
  $self -> {inst} -> {assembly} =  $array[$index];
  printf ("! Assemby selected     : %s \n", $self->{inst}-> {assembly}) if ($main::debug); 

  $single = $self -> {FPUALU} -> {$instSel} -> {opcode} -> {$array[$index]} -> {single};
  $self -> setupReg();  

  # randomize rs1
  @array = ();
  @array = @{$self -> {RS1}};
  $index = int rand @array;
  $self->{inst} -> {rs1} -> {value} = $array[$index];
  $self->{inst} -> {rs1} -> {value} = ($self->{inst} -> {rs1} -> {value} % 32) 
        if(($self -> {inst} -> {assembly} eq "alignaddr") || ($self -> {inst} -> {assembly} eq "alignaddrl"));
                        
  
  
  printf ("! rs1 selected         : %s \n", $self->{inst} -> {rs1}  -> {value}) if ($main::debug); 

  #randomize rs2 
  @array = ();
  @array = @{$self -> {RS2}};
  $index = int rand @array;
  $self->{inst} -> {rs2}  -> {value} = $array[$index];
  $self->{inst} -> {rs2} -> {value} = ($self->{inst} -> {rs2} -> {value} % 32)
            if(($self -> {inst} -> {assembly} eq "alignaddr") || ($self -> {inst} -> {assembly} eq "alignaddrl"));
  printf ("! rs2 selected         : %s \n", $self->{inst} -> {rs2} -> {value} ) if ($main::debug);
 
  #randomize rd
  #if($self -> {inst} -> {assembly} eq "fdtox" || $self -> {inst} -> {assembly} eq "fdtoi" ||
  #   $self -> {inst} -> {assembly} eq "fdtos")
  #{
  #  $self -> {RD} = [0..31];
  #}   
  #elsif($self -> {inst} -> {assembly} eq "fstod" || $self -> {inst} -> {assembly} eq "fxtod" ||
  #      $self -> {inst} -> {assembly} eq "fitod" || $self -> {inst} -> {assembly} eq "fstod")
  #{
  #   $self -> {RD}  = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,
  #                      32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62];
  #}

  #randomize rd
  if($self -> {inst} -> {assembly} eq "fdtoi" || $self -> {inst} -> {assembly} eq "fdtos" ||
      $self -> {inst} -> {assembly} eq "fxtos")
  {
    $self -> {RD} = [0..31];
  }
  elsif($self -> {inst} -> {assembly} eq "fstod" || $self -> {inst} -> {assembly} eq "fitod" ||
        $self -> {inst} -> {assembly} eq "fstox")
  {
     $self -> {RD}  = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,
                        32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62];
  }


  @array = ();
  @array = @{$self -> {RD}};
  $index = int rand @array;
  $self->{inst} -> {rd}   -> {value}=  $array[$index];
  $self->{inst} -> {rd} -> {value} = ($self->{inst} -> {rd} -> {value} % 32)
            if(($self -> {inst} -> {assembly} eq "alignaddr") || ($self -> {inst} -> {assembly} eq "alignaddrl"));
  printf ("! rd selected          : %s \n", $self->{inst} -> {rd}  -> {value}) if ($main::debug);

}  


############################################################
sub genRandomInst
{
  my $self = shift;
  my $imm13;
  my $reg_type;
  my $instGrp;

  print "        wr  %g0, 0x4, %fprs \n\n";
  $self -> initFpReg();

  $self ->  {inst} -> {fccn} -> {value} =  $self-> {opt} -> {fccn};
  $self -> set_fsr($self -> {opt} -> {rd}, $self -> {opt} -> {tem});
  print "        wr  %g0, 0x0, %fprs \n\n" if ($self-> {opt} -> {fpdis});
  print "        wr  %g0, 0x4, %fprs \n\n" if (!($self-> {opt} -> {fpdis}));


  $instGrp  =  $self-> {opt} -> {inst};

  while($self -> {opt} -> {random_inst} > 0 )
  {
    $self -> randomize();
    #$self -> genOpcode();
    $argnum = 1;
    $imm13 = rand(0xfff) & 0xff8;
    $reg_type = "f";
    #$reg_type = "r" if(($self -> {inst} -> {assembly} eq "alignaddr") || ($self -> {inst} -> {assembly} eq "alignaddrl") ||
    #                   ($instGrp eq "INT2FP")); 
    $reg_type = "r" if(($self -> {inst} -> {assembly} eq "alignaddr") || ($self -> {inst} -> {assembly} eq "alignaddrl")); 

    if(!($instGrp eq "FILL" || $instGrp eq "MOV" || $instGrp eq "NEG" || $instGrp eq "ABS" ||
        $instGrp eq "COPY" || $instGrp eq "NOT" || $instGrp eq "FP2INT" || $instGrp eq "INT2FP" ||
        $instGrp eq "FP2FP"))
    {
      $self -> load_reg($self->{inst} -> {rs1} -> {value}, $imm13, $reg_type);
    }

    if(!($instGrp eq "FILL"))
    {
      if(($self->{inst} -> {rs1} -> {value} != $self->{inst} -> {rs2} -> {value} ) ||
         ($instGrp eq "MOV" || $instGrp eq "NEG" || $instGrp eq "ABS" || $instGrp eq "COPY" || 
          $instGrp eq "NOT" || $instGrp eq "FP2INT" || $instGrp eq "INT2FP" || $instGrp eq "FP2FP"))
      {
        $argnum = 2;
        $imm13 = rand(0xfff) & 0xff8;
        $self -> load_reg($self->{inst} -> {rs2} -> {value}, $imm13, $reg_type);
      }
    }
    $self-> printInst();
    $self -> {opt} -> {random_inst} = ($self -> {opt} -> {random_inst}) -1;
    $argnum = "";
   }
}

    
##############################################################
# print instruc
##############################################################

sub printInst
{
   my $self = shift;
   my $inst;

  if($self-> {opt} -> {rsvd})
  {
    $inst  =  sprintf "        .word  0x%08x", $self-> {inst} -> {opcode};
    $inst .=  sprintf "        !  %-9s",  $self-> {inst} -> {assembly};
    $inst .=  sprintf "%%f%-2s,    ",   $self-> {inst} -> {rs2}  -> {value};
    $inst .=  sprintf "%%f%-6s",   $self-> {inst} -> {rd}  -> {value};
    $inst .=  sprintf "   Reserved bits : 0x%02x", $self-> {inst} -> {rs1} -> {value};
  }
  elsif($self-> {inst} -> {group} eq "CMP")
  {
     $inst  =  sprintf "        %-15s",  $self-> {inst} -> {assembly};
     $inst .=  sprintf "%%fcc%-2s,    ",   $self-> {inst} -> {fccn}  -> {value};
     $inst .=  sprintf "%%f%-2s,    ",   $self-> {inst} -> {rs1}  -> {value};
     $inst .=  sprintf "%%f%-6s",   $self-> {inst} -> {rs2}  -> {value};
  } 
  elsif($self-> {inst} -> {group} eq "FILL")
  {
     $inst  =  sprintf "        %-15s",  $self-> {inst} -> {assembly};
     $inst .=  sprintf "%%f%-6s",   $self-> {inst} -> {rd}  -> {value};
     #$inst .=  sprintf "         !  Opcode :  0x%08x", $self-> {inst} -> {opcode};
  }
  elsif($self-> {inst} -> {group} eq "COPY"  || $self-> {inst} -> {group} eq "NOT")
  {
     $inst  =  sprintf "        %-15s",  $self-> {inst} -> {assembly};
     $inst .=  sprintf "%%f%-2s,    ",   $self-> {inst} -> {rs2}  -> {value};
     $inst .=  sprintf "%%f%-6s",   $self-> {inst} -> {rd}  -> {value};
  } 
  elsif($self-> {inst} -> {assembly} eq "alignaddr" || $self-> {inst} -> {assembly} eq "alignaddrl")
  {
     $inst  =  sprintf "        %-15s",  $self-> {inst} -> {assembly};
     $inst .=  sprintf "%%r%-2s,    ",   $self-> {inst} -> {rs1}  -> {value};
     $inst .=  sprintf "%%r%-2s,    ",   $self-> {inst} -> {rs2}  -> {value};
     $inst .=  sprintf "%%r%-6s",   $self-> {inst} -> {rd}  -> {value};
  }
  elsif($self-> {inst} -> {group} eq "MOV"  || $self-> {inst} -> {group} eq "NEG" ||
        $self-> {inst} -> {group} eq "ABS")
  {
     $inst  =  sprintf "        %-15s",  $self-> {inst} -> {assembly};
     $inst .=  sprintf "%%f%-2s,    ",   $self-> {inst} -> {rs2}  -> {value};
     $inst .=  sprintf "%%f%-6s",   $self-> {inst} -> {rd}  -> {value};
  }
  elsif($self-> {inst} -> {group} eq "INT2FP" || $self-> {inst} -> {group} eq "FP2INT" || $self-> {inst} -> {group} eq "FP2FP")
  {
     $inst  =  sprintf "        %-15s",  $self-> {inst} -> {assembly};
     $inst .=  sprintf "%%f%-2s,    ",   $self-> {inst} -> {rs2}  -> {value};
     $inst .=  sprintf "%%f%-6s",   $self-> {inst} -> {rd}  -> {value};
  }
  else
  { 
     $inst  =  sprintf "        %-15s",  $self-> {inst} -> {assembly};
     $inst .=  sprintf "%%f%-2s,    ",   $self-> {inst} -> {rs1}  -> {value};
     $inst .=  sprintf "%%f%-2s,    ",   $self-> {inst} -> {rs2}  -> {value};
     $inst .=  sprintf "%%f%-6s",   $self-> {inst} -> {rd}  -> {value};
  }

  $inst .=  sprintf "\n\n";
  print $inst;
}


#####################################################################
sub genAllWalk1Inst
{
 my $self = shift;
 my $instGrp;
 my $rs1;
 my $rs2;
 my $rd;
 my $inst;
 my ($imm13, $reg_type);
 

  print "        wr  %g0, 0x4, %fprs \n\n";
  $self -> initFpReg();

  $instGrp = $self-> {opt} -> {inst};
  $self ->  {inst} -> {group} =  $self-> {opt} -> {inst};
  $self ->  {inst} -> {fccn} -> {value} =  $self-> {opt} -> {fccn};
  $self ->   set_fsr($self -> {opt} -> {rd}, $self -> {opt} -> {tem});
  print "        wr  %g0, 0x0, %fprs \n\n" if ($self-> {opt} -> {fpdis});
  print "        wr  %g0, 0x4, %fprs \n\n" if (!($self-> {opt} -> {fpdis}));


   foreach $inst (keys %{$self -> {FPUALU} -> {$instGrp} -> {opcode}})
   {
     $single = $self -> {FPUALU} -> {$instGrp} -> {opcode} -> {$inst} -> {single};
     $self -> setupReg();  
     $self -> {RDWalk1}  =[0] if($instGrp eq "CMP");
     $self -> {RS1Walk1} =[0] if($instGrp eq "FILL");
     $self -> {RS2Walk1} =[0] if($instGrp eq "FILL");
     $self -> {RS1Walk1} =[0] if($instGrp eq "COPY");
     $self -> {RS1Walk1} =[0] if($instGrp eq  "NOT");
     $self -> {RS1Walk1} =[0] if($instGrp eq  "MOV");
     $self -> {RS1Walk1} =[0] if($instGrp eq  "NEG");
     $self -> {RS1Walk1} =[0] if($instGrp eq  "ABS");
     $self -> {RS1Walk1} =[0] if($instGrp eq  "FP2INT");
     $self -> {RS1Walk1} =[0] if($instGrp eq  "FP2FP");
     $self -> {RS1Walk1} =[0] if($instGrp eq  "INT2FP");

     $self -> {RDWalk1}  = [ 0, 1, 2, 4, 8, 16 ] if($inst eq "fdtoi" || $inst eq "fdtos" || $inst eq "fxtos");
     $self -> {RDWalk1}  = [ 0, 2, 4, 8, 16 ] if($inst eq "fstod" || $inst eq "fitod" || $inst eq "fitod" || $inst eq "fstox");
   
     foreach $rs1 (@{$self -> {RS1Walk1}})
     {
       foreach $rs2 (@{$self -> {RS2Walk1}})
       {
         foreach $rd (@{$self -> {RDWalk1}})
         {
           $self-> {inst} -> {assembly} = $inst;
           $self-> {inst} -> {op3}   -> {value} = oct ($self -> {FPUALU} -> {$instGrp} -> {opcode} -> {$inst} -> {op3});
           $self-> {inst} -> {opf}   -> {value} = oct ($self -> {FPUALU} -> {$instGrp} -> {opcode} -> {$inst} -> {opf});
           $self-> {inst} -> {rs1}   -> {value} = $rs1;
           $self-> {inst} -> {rs2}   -> {value} = $rs2;
           $self-> {inst} -> {rd}    -> {value} = $rd;
           #$self-> genOpcode();

           $imm13 = rand(0xfff) & 0xff8;
           $reg_type = "f" ; 
           $reg_type = "r" if ($self-> {inst} -> {assembly} eq "alignaddr" || $self-> {inst} -> {assembly} eq "alignaddrl");
           $argnum = 1;
           $self -> load_reg($self -> {inst} -> {rs1} -> {value}, $imm13, $reg_type) if(!($instGrp eq "FILL" || $instGrp eq "MOV" ||
                                                                                   $instGrp eq "NEG" || $instGrp eq "ABS" ||
                                                                                   $instGrp eq "COPY" || $instGrp eq "NOT" ||
                                                                                   $instGrp eq "FP2INT" || $instGrp eq "INT2FP" ||
                                                                                   $instGrp eq "FP2FP") && $self->{opt}->{fpdis}== 0);

           if(((($self -> {inst} -> {rs1} -> {value} != $self -> {inst} -> {rs2} -> {value}) &&
              !($instGrp eq "FILL")) ||
                ($instGrp eq "MOV" || $instGrp eq "NEG" || $instGrp eq "ABS" || $instGrp eq "COPY" || $instGrp eq "NOT" ||
                 $instGrp eq "FP2INT" || $instGrp eq "INT2FP" || $instGrp eq "FP2FP")) &&  $self->{opt}->{fpdis}== 0)
           {
             $argnum = 2;
             $imm13 = rand(0xfff) & 0xff8;
             $self ->load_reg($self -> {inst} -> {rs2} -> {value}, $imm13, $reg_type);
           }
           $argnum = "";
           $self-> printInst();
         }
       }
     }
   }

    
  $self ->  setupInstInfo();
  $self ->  setupFormatInfo();
}

#####################################################################
sub genAllWalk1InstWithRsvd
{
 my $self = shift;
 my $instGrp;
 my $rs1;
 my $rs2;
 my $rd;
 my $inst;
 my ($imm13, $reg_type);
 

  print "        wr  %g0, 0x4, %fprs \n\n"; 
  $self -> initFpReg();
  $instGrp = $self-> {opt} -> {inst};
  $self ->  {inst} -> {group} =  $self-> {opt} -> {inst};
  $self ->  {inst} -> {fccn} -> {value} =  $self-> {opt} -> {fccn};
  $self ->   set_fsr($self -> {opt} -> {rd}, $self -> {opt} -> {tem});
  print "        wr  %g0, 0x0, %fprs \n\n" if ($self-> {opt} -> {fpdis});
  print "        wr  %g0, 0x4, %fprs \n\n" if (!($self-> {opt} -> {fpdis}));

   
   foreach $inst (keys %{$self -> {FPUALU} -> {$instGrp} -> {opcode}})
   {
     $single = $self -> {FPUALU} -> {$instGrp} -> {opcode} -> {$inst} -> {single};
     $self -> setupReg();  
     $self -> {RS1Walk1} =[0,1,2,4,8,16,31] if($instGrp eq "FP2INT");
     $self -> {RS1Walk1} =[0,1,2,4,8,16,31] if($instGrp eq "FP2FP");
     $self -> {RS1Walk1} =[0,1,2,4,8,16,31] if($instGrp eq "INT2FP");
     foreach $rs1 (@{$self -> {RS1Walk1}})
     {
       foreach $rs2 (@{$self -> {RS2Walk1}})
       {
         foreach $rd (@{$self -> {RDWalk1}})
         {
           $self-> {inst} -> {assembly} = $inst;
           $self-> {inst} -> {op3}   -> {value} = oct ($self -> {FPUALU} -> {$instGrp} -> {opcode} -> {$inst} -> {op3});
           $self-> {inst} -> {opf}   -> {value} = oct ($self -> {FPUALU} -> {$instGrp} -> {opcode} -> {$inst} -> {opf});
           $self-> {inst} -> {rs1}   -> {value} = $rs1;
           $self-> {inst} -> {rs2}   -> {value} = $rs2;
           $self-> {inst} -> {rd}    -> {value} = $rd;
           $self-> genOpcode();
           $self-> printInst();
         }
       }
     }
   }

    
  $self ->  setupInstInfo();
  $self ->  setupFormatInfo();
}


#########################################################################
## setup diag options
##########################################################################
sub setupDiagOptions() 
{
   my $self = shift;

   $self  ->  {opt} =
              {
               name          => "",    # name of the diag
               thrd_count    => 1,
               thrd_stride   => 1,
               super         => 0,     # run in supervisor mode
               hyper         => 0,     # run in hypervisor mode
               enboff        => 0,     # run in hypervisor mode
               inst          => "",    # instruction to execute
               inst_group    => "",    # instruction to execute
               fpdis         => 0,     # 
               rand          => 0,     # 
               random_inst   => 4000,  # 
               fccn          => 0,  # 
               rd            => 0,  # 
               tem           => 31,  # 
               of            => 0,  # 
               uf            => 0,  # 
               nx            => 0,  # 
               nv            => 0,  # 
               dz            => 0,  # 
               seed          => -1,  # 
             };
   my @options =
      qw(
         name=s
         thrd_count=i
         thrd_stride=i
         super=i
         hyper=i
         enboff=i
         inst=s
         inst_group=s
         fpdis=i
         rand=i 
         random_inst=i
         fccn=i
         rd=i
         tem=i
         of=i
         uf=i
         nx=i
         nv=i
         dz=i
         seed=i
        );

   GetOptions($self-> {opt}, @options);

    my @diag_run_args = split(/_/, $self-> {opt} -> {name});
    my $index = 0;
    printf("!Diag run options\n");
    foreach my $diag_run_arg (@diag_run_args) 
    {
       if($index == 0) 
       {
          $self-> {opt} -> {inst_group} = $diag_run_arg;
          printf("!inst_group = %-20s\n", $self-> {opt} -> {inst_group});
       }
       elsif($index == 1) 
       {
          $self-> {opt} -> {inst} = uc($diag_run_arg);
          printf("!inst = %-20s\n", $self-> {opt} -> {inst});
       }
       else 
       {
          $self -> {opt} -> {$diag_run_arg} = 1;
          printf("!%s = %d\n", $diag_run_arg, $self-> {opt} -> {$diag_run_arg});
       }
       $index++;
    }
    if ($self-> {opt} -> {seed} != -1)
    {
        printf("!seed set to: %d\n", $self-> {opt} -> {seed});
        srand($self-> {opt} -> {seed});
    } else
    {
        my $time = time;
        printf("!seed was unset, using: %d\n", $time);
        srand($self-> {opt} -> {seed});
    }
}

### shift : x bit and shift num, tadd and tsub - int, div - int

##########################################################################
# Initialize integer registers
##########################################################################
sub initIntReg
{
  my $self   = shift;
  my $wincnt = shift;
  my $back   = shift;
  my ($rand64, $count);

  for ($count=0; $count<8; $count++)
  {
    $rand64      = sprintf "0x%08x%08x", rand(0xffffffff), rand(0xffffffff);
    $rand64      = Math::BigInt->new ($rand64);

    &setx($rand64, 1, $count);
  }
 
  printf ("\n");

  while ($wincnt > 0)
  {
    for ($count = 16; $count < 32; $count++)
    {
      $rand64      = sprintf "0x%08x%08x", rand(0xffffffff), rand(0xffffffff);
      $rand64      = Math::BigInt->new ($rand64);
      &setx($rand64, 1, $count);
    }
    $wincnt--;
    print  "\n"; 
    print  "        save\n" if($wincnt);
  }


  while ($back > 0)
  {
    print  "        restore\n" if($back);
    $back--;
  }
  print  "\n"; 
}


##########################################################################
# Initialize Floating Point registers
##########################################################################
sub initFpReg
{
  my $self   = shift;
  my ($count);

  for ($count=0; $count<64; $count=$count+2)
  {
    $self ->load_reg($count, $count*8, "f");
  }
}


#####################################################
sub hyp_helper_apis() 
{
  my $slf = shift;
  my ($tmp1, $tmp2) = (1,2);

  printf("\n\n");
  printf("SECTION .HTRAPS\n");
  printf("attr_text {\n");
  printf("    Name = .HTRAPS,\n");
  printf("    VA=HV_TRAP_BASE_PA,\n");
  printf("    RA=HV_TRAP_BASE_PA,\n");
  printf("    PA=ra2pa(HV_TRAP_BASE_PA,0),\n");
  #printf("    tsbonly,\n");
  printf("    part_0_i_ctx_zero_ps0_tsb,\n");
  printf("    part_0_i_ctx_nonzero_ps0_tsb,\n");
  printf("    TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,\n");
  printf("    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,\n");
  printf("    TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0\n");
  printf("    }\n");
  printf(".global hyp_api\n");
  printf("hyp_api:\n");
  printf("ldxa [%%g0] 0x45, %%r%d\n", $tmp1);
  printf("sllx %%r%d, 60, %%r%d\n", $tmp1, $tmp2);
  printf("srlx %%r%d, 63, %%r%d\n", $tmp2, $tmp2);
  printf("sllx %%r%d,  3, %%r%d\n", $tmp2, $tmp2);
  printf("xor  %%r%d,  %%r%d, %%r%d\n", $tmp1, $tmp2, $tmp1);
  printf("stxa %%r%d, [%%g0] 0x45\n", $tmp1);
  printf("done\n");
}


######################################################################################
#
######################################################################################
sub enableInt()
{
  my  $self = shift;

#  if($self-> {opt} -> {inst} eq "ALL" )
#  {
    printf ("\n\n");
    printf ("! fp disabled trap\n");
    printf ("#define ENABLE_T0_Fp_disabled_0x20\n");
    printf ("\n\n");
#  }

#  if($self-> {opt} -> {inst} eq "ALL" )
#  {
    printf ("! fp ieee 754 \n");
    printf ("#define H_T0_Fp_exception_ieee_754_0x21\n");
    printf ("#define SUN_H_T0_Fp_exception_ieee_754_0x21 done; \n");
    printf ("\n\n");
#  }

#  if($self-> {opt} -> {inst} eq "ALL" )
#  {
    printf ("! fp ieee 754 \n");
    printf ("#define H_T0_Fp_exception_other_0x22\n");
    printf ("#define SUN_H_T0_Fp_exception_other_0x22 done; \n");
    printf ("\n\n");
#  }

}
###############################################################

sub gen_scratch_mem_area() {
    printf("SECTION SCRATCH_MEM DATA_VA=0x1ffffe000\n");
    printf("attr_data {\n");
    printf("        Name = SCRATCH_MEM,\n");
    printf("        hypervisor\n");
    printf("        }\n");
    printf("attr_data {\n");
    printf("        Name = SCRATCH_MEM,\n");
    printf("        RA=0x1ffffe000,\n");
    printf("        PA=ra2pa\(0x1ffffe000,0\),\n");
    printf("        part_0_d_ctx_nonzero_ps0_tsb, \n");
    printf("        part_0_d_ctx_zero_ps0_tsb, \n");
    printf("        TTE_Context=PCONTEXT\n");
    printf("        TTE_G=1, TTE_Size=0x0, TTE_NFO=0,\n");
    printf("        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,\n");
    printf("        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, ");
    printf("        TTE_P=0, TTE_W=1,  TTE_V=1\n");
    printf("        }\n");
    printf(".data\n");
    printf(".global scratch_mem\n");
    printf("scratch_mem:\n");
    for (my $i=0; $i<8192/4; $i++) {
            printf(".word 0x%x\n", int(rand(0xffffffff)));
    }
}

###################################################################

sub load() {
    my ($inst, $rs1, $rs2, $imm, $dest_num, $dest_type) = @_;
    if($imm == $ILLIMM) {
        print ("        membar  #Sync\n");
        printf("        %s [%%r%d+%%r%d], %%%s%d\n", $inst, $rs1, $rs2, $dest_type, $dest_num);
    }
    else {
        print ("        membar  #Sync\n");
        printf("        %s [%%r%d+0x%x], %%%s%d\n", $inst, $rs1, $imm, $dest_type, $dest_num);
    }
}

########################################################################

sub store() {
    my ($inst, $src_type, $src_num, $rs1, $rs2, $imm) = @_;
    if($imm == $ILLIMM) {
        printf("        %s %s%d, [%%r%d+%%r%d]\n", $inst, $src_type, $src_num, $rs1, $rs2);
    }
    else {
        printf("        %s %s%d, [%%r%d+0x%x]\n", $inst, $src_type, $src_num, $rs1, $imm);
    }
}

###########################################################################3


sub lock_regs() {
    my (@regs) = @_;
    foreach my $reg (@regs) {
        if(($locked_regs & (0x1 << $reg)) == 0) {
            $locked_regs |= (0x1 << $reg);
        }
        else {
            printf("ERROR: reg %d is already locked\n", $reg);
        }
    }
    printf("!lock_temp_reg locked regs = 0x%x\n", $locked_regs);
}

###########################################################################3

sub release_regs() {
    my (@regs) = @_;
    foreach my $reg (@regs) {
        if($locked_regs & (0x1 << $reg)) {
            $locked_regs ^= (0x1 << $reg);
        }
        else {
            printf("ERROR: reg %d was never locked\n", $reg);
        }
    }
    printf("!release_temp_reg locked regs = 0x%x\n", $locked_regs);
}

###########################################################################3

sub release_all_regs() {
    $locked_regs = 0;
    #printf("!release all locked regs = 0x%x\n", $locked_regs);
}

###########################################################################3

sub pick_tmp_reg() {
    my ($ex1, $ex2) = @_;
    foreach my $reg (1..31) {
        #if($reg != $ex1 && $reg != $ex2 && (($locked_regs & (0x1 << $reg)) == 0)) {
        if((($locked_regs & (0x1 << $reg)) == 0)) {
            $locked_regs |= (0x1 << $reg);
            #printf("!pick temp locked regs = 0x%x\n", $locked_regs);
            return ($reg);
        }
    }
    printf("ERROR: If here, means something went wrong in pick_tmp_reg\n");
}
###########################################################################3

sub add_regs() {
    my ($rs1, $rs2, $imm, $dest) = @_;
    if($imm == $ILLIMM) {
        printf("        add %%r%d, %%r%d, %%r%d\n", $rs1, $rs2, $dest);
    }
    else {
        printf("        add %%r%d, 0x%x, %%r%d\n",  $rs1, $imm, $dest);
    }
}

sub setx() {
    my ($va, $tmp_reg, $dest) = @_;
    $va      = Math::BigInt->new ($va);
    printf("        setx %s, %%r%d, %%r%d\n", $va -> as_hex(), $tmp_reg, $dest);
}

sub setx_label() {
    my ($label, $tmp_reg, $dest) = @_;
    printf("        setx %s, %%r%d, %%r%d\n", $label, $tmp_reg, $dest);
}


###########################################################################3
sub load_reg
{
   my $self = shift;
   my $dest_reg = shift;
   my $imm13 = shift;
   my $reg_type = shift;

   #my ($dest_reg,$imm13, $reg_type) = @_;
   
    my ($tmp1,$tmp2, $tmp3, $tmp4, $rand64,$count);

    $rand64      =  $self -> get_rand_data();

    $tmp1 = &pick_tmp_reg();
    $tmp2 = &pick_tmp_reg();
    $tmp3 = &pick_tmp_reg();
    $tmp4 = &pick_tmp_reg();

    &setx_label("scratch_mem", $tmp1, $tmp2);
    &setx($rand64, $tmp1, $tmp3);

    &setx($imm13, $tmp1, $tmp4);

    &store("st", "%r", $tmp3, $tmp2, $tmp4,$ILLIMM);

    if($reg_type eq "r")
    {
      &load("ldx",  $tmp2, $tmp4, $ILLIMM, $dest_reg, $reg_type);
    }
    elsif(!$single)
    {
      &load("ldd",  $tmp2, $tmp4, $ILLIMM, $dest_reg, $reg_type);
      #&load("ldd",  $tmp2, $tmp4, $ILLIMM, "%${reg_type}",$dest_reg, $reg_type);
    }
    else
    {
      &load("ld",  $tmp2, $tmp4, $ILLIMM, $dest_reg, $reg_type);
      #&load("ld",  $tmp2, $tmp4, $ILLIMM, "%${reg_type}",$dest_reg, $reg_type);
    }

    &release_all_regs();
}

###############################################################################
## sef fsr
###############################################################################
sub set_fsr
{

my $self = shift;
my $rd = shift;
my $tem = shift;

  my $fsr_lw =  ($rd << 30) + ($tem << 23);
  my $fsr_uw = 0;

  my $fsr      = sprintf "0x%08x%08x", $fsr_uw, $fsr_lw;
     $fsr      = Math::BigInt->new ($fsr);

  my $tmp1 = &pick_tmp_reg();
  my $tmp2 = &pick_tmp_reg();
  my $tmp3 = &pick_tmp_reg();
  my $tmp4 = &pick_tmp_reg();
  my $imm13 = rand(0xfff) & 0xff8;

  &setx_label("scratch_mem", $tmp1, $tmp2);
  &setx($fsr, $tmp1, $tmp3);
  &setx($imm13, $tmp1, $tmp4);

  &store("st", "%r", $tmp3, $tmp2, $tmp4,$ILLIMM);

  printf("        ldx [%%r%d+0x%x], %%fsr\n\n",  $tmp2, $imm13 );
}

#################################################################################
sub get_rand_data
{
my $self = shift;

    my $rand64;
    my $rand_indx;

    $rand64      = sprintf "0x%08x%08x", rand(0xffffffff), rand(0xffffffff); 
    $rand64      = Math::BigInt->new ($rand64);


    ## fadds, faddd
    if($self->{inst}->{assembly} eq "fadds" || $self->{inst}->{assembly} eq "fsubs")
    {
      if($self->{opt}->{of} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
      }
      
      if($self->{opt}->{uf} == 1)
      {
        $rand_indx = int rand(4); 
        $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
      }

      if($self->{opt}->{nx} == 1)
      {
        $rand_indx = int rand(4); 
        $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
      }

      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(8);
        $rand64 = get_pos_infinity(1) if($rand_indx == 0);
        $rand64 = get_neg_infinity(1) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(1) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(1) if($rand_indx == 3);
        $rand64 = get_pos_signal_NaN(1) if($rand_indx == 4);
        $rand64 = get_neg_signal_NaN(1) if($rand_indx == 5);
        $rand64 = get_pos_norm(1) if($rand_indx == 6);
        $rand64 = get_neg_norm(1) if($rand_indx == 7);
      }
    }

    if($self->{inst}->{assembly} eq "faddd" || $self->{inst}->{assembly} eq "fsubd")
    {
      if($self->{opt}->{of} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
        $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
      }

      if($self->{opt}->{uf} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
        $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
      }

      if($self->{opt}->{nx} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
        $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
      }

      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(8);
        $rand64 = get_pos_infinity(0) if($rand_indx == 0);
        $rand64 = get_neg_infinity(0) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(0) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(0) if($rand_indx == 3);
        $rand64 = get_pos_signal_NaN(0) if($rand_indx == 4);
        $rand64 = get_neg_signal_NaN(0) if($rand_indx == 5);
        $rand64 = get_pos_norm(0) if($rand_indx == 6);
        $rand64 = get_neg_norm(0) if($rand_indx == 7);
      }
    }

    if($self->{inst}->{assembly} eq "fcmps")
    {
      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_signal_NaN(1) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(1) if($rand_indx == 1);
        $rand64 = get_pos_norm(1) if($rand_indx == 2);
        $rand64 = get_neg_norm(1) if($rand_indx == 3);
      }
    }

    if($self->{inst}->{assembly} eq "fcmpd")
    {
      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_signal_NaN(0) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(0) if($rand_indx == 1);
        $rand64 = get_pos_norm(0) if($rand_indx == 2);
        $rand64 = get_neg_norm(0) if($rand_indx == 3);
      }
    }


    ### fp -> Int coversion
    if($self->{inst}->{assembly} eq "fcmpes")
    {
      if($self->{opt}->{nv} == 1)
      {  
        $rand_indx = int rand(8);
        $rand64 = get_pos_signal_NaN(1) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(1) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(1) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(1) if($rand_indx == 3);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 4);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 5);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 6);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 7);
      }
    }

    if($self->{inst}->{assembly} eq "fcmped")
    {
      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(8);
        $rand64 = get_pos_signal_NaN(0) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(0) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(0) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(0) if($rand_indx == 3);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 4);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 5);
        $rand64 = get_pos_norm_low(0) if($rand_indx == 6);
        $rand64 = get_neg_norm_low(0) if($rand_indx == 7);
      }
    }

    if($self->{inst}->{assembly} eq "fstox")
    {
      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(10);
        $rand64 = get_pos_signal_NaN(1) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(1) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(1) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(1) if($rand_indx == 3);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 4);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 5);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 6);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 7);
        $rand64 = get_pos_infinity(1) if($rand_indx == 8);
        $rand64 = get_neg_infinity(1) if($rand_indx == 9);
      } 
      if($self->{opt}->{nx} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 1);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 3);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 4);
      }
    }

    if($self->{inst}->{assembly} eq "fstoi")
    {
      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(10);
        $rand64 = get_pos_signal_NaN(1) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(1) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(1) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(1) if($rand_indx == 3);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 4);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 5);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 6);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 7);
        $rand64 = get_pos_infinity(1) if($rand_indx == 8);
        $rand64 = get_neg_infinity(1) if($rand_indx == 9);
      }
      if($self->{opt}->{nx} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 1);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 3);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 4);
      }
    }

    if($self->{inst}->{assembly} eq "fdtox")
    {
      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(10);
        $rand64 = get_pos_signal_NaN(0) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(0) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(0) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(0) if($rand_indx == 3);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 4);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 5);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 6);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 7);
        $rand64 = get_pos_infinity(0) if($rand_indx == 8);
        $rand64 = get_neg_infinity(0) if($rand_indx == 9);
      }
      if($self->{opt}->{nx} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 1);
        $rand64 = get_pos_norm_low(0) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
      }
    }

    if($self->{inst}->{assembly} eq "fdtoi")
    {
      if($self->{opt}->{nv} == 1)
      { 
        $rand_indx = int rand(10); 
        $rand64 = get_pos_signal_NaN(0) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(0) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(0) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(0) if($rand_indx == 3);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 4);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 5);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 6);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 7);
        $rand64 = get_pos_infinity(0) if($rand_indx == 8);
        $rand64 = get_neg_infinity(0) if($rand_indx == 9);
      }
      if($self->{opt}->{nx} == 1)
      {
        $rand_indx = int rand(4);  
        $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 1);
        $rand64 = get_pos_norm_low(0) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
      }
    }

    if($self->{inst}->{assembly} eq "fstod")
    {
      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(2); 
        $rand64 = get_pos_signal_NaN(0) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(0) if($rand_indx == 1);
      }
    }

    if($self->{inst}->{assembly} eq "fdtos")
    {
      if($self->{opt}->{of} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 1);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
      }
      if($self->{opt}->{uf} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 1);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
      }
      if($self->{opt}->{nx} == 1)
      {
        $rand_indx = int rand(4);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 1);
        $rand64 = get_pos_norm_low(1) if($rand_indx == 2);
        $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
      }
      if($self->{opt}->{nv} == 1)
      {
        $rand_indx = int rand(2);
        $rand64 = get_pos_signal_NaN(1) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(1) if($rand_indx == 1);
      }
    }


  if($self->{inst}->{assembly} eq "fxtos")
  {
   if($self->{opt}->{nx} == 1)
   {
     $rand_indx = int rand(4);
     $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
     $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
     $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
     $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
   }
  } 

  if($self->{inst}->{assembly} eq "fxtod")
  { 
   if($self->{opt}->{nx} == 1)
   {
     $rand_indx = int rand(4);
     $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
     $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
     $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
     $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
   }
  } 

  if($self->{inst}->{assembly} eq "fitos")
  { 
   if($self->{opt}->{nx} == 1)
   {
     $rand_indx = int rand(4); 
     $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
     $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
     $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
     $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
   }
  } 

  if($self->{inst}->{assembly} eq "fmuls")
  {
    if($self->{opt}->{of} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
    }
    if($self->{opt}->{uf} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
    }
    if($self->{opt}->{nv} == 6)
    {
        $rand_indx = int rand(10);
        $rand64 = get_pos_signal_NaN(1) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(1) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(1) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(1) if($rand_indx == 3);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 4);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 5);
        $rand64 = get_pos_norm_high(1) if($rand_indx == 6);
        $rand64 = get_neg_norm_high(1) if($rand_indx == 7);
        $rand64 = get_pos_infinity(1) if($rand_indx == 8);
        $rand64 = get_neg_infinity(1) if($rand_indx == 9);
    }
    if($self->{opt}->{nx} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
    }
  }

  if($self->{inst}->{assembly} eq "fmuld")
  {
    if($self->{opt}->{of} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
    }
    if($self->{opt}->{uf} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
    }
    if($self->{opt}->{nv} == 1)
    {
        $rand_indx = int rand(10);
        $rand64 = get_pos_signal_NaN(0) if($rand_indx == 0);
        $rand64 = get_neg_signal_NaN(0) if($rand_indx == 1);
        $rand64 = get_pos_quiet_NaN(0) if($rand_indx == 2);
        $rand64 = get_neg_quiet_NaN(0) if($rand_indx == 3);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 4);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 5);
        $rand64 = get_pos_norm_high(0) if($rand_indx == 6);
        $rand64 = get_neg_norm_high(0) if($rand_indx == 7);
        $rand64 = get_pos_infinity(0) if($rand_indx == 8);
        $rand64 = get_neg_infinity(0) if($rand_indx == 9);
    }
    if($self->{opt}->{nx} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
    }
  }

  if($self->{inst}->{assembly} eq "fsmuld")
  {
    my $count;
    if($self->{opt}->{of} == 1)
    {
      $count = 1 if($argnum == 1);
      $count = 0 if($argnum == 2);
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high($count) if($rand_indx == 0);
      $rand64 = get_pos_norm_low($count) if($rand_indx == 1);
      $rand64 = get_neg_norm_high($count) if($rand_indx == 2);
      $rand64 = get_neg_norm_low($count) if($rand_indx == 3);
    }
    if($self->{opt}->{uf} == 1)
    {
      $count = 1 if($argnum == 1);
      $count = 0 if($argnum == 2);
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high($count) if($rand_indx == 0);
      $rand64 = get_pos_norm_low($count) if($rand_indx == 1);
      $rand64 = get_neg_norm_high($count) if($rand_indx == 2);
      $rand64 = get_neg_norm_low($count) if($rand_indx == 3);
    }
    if($self->{opt}->{nv} == 1)
    {
      $count = 1 if($argnum == 1);
      $count = 0 if($argnum == 2);
      $rand_indx = int rand(10);
      $rand64 = get_pos_signal_NaN($count) if($rand_indx == 0);
      $rand64 = get_neg_signal_NaN($count) if($rand_indx == 1);
      $rand64 = get_pos_quiet_NaN($count) if($rand_indx == 2);
      $rand64 = get_neg_quiet_NaN($count) if($rand_indx == 3);
      $rand64 = get_pos_norm_high($count) if($rand_indx == 4);
      $rand64 = get_neg_norm_high($count) if($rand_indx == 5);
      $rand64 = get_pos_norm_high($count) if($rand_indx == 6);
      $rand64 = get_neg_norm_high($count) if($rand_indx == 7);
      $rand64 = get_pos_infinity($count) if($rand_indx == 8);
      $rand64 = get_neg_infinity($count) if($rand_indx == 9);
    }
    if($self->{opt}->{nx} == 1)
    {
      $count = 1 if($argnum == 1);
      $count = 0 if($argnum == 2);
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high($count) if($rand_indx == 0);
      $rand64 = get_pos_norm_low($count) if($rand_indx == 1);
      $rand64 = get_neg_norm_high($count) if($rand_indx == 2);
      $rand64 = get_neg_norm_low($count) if($rand_indx == 3);
    }
  }

  if($self->{inst}->{assembly} eq "fdivs")
  {
    if($self->{opt}->{of} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
    }
    if($self->{opt}->{uf} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
    }
    if($self->{opt}->{nv} == 1)
    {
      $rand_indx = int rand(10);
      $rand64 = get_pos_signal_NaN(1) if($rand_indx == 0);
      $rand64 = get_neg_signal_NaN(1) if($rand_indx == 1);
      $rand64 = get_pos_quiet_NaN(1) if($rand_indx == 2);
      $rand64 = get_neg_quiet_NaN(1) if($rand_indx == 3);
      $rand64 = get_pos_norm_high(1) if($rand_indx == 4);
      $rand64 = get_neg_norm_high(1) if($rand_indx == 5);
      $rand64 = get_pos_norm_high(1) if($rand_indx == 6);
      $rand64 = get_neg_norm_high(1) if($rand_indx == 7);
      $rand64 = get_pos_infinity(1) if($rand_indx == 8);
      $rand64 = get_neg_infinity(1) if($rand_indx == 9);
    }
    if($self->{opt}->{nx} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(1) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(1) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(1) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(1) if($rand_indx == 3);
    }
    if($self->{opt}->{dz} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_zero(1) if($rand_indx == 0);
      $rand64 = get_neg_zero(1) if($rand_indx == 1);
      $rand64 = get_pos_norm(1) if($rand_indx == 2);
      $rand64 = get_neg_norm(1) if($rand_indx == 3);
    }
  }

  if($self->{inst}->{assembly} eq "fdivd")
  {
    if($self->{opt}->{of} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
    }
    if($self->{opt}->{uf} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
    }
    if($self->{opt}->{nv} == 1)
    {
      $rand_indx = int rand(10);
      $rand64 = get_pos_signal_NaN(0) if($rand_indx == 0);
      $rand64 = get_neg_signal_NaN(0) if($rand_indx == 1);
      $rand64 = get_pos_quiet_NaN(0) if($rand_indx == 2);
      $rand64 = get_neg_quiet_NaN(0) if($rand_indx == 3);
      $rand64 = get_pos_norm_high(0) if($rand_indx == 4);
      $rand64 = get_neg_norm_high(0) if($rand_indx == 5);
      $rand64 = get_pos_norm_high(0) if($rand_indx == 6);
      $rand64 = get_neg_norm_high(0) if($rand_indx == 7);
      $rand64 = get_pos_infinity(0) if($rand_indx == 8);
      $rand64 = get_neg_infinity(0) if($rand_indx == 9);
    }
    if($self->{opt}->{nx} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_norm_high(0) if($rand_indx == 0);
      $rand64 = get_pos_norm_low(0) if($rand_indx == 1);
      $rand64 = get_neg_norm_high(0) if($rand_indx == 2);
      $rand64 = get_neg_norm_low(0) if($rand_indx == 3);
    }
    if($self->{opt}->{dz} == 1)
    {
      $rand_indx = int rand(4);
      $rand64 = get_pos_zero(0) if($rand_indx == 0);
      $rand64 = get_neg_zero(0) if($rand_indx == 1);
      $rand64 = get_pos_norm(0) if($rand_indx == 2);
      $rand64 = get_neg_norm(0) if($rand_indx == 3);
    }
  }

  return $rand64; 
}

#####################################################################
sub get_pos_norm
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;
  my $diff;

  if($single)
  {
    $low =  0x00800000; 
    $high = 0x7F7FFFFF;
    $value = $low + int rand($high-$low);
    $value = sprintf "0x%08x%08x", $value, $value; 
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $low    =  "0x0010000000000000"; 
    $high   =  "0x7FEFFFFFFFFFFFFF";
    $low    =  Math::BigInt->new ($low);
    $high   =  Math::BigInt->new ($high);
    $value  =  Math::BigInt->new ($high);
    $value  ->  bsub($low);
    $value  -> bmul(int rand(10));
    $value  -> bdiv(10);
    $value  -> badd($low);
  } 
  printf "        ! pos_norm \n";
  return $value;
}

sub get_pos_norm_high
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;
  my $diff;

  if($single) 
  {
    $high = 0x7F7FFFFF;
    $value =  $high - int rand(0x100); 
    $value = sprintf "0x%08x%08x", $value, $value; 
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $high = "0x7FEFFFFFFFFFFFFF";
    $diff  = 0x100;
    $diff  = int rand($diff);
    $high  = Math::BigInt->new ($high);
    $diff  = Math::BigInt->new ($diff);
    $high -> bsub($diff);
    $value = Math::BigInt->new ($high); 
  }
  printf "        ! pos_norm_high \n";
  return $value;
}

sub get_pos_norm_low
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;
  my $diff;

  if($single) 
  {
    $low = 0x00800000;
    $value =  $low + int rand(0x100); 
    $value = sprintf "0x%08x%08x", $value, $value; 
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $low = "0x0010000000000000";
    $diff  = 0x100;
    $diff  = int rand($diff);
    $low  = Math::BigInt->new ($low);
    $diff  = Math::BigInt->new ($diff);
    $low -> badd($diff);
    $value = Math::BigInt->new ($low); 
  }
  printf "        ! pos_norm_low \n";
  return $value;
}



sub get_neg_norm
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;

  if($single)
  {
    $low = 0x80800000;
    $high = 0xFF7FFFFF;
    $value = $low + int rand($high-$low);
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $low = "0x8010000000000000";
    $high = "0xFFEFFFFFFFFFFFFF";
    $low  = Math::BigInt->new ($low);
    $high  = Math::BigInt->new ($high);
    $value  = Math::BigInt->new ($high);
    $value  -> bsub($low);
    $value -> bmul(int rand(10));
    $value -> bdiv(10);
    $value -> badd($low);
  }
  printf "        ! neg_norm \n";
  return $value;
}

sub get_neg_norm_high
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;
  my $diff;

  if($single)
  {
    $high = 0xFF7FFFFF;
    $value =  $high - int rand(0x100);
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $high = "0xFFEFFFFFFFFFFFFF";
    $diff  = 0x100;
    $diff  = int rand($diff);
    $high  = Math::BigInt->new ($high);
    $diff  = Math::BigInt->new ($diff);
    $high -> bsub($diff);
    $value = Math::BigInt->new ($high);
  }
  printf "        ! neg_norm_high \n";
  return $value;
}

sub get_neg_norm_low
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;
  my $diff;

  if($single)
  {
    $low = 0x00800000;
    $value =  $low + int rand(0x100);
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $low = "0x8010000000000000";
    $diff  = 0x100;
    $diff  = int rand($diff);
    $low  = Math::BigInt->new ($low);
    $diff  = Math::BigInt->new ($diff);
    $low -> badd($diff);
    $value = Math::BigInt->new ($low);
  }
  printf "        ! neg_norm_low \n";
  return $value;
}

sub get_pos_quiet_NaN
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;

  if($single)
  {
    $low = 0x7FC00000;
    $high = 0x7FFFFFFF;
    $value = $low + int rand($high-$low);
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $low =  "0x7FF8000000000000";
    $high = "0x7FFFFFFFFFFFFFFF";
    $low  = Math::BigInt->new ($low);
    $high  = Math::BigInt->new ($high);
    $value = Math::BigInt->new ($high);
    $value -> bsub($low);
    $value -> bmul(int rand(10));
    $value -> bdiv(10);
    $value -> badd($low);
  }
  printf "        ! pos_quiet_NaN \n";
  return $value;
}

sub get_neg_quiet_NaN
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;

  if($single)
  {
    $low  = 0xFFC00001;
    $high = 0xFFFFFFFF;
    $value = $low + int rand($high-$low);
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $low = "0xFFF8000000000001";
    $high = "0xFFFFFFFFFFFFFFFF";
    $low  = Math::BigInt->new ($low);
    $high  = Math::BigInt->new ($high);
    $value  = Math::BigInt->new ($high);
    $value  -> bsub($low);
    $value -> bmul(int rand(10));
    $value -> bdiv(10);
    $value -> badd($low);
  }
  printf "        ! neg_quiet_NaN \n";
  return $value;
}

sub get_pos_signal_NaN
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;

  if($single)
  {
    $low  = 0x7F800001;
    $high = 0x7FBFFFFF;
    $value = $low + int rand($high-$low);
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $low  = "0x7FF0000000000001";
    $high = "0x7FF7FFFFFFFFFFFF";
    $low  = Math::BigInt->new ($low);
    $high  = Math::BigInt->new ($high);
    $value  = Math::BigInt->new ($high);
    $value  -> bsub($low);
    $value -> bmul(int rand(10));
    $value -> bdiv(10);
    $value -> badd($low);
  }
  printf "        ! pos_signal_NaN \n";
  return $value;
}

sub get_neg_signal_NaN
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;

  if($single)
  {
    $low  = 0xFF800001;
    $high = 0xFFBFFFFF;
    $value = $low + int rand($high-$low);
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $low  = "0xFFF0000000000001";
    $high = "0xFFF7FFFFFFFFFFFF";
    $low  = Math::BigInt->new ($low);
    $high  = Math::BigInt->new ($high);
    $value  = Math::BigInt->new ($high);
    $value  -> bsub($low);
    $value -> bmul(int rand(10));
    $value -> bdiv(10);
    $value -> badd($low);
  }
  printf "        ! pos_signal_NaN \n";
  return $value;
}

sub get_pos_infinity
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;

  if($single)
  {
    $value = 0x7F800000;
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $value = "0x7FF0000000000000";
    $value  = Math::BigInt->new ($value);
  }
  printf "        ! pos_infinity \n";
  return $value;
}

sub get_neg_infinity
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;

  if($single)
  {
    $value = 0xFF800000;
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $value = "0xFFF0000000000000";
    $value  = Math::BigInt->new ($value);
  }
  printf "        ! neg_infinity \n";
  return $value;
}

sub get_pos_zero
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;

  if($single)
  {
    $value = 0x00000000;
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $value = "0x0000000000000000";
    $value  = Math::BigInt->new ($value);
  }
  printf "        ! pos_zero \n";
  return $value;
}

sub get_neg_zero
{
  my $self = shift;
  my $single = shift;
  my $value;
  my $low;
  my $high;

  if($single)
  {
    $value = 0x80000000;
    $value = sprintf "0x%08x%08x", $value, $value;
    $value  =  Math::BigInt->new ($value);
  }
  else
  {
    $value = "0x8000000000000000";
    $value  = Math::BigInt->new ($value);
  }
  printf "        ! neg_zero \n";
  return $value;
}

1;
