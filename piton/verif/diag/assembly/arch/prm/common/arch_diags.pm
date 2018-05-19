# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: arch_diags.pm
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

package arch_diags;

use strict;
use BigIntSupport;
use Getopt::Long;

require Exporter;
use vars qw(@ISA @EXPORT);

my @ISA         = qw(Exporter);
use vars          qw(%opt);
my @EXPORT      = qw(%opt);

my @ld_freg    = ("ld", "ldd", "ldq", "ldx");

my @fregs      = ( "%f0",  "%f1",  "%f2",  "%f3",  "%f4",  "%f5",  "%f6",  "%f7",
                "%f8",  "%f9", "%f10", "%f11", "%f12", "%f13", "%f14", "%f15",
               "%f16", "%f17", "%f18", "%f19", "%f20", "%f21", "%f22", "%f23",
               "%f24", "%f25", "%f26", "%f27", "%f28", "%f29", "%f30", "%f31" );

my @fregs_dbl  = ( 0,  2,  4,  6,  8, 10, 12, 14, 16, 18,  
               20, 22, 24, 26, 28, 30, 32, 34, 36, 38,  
               40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 
               60, 62);   


my @iregs      = ( "%r0",  "%r1",  "%r2",  "%r3",  "%r4",  "%r5",  "%r6",  "%r7",
                "%r8",  "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15",
               "%r16", "%r17", "%r18", "%r19", "%r20", "%r21", "%r22", "%r23",
               "%r24", "%r25", "%r26", "%r27", "%r28", "%r29", "%r30", "%r31" );

my @walking1_iregs      = (0x0, 0x1, 0x2, 0x4, 0x8, 0x10, 0x1f); 
my @walking1_imm13      = (0x0, 0x1, 0x2, 0x4, 0x8, 0x10, 0x20,0x40,0x80,
                       0x100, 0x200, 0x400, 0x800, 0x1000, 0x1fc0);

my $ILLIMM = 0x80000000;


#my @all_fbfcc = ("fba",  "fbn",   "fbu", "fbg", "fbug", "fbl", "fbul", "fblg", "fbne", "fbe", "fbue",
#                 "fbge", "fbuge", "fble", "fbule", "fbo"); 
my @imm22_targets = (0x0, 0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80, 0x3ff000, 0x3ffff0);

my @imm19_targets = (0x0, 0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80, 0x7f000, 0x7fff0);

my %mem_inst = (ld => 1, ldd => 1,  lda => 1, ldda => 1);

my %cti_inst = (
                   ba     => 1, bn     => 1, bne    => 1, be    => 1, bg     => 1,  ble   => 1,
                   bge    => 1, bl     => 1, bgu    => 1, bleu  => 1, bcc    => 1,  bcs   => 1,
                   bpos   => 1, bneg   => 1, bvc    => 1, bvs   => 1, 
                   fba    => 1, fbn    => 1, fbu    => 1, fbg   => 1, fbug    => 1, fbl   => 1,
                   fbul   => 1, fblg   => 1, fbne   => 1, fbe   => 1, fbue    => 1, fbge  => 1,
                   fbuge  => 1, fble   => 1, fbule  => 1, fbo   => 1
               );

    %opt     = (
               name          => "",    # name of the diag
               thrd_count    => 1,     
               thrd_stride   => 1,
               super         => 0,     # run in supervisor mode
               hyper         => 0,     # run in hypervisor mode
               enboff        => 0,     # run in hypervisor mode
               inst          => "",    # instruction to execute
               inst_group    => "",    # instruction to execute
               illinst       => 0,     # generate illinst trap
               fpdis         => 0,     # generate fpdisable trap
               dmisalgn      => 0,     # generate double-misalign trap
               misalgn       => 0,     # generate misalign trap
               dataacc       => 0,     # generate dataacc trap
               privact       => 0,     # generate privact trap
               vawatch       => 0,     # generate vamatch trap
               seltrap       => 0,     # generate vamatch trap
               alldest       => 0,     # try all dest regs
               range_param   => 0,     # generic range.. of any type
               mem_inst      => 0,
               cti_inst      => 0
              );


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
      illinst=i
      fpdis=i
      dmisalgn=i
      misalgn=i
      dataacc=i
      privact=i
      vawatch=i
      seltrap=i
      alldest=i
      range_param=i
      mem_inst=i
      cti_inst=i
     );

sub setup_diag_options() {
    GetOptions(\%opt, @options);

    my @diag_run_args = split(/_/, $opt{name});
    my $index = 0;
    printf("!Diag run options :\n");
    foreach my $diag_run_arg (@diag_run_args) {
        if($index == 0) {
            $opt{inst_group} = $diag_run_arg;
            printf("!inst_group = %-20s\n", $opt{inst_group});
        }
        elsif($index == 1) {
            $opt{inst} = $diag_run_arg;
            printf("!inst = %-20s\n", $opt{inst});
        }
        else {
            $opt{$diag_run_arg}=1; 
            printf("!%s = %d\n", $diag_run_arg, $opt{$diag_run_arg});
        }
        $index++;
    }
    $opt{mem_inst} = 1 if($mem_inst{$opt{inst}});
    $opt{cti_inst} = 1 if($cti_inst{$opt{inst}});
}

my $locked_regs = 0;
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
sub release_all_regs() {
    $locked_regs = 0;
    printf("!release all locked regs = 0x%x\n", $locked_regs);
}

sub pick_tmp_reg() {
    my ($ex1, $ex2) = @_;
    foreach my $reg (1..31) {
        if($reg != $ex1 && $reg != $ex2 && (($locked_regs & (0x1 << $reg)) == 0)) { 
            $locked_regs |= (0x1 << $reg);
            printf("!pick temp locked regs = 0x%x\n", $locked_regs);
            return ($reg); 
        }
    }
    printf("ERROR: If here, means something went wrong in pick_tmp_reg\n");
}

sub possible_tmp_reg() {
    my ($ex1, $ex2) = @_;
    foreach my $reg (1..31) {
        if($reg != $ex1 && $reg != $ex2 && (($locked_regs & (0x1 << $reg)) == 0)) { 
            printf("!possible temp locked regs = 0x%x\n", $locked_regs);
            return ($reg); 
        }
    }
    printf("ERROR: If here, means something went wrong in pick_tmp_reg\n");
}

sub setx() {
    my ($va, $tmp_reg, $dest) = @_;
    printf("setx 0x%s, %%r%d, %%r%d\n", bigint2hex($va), $tmp_reg, $dest);
}

sub setx_label() {
    my ($label, $tmp_reg, $dest) = @_;
    printf("setx %s, %%r%d, %%r%d\n", $label, $tmp_reg, $dest);
}

sub mov() {
    my ($rs1, $imm, $dest) = @_;
    if($imm == $ILLIMM) {
        printf("mov %%r%d, %%r%d\n", $rs1, $dest);
    }
    else {
        printf("mov 0x%x, %%r%d\n",  $imm, $dest);
    }
}

sub or_regs() {
    my ($rs1, $rs2, $imm, $dest) = @_;
    if($imm == $ILLIMM) {
        printf("or %%r%d, %%r%d, %%r%d\n", $rs1, $rs2, $dest);
    }
    else {
        printf("or %%r%d, 0x%x, %%r%d\n",  $rs1, $imm, $dest);
    }
}

sub and_regs() {
    my ($rs1, $rs2, $imm, $dest) = @_;
    if($imm == $ILLIMM) {
        printf("and %%r%d, %%r%d, %%r%d\n", $rs1, $rs2, $dest);
    }
    else {
        printf("and %%r%d, 0x%x, %%r%d\n",  $rs1, $imm, $dest);
    }
}

sub add_regs() {
    my ($rs1, $rs2, $imm, $dest) = @_;
    if($imm == $ILLIMM) {
        printf("add %%r%d, %%r%d, %%r%d\n", $rs1, $rs2, $dest);
    }
    else {
        printf("add %%r%d, 0x%x, %%r%d\n",  $rs1, $imm, $dest);
    }
}

sub load_reg() {
    my ($inst, $rs1, $rs2, $imm, $imm_asi, $dest_type, $dest_num) = @_;
    if($inst eq "ldub" || $inst eq "ld" || $inst eq "ldd") {
        &load($inst, $rs1, $rs2, $imm, $dest_type, $dest_num);
    }
    if($inst eq "lda" || $inst eq "ldda" || $inst eq "ldxa") {
        &load_alt($inst, $rs1, $rs2, $imm, $imm_asi, $dest_type, $dest_num);
    }
}

sub load() {
    my ($inst, $rs1, $rs2, $imm, $dest_type, $dest_num) = @_;
    if($imm == $ILLIMM) {
        printf("%s [%%r%d+%%r%d], %s%d\n", $inst, $rs1, $rs2, $dest_type, $dest_num);
    }
    else {
        printf("%s [%%r%d+0x%x], %s%d\n", $inst, $rs1, $imm, $dest_type, $dest_num);
    }
}

sub store() {
    my ($inst, $src_type, $src_num, $rs1, $rs2, $imm) = @_;
    if($imm == $ILLIMM) {
        printf("%s %s%d, [%%r%d+%%r%d]\n", $inst, $src_type, $src_num, $rs1, $rs2);
    }
    else {
        printf("%s %s%d, [%%r%d+0x%x]\n", $inst, $src_type, $src_num, $rs1, $imm);
    }
}

sub load_alt() {
    my ($inst, $rs1, $rs2, $imm, $imm_asi, $dest_type, $dest_num) = @_;
    if($imm == $ILLIMM) {
        if($imm_asi == $ILLIMM) {
            printf("%s [%%r%d+%%r%d] %%asi, %s%d\n", $inst, $rs1, $rs2, $dest_type, $dest_num);
        }
        else {
            printf("%s [%%r%d+%%r%d] 0x%x, %s%d\n", $inst, $rs1, $rs2, $imm_asi, $dest_type, $dest_num);
        }
    }
    else {
        if($imm_asi == $ILLIMM) {
            printf("%s [%%r%d+0x%x] %%asi, %s%d\n", $inst, $rs1, $imm, $dest_type, $dest_num);
        }
        else {
            printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
            printf("wr %%r0, 0x%x, %%asi\n", $imm_asi); 
            printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
            printf("%s [%%r%d+0x%x] %%asi, %s%d\n", $inst, $rs1, $imm, $dest_type, $dest_num);
        }
    }
}

