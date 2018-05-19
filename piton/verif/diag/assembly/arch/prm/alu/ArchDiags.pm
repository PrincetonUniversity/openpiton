# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: ArchDiags.pm
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

package ArchDiags;
use Getopt::Long;
#use Math::BigInt;
use BigIntSupport;
use strict;


################################################################################
# constructor
################################################################################

sub new
{
  my $class = shift;
  my $self  = {};
  print ("Creating a ArchDiags object\n") if ($main::debug);
  bless ($self, $class);
  

  $self -> {ALU} -> {ADD}       =  {};
  $self -> {ALU} -> {SUB}       =  {};
  $self -> {ALU} -> {DIV}       =  {};
  $self -> {ALU} -> {LOGICAL}   =  {};
  $self -> {ALU} -> {MULDIV}    =  {};
  $self -> {ALU} -> {MUL32}     =  {};
  $self -> {ALU} -> {MULSTEP}   =  {};
  $self -> {ALU} -> {SHIFT}     =  {};
  $self -> {ALU} -> {TADD}      =  {};
  $self -> {ALU} -> {TSUB}      =  {};

  $self ->  setupInstInfo();
  $self ->  setupRegImm13();
  $self ->  setupFormatInfo();



  return $self;
}

########################################################### 
# setup instruction info  
########################################################### 
sub setupInstInfo
{
  my $self = shift;

  $self -> {ALU} -> {ADD} -> {format} =  "3";
  $self -> {ALU} -> {ADD} -> {opcode} -> {add}    -> {op3} = "0b000000", 
  $self -> {ALU} -> {ADD} -> {opcode} -> {addcc}  -> {op3} = "0b010000";
  $self -> {ALU} -> {ADD} -> {opcode} -> {addc}   -> {op3} = "0b001000";
  $self -> {ALU} -> {ADD} -> {opcode} -> {addccc} -> {op3} = "0b011000";

  $self -> {ALU} -> {SUB} -> {format} = "3";
  $self -> {ALU} -> {SUB} -> {opcode} -> {sub}    -> {op3} = "0b000100", 
  $self -> {ALU} -> {SUB} -> {opcode} -> {subcc}  -> {op3} = "0b010100";
  $self -> {ALU} -> {SUB} -> {opcode} -> {subc}   -> {op3} = "0b001100";
  $self -> {ALU} -> {SUB} -> {opcode} -> {subccc} -> {op3} = "0b011100";

  $self -> {ALU} -> {DIV} -> {format} = "3";
  $self -> {ALU} -> {DIV} -> {opcode} -> {udiv}   -> {op3} = "0b001110",
  $self -> {ALU} -> {DIV} -> {opcode} -> {sdiv}   -> {op3} = "0b001111";
  $self -> {ALU} -> {DIV} -> {opcode} -> {udivcc} -> {op3} = "0b011110";
  $self -> {ALU} -> {DIV} -> {opcode} -> {udivcc} -> {op3} = "0b011111";

  $self -> {ALU} -> {LOGICAL} -> {format} = "3";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {and}    -> {op3} = "0b000001";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {andcc}  -> {op3} = "0b010001";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {andn}   -> {op3} = "0b000101";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {andncc} -> {op3} = "0b010101";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {or}     -> {op3} = "0b000010",
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {orcc}   -> {op3} = "0b010010";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {orn}    -> {op3} = "0b000110";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {orncc}  -> {op3} = "0b010110";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {xor}    -> {op3} = "0b000011",
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {xorcc}  -> {op3} = "0b010011";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {xnor}   -> {op3} = "0b000111";
  $self -> {ALU} -> {LOGICAL} -> {opcode} -> {xnorcc} -> {op3} = "0b010111";

  $self -> {ALU} -> {MULDIV} -> {format} = "3";
  $self -> {ALU} -> {MULDIV} -> {opcode} -> {mulx}  -> {op3} = "0b001001",
  $self -> {ALU} -> {MULDIV} -> {opcode} -> {sdivx} -> {op3} = "0b101101";
  $self -> {ALU} -> {MULDIV} -> {opcode} -> {udivx} -> {op3} = "0b001101";

  $self -> {ALU} -> {MUL32} -> {format} = "3";
  $self -> {ALU} -> {MUL32} -> {opcode} -> {umul}   -> {op3} = "0b001010";
  $self -> {ALU} -> {MUL32} -> {opcode} -> {smul}   -> {op3} = "0b001011";
  $self -> {ALU} -> {MUL32} -> {opcode} -> {umulcc} -> {op3} = "0b011010";
  $self -> {ALU} -> {MUL32} -> {opcode} -> {smulcc} -> {op3} = "0b011011";

  $self -> {ALU} -> {MULSTEP}  ->  {format}  =  "3";
  $self -> {ALU} -> {MULSTEP}  ->  {opcode}  ->  {mulscc}   ->  {op3}  =  "0b100100";

  $self -> {ALU} -> {SHIFT} -> {format} = "3";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {sll}  -> {op3} = "0b100100";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {srl}  -> {op3} = "0b100110";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {sra}  -> {op3} = "0b100110";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {sllx} -> {op3} = "0b100101";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {srlx} -> {op3} = "0b100110";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {srax} -> {op3} = "0b100111";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {sll}  -> {x}   = "0";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {srl}  -> {x}   = "0";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {sra}  -> {x}   = "0";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {sllx} -> {x}   = "1";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {srlx} -> {x}   = "1";
  $self -> {ALU} -> {SHIFT} -> {opcode} -> {srax} -> {x}   = "1";

  $self -> {ALU} -> {TADD} -> {format} = "3";
  $self -> {ALU} -> {TADD} -> {opcode} -> {taddcc}   -> {op3} = "0b100000";
  $self -> {ALU} -> {TADD} -> {opcode} -> {taddcctv} -> {op3} = "0b100010";

  $self -> {ALU} -> {TSUB} -> {format} = "3";
  $self -> {ALU} -> {TSUB} -> {opcode} -> {tsubcc}   -> {op3} = "0b100001";
  $self -> {ALU} -> {TSUB} -> {opcode} -> {tsubcctv} -> {op3} = "0b100011";

}

########################################################### 
# setup rs1,rs2, rd and imm13 info
########################################################### 
sub setupRegImm13
{
  my $self = shift;

  $self -> {RS1} = [0..31];
  $self -> {RS2} = [0..31];
  $self -> {RD}  = [0..31];
  $self -> {RSVD}= [0x0..0xff];
  $self -> {RS1Walk1} = [ 0, 1, 2, 4, 8, 16 ];
  $self -> {RS2Walk1} = [ 0, 1, 2, 4, 8, 16 ];
  $self -> {RDWalk1}  = [ 0, 1, 2, 4, 8, 16 ];
  $self -> {RSVDWalk1}  = [ 0, 1, 2, 4, 8, 16, 32, 64, 128, 255 ];
  $self -> {IMM13}    =  [0x0..0x1fff];
  $self -> {IMM13Walk1} =  [0x0, 0x1, 0x2, 0x4, 0x8, 0x10, 0x20,0x40,0x80,
                            0x100, 0x200, 0x400, 0x800, 0x1000, 0x1fff];
  $self -> {I} = [0,1];

}

