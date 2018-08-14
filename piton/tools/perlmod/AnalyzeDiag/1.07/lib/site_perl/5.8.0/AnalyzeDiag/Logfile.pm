# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Logfile.pm
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
# -*- perl -*-

package AnalyzeDiag::Logfile;

use strict;
use warnings;
use File::Spec;
use Math::BigInt;

use AnalyzeDiag::Output;

use fields qw(filename);

###############################################################################

sub create_from_dir {
  my $class = shift;
  my $dir = shift;

  my $vcslog = File::Spec->catfile($dir, 'sim.log');

  my $log;
  if(-e $vcslog) {
    # RTL Run
    $log = AnalyzeDiag::Logfile::Rtl->new();
    $log->filename($vcslog);
  }else {
    script_die "Cannot find '$vcslog'.\n";
  }
  return $log;
}

###############################################################################

sub new {
  my $this = shift;

  unless (ref $this) {
    $this = fields::new($this);
  }

  return $this;
}

###############################################################################

sub filename {
  my $this = shift;
  my $filename = shift;
  $this->{filename} = $filename if defined $filename;
  return $this->{filename};
}

###############################################################################

sub get_cycle_period {
  my $this = shift;

  script_die "Can't get_cycle_period on abstract superclass!\n";
}

###############################################################################