sub store_alt() {
    my ($inst, $dest_type, $dest_num, $rs1, $rs2, $imm, $imm_asi) = @_;

    if($imm == $ILLIMM) {
        if($imm_asi == $ILLIMM) {
            printf("%s %s%d, [%%r%d+%%r%d] %%asi\n", $inst, $dest_type, $dest_num, $rs1, $rs2);
        }
        else {
            printf("%s %s%d, [%%r%d+%%r%d] 0x%x\n", $inst, $dest_type, $dest_num, $rs1, $rs2, $imm_asi);
        }
    }
    else {
        if($imm_asi == $ILLIMM) {
            printf("%s %s%d, [%%r%d+0x%x] %%asi\n", $inst, $dest_type, $dest_num, $rs1, $imm);
        }
        else {
            printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
            printf("wr %%r0, 0x%x, %%asi\n", $imm_asi); 
            printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
            printf("%s %s%d, [%%r%d+0x%x] %%asi\n", $inst, $dest_type, $dest_num, $rs1, $imm);
        }
    }

}

sub cas() {
    my ($inst, $rs1, $rs2, $imm, $dest_type, $dest_num) = @_;
    if($imm == $ILLIMM) {
        printf("%s [%%r%d], %%r%d, %s%d\n", $inst, $rs1, $rs2, $dest_type, $dest_num);
    }
    else {
        my $tmp1 = &pick_tmp_reg();
        &add_regs($rs1, 0, $imm, $tmp1);
        printf("%s [%%r%d], %%r%d, %s%d\n", $inst, $tmp1, $rs2, $dest_type, $dest_num);
        &release_regs($tmp1);
    }
}

sub cas_alt() {
    my ($inst, $rs1, $rs2, $imm, $imm_asi, $dest_type, $dest_num) = @_;
    if($imm == $ILLIMM) {
        if($imm_asi == $ILLIMM) {
            printf("%s [%%r%d] %%asi, %%r%d, %s%d\n", $inst, $rs1, $rs2, $dest_type, $dest_num);
        }
        else {
            printf("%s [%%r%d] 0x%x, %%r%d, %s%d\n", $inst, $rs1, $imm_asi, $rs2, $dest_type, $dest_num);
        }
    }
    else {
        my $tmp1 = &pick_tmp_reg();
        &add_regs($rs1, 0, $imm, $tmp1);
        if($imm_asi == $ILLIMM) {
            printf("%s [%%r%d] %%asi, %%r%d, %s%d\n", $inst, $tmp1, $rs2, $dest_type, $dest_num);
        }
        else {
            printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
            printf("wr %%r0, 0x%x, %%asi\n", $imm_asi); 
            printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
            printf("%s [%%r%d] %%asi, %%r%d, %s%d\n", $inst, $tmp1, $rs2, $dest_type, $dest_num);
        }
        &release_regs($tmp1);
    }
}

# va  == net va
# imm == required imm in va
sub setup_addr_in_rs1_rs2() {
    my ($va, $rs1, $rs2, $imm, $err_ref) = @_; 
    my ($tmp_reg) = 0;

    #print("!SETX DEBUG VA:$va, RS1:$rs1, RS2:$rs2, iMM:$imm\n");
    $$err_ref = 0;
    if($imm != $ILLIMM) {
        if($rs1 != 0) {
            my ($remainder) = $va;
            if($imm & 0x1000)  {
                $imm |= 0xffffffffffffe000;
                $imm = ~$imm; $imm += 1; # 2's complement
                $remainder = $va + $imm;
            }
            else {
                $remainder = $va - $imm;
            }
            $tmp_reg = &pick_tmp_reg($rs1);
            &lock_regs($rs1);
            #print("!SETX REAL DEBUG VA:$remainder, TMP_REG:$tmp_reg, RS1:$rs1\n");
            &setx($remainder, $tmp_reg, $rs1);
            &release_regs($tmp_reg);
            return $va;
        }
        else {
            return $imm;
        }
    }

    if($rs1 == 0 && $rs2 == 0) { 
        # no init needed, load will come from 0x0.
        return 0;
    }
    elsif($rs1 == 0) {
        $tmp_reg = &pick_tmp_reg($rs2);
        &setx($va, $tmp_reg, $rs2);
        &lock_regs($rs2);
        &release_regs($tmp_reg);
    }
    elsif($rs2 == 0) {
        $tmp_reg = &pick_tmp_reg($rs1);
        &setx($va, $tmp_reg, $rs1);
        &lock_regs($rs1);
        &release_regs($tmp_reg);
    }
    else {
        $tmp_reg = &pick_tmp_reg($rs1, $rs2);
        my ($half_addr) = 0;
        if($rs1 == $rs2) {
            if($va%2 != 0) {
                $$err_ref = 1; # Can't get this addr setup.
                return $va;
            }
            else {
                $half_addr = $va/2;
            }
        }
        else {
            $half_addr  = int($va/2 + $va/4);
        }
        my ($other_half) = $va - $half_addr;
        &setx($half_addr,  $tmp_reg, $rs1);
        &setx($other_half, $tmp_reg, $rs2);
        &lock_regs($rs1);
        &lock_regs($rs2) if($rs1 != $rs2);
        &release_regs($tmp_reg);
    }
    return $va;
}

sub gen_instr_sec() {

    printf("SECTION .BIG_MAIN  TEXT_VA=0x30000000\n");
    printf("attr_text {\n");
    printf("Name = .BIG_MAIN,\n");
    printf("VA= 0x30000000,\n");
    printf("RA= 0x120000000,\n");
    printf("PA=ra2pa\(0x120000000,0\),\n");
    printf("compressimage,\n");
    printf("part_0_i_ctx_nonzero_ps0_tsb,\n");
    printf("TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=5, TTE_Size_Ptr=0, TTE_NFO=0,\n");
    printf("TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,\n");
    printf("TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1\n");
    printf("}\n");
    if($opt{hyper}) {
        printf("attr_text {\n");
        printf("Name = .BIG_MAIN,\n");
        printf("hypervisor\n");
        printf("}\n");
    }
}

sub gen_data_sec() {
    my ($data_va, $last_data_va, $dataacc, $super) = @_;

    printf("SECTION RAND_DATA%s DATA_VA=0x%s\n", bigint2hex($data_va), bigint2hex($data_va));
    printf("attr_data {\n");
    printf("        Name = RAND_DATA%s,\n",bigint2hex($data_va));
    if($opt{hyper} && (($opt{inst_group} ne "asi") || 
                       (($opt{inst} ne "0x10") && ($opt{inst} ne "0x11") &&
                        ($opt{inst} ne "0x14") && ($opt{inst} ne "0x15") &&
                        ($opt{inst} ne "0x16") && ($opt{inst} ne "0x17") &&
                        ($opt{inst} ne "0x1c") && ($opt{inst} ne "0x1d") &&
                        ($opt{inst} ne "0x1e") && ($opt{inst} ne "0x1f") &&
                        ($opt{inst} ne "0x22") && ($opt{inst} ne "0x23") &&
                        ($opt{inst} ne "0x26") && ($opt{inst} ne "0x2e") &&
                        ($opt{inst} ne "0x2a") && ($opt{inst} ne "0x2b") &&
                        ($opt{inst} ne "0x18") && ($opt{inst} ne "0x19")))) {
        printf("hypervisor\n");
    }
    else {
        printf("        RA=0x%s,\n",bigint2hex($data_va));
        if($dataacc) {
            printf("        tsbonly,\n");
        }
        else {
            if(($data_va >> 39) & 0x1) { #if bit39 on va is set, make it equal to PA
                printf("        PA=0x%s,\n", bigint2hex($data_va));
            }
            else {
                printf("        PA=ra2pa\(0x%s,0\),\n", bigint2hex($data_va));
            }
        }
        printf("        part_0_d_ctx_nonzero_ps0_tsb, \n");
        if((($opt{inst_group} eq "asi") && (($opt{inst} eq "0x4")  || ($opt{inst} eq "0xc")  ||
                                            ($opt{inst} eq "0x24") || ($opt{inst} eq "0x26") ||
                                            ($opt{inst} eq "0x2c") || ($opt{inst} eq "0x2e") ||
                                            ($opt{inst} eq "0x27") || ($opt{inst} eq "0x2f"))) || 
            (($opt{inst_group} eq "ldst") && ($opt{inst} eq "tl1"))) {
            printf("    part_0_d_ctx_zero_ps0_tsb, \n");
        }
        if(($opt{inst_group} eq "asi") && (($opt{inst} eq "0x11") || ($opt{inst} eq "0x19") ||
                                           ($opt{inst} eq "0x81") || ($opt{inst} eq "0x83") ||
                                           ($opt{inst} eq "0x89") || ($opt{inst} eq "0x8b") ||
                                           ($opt{inst} eq "0x17") || ($opt{inst} eq "0x1f") ||
                                           ($opt{inst} eq "0x23") || ($opt{inst} eq "0x2b") ||
                                           ($opt{inst} eq "0xe3") || ($opt{inst} eq "0xeb") ||
                                           ($opt{inst} eq "0xf1") || ($opt{inst} eq "0xf9"))) {
            printf("TTE_Context=SCONTEXT\n");
        }
        else {
            printf("TTE_Context=PCONTEXT\n");
        } 
        printf("        TTE_G=1, TTE_Size=0x0, \n");
        if(($opt{inst_group} eq "asi") && (($opt{inst} eq "0x82") || ($opt{inst} eq "0x83") ||
                                           ($opt{inst} eq "0x8a") || ($opt{inst} eq "0x8b"))) {
            printf("TTE_NFO=1,\n");
        }
        else {
            printf("TTE_NFO=0,\n");
        }
        printf("        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,\n");
        printf("        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, "); 
        if(($dataacc && $opt{inst_group} ne "asi") || $opt{super}) {
            if(($opt{inst_group} eq "asi") && ($opt{inst} eq "0x10" || $opt{inst} eq "0x11" ||
                                               $opt{inst} eq "0x18" || $opt{inst} eq "0x19" ||
                                               $opt{inst} eq "0x22" || $opt{inst} eq "0x23" ||
                                               $opt{inst} eq "0x2a" || $opt{inst} eq "0x2b" ||
                                               $opt{inst} eq "0x80" || $opt{inst} eq "0x81" ||
                                               $opt{inst} eq "0x82" || $opt{inst} eq "0x83" ||
                                               $opt{inst} eq "0x88" || $opt{inst} eq "0x89" ||
                                               $opt{inst} eq "0x8a" || $opt{inst} eq "0x8b")) {
                printf("TTE_P=0, TTE_W=1,  TTE_V=1\n");
            }
            else {
                printf("TTE_P=1, TTE_W=1,  TTE_V=1\n");
            }
        }
        else {
            printf("TTE_P=0, TTE_W=1,  TTE_V=1\n");
        }
    }
    printf("        }\n");
    printf(".data\n");
    printf(".global data_sec%s\n",bigint2hex($data_va));
    printf("normal_addr_range_data%s:\n",bigint2hex($data_va));
    if($dataacc == 0) {
        for (my $i=0; $i<($last_data_va-$data_va)/4; $i++) { 
            printf(".word 0x%x\n", int(rand(0xffffffff)));
        }
    }
    else {
        printf(".skip %d\n", ($last_data_va-$data_va)); 
        printf(".byte 0x%x\n", int(rand(0xff)));
    }

    printf(".end\n");
}