################################################################
sub setupFormatInfo
{
  my $self = shift;

   $self  -> {inst} -> {rs1}   -> {value} = "";
   $self  -> {inst} -> {rs2}   -> {value} = "";
   $self  -> {inst} -> {i}     -> {value} = "";
   $self  -> {inst} -> {rd}    -> {value} = "";
   $self  -> {inst} -> {op3}   -> {value} = "";
   $self  -> {inst} -> {const} -> {value} =  2;
   $self  -> {inst} -> {imm13} -> {value} = "";
   $self  -> {inst} -> {rsvd}  -> {value} = 0;
   $self  -> {inst} -> {x}     -> {value} = 0;

   $self  -> {inst} -> {rs1}   -> {shift} = 14;
   $self  -> {inst} -> {rs2}   -> {shift} = 0;
   $self  -> {inst} -> {i}     -> {shift} = 13;
   $self  -> {inst} -> {rd}    -> {shift} = 25;
   $self  -> {inst} -> {op3}   -> {shift} = 19;
   $self  -> {inst} -> {const} -> {shift} = 30;
   $self  -> {inst} -> {imm13} -> {shift} = 0;
   $self  -> {inst} -> {rsvd}  -> {shift} = 5;
   $self  -> {inst} -> {x}     -> {shift} = 12;

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

 if($self -> {inst} -> {i}   -> {value}  == 1)
 {
   $self -> {inst} -> {opcode} =
             ($self  -> {inst} -> {const} -> {value} << $self  -> {inst} -> {const} -> {shift}) +
             ($self  -> {inst} -> {rd}    -> {value} << $self  -> {inst} -> {rd}    -> {shift}) +
             ($self  -> {inst} -> {op3}   -> {value} << $self  -> {inst} -> {op3}   -> {shift}) +
             ($self  -> {inst} -> {rs1}   -> {value} << $self  -> {inst} -> {rs1}   -> {shift}) +
             ($self  -> {inst} -> {i}     -> {value} << $self  -> {inst} -> {i}     -> {shift}) +
             ($self  -> {inst} -> {x}     -> {value} << $self  -> {inst} -> {x}     -> {shift}) +
             ($self  -> {inst} -> {rsvd}  -> {value} << $self  -> {inst} -> {rsvd}  -> {shift}) +
             ($self  -> {inst} -> {imm13} -> {value} << $self  -> {inst} -> {imm13} -> {shift});
 }
 elsif($self  -> {inst} -> {i}   -> {value} == 0)
 {
   $self -> {inst} -> {opcode} = 
             ($self  -> {inst} -> {const} -> {value} << $self  -> {inst} -> {const} -> {shift}) +
             ($self  -> {inst} -> {rd}    -> {value} << $self  -> {inst} -> {rd}    -> {shift}) +
             ($self  -> {inst} -> {op3}   -> {value} << $self  -> {inst} -> {op3}   -> {shift}) +
             ($self  -> {inst} -> {rs1}   -> {value} << $self  -> {inst} -> {rs1}   -> {shift}) +
             ($self  -> {inst} -> {i}     -> {value} << $self  -> {inst} -> {i}     -> {shift}) +
             ($self  -> {inst} -> {x}     -> {value} << $self  -> {inst} -> {x}     -> {shift}) +
             ($self  -> {inst} -> {rs2}   -> {value} << $self  -> {inst} -> {rs2}   -> {shift}) + 
             ($self  -> {inst} -> {rsvd}  -> {value} << $self  -> {inst} -> {rsvd}  -> {shift});
  }
  else
  {
   die ("Incorrect value of i in Opcode\n",);
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
    @array = keys (%{$self -> {ALU}});
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
  @array = keys (%{$self -> {ALU} -> {$instSel} -> {opcode}});
  $index = int rand @array;
   
  $self -> {inst} -> {op3} -> {value} = $self -> {ALU} -> {$instSel} -> {opcode} -> {$array[$index]} -> {op3};
  printf ("! Opcode selected      : %s \n", $self->{inst}-> {op3}-> {value} ) if ($main::debug); 
  $self -> {inst} -> {op3} -> {value} =  oct ($self -> {inst} -> {op3} -> {value});
  $self -> {inst} -> {assembly} =  $array[$index];
  printf ("! Assemby selected     : %s \n", $self->{inst}-> {assembly}) if ($main::debug); 

  # randomize rs1
  @array = ();
  @array = @{$self -> {RS1}};
  $index = int rand @array;
  $self->{inst} -> {rs1} -> {value} = $array[$index];
  printf ("! rs1 selected         : %s \n", $self->{inst} -> {rs1}  -> {value}) if ($main::debug); 

  # randomize i
  @array = ();
  @array = @{$self -> {I}};
  $index = int rand @array;
  $self->{inst} -> {i}   -> {value}= $array[$index];
  printf ("! i selected           : %s \n", $self->{inst} -> {i}  -> {value}) if ($main::debug);


  if($self -> {inst} -> {i} -> {value} == 1)
  {
    #randomize imm13
    $index = int rand @{$self -> {IMM13}};
    $self-> {inst} -> {imm13}   -> {value}= $self -> {IMM13} -> [$index];
    printf ("! imm13 selected       : %s \n", $self -> {inst} -> {imm13}  -> {value}) if ($main::debug);
  }
  else
  {
    #randomize rs2 
    @array = ();
    @array = @{$self -> {RS2}};
    $index = int rand @array;
    $self->{inst} -> {rs2}  -> {value} = $array[$index];
    printf ("! rs2 selected         : %s \n", $self->{inst} -> {rs2} -> {value} ) if ($main::debug);
  }
 
  #randomize rd
  @array = ();
  @array = @{$self -> {RD}};
  $index = int rand @array;
  $self->{inst} -> {rd}   -> {value}=  $array[$index];
  printf ("! rd selected          : %s \n", $self->{inst} -> {rd}  -> {value}) if ($main::debug);

}  


############################################################
sub genRandomInst
{
  my $self = shift;
  my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $imm13, $tempReg, $y_reg,$ccr_reg);


  while($self -> {opt} -> {random_inst} > 0 )
  {
    $self -> randomize();
    $self -> genOpcode();

    if(($self -> {inst} -> {group} eq "ADD") || ($self -> {inst} -> {group} eq "SUB"))
    {
      $ccr_reg = int rand(0xff);
      printf ("        wr       %%g0,       0x%-02x,   %%ccr\n",$ccr_reg);
    }
 
    if(($self -> {inst} -> {group} eq "DIV") || ($self -> {inst} -> {group} eq "MULSTEP"))
    {
      $tempReg = $self -> selTempReg();
      $y_reg = int rand(0xffffffff); 
      printf ("        set       0x%08x,     %%r%-2d  \n", $y_reg, $tempReg);
      printf ("        wr       %%g0,   %%r%-2d,   %%y\n", $tempReg);
    }

    if($self -> {inst} -> {i} -> {value})
    {
      $tempReg = $self -> selTempReg();
      $rs1_odd  = int rand(0xffffffff);
      $rs1_even = int rand(0xffffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
    }  
    else
    {
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0xffffffff);
      $rs1_odd  = int rand(0xffffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      if($self -> {inst} -> {rs1} -> {value} != $self -> {inst} -> {rs2} -> {value})
      { 
        $tempReg = $self -> selTempReg();
        $rs2_even = int rand(0xffffffff);
        $rs2_odd  = int rand(0xffffffff);
        printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      }
    }
    $self-> printInst();
   $self -> {opt} -> {random_inst} = ($self -> {opt} -> {random_inst}) -1 ;
  }
}
  
  
##############################################################
# print instruction
##############################################################

sub printInst
{
   my $self = shift;
   my $inst;

   if($self-> {opt} -> {rsvd})
   {
     $inst  =  sprintf "        .word  0x%08x", $self-> {inst} -> {opcode};
     $inst .=  sprintf "        !  %-9s",  $self-> {inst} -> {assembly};
     $inst .=  sprintf "%%r%-2s,    ",   $self-> {inst} -> {rs1}  -> {value};
     if ($self-> {inst} -> {i}  -> {value})
     {
       $inst .=  sprintf "0x%04x,  ",   $self-> {inst} -> {imm13}  -> {value} & 0x1fff;
     }
     else
     {
       $inst .=  sprintf "%%r%-2s,    ",   $self-> {inst} -> {rs2}  -> {value};
     }
     $inst .=  sprintf "%%r%-6s",   $self-> {inst} -> {rd}  -> {value};
     $inst .=  sprintf "   Reserved bits : 0x%02x", $self-> {inst} -> {rsvd} -> {value} ;
     $inst .=  sprintf "\n\n";

     print $inst;

   }
   else
   {
     $inst  =  sprintf "        %-9s",  $self-> {inst} -> {assembly};
     $inst .=  sprintf "%%r%-2s,    ",   $self-> {inst} -> {rs1}  -> {value};
 
     if ($self-> {inst} -> {i}  -> {value})
     {
      if($self ->  {inst} -> {group} eq "SHIFT")
      {
        if($self->{ALU}->{SHIFT}->{opcode}->{$self -> {inst} ->{assembly}}->{x})
        {
          $self-> {inst} -> {imm13}  -> {value} = $self-> {inst} -> {imm13}  -> {value}  & 0x003f
        }
        else
        {
          $self-> {inst} -> {imm13}  -> {value} = $self-> {inst} -> {imm13}  -> {value}  & 0x001f
        }
      }
       $inst .=  sprintf "0x%04x,  ",   $self-> {inst} -> {imm13}  -> {value} & 0x1fff;
     }
     else
     {
       $inst .=  sprintf "%%r%-2s,    ",   $self-> {inst} -> {rs2}  -> {value};
     }
 
     $inst .=  sprintf "%%r%-6s",   $self-> {inst} -> {rd}  -> {value};

     $inst .=  sprintf "         !  Opcode :  0x%08x", $self-> {inst} -> {opcode};

     $inst .=  sprintf "\n\n";

     print $inst;
   }
}


#####################################################################
sub genAllWalk1Inst
{
 my $self = shift;
 my $instGrp;
 my $rs1;
 my $rs2;
 my $rd;
 my $imm13;
 my $instGrp;
 my $inst;
 my $rsvd;
 my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $imm13, $tempReg, $y_reg, $ccr_reg);
 

   $instGrp = $self-> {opt} -> {inst};

   foreach $inst (keys %{$self -> {ALU} -> {$instGrp} -> {opcode}})
   {
     foreach $rs1 (@{$self -> {RS1Walk1}})
     {
       foreach $rs2 (@{$self -> {RS2Walk1}})
       {
         foreach $rd (@{$self -> {RDWalk1}})
         {
           $self-> {inst} -> {assembly} = $inst;
           $self-> {inst} -> {op3}   -> {value} = oct ($self -> {ALU} -> {$instGrp} -> {opcode} -> {$inst} -> {op3});
           $self-> {inst} -> {i}     -> {value} = 0;
           $self-> {inst} -> {rs1}   -> {value} = $rs1;
           $self-> {inst} -> {rs2}   -> {value} = $rs2;
           $self-> {inst} -> {rd}    -> {value} = $rd;
           $self-> {inst} -> {rsvd}  -> {value} = 0;
           $self-> {inst} -> {x}     -> {value} = 0;
           $self-> {inst} -> {x}     -> {value} =  $self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x} if($instGrp eq "SHIFT");
           $self-> genOpcode();
           if($self-> {opt} -> {negative} || $self-> {opt} -> {zero} || $self-> {opt} -> {overflow} || $self-> {opt} -> {carry})
           {
             die ("Condition codes not affected \n") if ($instGrp eq "SHIFT");
             die ("Condition codes not affected \n") if ($instGrp eq "MULTDIV");
             if($rs1 != $rs2)
             {
               $self -> ccFlagTestAdd() if ($instGrp eq "ADD"); 
               $self -> ccFlagTestSub() if ($instGrp eq "SUB"); 
               $self -> ccFlagTestDiv() if ($instGrp eq "DIV"); 
               $self -> ccFlagTestLogic() if ($instGrp eq "LOGICAL"); 
               $self -> ccFlagTestMul32() if ($instGrp eq "MUL32"); 
               $self -> ccFlagTestMulStep() if ($instGrp eq "MULSTEP"); 
               $self -> ccFlagTestTadd() if ($instGrp eq "TADD"); 
               $self -> ccFlagTestTsub() if ($instGrp eq "TSUB"); 
             }
           }
           else
           { 
             if(($instGrp eq "ADD") || ($instGrp eq "SUB"))
             {
               $ccr_reg = int rand(0xff);
               printf ("        wr       %%g0,       0x%-02x,   %%ccr\n",$ccr_reg);
             }

             if(($instGrp eq "DIV") || ($instGrp eq "MULSTEP"))
             {
                $tempReg = $self -> selTempReg();
                $y_reg = int rand(0xffffffff);
                printf ("        set       0x%08x,     %%r%-2d  \n", $y_reg, $tempReg);
                printf ("        wr       %%g0,   %%r%-2d,   %%y\n", $tempReg);
             }
             $tempReg = $self -> selTempReg();
             $rs1_even = int rand(0xffffffff);
             $rs1_odd  = int rand(0xffffffff);
             printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

             if($self -> {inst} -> {rs1} -> {value} != $self -> {inst} -> {rs2} -> {value})
             {
               $tempReg = $self -> selTempReg();
               $rs2_even = int rand(0xffffffff);
               $rs2_odd  = int rand(0xffffffff);
               printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
             }
             $self-> printInst();
           }
         }
       }
     }

    if($instGrp eq  "SHIFT")
    {
      if($self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x})
      {
        $self -> {IMM13Walk1} =  [0x0, 0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x3f] ;
      }
      else
      {
        $self -> {IMM13Walk1} =  [0x0, 0x1, 0x2, 0x4, 0x8, 0x10, 0x1f] ;
      } 
    }
    
    foreach $rs1 (@{$self -> {RS1Walk1}})
    {
       foreach $imm13 (@{$self -> {IMM13Walk1}})
       {
         foreach $rd (@{$self -> {RDWalk1}})
         {
           $self-> {inst} -> {assembly} = $inst;
           $self-> {inst} -> {op3}   -> {value} = oct ($self -> {ALU} -> {$instGrp} -> {opcode} -> {$inst} -> {op3});
           $self-> {inst} -> {i}     -> {value} = 1;
           $self-> {inst} -> {rs1}   -> {value} = $rs1;
           $self-> {inst} -> {imm13} -> {value} = $imm13;
           $self-> {inst} -> {rd}    -> {value} = $rd;
           $self-> {inst} -> {rsvd}  -> {value} = 0;
           $self-> {inst} -> {x}     -> {value} = 0;
           $self-> {inst} -> {x}     -> {value} =  $self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x} if($instGrp eq "SHIFT");
           $self-> genOpcode();
           if($self-> {opt} -> {negative} || $self-> {opt} -> {zero} || $self-> {opt} -> {overflow} || $self-> {opt} -> {carry})
           {
              die ("Condition codes not affected \n") if ($instGrp eq "SHIFT");
              die ("Condition codes not affected \n") if ($instGrp eq "MULTDIV");
              $self -> ccFlagTestAdd() if ($instGrp eq "ADD");
              $self -> ccFlagTestSub() if ($instGrp eq "SUB");
              $self -> ccFlagTestDiv() if ($instGrp eq "DIV");
              $self -> ccFlagTestLogic() if ($instGrp eq "LOGICAL");
              $self -> ccFlagTestMul32() if ($instGrp eq "MUL32");
              $self -> ccFlagTestMulStep() if ($instGrp eq "MULSTEP");
              $self -> ccFlagTestTadd() if ($instGrp eq "TADD");
              $self -> ccFlagTestTsub() if ($instGrp eq "TSUB");
           }
           else
           {
             if(($instGrp eq "ADD") || ($instGrp eq "SUB"))
             {
               $ccr_reg = int rand(0xff);
               printf ("        wr       %%g0,       0x%-02x,   %%ccr\n",$ccr_reg);
             }

             if(($instGrp eq "DIV") || ($instGrp eq "MULSTEP"))
             {
               $tempReg = $self -> selTempReg();
               $y_reg = int rand(0xffffffff);
               printf ("        set       0x%08x,     %%r%-2d  \n", $y_reg, $tempReg);
               printf ("        wr       %%g0,   %%r%-2d,   %%y\n", $tempReg);
             }
             $tempReg = $self -> selTempReg();
             $rs1_even = int rand(0xffffffff);
             $rs1_odd  = int rand(0xffffffff);
             printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
             $self-> printInst();
           }
         }
       }
     }
   }
  $self ->  setupInstInfo();
  $self ->  setupRegImm13();
  $self ->  setupFormatInfo();
}