sub get_times_for_pcs {
  my $this   = shift;
  my $pclist = shift;

  my %pchash   = map { $_ => [] } @$pclist;
  my %shortpc  = map { $_ => $_ } @$pclist;

  foreach (values %shortpc) { s/^0+// }
  %shortpc = reverse %shortpc;

  debug "get_times_for_pcs: shortpc hash ->\n";
  foreach my $pc (keys %shortpc) {
    debug "  short=$pc, long=$shortpc{$pc}\n";
  }

 my $fh = IO::File->new("<$this->{filename}") or
   script_die "Can't open '$this->{filename}': $!\n";

  $this->search_file_for_pcs($fh, \%pchash, \%shortpc);

  return \%pchash;
}

###############################################################################

sub search_file_for_pcs {
  my $this = shift;
  my $fh = shift;
  my $pchash = shift;
  my $shortpc = shift;

  my $ref = ref $this;
  script_die "Error: search_file_for_pcs not implemented for $ref!\n";
}

###############################################################################

sub subtract_times {
  my $this = shift;
  my $arg1 = shift;
  my $arg2 = shift;

  if(ref $arg1 and ref $arg2) {
    script_die "Error: subtract_times args are different lengths!\n"
      unless @$arg1 == @$arg2;

    my @results;
    foreach my $i ( 0 .. (@$arg1 - 1) ) {
      my $diff = $this->subtract_times($arg1->[$i], $arg2->[$i]);
      push @results, $diff;
    }

    return @results;
  } elsif(not ref $arg1 and not ref $arg2) {
    my $bi1 = Math::BigInt->new($arg1);
    my $bi2 = Math::BigInt->new($arg2);
    my $diff = $bi1->bsub($bi2)->bstr();
    return $diff;
  } else {
    script_die "Error: subtract times needs two ref args or two scalar ".
      "args, not one of each!\n";
  }
}

###############################################################################

sub to_cycles {
  my $this = shift;
  my $arg = shift;

  if(ref $arg) {
    my @results;
    foreach my $elem (@$arg) {
      my $cycles = $this->to_cycles($elem);
      push @results, $cycles;
    }
    return @results;
  } else {
    my $period = $this->get_cycle_period();
    return $arg if $period == 1;
    my $num = Math::BigInt->new($arg);
    my $quotient = Math::BigInt->new('0');
    my $remainder = Math::BigInt->new('0');
    ($quotient, $remainder) = $num->bdiv($period);
    if ( $remainder > ($period - $remainder ) ) {
	$num->binc();
    }
    $num->bstr();
    return $num;
  }
}

###############################################################################
###############################################################################

package AnalyzeDiag::Logfile::Rtl;

use strict;
use warnings;

use IO::File;

use AnalyzeDiag::Output;

use base qw(AnalyzeDiag::Logfile);
use fields qw(cycle_period);

our $Freq_Regex_m1 = qr/Info:\s*Selected Core Clock Frequency\s(\d+)\s*MHz/;
our $Pll_Regex_m1 = qr/pll_clk frequency\s*=\s*(\d+)/;
our $Cmp_div_Regex_m1 = qr/cmp_clk divider\s*=\s*(\d+)/;
our $Cmp_clk_period_Regex_m1 = qr/cmp_clk period\s*=\s*(\d+)/;
our $Hex_Regex = qr/[\da-f]+/;

###############################################################################

sub new {
  my $this = shift;

  $this = fields::new($this);

  return $this;
}

###############################################################################

sub get_cycle_period {
  my $this = shift;
  return $this->{cycle_period} if defined $this->{cycle_period};

  my $fh = IO::File->new("<$this->{filename}") or
    script_die "Can't open '$this->{filename}': $!\n";

  # Used to be this was the only divider, so old versions of the model
  # didn't print it out.  Make it the default so we can handle old and
  # new.
  my $cmp_clk_divider = 2;
  my $pll_freq;

  while(<$fh>) {
    if(/$Cmp_clk_period_Regex_m1/) {
      # I found the period I'm looking for.  This trumps everything else.
      my $period_ps = $1;
      script_die "Found clock period of 0! in '$this->{filename}'!\n"
	unless $period_ps;
      $this->{cycle_period} = $period_ps;
      chat "Found cycle_period spelled out: $period_ps\n", 2;
      last;
    } elsif(/$Pll_Regex_m1/) {
      $pll_freq = $1;
      chat "Found PLL frequency: $pll_freq\n", 2;
    } elsif(/$Cmp_div_Regex_m1/) {
      $cmp_clk_divider = $1;
      chat "Found CMP clock divider: $cmp_clk_divider\n", 2;
    } elsif(/$Freq_Regex_m1/) {
      # Time's up.  Any timing-related messages that haven't shown up
      # by now aren't coming
      if(defined $pll_freq) {
	my $pll_period;
	# HACK!  These are periods hardcoded from cmp_clk.v.
	# Hopefully, we're using a version of hte model that has the
	# "cmp_period" defined, so we don't have to use this.
	my %pll_periods = (
			   2000 => 250,
			   2200 => 227,
			   2333 => 214,
			   2334 => 214, # from old sys_clk.v
			   2400 => 208,
			   2550 => 196,
			   2600 => 192,
			   2800 => 179,
			   default => 208,
			  );
	$pll_period = exists $pll_periods{$pll_freq} ?
	  $pll_periods{$pll_freq} : $pll_periods{default};
	my $period_ps = $pll_period * 2 * $cmp_clk_divider;
	$this->{cycle_period} = $period_ps;
	chat "Computed cycle_period from PLL ($pll_freq) and div ".
	  "($cmp_clk_divider): $period_ps\n", 2;
      } else {
	# Couldn't find anything but the frequency message.  Use that.
	my $freq = $1;
	my $period_ps = int(1 / $freq * 1000000);
	$this->{cycle_period} = $period_ps;
	chat "Guessed at cycle_period from frequency ($freq): $period_ps\n";
      }
      last;
    }
  }

  script_die "Could not find clock frequency in '$this->{filename}'\n"
    unless defined $this->{cycle_period};

  return $this->{cycle_period};
}

###############################################################################

sub search_file_for_pcs {
  my $this = shift;
  my $fh = shift;
  my $pchash = shift;
  my $shortpc = shift;

  my $last_inst;
  my $this_inst;

  my @work;


  while(<$fh>) {
    # Find time for PC, don't commit it yet since we don't know if it will
    # be restarted
    if(/^ \( (\d+) \) Info-perm \s* thread \( $Hex_Regex \) \s*
       pc \( 0* ($Hex_Regex)  \)/ox
      )
      {
	my ($time, $pc) = ($1, $2);
	next unless exists $shortpc->{$pc};

	my $long_pc = $shortpc->{$pc};
	if(exists $pchash->{$long_pc}) {
	  chat " Found pc=$pc, time=$time\n";
	  push @work, [$long_pc, $time];
	}
      }
    elsif(/^ \d+ \: pc-MATCH .* val \s* = \s* 0* ($Hex_Regex) \s* $/ox)
      {

	my $pc = $1;
	next unless exists $shortpc->{$pc};
	my $long_pc = $shortpc->{$pc};
	
	my $entry = shift @work;
	script_die "Parse error in log file: Bad pc $entry->[0] ".
	  "(expected $long_pc)!\n" unless $long_pc eq $entry->[0];

	if(not defined $last_inst or $last_inst ne 'retry') {
	  my $time = $entry->[1];
	  chat "PC=$long_pc, time=$time\n";
	  push @{$pchash->{$long_pc}}, $time;
	} else {
	  debug "Retry!\n";
	}
	
      }
    # Keep track of which instruction was the last one
    elsif(/^ \d+ \:sas\> \s+ \d+ \: \s+ \[swvp.*\] \s+
	  \<v\: $Hex_Regex \> \s+  \<p\: $Hex_Regex \> \s+ (\S+)/ox
	 )
      {
	$last_inst = $this_inst;
	$this_inst = $1;
      }
  }

}

###############################################################################
###############################################################################
###############################################################################

package AnalyzeDiag::Logfile::Mom;

use strict;
use warnings;

use AnalyzeDiag::Output;

use base qw(AnalyzeDiag::Logfile);
use fields qw();

###############################################################################

sub new {
  my $this = shift;

  $this = fields::new($this);

  return $this;
}

###############################################################################

sub get_cycle_period {
  my $this = shift;
  return 1;
}

###############################################################################

sub search_file_for_pcs {
  my $this = shift;
  my $fh = shift;
  my $pchash = shift;
  my $shortpc = shift;

  my $last_inst;
  my $this_inst;

  my @work;


  while(<$fh>) {

    if(/^ \@(\d+): \s+ \d+ \.pc \= ($Hex_Regex) \s+ \[ .* \s+ latency=\d+ \s+ 
       (\S+) /ox)
      {
	my ($time, $pc, $this_inst) = ($1, $2, $3);
	$pc =~ s/^0+//;

	next unless exists $shortpc->{$pc};
	my $long_pc = $shortpc->{$pc};
	chat "FOUND PC=$pc\n";
	chat "  Last inst = $last_inst\n" if defined $last_inst;
	if(not defined $last_inst or $last_inst ne 'retry') {
	  chat "PC=$long_pc, time=$time\n";
	  push @{$pchash->{$long_pc}}, $time;
	}

	$last_inst = $this_inst;

      }

  }

}

###############################################################################
###############################################################################
1;