sub gen_high_data_sec() {
    my ($dataacc, $super) = @_;

    printf("SECTION RAND_DATAffffffffffffe000 DATA_VA=0xffffffffffffe000\n");
    printf("attr_data {\n");
    printf("        Name = RAND_DATAffffffffffffe000,\n");
    if($opt{hyper}) {
        printf("hypervisor\n");
    }
    else {
        printf("        RA=0x20010000,\n");
        if($dataacc) {
            printf("        tsbonly,\n");
        }
        else {
            printf("        PA=ra2pa\(0x20010000,0\),\n");
        }
        if($super) {
            printf("        part_0_d_ctx_nonzero_ps0_tsb,\n TTE_Context=PCONTEXT\n");
        }
        else {
            printf("        part_0_d_ctx_nonzero_ps0_tsb,\n TTE_Context=PCONTEXT\n");
        }
        printf("        TTE_G=1, TTE_Size=0x0, TTE_NFO=0,\n");
        printf("        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,\n");
        printf("        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, ");
        if($dataacc) {
            if($opt{super}) {
                printf("TTE_P=0, TTE_W=1,  TTE_V=0\n");
            }
            else {
                printf("TTE_P=1, TTE_W=1,  TTE_V=1\n");
            }
        }
        else {
            printf("TTE_P=0, TTE_W=1,  TTE_V=1\n");
        }
    }
    printf("        }\n");
    printf(".data\n");
    printf(".global data_secffffffffffffe000\n");
    printf("normal_addr_range_dataffffffffffffe000:\n");
    if($dataacc == 0) {
        for (my $i=0; $i<8188/4; $i++) { 
            printf(".word 0x%x\n", int(rand(0xffffffff)));
        }
    }
    else {
        printf(".skip 8180\n");
        printf(".byte 0x%x\n", int(rand(0xff)));
    }

    printf(".end\n");
}

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
    for (my $i=0; $i<1024/4; $i++) { 
            printf(".word 0x%x\n", int(rand(0xffffffff)));
    }
}

sub setup_va_watchpoint() {
    my ($addr, $rd_en, $wr_en) = @_;

    if(($opt{enboff} == 0) && ($opt{hyper} == 0)) {
        printf("ta T_CHANGE_HPRIV\n")
    }
    elsif ($opt{enboff} && ($opt{super} == 0)) {
        printf("ta T_CHANGE_PRIV\n")
    }
    else {
        # hyper mode, or enboff.super mode requires nothing.
    }
    my $tmp_reg_lsu_ctl = &pick_tmp_reg();
    &load_alt("ldxa", 0, 0, $ILLIMM, 0x45, "%r", $tmp_reg_lsu_ctl);
    my $tmp1 = &pick_tmp_reg();
    my $tmp2 = &pick_tmp_reg();
    my $tmp_rst_mask = hex2bigint("0x000fffff");
    &setx($tmp_rst_mask, $tmp1, $tmp2);
    &and_regs($tmp2, $tmp_reg_lsu_ctl, $ILLIMM, $tmp_reg_lsu_ctl);

    my $ctl_reg_mask  = hex2bigint("0x1fe000000");
    $ctl_reg_mask |= ($wr_en << 21);
    $ctl_reg_mask |= ($rd_en << 22);
    &setx($ctl_reg_mask, $tmp1, $tmp2); 
    &or_regs($tmp_reg_lsu_ctl, $tmp2, $ILLIMM, $tmp_reg_lsu_ctl);
    &store_alt("stxa", "%r", $tmp_reg_lsu_ctl, 0, 0, $ILLIMM, 0x45);
 
    #now setup addr
    if($rd_en || $wr_en) { # only then address matters
        my $big_addr = Math::BigInt->new($addr);
        if(($big_addr & 0xfffff000) == 0x1000) {
            my $big_tmp = Math::BigInt->new(0xffffffff);
            $big_tmp <<= 32;
            $big_addr = $big_tmp | 0xffffe000 | $big_addr; 
         }
         &setx($big_addr, $tmp1, $tmp2);
         &mov(0, 0x38, $tmp1);
         &store_alt("stxa", "%r", $tmp2, $tmp1, 0, $ILLIMM, 0x58);
    }
    if(($opt{hyper} == 0) && ($opt{enboff} ==  0)) {
        printf("ta T_CHANGE_NONHPRIV\n")
    }
    elsif ($opt{enboff} && ($opt{super} == 0)) {
        printf("ta T_CHANGE_NONPRIV\n")
    }
    else {
        # hyper mode, or enboff.super mode requires nothing.
    }
    &release_regs($tmp_reg_lsu_ctl, $tmp1, $tmp2);
}

sub setup_tte_entry() {
    my ($addr) = @_;
    
    printf("!func: setup_tte_entry : 0x%x\n", $addr);

    my $err = 0;
    my $tmp1 = &pick_tmp_reg();
    my $tmp2 = &pick_tmp_reg();
    printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
    &setx($addr, $tmp1, $tmp2);
    &load("ldub", $tmp2, 0, $ILLIMM, "%r", 0);
    &release_regs($tmp1, $tmp2);
    printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
}

sub gen_all_ldf() {
    my ($ldf_inst, $next_addr_ref, $next_0addr_ref, $all_dest, $misalgn_offset, $vawatch, $preloadtlb) = @_;

    my $factor = 1;
       $factor = 2 if($ldf_inst eq "ldd" || $ldf_inst eq "ldda");

    my @fdest = ();
    if($all_dest) {
        @fdest = (0..31);
    }
    else {
        @fdest = (0x0, 0x1, 0x2, 0x4, 0x8, 0x10, 0x1f);
    }

    my ($ldf_dest, $rs1, $rs2, $err);
    foreach $ldf_dest (@fdest) {                                        #pick dest freg
        my $dest = $ldf_dest*$factor;
        foreach $rs1 (@walking1_iregs) {                               #mem addr combination rs1
            my @rep_rs2 = (0, $rs1, 31);
            foreach $rs2 (@rep_rs2) {                           #mem addr combination rs2
                my ($imm) = $ILLIMM;
                my $setup_va = &setup_addr_in_rs1_rs2($$next_addr_ref+$misalgn_offset, $rs1, $rs2, $imm, \$err);
                if($err == 0) {
                    if($setup_va == ($$next_addr_ref+$misalgn_offset)) { 
                        $$next_addr_ref += (4*$factor); 
                    }
                    else {
                        push(@$next_0addr_ref, $setup_va);
                    }
                    if($misalgn_offset == 0 || $setup_va != 0) {
                        &setup_tte_entry($setup_va) if($preloadtlb);
                        &setup_va_watchpoint($setup_va, 1, 0) if($vawatch);
                        &load_reg($ldf_inst, $rs1, $rs2, $imm, 0x88, "%f", $dest);
                        &setup_va_watchpoint($setup_va, 0, 0) if($vawatch);
                        printf("\n");
                    }
                }
                &release_all_regs();
            }

            my @rep_imm13 = (0, 0x800, 0x1000, 0x1fc0);
            foreach my $imm (@rep_imm13) {                           #mem addr combination imm
                my $setup_va = &setup_addr_in_rs1_rs2($$next_addr_ref+$misalgn_offset, $rs1, $rs2, $imm+$misalgn_offset, \$err);
                #print("!LDF DEBUG: NEXT_ADDR:$$next_addr_ref, OFFSET:$misalgn_offset, RS1:$rs1, RS2:$rs2, IMM:$imm\n");
                if($err == 0) {
                    if($setup_va == ($$next_addr_ref+$misalgn_offset)) { 
                        $$next_addr_ref += (4*$factor); 
                    }
                    else {
                        push(@$next_0addr_ref, $setup_va);
                    }
                    if($misalgn_offset == 0 || $setup_va != 0) {
                        &setup_tte_entry($setup_va) if($preloadtlb);
                        &setup_va_watchpoint($setup_va, 1, 0) if($vawatch);
                        &load_reg($ldf_inst, $rs1, $rs2, $imm+$misalgn_offset, 0x88, "%f", $dest);
                        &setup_va_watchpoint($setup_va, 0, 0) if($vawatch);
                        printf("\n");
                    }
                }
                &release_all_regs();
            }
        }

        foreach $rs2 (@walking1_iregs) {                               #mem addr combination rs1
            my @rep_rs1 = (0, $rs2, 31);
            foreach $rs1 (@rep_rs1) {                           #mem addr combination rs2
                my ($imm) = $ILLIMM;
                my $setup_va = &setup_addr_in_rs1_rs2($$next_addr_ref+$misalgn_offset, $rs1, $rs2, $imm, \$err);
                if($err == 0) {
                    if($setup_va == ($$next_addr_ref+$misalgn_offset)) { 
                        $$next_addr_ref += (4*$factor); 
                    }
                    else {
                        push(@$next_0addr_ref, $setup_va);
                    }
                    if($misalgn_offset == 0 || $setup_va != 0) {
                        &setup_tte_entry($setup_va) if($preloadtlb);
                        &setup_va_watchpoint($setup_va, 1, 0) if($vawatch);
                        &load_reg($ldf_inst, $rs1, $rs2, $imm, 0x88, "%f", $dest);
                        &setup_va_watchpoint($setup_va, 0, 0) if($vawatch);
                        printf("\n");
                    }
                }
                &release_all_regs();
            }
        }

        foreach my $imm (@walking1_imm13) {                               #mem addr combination rs1
            my @rep_rs1 = (0, 31);
            foreach $rs1 (@rep_rs1) {                           #mem addr combination rs2
                if($rs1 == 0 && ($imm & 0x3f)) {
                    #skip
                }
                else {
                    my $setup_va = &setup_addr_in_rs1_rs2($$next_addr_ref+$misalgn_offset, $rs1, $rs2, $imm+$misalgn_offset, \$err);
                    if($err == 0) {
                        if($setup_va == ($$next_addr_ref+$misalgn_offset)) { 
                            $$next_addr_ref += (4*$factor); 
                        }
                        else {
                            push(@$next_0addr_ref, $setup_va);
                        }
                        if($misalgn_offset == 0 || $setup_va != 0) {
                            &setup_tte_entry($setup_va) if($preloadtlb);
                            &setup_va_watchpoint($setup_va, 1, 0) if($vawatch);
                            &load_reg($ldf_inst, $rs1, $rs2, $imm+$misalgn_offset, 0x88, "%f", $dest);
                            &setup_va_watchpoint($setup_va, 0, 0) if($vawatch);
                            printf("\n");
                        }
                    }
                    &release_all_regs();
                }
            }
        }
    }
}