#####################################################################
#### check reserved bits in int
######################################################################
sub genAllWalk1InstWithRsvd
{
 my $self = shift;
 my $instGrp;
 my $rs1;
 my $rs2;
 my $rd;
 my $imm13;
 my $instGrp;
 my $inst;
 my $rsvd;
 my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $tempReg, $y_reg, $ccr_reg);

   $instGrp = $self-> {opt} -> {inst};

   if($instGrp eq  "SHIFT")
   {
     $self -> {RSVDWalk1}  = [ 0, 1, 2, 4, 8, 16, 32, 64, 127 ];
   }

   foreach $inst (keys %{$self -> {ALU} -> {$instGrp} -> {opcode}})
   {
     foreach $rs1 (@{$self -> {RS1Walk1}})
     {
       foreach $rs2 (@{$self -> {RS2Walk1}})
       {
         foreach $rd (@{$self -> {RDWalk1}})
         {
            foreach $rsvd (@{$self -> {RSVDWalk1}})
            {
              $self-> {inst} -> {assembly} = $inst;
              $self-> {inst} -> {op3}   -> {value} = oct ($self -> {ALU} -> {$instGrp} -> {opcode} -> {$inst} -> {op3});
              $self-> {inst} -> {i}        -> {value} = 0;
              $self-> {inst} -> {rs1}      -> {value} = $rs1;
              $self-> {inst} -> {rs2}      -> {value} = $rs2;
              $self-> {inst} -> {rd}       -> {value} = $rd;
              $self-> {inst} -> {rsvd}     -> {value} = $rsvd;
              $self-> {inst} -> {x}        -> {value} = 0;
              $self-> {inst} -> {x}        -> {value} =  $self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x} if($instGrp eq  "SHIFT");

              $self-> genOpcode();

              if(($instGrp eq "ADD") || ($instGrp eq "SUB"))
              {
                $ccr_reg = int rand(0xff);
                printf ("        wr       %%g0,       0x%-02x,   %%ccr\n",$ccr_reg);
              }
              if(($instGrp eq "DIV") || ($instGrp eq "MULSTEP"))
              {
                 $tempReg = $self -> selTempReg();
                 $y_reg = int rand(0xffffffff);
                 printf ("        set       0x%08x,     %%r%-2d  \n", $y_reg, $tempReg);
                 printf ("        wr       %%g0,   %%r%-2d,   %%y\n", $tempReg);
              }
              $tempReg = $self -> selTempReg();
              $rs1_even = int rand(0xffffffff);
              $rs1_odd  = int rand(0xffffffff);
              printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
              if($self -> {inst} -> {rs1} -> {value} != $self -> {inst} -> {rs2} -> {value})
              {
                $rs2_even = int rand(0xffffffff);
                $rs2_odd  = int rand(0xffffffff);
                printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
              }
              $self-> printInst();
            }
         }
       }
     }
   }

   if($instGrp eq  "SHIFT")
   {
     foreach $inst (keys %{$self -> {ALU} -> {$instGrp} -> {opcode}})
     {
       $self -> {RSVDWalk1}  = [ 0, 1, 2, 4, 8, 16, 32, 64, 127 ] if(!$self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x}) ;
       $self -> {RSVDWalk1}  = [ 0, 1, 2, 4, 8, 16, 32, 63 ] if($self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x}) ;
       $self -> {IMM13Walk1}  = [ 0, 1, 2, 4, 8, 16, 31] if(!$self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x}) ;
       $self -> {IMM13Walk1}  = [ 0, 1, 2, 4, 8, 16, 32, 63] if($self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x}) ;
       $self  -> {inst} -> {rsvd}  -> {shift} = 5 if(!$self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x});
       $self  -> {inst} -> {rsvd}  -> {shift} = 6 if($self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x});
       foreach $rs1 (@{$self -> {RS1Walk1}})
       {
         foreach $imm13 (@{$self -> {IMM13Walk1}})
         {
           foreach $rd (@{$self -> {RDWalk1}})
           {
              foreach $rsvd (@{$self -> {RSVDWalk1}})
              {
                $self-> {inst} -> {assembly} = $inst;
                $self-> {inst} -> {op3}   -> {value} = oct ($self -> {ALU} -> {$instGrp} -> {opcode} -> {$inst} -> {op3});
                $self-> {inst} -> {i}     -> {value} = 1;
                $self-> {inst} -> {rs1}   -> {value} = $rs1;
                $self-> {inst} -> {imm13} -> {value} = $imm13;
                $self-> {inst} -> {rd}    -> {value} = $rd;
                $self-> {inst} -> {rsvd}  -> {value} = $rsvd;
                $self-> {inst} -> {x}     -> {value} = 0;
                $self-> {inst} -> {x}     -> {value} =  $self -> {ALU} -> {SHIFT} -> {opcode} -> {$inst} -> {x} ;
  
                $self-> genOpcode();
  
                $tempReg = $self -> selTempReg();
                $rs1_even = int rand(0xffffffff);
                $rs1_odd  = int rand(0xffffffff);
                printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

                $self-> printInst();
              }
           }
         }
       }
     }
  }
  $self ->  setupInstInfo();
  $self ->  setupRegImm13();
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
               zero          => 0,     # 
               negative      => 0,     #
               overflow      => 0,     # 
               carry         => 0,     # 
               rand          => 0,     # 
               random_inst   => 4000,  # 
               rsvd          => 0,     # 
               seed          => -1,    #
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
         zero=i
         negative=i
         overflow=i
         carry=i
         rand=i 
         random_inst=i
         rsvd=i
         seed=i
        );

   GetOptions($self-> {opt}, @options);

    my @diag_run_args = split(/_/, $self-> {opt} -> {name});
    my $index = 0;
    printf("!Diag run options :\n");
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
  my ($rs1_odd,$rs1_even,$rs2_odd,$rs2_even, $count);

  for ($count=0; $count<8; $count++)
  {
    $rs1_odd  = int rand(0xffffffff);
    $rs1_even = int rand(0xffffffff);
    printf ("        setx     0x%08x%08x,   %%g1, %%g%-2d\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$count);
  }
 
  printf ("\n");

  while ($wincnt > 0)
  {
    for ($count = 16; $count < 32; $count++)
    {
      $rs2_odd  = int rand(0xffffffff);
      $rs2_even = int rand(0xffffffff);
      printf ("        setx     0x%08x%08x,   %%g1, %%r%-2d\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$count);
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

###########################################################
sub selTempReg
{
  my $self   = shift;
  my $temp;

  while(1)
  {
    $temp = int rand(31);
    if(($self -> {inst} -> {rs1} -> {value} ne $temp) &&
       ($self -> {inst} -> {rs2} -> {value} ne $temp) && 
       ($temp != 0))
       
   {
    last;
   } 
  }
  
  return $temp;
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

##################################################################################
# CC test add
##################################################################################
sub ccFlagTestAdd
{
my $self = shift;
my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $imm13, $tempReg);

  if($self -> {opt} -> {negative})
  {
   
    if($self -> {inst} -> {i} -> {value})
    {
      printf ("        !  rs1 + -imm13    |rs1| < |imm13|   lsw\n");
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0x0fffffff);
      $rs1_odd  = int rand(0x00000400);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13  =  (($rs1_odd + int rand(0x00ff)) ^ 0x1fff ) + 1;
      $self -> {inst} -> {imm13}  -> {value}= $imm13;
    }
    else 
    { 
      printf ("        !  rs1 + -rs1    |rs1| < |rs2|   lsw\n");
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0x0fffffff);
      $rs1_odd  = int rand(0x40000000);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $tempReg = $self -> selTempReg();
      $rs2_even = int rand(0x0fffffff);
      $rs2_odd  = (($rs1_odd + int rand(0x0fffffff)) ^ 0xffffffff) + 1;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();


    if( $self -> {inst} -> {i} -> {value})
    {
      printf ("        !  -rs1 + imm13    |rs1| < |imm13|   lsw\n");
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0x0fffffff);
      $rs1_odd  = ((int rand(0x000000ff) | 0x00000400) ^ 0xffffffff) + 1;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13  =  (($rs1_odd  ^ 0xffffffff) + 1) - int rand(0x00ff);
      $self -> {inst} -> {imm13}  -> {value} = $imm13;
    }
    else  
    {
      printf ("        !  -rs1 + rs1    |rs1| < |rs2|   lsw\n");
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0x0fffffff);
      $rs1_odd  = (int rand(0x0fffffff) | 0x40000000) ^ 0xffffffff + 1;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $tempReg = $self -> selTempReg();
      $rs2_even = int rand(0x0fffffff);
      $rs2_odd  = (($rs1_odd ^ 0xffffffff) + 1) - int rand(0x0fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    if( !($self -> {inst} -> {i} -> {value}))
    {
      printf ("        !  rs1 + -rs2    |rs1| < |rs2|   msw \n");
      $rs1_even = int rand(0x0fffffff) | 0x40000000;
      $rs1_odd  = int rand(0x00000000);
      $tempReg = $self -> selTempReg();
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $tempReg = $self -> selTempReg();
      $rs2_even  = (($rs1_even + int rand(0x0fffffff)) ^ 0xffffffff) + 1;
      $rs2_odd   = int rand(0x00000000);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();
    }

    if(!($self -> {inst} -> {i} -> {value}))
    {
      printf ("        !  -rs1 + rs2    |rs1| > |rs2|   msw \n");
      $tempReg = $self -> selTempReg();
      $rs1_even = ((int rand(0x0fffffff) + 0x40000000) ^ 0xffffffff)  + 1;;
      $rs1_odd  = 0x00000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $tempReg = $self -> selTempReg();
      $rs2_even  = (($rs1_even ^ 0xffffffff) + 1) - int rand(0x0fffffff);
      $rs2_odd = 0x00000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();
    }
  }

  
  if($self -> {opt} -> {zero})
  {

    if( $self -> {inst} -> {i} -> {value})
    {
      printf ("        !  rs1 + -imm13    |rs1| == |imm13|  lsw \n");
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0x000007ff) | 0x00000001;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13  =  ($rs1_odd  ^ 0x1fff) + 1;
      $self -> {inst} -> {imm13} -> {value}  = $imm13;
    }
    else
    {
      
      printf ("        !  rs1 + -rs1    |rs1| == |rs2|  lsw \n");
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $tempReg = $self -> selTempReg();
      $rs2_even = int rand(0x0fffffff);
      $rs2_odd  = ($rs1_odd ^ 0xffffffff) + 1;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    if( $self -> {inst} -> {i} -> {value})
    {
      printf ("        !  -rs1 + imm13    |rs1| == |imm13|  lsw \n");
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0x00000fff) ;
      $imm13  = $rs1_odd;
      $rs1_odd  = ($rs1_odd ^ 0xffffffff) + 1;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $tempReg = $self -> selTempReg();
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      printf ("        !  -rs1 + rs2    |rs1| == |rs2|  lsw \n");
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = (int rand(0x7fffffff) ^ 0xffffffff) + 1;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $tempReg = $self -> selTempReg();
      $rs2_even = int rand(0x0fffffff);
      $rs2_odd  = ($rs1_odd ^ 0xffffffff) + 1;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    if(!( $self -> {inst} -> {i} -> {value}))
    {
      printf ("        !  rs1 + -rs1    |rs1| == |rs2|  msw \n"); 
      $tempReg = $self -> selTempReg();
      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = 0x00000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $tempReg = $self -> selTempReg();
      $rs2_even = ($rs1_even ^ 0xffffffff) + 1;
      $rs2_odd  = 0x00000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();
    }

    if(!( $self -> {inst} -> {i} -> {value}))
    {
      printf ("        !  -rs1 + rs1    |rs1| == |rs2|  msw \n");
      $tempReg = $self -> selTempReg();
      $rs1_even = (int rand(0x7fffffff) ^ 0xffffffff) + 1;
      $rs1_odd  = 0x00000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $tempReg = $self -> selTempReg();
      $rs2_even = ($rs1_even ^ 0xffffffff) + 1;
      $rs2_odd  = 0x00000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();
    }

  }

  if($self -> {opt} -> {overflow})
  {
    $tempReg = $self -> selTempReg();
    #####

    if( $self -> {inst} -> {i} -> {value})
    {

      $imm13 =  0x0fff;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
 
      $rs1_even = 0x7fffffff;
      $rs1_odd =  0xffffffff;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $self-> printInst();

      $rs1_even = 0x7fffffff;
      $rs1_odd =  0x7fffffff;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $self-> printInst();

      $imm13 =  0x1001;
      $self -> {inst} -> {imm13} -> {value} = $imm13;

      $rs1_even = 0x80000001;
      $rs1_odd =  0x00000001;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $self-> printInst();

      $rs1_even = 0x80000001;
      $rs1_odd =  0x80000001;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $self-> printInst();

    }
    else
    {
      $rs1_even = int rand(0x7fffffff) | 0x40000000;
      $rs1_odd  = int rand(0x7fffffff) |  0x40000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

      $rs2_even = int rand(0x7fffffff) | 0x40000000;
      $rs2_odd  = int rand(0x7fffffff) | 0x40000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();

      $rs1_even = int rand(0x7fffffff) | 0x40000000;
      $rs1_odd  = int rand(0xffffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

      $rs2_even = int rand(0x7fffffff) | 0x40000000;
      $rs2_odd  = int rand(0xffffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();

      $rs1_even = int rand(0x80000001);
      $rs1_odd  = int rand(0x80000001);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

      $rs2_even = int rand(0x80000001);
      $rs2_odd  = int rand(0x80000001);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();

      $rs1_even = int rand(0x80000000);
      $rs1_odd  = int rand(0x00000001);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

      $rs2_even = int rand(0x80000000);
      $rs2_odd  = int rand(0x00000001);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();
    }
  }

  if($self -> {opt} -> {carry})
  {
    $tempReg = $self -> selTempReg();
    ## 1 + 1
    printf ("        wr       %%g0,       0x01,   %%ccr\n");
    if( $self -> {inst} -> {i} -> {value})
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13 =  int rand(0x0fff) | 0x1000;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff);
      $rs2_odd  = int rand(0x3fffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    ## 01 + 11
    printf ("        wr       %%g0,       0x01,   %%ccr\n");
    if( $self -> {inst} -> {i} -> {value})
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x40000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13 = int rand(0x0fff) | 0x1000;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x40000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff);
      $rs2_odd  = int rand(0x3fffffff) | 0xc0000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    printf ("        wr       %%g0,       0x10,   %%ccr\n");
    if($self -> {inst} -> {i} -> {value})
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x40000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13 = int rand(0x0fff) | 0x1000;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs1_even = int rand(0x3fffffff) | 0x80000000;
      $rs1_odd  = int rand(0x3fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff) | 0x80000000;
      $rs2_odd  = int rand(0x3fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    printf ("        wr       %%g0,       0x10,   %%ccr\n");
    if($self -> {inst} -> {i} -> {value})
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x40000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13 = int rand(0x0fff) | 0x1000;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs1_even = int rand(0x3fffffff) | 0xc0000000;
      $rs1_odd  = int rand(0x3fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff) | 0x40000000;
      $rs2_odd  = int rand(0x3fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
  }

}

###########################################################################################
#### CC test subtract
###########################################################################################
sub ccFlagTestSub
{
my $self = shift;
my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $imm13, $tempReg);


   ####  rs1 +ve rs2 +ve  rs1 < rs2
  if($self -> {opt} -> {negative})
  {
    $tempReg = $self -> selTempReg();
    #####
    $rs1_even =  0x00000000;
    $rs1_odd  = int rand(0x000003ff);
    #printf ("special1\n");
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13  = $rs1_odd + int rand(0x07ff);
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even =  0x00000000;
      $rs2_odd  =  $rs1_odd + int rand(0x3fffffff);
    #printf ("special2\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

   #### rs1 -ve rs2 -ve  |rs1| > |rs2|

    $rs1_even =  0x00000000;
    $rs2_odd  = int rand(0x000003ff) | 0x000000001;
    $imm13   =  $rs2_odd;
    $rs1_odd  = (($rs1_odd  | 0x000040000) ^ 0xffffffff) + 1;
    #printf ("special3\n");
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13  = ($imm13 ^ 0x1fff) + 1;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even =  0x00000000;
      $rs2_odd  = ($rs2_odd ^ 0xffffffff) + 1;
    #printf ("special4\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();


    $rs1_even =  0xffffffff;
    $rs2_odd  = int rand(0x000003ff) + 0x00000001; 
    $imm13  =   $rs2_odd;
    $rs1_odd  = $rs2_odd + 0x000004000;
    $rs1_odd  = ($rs1_odd ^ 0xffffffff) + 1;
    #printf ("special5\n");
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13  = ($imm13 ^ 0x1fff) + 1;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even =  0xffffffff;
      $rs2_odd  = ($rs2_odd ^ 0xffffffff) + 1;
    #printf ("special6\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    $rs1_even =  0xffffffff;
    $rs1_odd  = int rand(0x000007ff);
    $rs2_odd  = $rs1_odd;
    $rs1_odd  = ($rs1_odd ^ 0xffffffff) + 1;
    #printf ("special7\n");
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13  = rand(0x03ff);
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even =  0xffffffff;
      $rs2_odd  = int rand(0x000003ff);
    #printf ("special8\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
  }

  if($self -> {opt} -> {overflow})
  {
    $tempReg = $self -> selTempReg();
    #####
    $rs1_even =  0x00000000;
    $rs1_odd  =  0x7fffffff;
    #printf ("special9\n");
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13  = int rand(0x07ff);
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even =  0x00000000;
      $rs2_odd  =  (int rand(0x7fffffff) + 1) ^ 0xffffffff;
    #printf ("special10\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    $tempReg = $self -> selTempReg();
    #####
    $rs1_even =  0x7fffffff;
    $rs1_odd  =  0xffffffff;
    #printf ("special11\n");
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13  =  int rand(0x07ff);
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      # Jon: I think the true bug lies here. This overflows and somehow displays as 9 hex digits instead of 8.
      $rs2_even =  (int rand(0x00000000) ^ 0xffffffff) + 1;
      $rs2_odd  =  ("0xffffffff");
      #$rs2_odd  =  int rand (("0xffffffff")); # Jon: Tried this as a fix but still overflows wrongly (rand isn't working right?)
      #$rs2_odd  = (0xffffffff);
    #printf ("special12\n");
    #printf ("0x%08x\n", $rs2_even);
    #printf ("0x%08x\n", $rs2_odd);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
}

 if($self -> {opt} -> {zero})
  {
    $tempReg = $self -> selTempReg();
    ######
    $rs1_odd   = rand (0x00000fff);
    $rs1_even  = rand (0xffffffff);
   
    #printf ("special13\n");
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 = $rs1_odd;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_odd   = $rs1_odd;
      $rs2_even  = rand (0xffffffff);
    #printf ("special14\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
    $tempReg = $self -> selTempReg();
    ######
    $rs1_odd   = rand (0x00000fff);
    $rs1_even  = 0x00000000;
   
    #printf ("special15\n");
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 = $rs1_odd;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_odd   = $rs1_odd;
      $rs2_even  = 0x00000000;
    #printf ("special16\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
 }

  if($self -> {opt} -> {carry})
  {
    ## 01 - 10
    if(!($self -> {inst} -> {i} -> {value}))
    {
      printf ("        wr       %%g0,       0x01,   %%ccr\n");
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x40000000;
    #printf ("special17\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff);
      $rs2_odd  = int rand(0x3fffffff) | 0x80000000;
    #printf ("special18\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();
    }

    ## 10 - 11 
    printf ("        wr       %%g0,       0x01,   %%ccr\n");
    if($self -> {inst} -> {i} -> {value})
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x80000000;
    #printf ("special19\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13 = int rand(0x07ff) | 0x1800;
      $imm13 = $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x80000000;
    #printf ("special19\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff);
      $rs2_odd  = int rand(0x3fffffff) | 0xc0000000;
    #printf ("special20\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    ## 01 - 11
    printf ("        wr       %%g0,       0x01,   %%ccr\n");
    if($self -> {inst} -> {i} -> {value})
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x40000000;
    #printf ("special21\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13 = int rand(0x07ff) | 0x1800;
      $imm13 = $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs1_even = int rand(0x3fffffff) | 0x40000000;
      $rs1_odd  = int rand(0x3fffffff);
    #printf ("special22\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff) | 0xc0000000;
      $rs2_odd  = int rand(0x3fffffff);
    #printf ("special23\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    if(!($self -> {inst} -> {i} -> {value}))
    {
      printf ("        wr       %%g0,       0x10,   %%ccr\n");
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x40000000;
    #printf ("special24\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff) | 0x80000000;
      $rs2_odd  = int rand(0x3fffffff) ;
    #printf ("special25\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      $self-> printInst();
    }

    printf ("        wr       %%g0,       0x10,   %%ccr\n");
    if($self -> {inst} -> {i} -> {value})
    {
      $rs1_even = int rand(0x3fffffff) | 0x80000000;
      $rs1_odd  = int rand(0x3fffffff) ;
    #printf ("special26\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13 = int rand(0x07ff) | 0x1800;
      $imm13 = $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs1_even = int rand(0x3fffffff) | 0x80000000;
      $rs1_odd  = int rand(0x3fffffff) ;
    #printf ("special27\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff);
      $rs2_odd  = int rand(0x3fffffff) | 0xc0000000;
    #printf ("special28\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    printf ("        wr       %%g0,       0x10,   %%ccr\n");
    if($self -> {inst} -> {i} -> {value})
    {
      $rs1_even = int rand(0x3fffffff);
      $rs1_odd  = int rand(0x3fffffff) | 0x40000000;
    #printf ("special29\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $imm13 = int rand(0x07ff) | 0x1800;
      $imm13 = $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs1_even = int rand(0x3fffffff) | 0x40000000;
      $rs1_odd  = int rand(0x3fffffff);
    #printf ("special30\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
      $rs2_even = int rand(0x3fffffff) | 0xc0000000;
      $rs2_odd  = int rand(0x3fffffff);
      $rs2_odd  = int rand(0x3fffffff);
    #printf ("special31\n");
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
  }
}
###########################################################################
#### CC test Divide
###########################################################################
sub ccFlagTestDiv
{
my $self = shift;
my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $imm13, $y_reg, $tempReg);

  if($self -> {opt} -> {negative})
   {
     $tempReg = $self -> selTempReg();
     ######  lsw -ve
     $y_reg = 0x00000000;
     $tempReg = $self -> selTempReg();
     printf ("        set       0x%08x,     %%r%-2d  \n", $y_reg, $tempReg);
     printf ("        wr       %%g0,   %%r%-2d,   %%y\n", $tempReg);
 
     if( $self -> {inst} -> {i} -> {value})
     {
       $rs1_even = int rand(0xffffffff);
       $rs1_odd = int rand(0x0000003f) | 0x00000001;
       printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
       $imm13 =  ( $rs1_odd ^  0x1fff ) + 1;
       $self -> {inst} -> {imm13} -> {value} = $imm13;
     }
     else
     {
       $rs1_even = int rand(0xffffffff);
       $rs1_odd = int rand(0x0000ffff) | 0x00000001;
       printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
       $rs2_even = int rand(0xffffffff);
       $rs2_odd   = ( $rs1_odd ^  0xffffffff ) + 1;
       printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
     }
 
     $self-> printInst();
  }   

  if($self -> {opt} -> {zero})
  {
     $tempReg = $self -> selTempReg();
     ######
     $y_reg = 0x00000000;
     $rs1_even = int rand(0xffffffff);
     $rs1_odd = 0x00000000;
 
     $tempReg = $self -> selTempReg();
     printf ("        set       0x%08x,     %%r%-2d  \n", $y_reg, $tempReg);
     printf ("        wr       %%g0,   %%r%-2d,   %%y\n", $tempReg);
     printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
     if( $self -> {inst} -> {i} -> {value})
     {
       $imm13 =  int rand(0x1fff);
       $self -> {inst} -> {imm13} -> {value} = $imm13;
     }
     else
     {
       $rs2_even = int rand(0xffffffff);
       $rs2_odd   = int rand(0xffffffff);
       printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
     }
 
     $self-> printInst();
   }

  if($self -> {opt} -> {overflow})
  {
     $tempReg = $self -> selTempReg();
     ######
     $y_reg = 0x7fffffff;
     $rs1_even = int rand(0xffffffff);
     $rs1_odd = int rand(0x0fffffff);

     $tempReg = $self -> selTempReg();
     printf ("        set       0x%08x,     %%r%-2d  \n", $y_reg, $tempReg);
     printf ("        wr       %%g0,   %%r%-2d,   %%y\n", $tempReg);
     printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

     if( $self -> {inst} -> {i} -> {value})
     {
       $imm13 =  int rand(0x0fff) | 0x0001;
       $self -> {inst} -> {imm13} -> {value} = $imm13;
     }
     else
     {
       $rs2_even = int rand(0xffffffff);
       $rs2_odd   = int rand(0x00000fff) | 0x00000001;
       printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
     }

     $self-> printInst();
  }
}


######################################################################################
### Logical CC test
######################################################################################
sub ccFlagTestLogic
{
my $self = shift;
my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $imm13,  $tempReg);

  if($self -> {opt} -> {zero})
  {
    if(($self -> {inst} -> {assembly} eq "and") || ($self -> {inst} -> {assembly} eq "andcc"))
    {
       $rs1_even = int rand(0xffffffff);
       $rs1_odd  = int rand(0xffffffff);
       printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

       $rs2_even = $rs1_even ^ 0xffffffff;
       $rs2_odd  = $rs1_odd  ^ 0xffffffff; 
       printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
      
       $self-> printInst();
    }

    if(($self -> {inst} -> {assembly} eq "andn") || ($self -> {inst} -> {assembly} eq "andncc"))
    {
      $rs1_even = int rand(0xffffffff);
      $rs1_odd  = int rand(0xffffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = $rs1_even;
      $rs2_odd  = $rs1_odd; 
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
 
      $self-> printInst();
    }

    if(($self -> {inst} -> {assembly} eq "or") || ($self -> {inst} -> {assembly} eq "orcc"))
    {
      $rs1_even = 0x00000000;
      $rs1_odd  = 0x00000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = 0x00000000;
      $rs2_odd  = 0x00000000; 
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
 
      $self-> printInst();
    }
 
    if(($self -> {inst} -> {assembly} eq "orn") || ($self -> {inst} -> {assembly} eq "orncc"))
    {
      $rs1_even = 0x00000000;
      $rs1_odd  = 0x00000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = 0xffffffff;
      $rs2_odd  = 0xffffffff;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
 
      $self-> printInst();
    }
 
    if(($self -> {inst} -> {assembly} eq "xor") || ($self -> {inst} -> {assembly} eq "xorcc"))
    {
      $rs1_even = int rand(0xffffffff);
      $rs1_odd  = int rand(0xffffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = $rs1_even;
      $rs2_odd  = $rs1_odd;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
 
      $self-> printInst();
    }
 
    if(($self -> {inst} -> {assembly} eq "xnor") || ($self -> {inst} -> {assembly} eq "xnorcc"))
    {
      $rs1_even = int rand(0xffffffff);
      $rs1_odd  = int rand(0xffffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
 
      $rs2_even = $rs1_even  ^ 0xffffffff;
      $rs2_odd  = $rs1_odd  ^ 0xffffffff;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
 
      $self-> printInst();
    }
  }

  if($self -> {opt} -> {negative})
  {
    if(($self -> {inst} -> {assembly} eq "and") || ($self -> {inst} -> {assembly} eq "andcc"))
    {
      $rs1_even = int rand(0xffffffff)  | 0x80000000;
      $rs1_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

      $rs1_even = int rand(0xffffffff)  | 0x80000000;
      $rs1_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
 
      $self-> printInst();

      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0xffffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0xffffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
 
      $self-> printInst();
    }

    if(($self -> {inst} -> {assembly} eq "andn") || ($self -> {inst} -> {assembly} eq "andncc"))
    {
      $rs1_even = int rand(0xffffffff)  | 0x80000000;
      $rs1_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0xffffffff)  | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
 
      $self-> printInst();

      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0xffffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
 
      $self-> printInst();
    }

    if(($self -> {inst} -> {assembly} eq "or") || ($self -> {inst} -> {assembly} eq "orcc"))
    {
      $rs1_even = int rand(0xffffffff)  | 0x80000000;
      $rs1_odd  = int rand(0xffffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = int rand(0x7fffffff) | 0x80000000;
      $rs2_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
  
       $self-> printInst();
 
      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0xffffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = int rand(0xffffffff);
      $rs2_odd  = int rand(0xffffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
  
       $self-> printInst();
    }
 
    if(($self -> {inst} -> {assembly} eq "orn") || ($self -> {inst} -> {assembly} eq "orncc"))
    {
      $rs1_even = int rand(0xffffffff)  | 0x80000000;
      $rs1_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = int rand(0x7fffffff);
      $rs2_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
  
       $self-> printInst();
 
      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0xffffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
  
      $rs2_even = int rand(0x7fffffff);
      $rs2_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
  
       $self-> printInst();
    }
 
    if(($self -> {inst} -> {assembly} eq "xor") || ($self -> {inst} -> {assembly} eq "xorcc"))
    {
      $rs1_even = int rand(0xffffffff)  | 0x80000000;
      $rs1_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = int rand(0x7fffffff);
      $rs2_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
  
       $self-> printInst();
 
      $rs1_even = int rand(0x7fffffff);
      $rs1_odd  = int rand(0xffffffff) | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = int rand(0x7fffffff);
      $rs2_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
  
      $self-> printInst();
    }
 
    if(($self -> {inst} -> {assembly} eq "xnor") || ($self -> {inst} -> {assembly} eq "xnorcc"))
    {
      $rs1_even = int rand(0xffffffff)  | 0x80000000;
      $rs1_odd  = int rand(0xffffffff)  | 0x80000000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = int rand(0xffffffff) | 0x80000000;
      $rs2_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
  
      $self-> printInst();
 
      $rs1_even = int rand(("0xffffffff")) | 0x80000000;
      $rs1_odd  = int rand(("0x7fffffff"));
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
      $rs2_even = int rand(0x7fffffff);
      $rs2_odd  = int rand(0x7fffffff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
  
      $self-> printInst();
    }
  }
}  

###################################################################################
#### CC test for mul32
###################################################################################
sub ccFlagTestMul32
{
my $self = shift;
my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $imm13, $tempReg);

 if($self -> {opt} -> {negative})
  {
    $tempReg = $self -> selTempReg();
    ######
    $rs1_even = int rand(0xffffffff);
    $rs1_odd =  int rand(0x00000fff) | 0x00000001;

    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 =  ($rs1_odd ^ 0x1fff) + 1;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even = int rand(0xffffffff);
      $rs2_odd   = ($rs1_odd ^ 0xffffffff) + 1;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    $rs1_even = int rand(0xffffffff);
    $rs1_odd = 0x7fffffff;

    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 =  0x0002;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even = int rand(0xffffffff);
      $rs2_odd   = "0x00000002";
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
  }

  if($self -> {opt} -> {zero})
  {
    $tempReg = $self -> selTempReg();
    ######
    $rs1_even = int rand(0xffffffff);
    $rs1_odd =  0x00800000;

    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 =   0x0400;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even = int rand(0xffffffff);
      $rs2_odd   = 0x00008000;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();

    ######
    $rs1_even = int rand(0xffffffff);
    $rs1_odd =  int rand(0x00000fff);

    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 =   int rand(0x0fff);   
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even = int rand(0xffffffff);
      $rs2_odd   = int rand(0x00000fff);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }

    $self-> printInst();
 }
}

###################################################################################
## CC Check for tadd
##################################################################################
sub ccFlagTestTadd
{
my $self = shift;
my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $imm13, $tempReg);

  $self -> ccFlagTestAdd();

  if($self -> {opt} -> {overflow})
  {
    $tempReg = $self -> selTempReg();
    ######
    $rs1_even = int rand(0xffffffff);
    $rs1_odd =  int rand(0xfffffffc) | 0x000000001;

    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 =  int rand(0x1ffc);
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even = int rand(0xffffffff);
      $rs2_odd   = int rand(0xfffffffc);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
 
    ######
    $rs1_even = int rand(0xffffffff);
    $rs1_odd =  int rand(0xfffffffc);
 
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 =  int rand(0x1fff) | 0x0002;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even = int rand(0xffffffff);
      $rs2_odd   = int rand(0xffffffff)  | 0x00000002;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
  }
}

###################################################################################
## CC Check for tsub
##################################################################################
sub ccFlagTestTsub
{
my $self = shift;
my ($rs1_odd, $rs1_even, $rs2_odd, $rs2_even, $imm13, $tempReg);

  $self -> ccFlagTestSub();

  if($self -> {opt} -> {overflow})
  {
    $tempReg = $self -> selTempReg();
    ######
    $rs1_even = int rand(0xffffffff);
    $rs1_odd =  int rand(0xfffffffc) | 0x000000001;

    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});

    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 =  int rand(0x1ffc);
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even = int rand(0xffffffff);
      $rs2_odd   = int rand(0xfffffffc);
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
 
    ######
    $rs1_even = int rand(0xffffffff);
    $rs1_odd =  int rand(0xfffffffc);
 
    printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs1_even & 0xffffffff),($rs1_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs1} -> {value});
 
    if( $self -> {inst} -> {i} -> {value})
    {
      $imm13 =  int rand(0x1fff) | 0x0002;
      $self -> {inst} -> {imm13} -> {value} = $imm13;
    }
    else
    {
      $rs2_even = int rand(0xffffffff);
      $rs2_odd   = int rand(0xffffffff)  | 0x00000002;
      printf ("        setx     0x%08x%08x,   %%r%-2d,   %%r%-2s\n", ($rs2_even & 0xffffffff),($rs2_odd & 0xffffffff),$tempReg, $self -> {inst} -> {rs2} -> {value});
    }
    $self-> printInst();
  }
}

######################################################################################
#
######################################################################################
sub enableInt()
{
  my  $self = shift;

  if($self-> {opt} -> {inst} eq "ALL" || $self-> {opt} -> {inst} eq "MULDIV" || $self-> {opt} -> {inst} eq "DIV")
  {
    printf ("\n\n");
    printf ("! for divide by zero cases \n");
    printf ("#define H_T0_Division_By_Zero\n");
    printf ("#define My_T0_Division_By_Zero \\\n");
    printf ("rdpr    %%tstate, %%i1; \\\n");
    printf ("rdpr    %%tt, %%i1; \\\n");
    printf ("rdpr    %%tpc, %%i0; \\\n");
    printf ("rdpr    %%tnpc, %%i1; \\\n");
    printf ("done; \\\n");
    printf ("nop; \n");
    printf ("\n\n");
  }

  if($self-> {opt} -> {inst} eq "ALL" || $self-> {opt} -> {inst} eq "TADD" || $self-> {opt} -> {inst} eq "TSUB")
  {
    printf ("\n\n");
    printf ("! for taddcctv cases \n");
    printf ("#define H_T0_Tag_Overflow\n");
    printf ("#define My_T0_Tag_Overflow \\\n");
    printf ("rdpr    %%tstate, %%i1; \\\n");
    printf ("rdpr    %%tt, %%i1; \\\n");
    printf ("rdpr    %%tpc, %%i0; \\\n");
    printf ("rdpr    %%tnpc, %%i1; \\\n");
    printf ("done; \\\n");
    printf ("nop; \n");
    printf ("\n\n");
  }

 if($self-> {opt} -> {rsvd})
 {
   printf ("\n\n");
   printf ("#define  H_HT0_Illegal_instruction_0x10 \n");
   printf ("#define My_HT0_Illegal_instruction_0x10 done;\n");
   printf ("\n\n");
 }

}


1;