sub gen_all_fbfcc() {
    my ($th_id, $inst, $inst_group) = @_;
    foreach my $taken (0..1) {
        foreach my $cc_combo (0..3) {
            my $setup_ok = &setup_fcc_for_fbpfcc($inst, $inst_group, $taken, 0, $cc_combo, $th_id);
            if($setup_ok) {
                foreach my $annul (0..1) {
                    foreach my $target (@imm22_targets) {
                        &gen_fbpfcc($inst, $inst_group, $annul, 0, 0, $cc_combo, $target, $taken, $th_id);
                    }
                }
            }
        }
    }
}

sub gen_all_fbpfcc() {
    my ($th_id, $inst, $inst_group) = @_;
    foreach my $taken (0..1) {
        foreach my $which_fcc (0..3) {
            foreach my $cc_combo (0..3) {
                my $setup_ok = &setup_fcc_for_fbpfcc($inst, $inst_group, $taken, $which_fcc, $cc_combo, $th_id);
                if($setup_ok) {
                    foreach my $ptn (0..1) {
                        foreach my $annul (0..1) {
                            foreach my $target (@imm19_targets) {
                                &gen_fbpfcc($inst, $inst_group, $annul, $ptn, $which_fcc, $cc_combo, $target, $taken, $th_id);
                            }
                        }
                    }
                }
            }
        }
    }
}

sub gen_fbpfcc() {
    my ($inst, $inst_group, $annul, $ptn, $which_fcc, $cc_combo, $target, $taken, $th_id) = @_;

    return if(($taken == 0) && ($opt{fpdis} == 0) && ($inst eq "fba"));
    return if(($taken == 1) && ($opt{fpdis} == 0) && ($inst eq "fbn"));

    my $target_limit = 0x200000;
    $target_limit = 0x40000 if($inst_group eq "fbpfcc");

    if($taken && ($opt{fpdis} == 0) && $target == 0) {
        #taken branch on self will be inf-loop
    }
    else {
        if($target & $target_limit) {
            printf("setx th%d_nxt_%s_fcc%x_combo%x_ptn%x_a%x_t%x_tgt%x, %%g2, %%g3\n", $th_id, $inst, $which_fcc, $cc_combo,  
                    $ptn, $annul, $taken, $target);
            printf("th%d_tgt_%s_fcc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_fcc, $cc_combo, $ptn, $annul, $taken, $target);
            printf("jmp %%g3\n");
            printf("nop\n");
        }

        printf("th%d_nxt_%s_fcc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_fcc, $cc_combo, $ptn, $annul, $taken, $target);
        printf("th%d_tgt_%s_fcc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_fcc, $cc_combo, $ptn, $annul, $taken, $target) if($target == 0);
        if($target & $target_limit) {
            printf("add %%g3, 0xc, %%g3\n");
        }
        printf("%s", $inst);
        printf(",a")  if($annul);
        printf(",pt") if($ptn == 1 && ($inst_group eq "fbpfcc"));
        printf(",pn") if($ptn == 0 && ($inst_group eq "fbpfcc"));
        printf(" %%fcc%d, ", $which_fcc) if($inst_group eq "fbpfcc"); 
        printf(" th%d_tgt_%s_fcc%x_combo%x_ptn%x_a%x_t%x_tgt%x\n", $th_id, $inst, $which_fcc, $cc_combo, $ptn, $annul, $taken, $target);
        if($target == 1) {
            printf("th%d_tgt_%s_fcc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_fcc, $cc_combo, $ptn, $annul, $taken, $target);
            printf("nop ! delay slot & branch target\n");
            printf("\n");
        }
        else {
            if(($inst eq "fba" || $inst eq "fbn") && $annul && ($opt{fpdis} == 0)) {
                #eat annuled instr(make it illegal)
                printf(".word 0x0\n");
            }
            elsif(($taken == 0) && $annul && ($opt{fpdis} == 0)) {
                #eat annuled instr(make it illegal)
                printf(".word 0x0\n");
            }
            else {
                printf("nop ! delay slot\n");
            }
            if(($target != 0) && (($target & $target_limit) == 0)) { 
                if(($target > 2) && (($taken == 0) || $opt{fpdis})) {
                    printf("call th%d_tgt_%s_fcc%x_combo%x_ptn%x_a%x_t%x_tgt%x\n", $th_id, $inst, $which_fcc, $cc_combo, $ptn, $annul, $taken, $target);
                    printf("nop\n");
                    printf(".skip %d\n", ($target-4)*4) if($target > 4);
                }
                else {
                    printf(".skip %d\n", ($target-2)*4) if($target > 2);
                }
                printf("th%d_tgt_%s_fcc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_fcc, $cc_combo, $ptn, $annul, $taken, $target);
                printf("nop ! branch target\n");
            }
            printf("\n");
        }
    }
}

sub setup_fcc_for_fbpfcc() {
    my ($inst, $inst_group, $taken, $which_fcc, $cc_combo, $th_id) = @_;

    my $ext_on = 0;
    $ext_on = 1 if($inst_group eq "fbpfcc");

    my $value  = $cc_combo;
    my $cc_E   = 0;
    my $cc_L   = 1;
    my $cc_G   = 2;
    my $cc_U   = 3;

    if($inst eq "fba" || $inst eq "fbn") {
        # all cc-combos are ok
    }
    elsif($inst eq "fbu") {
        return 0 if(($taken == 1) && ($value != $cc_U));
        return 0 if(($taken == 0) && ($value == $cc_U));
    }
    elsif($inst eq "fbg") {
        return 0 if(($taken == 1) && ($value != $cc_G));
        return 0 if(($taken == 0) && ($value == $cc_G));
    }
    elsif($inst eq "fbug") {
        return 0 if(($taken == 1) && (($value != $cc_U) && ($value != $cc_G)));
        return 0 if(($taken == 0) && (($value == $cc_U) || ($value == $cc_G)));
    }
    elsif($inst eq "fbl") {
        return 0 if(($taken == 1) && ($value != $cc_L));
        return 0 if(($taken == 0) && ($value == $cc_L));
    }
    elsif($inst eq "fbul") {
        return 0 if(($taken == 1) && (($value != $cc_L) && ($value != $cc_U)));
        return 0 if(($taken == 0) && (($value == $cc_L) || ($value == $cc_U)));
    } 
    elsif($inst eq "fblg") {
        return 0 if(($taken == 1) && (($value != $cc_L) && ($value != $cc_G)));
        return 0 if(($taken == 0) && (($value == $cc_L) || ($value == $cc_G)));
    } 
    elsif($inst eq "fbne") {
        return 0 if(($taken == 1) && (($value != $cc_L) && ($value != $cc_G) && ($value != $cc_U)));
        return 0 if(($taken == 0) && (($value == $cc_L) || ($value == $cc_G) || ($value == $cc_U)));
    }
    elsif($inst eq "fbe") {
        return 0 if(($taken == 1) && ($value != $cc_E));
        return 0 if(($taken == 0) && ($value == $cc_E));
    }
    elsif($inst eq "fbue") {
        return 0 if(($taken == 1) && (($value != $cc_U) && ($value != $cc_E)));
        return 0 if(($taken == 0) && (($value == $cc_U) || ($value == $cc_E)));
    }
    elsif($inst eq "fbge") {
        return 0 if(($taken == 1) && (($value != $cc_G) && ($value != $cc_E)));
        return 0 if(($taken == 0) && (($value == $cc_G) || ($value == $cc_E)));
    }
    elsif($inst eq "fbuge") {
        return 0 if(($taken == 1) && (($value != $cc_U) && ($value != $cc_G) && ($value != $cc_E)));
        return 0 if(($taken == 0) && (($value == $cc_U) || ($value == $cc_G) || ($value == $cc_E)));
    }
    elsif($inst eq "fble") {
        return 0 if(($taken == 1) && (($value != $cc_E) && ($value != $cc_L)));
        return 0 if(($taken == 0) && (($value == $cc_E) || ($value == $cc_L)));
    }
    elsif($inst eq "fbule") {
        return 0 if(($taken == 1) && (($value != $cc_E) && ($value != $cc_L) && ($value != $cc_U)));
        return 0 if(($taken == 0) && (($value == $cc_E) || ($value == $cc_L) || ($value == $cc_U)));
    }
    elsif($inst eq "fbo") {
        return 0 if(($taken == 1) && (($value != $cc_E) && ($value != $cc_L) && ($value != $cc_G)));
        return 0 if(($taken == 0) && (($value == $cc_E) || ($value == $cc_L) || ($value == $cc_G)));
    }
    else {
        printf("ERROR: bad instruction type\n");
        return 0;
    }
    my $others = (~$value) & 0x3;

    if($which_fcc == 0) {
        &setup_xfsr_fcc($ext_on, $others, $others, $others, $value, $th_id);
    }
    if($which_fcc == 1) {
        &setup_xfsr_fcc($ext_on, $others, $others, $value, $others, $th_id);
    }
    if($which_fcc == 2) {
        &setup_xfsr_fcc($ext_on, $others, $value, $others, $others, $th_id);
    }
    if($which_fcc == 3) {
        &setup_xfsr_fcc($ext_on, $value,  $others, $others, $others, $th_id);
    }
    return 1;
}

sub setup_xfsr_fcc() {
    my ($ext_on, $fcc3, $fcc2, $fcc1, $fcc0, $th_id) = @_;

    my $big_value     = Math::BigInt->new(($fcc3<<4) | ($fcc2<<2) | ($fcc1));
    $big_value      <<=32 ;
    $big_value       |= ($fcc0<<10); 

    if($ext_on) {
        printf("stx %%fsr, [%%g0+%d]\n", $th_id*8);
    }
    else {
        printf("st  %%fsr, [%%g0+%d]\n", $th_id*4);
    }
    my $tmp_fsr = &pick_tmp_reg();
    if($ext_on) {
        printf("ldx [%%g0+%d], %%r%d\n", $th_id*8, $tmp_fsr);
    }
    else {
        printf("ld  [%%g0+%d], %%r%d\n", $th_id*4, $tmp_fsr);
    }
    my $tmp1 = &pick_tmp_reg();
    my $tmp2 = &pick_tmp_reg();
    &setx(0xfffff3ff, $tmp1, $tmp2);
    &and_regs($tmp_fsr, $tmp2, $ILLIMM, $tmp_fsr);
    &setx($big_value, $tmp1, $tmp2);
    &or_regs($tmp_fsr, $tmp2, $ILLIMM, $tmp_fsr);
    if($ext_on) {
        printf("stx %%r%d, [%%g0+%d]\n", $tmp_fsr, $th_id*8);
        printf("ldx [%%g0+%d], %%fsr\n", $th_id*8);
    }
    else {
        printf("st  %%r%d, [%%g0+%d]\n", $tmp_fsr, $th_id*4);
        printf("ld  [%%g0+%d], %%fsr\n", $th_id*4);
    }
    &release_regs($tmp_fsr, $tmp1, $tmp2);
}



sub gen_all_bicc() {
    my ($th_id, $inst, $inst_group) = @_;
    foreach my $taken (0..1) {
        my @cc_combo_range = (0..15);
        foreach my $cc_combo (@cc_combo_range) {
            my $setup_ok = &setup_cc_for_bpcc($inst, $inst_group, $taken, 0, $cc_combo, $th_id);
            if($setup_ok) {
                foreach my $annul (0..1) {
                    foreach my $target (@imm22_targets) {
                        &gen_bpcc($inst, $inst_group, $annul, 0, 0, $cc_combo, $target, $taken, $th_id);
                    }
                }
            }
        }
    }
}

sub gen_all_bpcc() {
    my ($th_id, $inst, $inst_group) = @_;

    foreach my $taken (0..1) {
        my @cc = (0,2);
           @cc = (1,3) if($opt{illinst});
        foreach my $which_cc (@cc) {
            my @cc_combo_range = (0..15);
            foreach my $cc_combo (@cc_combo_range) {
                my $setup_ok = &setup_cc_for_bpcc($inst, $inst_group, $taken, $which_cc, $cc_combo, $th_id);
                if($setup_ok) {
                    foreach my $ptn (0..1) {
                        foreach my $annul (0..1) {
                            foreach my $target (@imm19_targets) {
                                &gen_bpcc($inst, $inst_group, $annul, $ptn, $which_cc, $cc_combo, $target, $taken, $th_id);
                            }
                        }
                    }
                }
            }
        }
    }
}

sub gen_bpcc() {
    my ($inst, $inst_group, $annul, $ptn, $which_cc, $cc_combo, $target, $taken, $th_id) = @_;

    my %bpcc_cond = (
                   ba     => 0x8, bn     => 0x0, bne    => 0x9, be    => 0x1, bg     => 0xa,  
                   ble    => 0x2, bge    => 0xb, bl     => 0x3, bgu   => 0xc, bleu   => 0x4, 
                   bcc    => 0xd, bcs    => 0x5, bpos   => 0xe, bneg  => 0x6, bvc    => 0xf, 
                   bvs    => 0x7
                );

    return if(($taken == 0) && ($opt{illinst} == 0) && ($inst eq "ba"));
    return if(($taken == 1) && ($opt{illinst} == 0) && ($inst eq "bn"));

    my $target_limit = 0x200000;
    $target_limit = 0x40000 if($inst_group eq "bpcc");

    if($taken && ($opt{illinst} == 0) && $target == 0) {
        #taken branch on self will be inf-loop
    }
    else {
        if($target & $target_limit) {
            printf("setx th%d_nxt_%s_cc%x_combo%x_ptn%x_a%x_t%x_tgt%x, %%g2, %%g3\n", $th_id, $inst, $which_cc, $cc_combo,
                    $ptn, $annul, $taken, $target);
            printf("th%d_tgt_%s_cc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_cc, $cc_combo, $ptn, $annul, $taken, $target);
            printf("jmp %%g3\n");
            printf("nop\n");
        }

        printf("th%d_nxt_%s_cc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_cc, $cc_combo, $ptn, $annul, $taken, $target);
        printf("th%d_tgt_%s_cc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_cc, $cc_combo, $ptn, $annul, $taken, $target) if($target == 0);
        if($target & $target_limit) {
            printf("add %%g3, 0xc, %%g3\n");
        }
        if($opt{illinst}) {
            my $inst_word = (($annul & 0x1)<<29) | (($bpcc_cond{$inst} & 0xf)<<25) | (0x1<<22) | (($which_cc & 0x3)<<20) |
                            (($ptn   & 0x1)<<19) | ($target & 0x7ffff);
            printf(".word 0x%x\n", $inst_word);
        }
        else {
            printf("%s", $inst);
            printf(",a")  if($annul);
            printf(",pt") if($ptn == 1 && ($inst_group eq "bpcc"));
            printf(",pn") if($ptn == 0 && ($inst_group eq "bpcc"));
            if($inst_group eq "bpcc") {
                printf(" %%icc, ") if($which_cc == 0); 
                printf(" %%xcc, ") if($which_cc == 2); 
            }
            printf(" th%d_tgt_%s_cc%x_combo%x_ptn%x_a%x_t%x_tgt%x\n", $th_id, $inst, $which_cc, $cc_combo, $ptn, $annul, $taken, $target);
        }
        if($target == 1) {
            printf("th%d_tgt_%s_cc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_cc, $cc_combo, $ptn, $annul, $taken, $target);
            printf("nop ! delay slot & branch target\n");
            printf("\n");
        }
        else {
            if(($inst eq "ba" || $inst eq "bn") && $annul && ($opt{illinst} == 0)) {
                #eat annuled instr(make it illegal)
                printf(".word 0x0\n");
            }
            elsif(($taken == 0) && $annul && ($opt{illinst} == 0)) {
                #eat annuled instr(make it illegal)
                printf(".word 0x0\n");
            }
            else {
                printf("nop ! delay slot\n");
            }
            if(($target != 0) && (($target & $target_limit) == 0)) { 
                if(($target > 2) && (($taken == 0) || $opt{illinst})) {
                    printf("call th%d_tgt_%s_cc%x_combo%x_ptn%x_a%x_t%x_tgt%x\n", $th_id, $inst, $which_cc, $cc_combo, $ptn, $annul, $taken, $target);
                    printf("nop\n");
                    printf(".skip %d\n", ($target-4)*4) if($target > 4);
                }
                else {
                    printf(".skip %d\n", ($target-2)*4) if($target > 2);
                }
                printf("th%d_tgt_%s_cc%x_combo%x_ptn%x_a%x_t%x_tgt%x:\n", $th_id, $inst, $which_cc, $cc_combo, $ptn, $annul, $taken, $target);
                printf("nop ! branch target\n");
            }
            printf("\n");
        }
    }
}

sub setup_cc_for_bpcc() {
    my ($inst, $inst_group, $taken, $which_cc, $cc_combo, $th_id) = @_;

    my $ext_on = 0;
    $ext_on = 1 if($inst_group eq "bpcc");

    my $cc   = $cc_combo;
    my $cc_C = ($cc_combo & 0x1);
    my $cc_V = ($cc_combo & 0x2)>>1;
    my $cc_Z = ($cc_combo & 0x4)>>2;
    my $cc_N = ($cc_combo & 0x8)>>3;

    if($inst eq "ba" || $inst eq "bn") {
        # all cc combos are ok
    }
    elsif($inst eq "bne") {
        return 0 if (($taken == 1) && ($cc_Z == 1));
        return 0 if (($taken == 0) && ($cc_Z == 0));
    }
    elsif($inst eq "be") {
        return 0 if (($taken == 1) && ($cc_Z == 0));
        return 0 if (($taken == 0) && ($cc_Z == 1));
    }
    elsif($inst eq "bg") {
        return 0 if (($taken == 1) && ( ($cc_Z == 1) || 
                                        (($cc_N == 1) && ($cc_V == 0)) ||
                                        (($cc_N == 0) && ($cc_V == 1)) ) );
        return 0 if (($taken == 0) && ( ($cc_Z == 0) && 
                                        (($cc_N == 1) && ($cc_V == 1)) ||
                                        (($cc_N == 0) && ($cc_V == 0)) ) );
    }
    elsif($inst eq "ble") {
        return 0 if (($taken == 1) && ( ($cc_Z == 0) && 
                                        (($cc_N == 1) && ($cc_V == 1)) ||
                                        (($cc_N == 0) && ($cc_V == 0)) ) );
        return 0 if (($taken == 0) && ( ($cc_Z == 1) || 
                                        (($cc_N == 1) && ($cc_V == 0)) ||
                                        (($cc_N == 0) && ($cc_V == 1)) ) );
    }
    elsif($inst eq "bge") {
        return 0 if (($taken == 1) && ( (($cc_N == 1) && ($cc_V == 0)) ||
                                        (($cc_N == 0) && ($cc_V == 1)) ) );
        return 0 if (($taken == 0) && ( (($cc_N == 1) && ($cc_V == 1)) ||
                                        (($cc_N == 0) && ($cc_V == 0)) ) );
    }
    elsif($inst eq "bl") {
        return 0 if (($taken == 1) && ( (($cc_N == 1) && ($cc_V == 1)) ||
                                        (($cc_N == 0) && ($cc_V == 0)) ) );
        return 0 if (($taken == 0) && ( (($cc_N == 1) && ($cc_V == 0)) ||
                                        (($cc_N == 0) && ($cc_V == 1)) ) );
    }
    elsif($inst eq "bgu") {
        return 0 if (($taken == 1) && (($cc_C == 1) || ($cc_Z == 1)));
        return 0 if (($taken == 0) && (($cc_C == 0) && ($cc_Z == 0)));
    }
    elsif($inst eq "bleu") {
        return 0 if (($taken == 1) && (($cc_C == 0) && ($cc_Z == 0)));
        return 0 if (($taken == 0) && (($cc_C == 1) || ($cc_Z == 1)));
    }
    elsif($inst eq "bcc") {
        return 0 if (($taken == 1) && ($cc_C == 1));
        return 0 if (($taken == 0) && ($cc_C == 0));
    }
    elsif($inst eq "bcs") {
        return 0 if (($taken == 1) && ($cc_C == 0));
        return 0 if (($taken == 0) && ($cc_C == 1));
    }
    elsif($inst eq "bpos") {
        return 0 if (($taken == 1) && ($cc_N == 1));
        return 0 if (($taken == 0) && ($cc_N == 0));
    }
    elsif($inst eq "bneg") {
        return 0 if (($taken == 1) && ($cc_N == 0));
        return 0 if (($taken == 0) && ($cc_N == 1));
    }
    elsif($inst eq "bvc") {
        return 0 if (($taken == 1) && ($cc_V == 1));
        return 0 if (($taken == 0) && ($cc_V == 0));
    }
    elsif($inst eq "bvs") {
        return 0 if (($taken == 1) && ($cc_V == 0));
        return 0 if (($taken == 0) && ($cc_V == 1));
    }
    else {
        printf("ERROR: unknown instruction\n");
    }

    if($which_cc == 0 || $which_cc == 1) {
        &setup_cc($ext_on, ((~$cc)&0xf), $cc, $th_id);
    }
    if($which_cc == 2 || $which_cc == 3) {
        &setup_cc($ext_on, $cc, ((~$cc)&0xf), $th_id);
    }
    return 1;
}

sub setup_cc() {
    my ($ext_on, $xcc, $icc, $th_id) = @_;

    my $value = ($xcc<<4) | $icc;

    printf("wr %%g0, 0x%x, %%ccr\n", $value);
}

my @asi_lda_insts = ("ldsba", "ldsha", "ldswa", "lduba", "lduha", "lduwa", 
                    "ldxa",  "ldda",  "ldaf",  "lddaf", "ldqaf", "prefetcha");  

my @asi_sta_insts = ("stba", "stha",  "stwa",  "stxa", "stda", 
                    "staf", "stdaf", "stqaf", "casa", "casxa", "ldstuba", "swapa");  

my $big_va  = Math::BigInt->new(0xc0);
$big_va   <<=32;
#my @asi_va_addrs = (0x0);
my @asi_va_addrs = (0x0, $big_va);

my %asi_spc_traps = (
                       0x15 => ("P:casa:dataacc,P:casxa:dataacc"),   # Real_IO
                       0x1d => ("P:casa:dataacc,P:casxa:dataacc"),   # Real_IO_L

                       0x16 => ("N:stdaf:dataacc,N:lddaf:dataacc"),  # BLK_LOAD_P
                       0x17 => ("N:stdaf:dataacc,N:lddaf:dataacc"),  # BLK_LOAD_S
                       0x1e => ("N:stdaf:dataacc,N:lddaf:dataacc"),  # BLK_LOAD_P_L
                       0x1f => ("N:stdaf:dataacc,N:lddaf:dataacc"),  # BLK_LOAD_S_L

                       0x66 => ("N:stxa:dataacc,N:stdaf:dataacc,N:ldxa:dataacc"),   # ICACHE_INSTR
                       0x67 => ("N:stxa:dataacc,N:stdaf:dataacc,N:ldxa:dataacc"),   # ICACHE_TAG

                       0x24 => ("N:ldda:dataacc"),  # QUAD_LDDA
                       0x26 => ("N:ldda:dataacc"),  # QUAD_LDDA
                       0x2c => ("N:ldda:dataacc"),  # QUAD_LDDA
                       0x2e => ("N:ldda:dataacc"),  # QUAD_LDDA

                       0x45 => ("N:stxa:dataacc,N:ldxa:dataacc"),  # LSU_CTL
                       0x4c => ("N:stxa:dataacc,N:ldxa:dataacc"),  # SPARC_ERROR_STATUS

                       0x22 => ("N:stba:dataacc,N:stha:dataacc,N:stwa:dataacc,N:stxa:dataacc,N:stda:dataacc,N:ldda:dataacc"),  # BLK_INIT
                       0x23 => ("N:stba:dataacc,N:stha:dataacc,N:stwa:dataacc,N:stxa:dataacc,N:stda:dataacc,N:ldda:dataacc"),  # BLK_INIT
                       0x2a => ("N:stba:dataacc,N:stha:dataacc,N:stwa:dataacc,N:stxa:dataacc,N:stda:dataacc,N:ldda:dataacc"),  # BLK_INIT
                       0x2b => ("N:stba:dataacc,N:stha:dataacc,N:stwa:dataacc,N:stxa:dataacc,N:stda:dataacc,N:ldda:dataacc"),  # BLK_INIT
                       0xe2 => ("N:stba:dataacc,N:stha:dataacc,N:stwa:dataacc,N:stxa:dataacc,N:stda:dataacc,N:ldda:dataacc"),  # BLK_INIT
                       0xe3 => ("N:stba:dataacc,N:stha:dataacc,N:stwa:dataacc,N:stxa:dataacc,N:stda:dataacc,N:ldda:dataacc"),  # BLK_INIT
                       0xea => ("N:stba:dataacc,N:stha:dataacc,N:stwa:dataacc,N:stxa:dataacc,N:stda:dataacc,N:ldda:dataacc"),  # BLK_INIT
                       0xeb => ("N:stba:dataacc,N:stha:dataacc,N:stwa:dataacc,N:stxa:dataacc,N:stda:dataacc,N:ldda:dataacc"),  # BLK_INIT

                       0x82 => ("P:stba:dataacc,P:stha:dataacc,P:stwa:dataacc,P:stxa:dataacc,P:stda:dataacc,P:staf:dataacc," . 
                                "P:stdaf:dataacc,P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),           # NFO
                       0x83 => ("P:stba:dataacc,P:stha:dataacc,P:stwa:dataacc,P:stxa:dataacc,P:stda:dataacc,P:staf:dataacc," . 
                                "P:stdaf:dataacc,P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),           # NFO
                       0x8a => ("P:stba:dataacc,P:stha:dataacc,P:stwa:dataacc,P:stxa:dataacc,P:stda:dataacc,P:staf:dataacc," . 
                                "P:stdaf:dataacc,P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),           # NFO
                       0x8b => ("P:stba:dataacc,P:stha:dataacc,P:stwa:dataacc,P:stxa:dataacc,P:stda:dataacc,P:staf:dataacc," . 
                                "P:stdaf:dataacc,P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),           # NFO

                       0xf0 => ("N:stdaf:dataacc,N:lddaf:dataacc"),  # BLK_P
                       0xf1 => ("N:stdaf:dataacc,N:lddaf:dataacc"),  # BLK_S
                       0xf8 => ("N:stdaf:dataacc,N:lddaf:dataacc"),  # BLK_PL
                       0xf9 => ("N:stdaf:dataacc,N:lddaf:dataacc")   # BLK_SL
                    );

my %asi_io_space_traps = (
                       0x4  => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIN
                       0xc  => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIN
                       0x10 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x11 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUS
                       0x18 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x19 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUS
                       0x2a => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x2b => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUS
                       0x14 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # REAL_MEM
                       0x1c => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x80 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x81 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x82 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x83 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x88 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x89 => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x8a => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc"),   # AIUP
                       0x8b => ("P:casa:dataacc,P:casxa:dataacc,P:ldstuba:dataacc,P:swapa:dataacc")    # AIUP
                    );

my %asi_rbw = (
                   0x42 => ("stxa,stdaf"),  # ASI_BIST_CONTROL
                   0x43 => ("stxa,stdaf"),  # ASI_ERR_INJECT
                   0x44 => ("stxa,stdaf"),  # ASI_STRM_CTL
                   0x73 => ("stxa,stdaf"),  # ASI_SWVR_UDB_INTR_W
                   0x45 => ("stxa,stdaf")   # ASI_LSU_CTL_REG
              );

my %store_rbw_inst = (
                         stxa  => "ldxa",
                         stdaf => "ldda"
                     );

my %trap_decode = (
                       illinst => 0x10,
                       dataacc => 0x30
                  );

my %external_asi = (
                       0x4  => 1, 0xc  => 1, 0x10 => 1, 0x11 => 1, 0x18 => 1, 0x19 => 1, 
                       0x80 => 1, 0x81 => 1, 0x82 => 1, 0x83 => 1, 0x88 => 1, 0x89 => 1, 0x8a => 1, 0x8b => 1,
                       0x14 => 1, 0x15 => 1, 0x16 => 1, 0x17 => 1, 0x1c => 1, 0x1d => 1, 0x1e => 1, 0x1f => 1,
                       0x22 => 1, 0x23 => 1, 0x24 => 1, 0x26 => 1, 0x27 => 1, 0x2a => 1, 0x2b => 1, 0x2c => 1,
                       0x2e => 1, 0x2f => 1, 0xe2 => 1, 0xe3 => 1, 0xea => 1, 0xeb => 1, 0xf0 => 1, 0xf1 => 1,
                       0xf8 => 1, 0xf9 => 1
                   );


sub read_before_write() {
    my ($asi, $inst) = @_;
    my ($rbw_inst);
    if($opt{hyper} || ($opt{super} && $opt{enboff})) {
    }
    else {
        return 0;
    }
    foreach my $rbw (split(/,/, $asi_rbw{$asi})) {
        ($rbw_inst) = split(/:/, $rbw);
        if($rbw_inst eq $inst) {
            return 1;
        }
    }
    return 0;
}

sub enable_trap() {
    my ($asi, $inst) = @_;
    my $neg_dec_vld = 1;
    my ($pos,$trap_inst,$trap_type);
    foreach my $traps (split(/,/, $asi_spc_traps{$asi})) {
        ($pos,$trap_inst,$trap_type) = split(/:/, $traps);
        if($pos eq "P") {
            if($trap_inst eq $inst) {
                &enable_trap_type($trap_type);
                return 1;
            }
        }
        else {
            if($trap_inst eq $inst) {
                $neg_dec_vld = 0;
            }
        }
    }
    if($pos eq "N" && $neg_dec_vld) {
        &enable_trap_type($trap_type);
        return 1;
    }
    return 0;
}


sub enable_io_space_traps() {
    my ($asi, $inst) = @_;
    my $neg_dec_vld = 1;
    my ($pos,$trap_inst,$trap_type);

    foreach my $traps (split(/,/, $asi_io_space_traps{$asi})) {
        ($pos,$trap_inst,$trap_type) = split(/:/, $traps);
        if($pos eq "P") {
            if($trap_inst eq $inst) {
                &enable_trap_type($trap_type);
                return 1;
            }
        }
        else {
            if($trap_inst eq $inst) {
                $neg_dec_vld = 0;
            }
        }
    }
    if($pos eq "N" && $neg_dec_vld) {
        &enable_trap_type($trap_type);
        return 1;
    }
    return 0;

}

sub enable_trap_type() {
    my ($trap) = @_;
    printf("set 0x%x, %%o0\n", $trap_decode{$trap});
    printf("set  0xff, %%o1\n");
    if($opt{enboff}) {
        printf("ta  T_TRAP_EN_N_TIMES\n");
    }
    else {
        printf("ta  T_HTRAP_EN_N_TIMES\n");
    }
}

sub gen_all_asi_insts() {
    my ($th_id, $asi_str) = @_;
    my $asi = hex($asi_str);

    &lock_regs(16);
    my $tmp1 = &pick_tmp_reg();
    my $tmp2 = &pick_tmp_reg();
    my $tmp3 = &pick_tmp_reg();
    
    &setx_label("scratch_mem", $tmp1, $tmp2);
    printf("ldx [%%r%d+%d], %%r16\n", $tmp2, ($th_id*2*64));
    printf("ldx [%%r%d+%d], %%r17\n", $tmp2, ($th_id*2*64)+8);
    for(my $i=0; $i<8; $i++) {
        printf("ldd [%%r%d+%d], %%f%d\n", $tmp2, ((($th_id*2)+1)*64+($i*8)), (16+$i*2));
    }
    if($asi == 0x4c) {
        &setx_label("0xffffffffffffffff", $tmp1, 16);
    }

    foreach my $va (@asi_va_addrs) {
        if($va >> 39) { # this is an io space.
            &setx($va, $tmp1, $tmp3);
            printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
            printf("wr %%g0, 0x14, %%asi\n");
            printf("stxa %%r16, [%%r%d+%d] %asi\n", $tmp3, ($th_id*2*64));
            printf("stxa %%r17, [%%r%d+%d] %asi\n", $tmp3, ($th_id*2*64)+8);
            for(my $i=0; $i<8; $i++) {
                printf("stda %%f%d, [%%r%d+%d] %asi\n", (16+$i*2), $tmp3, ((($th_id*2)+1)*64+($i*8)));
            }
            printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
        }
    }
    
    my $va_offset = 0;
    $va_offset = ($th_id*2*64) if($external_asi{$asi});

    my @asi_modes = ("normal",   "redbit_on",          "ambit_on",          "redbit_on_ambit_on", 
                     "oor_addr", "oor_addr_redbit_on", "oor_addr_ambit_on", "oor_addr_redbit_on_ambit_on", 
                     "dtlb_off", "dtlb_off_redbit_on", "dtlb_off_ambit_on", "dtlb_off_redbit_on_ambit_on", 
                     "oor_addr_dtlb_off", "oor_addr_dtlb_off_redbit_on", "oor_addr_dtlb_off_ambit_on", 
                     "oor_addr_dtlb_off_redbit_on_ambit_on");
    #my @asi_modes = ("normal",   "redbit_on", "oor_addr", "oor_addr_redbit_on",  "dtlb_off", "dtlb_off_redbit_on", 
    #                 "oor_addr_dtlb_off", "oor_addr_dtlb_off_redbit_on");
    foreach my $asi_mode (@asi_modes) {
        if($asi_mode =~ /dtlb_off/) {
            printf("mov 0x1, %%o7\n");
            printf("ta T_HTRAP_INST0\n"); 
        }
        else {
            printf("mov 0x2, %%o7\n");
            printf("ta T_HTRAP_INST0\n"); 
        }
        if($asi_mode =~ /redbit_on/) {
            printf("mov 0x8, %%o7\n");
            printf("ta T_HTRAP_INST0\n"); 
        }
        else {
            printf("mov 0x4, %%o7\n");
            printf("ta T_HTRAP_INST0\n"); 
        }
        if($asi_mode =~ /ambit_on/) {
            printf("!turn on AM bit\n");
            printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
            printf("rdpr %%pstate, %%r%d\n", $tmp1);
            printf("or %%r%d, 0x8, %%r%d\n", $tmp1, $tmp1);
            printf("wrpr %%r%d, 0x0, %%pstate\n", $tmp1);
            printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
        }
        else {
            printf("!turn off AM bit\n");
            printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
            printf("rdpr %%pstate, %%r%d\n", $tmp1);
            printf("or %%r%d, 0x8, %%r%d\n", $tmp1, $tmp1);
            printf("wrpr %%r%d, 0x8, %%pstate\n", $tmp1);
            printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
        }
        my $oor_va = 0x0;
        if($asi_mode =~ /oor_addr/) {
            $oor_va  = Math::BigInt->new(0x10000);
            $oor_va   <<=32;
        }
        foreach my $va (@asi_va_addrs) {
            &setx($va|$oor_va, $tmp2, $tmp1);
            foreach my $stinst (@asi_sta_insts) {
                my $trap_enabled = 0;
                if($stinst eq "stqaf") {
                    $trap_enabled = &enable_trap_type("illinst");
                }
                else {
                    $trap_enabled = &enable_trap($asi, $stinst) if($opt{seltrap});
                }
                if($trap_enabled == 0 && (($va>>39)&0x1)) {
                    $trap_enabled = &enable_io_space_traps($asi, $stinst);
                }
                if($external_asi{$asi} == undef && $stinst eq "stdaf") {
                    #skip this HACK
                }
                else {
                my $inst = $stinst;
                my $src_type = "%r";
                $src_type = "%f" if($stinst eq "staf" || $stinst eq "stdaf" || $stinst eq "stqaf");
                $src_type = ""   if($stinst eq "prefetcha");
                $inst =~ s/(.*)f$/$1/g if($stinst eq "staf" || $stinst eq "stdaf" || $stinst eq "stqaf");

                if($inst eq "casa" || $inst eq "casxa") {
                    &cas_alt($inst, $tmp1, 16, $va_offset, $asi, $src_type, 16);
                }
                elsif($inst eq "ldstuba" || $inst eq "swapa") {
                    &load_alt($inst, $tmp1, 0, $va_offset, $asi, $src_type, 16);
                }
                else {
                    &load_alt($store_rbw_inst{$stinst}, $tmp1, 0, $va_offset, $asi, $src_type, 16) if(&read_before_write($asi, $stinst));
                    &store_alt($inst, $src_type, 16, $tmp1, 0, $va_offset, $asi);
                }
                } #end HACK
            }
        }
        foreach my $va (@asi_va_addrs) {
            &setx($va|$oor_va, $tmp2, $tmp1);
            foreach my $ldinst (@asi_lda_insts) {
                if($ldinst eq "ldqaf") {
                    &enable_trap_type("illinst");
                }
                else {
                    &enable_trap($asi, $ldinst);
                }
                if($external_asi{$asi} == undef && $ldinst eq "lddaf") {
                    #skip this HACK
                }
                else {
                my $inst = $ldinst;
                my $dest_type = "%r";
                $dest_type = "%f" if($ldinst eq "ldaf" || $ldinst eq "lddaf" || $ldinst eq "ldqaf");
                $dest_type = ""   if($ldinst eq "prefetcha");
                $inst =~ s/(.*)f$/$1/g if($ldinst eq "ldaf" || $ldinst eq "lddaf" || $ldinst eq "ldqaf");
                &load_alt($inst, $tmp1, 0, $va_offset, $asi, $dest_type, 16);
                } #end HACK
            }
        }
    }
    &release_regs(16,$tmp1,$tmp2,$tmp3);
}

sub gen_required_data_sections() {
    if($opt{inst_group} eq "asi" || $opt{inst_group} eq "ldst") {
        foreach my $va (@asi_va_addrs) {
            &gen_data_sec($va, $va+1024, $opt{dataacc}, $opt{super}) if($va != 0x0);
        }
    }
}

sub hyp_helper_apis() {
    my ($tmp1, $tmp2) = (1,2);
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
    printf("and  %%o7, 0x1, %%o6\n");
    printf("brnz %%o6, turnoff_dtlb\n");
    printf("nop\n");
    printf("and  %%o7, 0x2, %%o6\n");
    printf("brnz %%o6, turnon_dtlb\n");
    printf("nop\n");
    printf("and  %%o7, 0x4, %%o6\n");
    printf("brnz %%o6, turnoff_redbit\n");
    printf("nop\n");
    printf("and  %%o7, 0x8, %%o6\n");
    printf("brnz %%o6, turnon_redbit\n");
    printf("nop\n");
    printf("ba api_done\n");
    printf("nop\n");

    printf("turnoff_dtlb:\n");
    printf("ldxa [%%g0] 0x45, %%r%d\n", $tmp1);
    printf("sllx %%r%d, 60, %%r%d\n", $tmp1, $tmp2);
    printf("srlx %%r%d, 63, %%r%d\n", $tmp2, $tmp2);
    printf("sllx %%r%d,  3, %%r%d\n", $tmp2, $tmp2);
    printf("xor  %%r%d,  %%r%d, %%r%d\n", $tmp1, $tmp2, $tmp1);
    printf("stxa %%r%d, [%%g0] 0x45\n", $tmp1);
    printf("ba api_done\n");
    printf("nop\n");

    printf("turnon_dtlb:\n");
    printf("ldxa [%%g0] 0x45, %%r%d\n", $tmp1);
    printf("or  %%r%d,  0x8, %%r%d\n", $tmp1, $tmp1);
    printf("stxa %%r%d, [%%g0] 0x45\n", $tmp1);
    printf("ba api_done\n");
    printf("nop\n");

    printf("turnon_redbit:\n");
    printf("rdhpr %%hpstate, %%r%d\n", $tmp1);
    printf("or %%r%d, 0x20, %%r%d\n", $tmp1, $tmp1);
    printf("wrhpr %%r%d, 0x0, %%hpstate\n", $tmp1);
    printf("ba api_done\n");
    printf("nop\n");

    printf("turnoff_redbit:\n");
    printf("rdhpr %%hpstate, %%r%d\n", $tmp1);
    printf("sllx %%r%d, 58, %%r%d\n", $tmp1, $tmp2);
    printf("srlx %%r%d, 63, %%r%d\n", $tmp2, $tmp2);
    printf("sllx %%r%d,  5, %%r%d\n", $tmp2, $tmp2);
    printf("wrhpr %%r%d, %%r%d, %%hpstate\n", $tmp1, $tmp2);
    printf("ba api_done\n");
    printf("nop\n");

    printf("api_done:\n");
    printf("done\n");
}


my @asi_ld_insts = ("ldsb", "ldsh", "ldsw", "ldub", "lduh", "lduw", 
                    "ldx",  "ldd",  "ldf",  "lddf", "ldqf", "prefetch");  

my @asi_st_insts = ("stb", "sth",  "stw",  "stx", "std", 
                    "stf", "stdf", "stqf", "cas", "casx", "ldstub", "swap");  

sub gen_all_ldst_insts() {
    my ($th_id) = @_;

    &lock_regs(16);
    my $tmp1 = &pick_tmp_reg();
    my $tmp2 = &pick_tmp_reg();
    my $tmp3 = &pick_tmp_reg();
    
    &setx_label("scratch_mem", $tmp1, $tmp2);
    printf("ldx [%%r%d+%d], %%r16\n", $tmp2, ($th_id*2*64));
    printf("ldx [%%r%d+%d], %%r17\n", $tmp2, ($th_id*2*64)+8);
    for(my $i=0; $i<8; $i++) {
        printf("ldd [%%r%d+%d], %%f%d\n", $tmp2, ((($th_id*2)+1)*64+($i*8)), (16+$i*2));
    }

    foreach my $va (@asi_va_addrs) {
        if($va >> 39) { # this is an io space.
            &setx($va, $tmp1, $tmp3);
            printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
            printf("wr %%g0, 0x14, %%asi\n");
            printf("stxa %%r16, [%%r%d+%d] %asi\n", $tmp3, ($th_id*2*64));
            printf("stxa %%r17, [%%r%d+%d] %asi\n", $tmp3, ($th_id*2*64)+8);
            for(my $i=0; $i<8; $i++) {
                printf("stda %%f%d, [%%r%d+%d] %asi\n", (16+$i*2), $tmp3, ((($th_id*2)+1)*64+($i*8)));
            }
            printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
        }
    }
    
    my $va_offset = ($th_id*2*64);

    my @asi_modes = ("normal",   "redbit_on",          "ambit_on",          "redbit_on_ambit_on", 
                     "oor_addr", "oor_addr_redbit_on", "oor_addr_ambit_on", "oor_addr_redbit_on_ambit_on", 
                     "dtlb_off", "dtlb_off_redbit_on", "dtlb_off_ambit_on", "dtlb_off_redbit_on_ambit_on", 
                     "oor_addr_dtlb_off", "oor_addr_dtlb_off_redbit_on", "oor_addr_dtlb_off_ambit_on", 
                     "oor_addr_dtlb_off_redbit_on_ambit_on");
    #my @asi_modes = ("normal",   "redbit_on", "oor_addr", "oor_addr_redbit_on",  "dtlb_off", "dtlb_off_redbit_on", 
    #                 "oor_addr_dtlb_off", "oor_addr_dtlb_off_redbit_on");
    foreach my $asi_mode (@asi_modes) {
        if($asi_mode =~ /dtlb_off/) {
            printf("mov 0x1, %%o7\n");
            printf("ta T_HTRAP_INST0\n"); 
        }
        else {
            printf("mov 0x2, %%o7\n");
            printf("ta T_HTRAP_INST0\n"); 
        }
        if($asi_mode =~ /redbit_on/) {
            printf("mov 0x8, %%o7\n");
            printf("ta T_HTRAP_INST0\n"); 
        }
        else {
            printf("mov 0x4, %%o7\n");
            printf("ta T_HTRAP_INST0\n"); 
        }
        if($asi_mode =~ /ambit_on/) {
            printf("!turn on AM bit\n");
            printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
            printf("rdpr %%pstate, %%r%d\n", $tmp1);
            printf("or %%r%d, 0x8, %%r%d\n", $tmp1, $tmp1);
            printf("wrpr %%r%d, 0x0, %%pstate\n", $tmp1);
            printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
        }
        else {
            printf("!turn off AM bit\n");
            printf("ta T_CHANGE_PRIV\n") if($opt{super} == 0);
            printf("rdpr %%pstate, %%r%d\n", $tmp1);
            printf("or %%r%d, 0x8, %%r%d\n", $tmp1, $tmp1);
            printf("wrpr %%r%d, 0x8, %%pstate\n", $tmp1);
            printf("ta T_CHANGE_NONPRIV\n") if($opt{super} == 0);
        }
        my $oor_va = 0x0;
        if($asi_mode =~ /oor_addr/) {
            $oor_va  = Math::BigInt->new(0x10000);
            $oor_va   <<=32;
        }
        foreach my $va (@asi_va_addrs) {
            &setx($va|$oor_va, $tmp2, $tmp1);
            foreach my $stinst (@asi_st_insts) {
                my $trap_enabled = 0;
                if($stinst eq "stqf") {
                    $trap_enabled = &enable_trap_type("illinst");
                }
                if($trap_enabled == 0 && (($va>>39)&0x1)) {
                    if($stinst eq "cas" || $stinst eq "casx" || 
                       $stinst eq "ldstub" || $stinst eq "swap") {
                        $trap_enabled = &enable_trap_type("dataacc");
                    }
                }
                my $inst = $stinst;
                my $src_type = "%r";
                $src_type = "%f" if($stinst eq "stf" || $stinst eq "stdf" || $stinst eq "stqf");
                $src_type = ""   if($stinst eq "prefetch");
                $inst =~ s/(.*)f$/$1/g if($stinst eq "stf" || $stinst eq "stdf" || $stinst eq "stqf");

                if($inst eq "cas" || $inst eq "casx") {
                    &cas($inst, $tmp1, 16, $va_offset, $src_type, 16);
                }
                elsif($inst eq "ldstub" || $inst eq "swap") {
                    &load($inst, $tmp1, 0, $va_offset, $src_type, 16);
                }
                else {
                    &store($inst, $src_type, 16, $tmp1, 0, $va_offset);
                }
            }
        }
        foreach my $va (@asi_va_addrs) {
            &setx($va|$oor_va, $tmp2, $tmp1);
            foreach my $ldinst (@asi_ld_insts) {
                if($ldinst eq "ldqf") {
                    &enable_trap_type("illinst");
                }
                my $inst = $ldinst;
                my $dest_type = "%r";
                $dest_type = "%f" if($ldinst eq "ldf" || $ldinst eq "lddf" || $ldinst eq "ldqf");
                $dest_type = ""   if($ldinst eq "prefetch");
                $inst =~ s/(.*)f$/$1/g if($ldinst eq "ldf" || $ldinst eq "lddf" || $ldinst eq "ldqf");
                &load($inst, $tmp1, 0, $va_offset, $dest_type, 16);
            }
        }
    }
    &release_regs(16,$tmp1,$tmp2,$tmp3);
}

1;
