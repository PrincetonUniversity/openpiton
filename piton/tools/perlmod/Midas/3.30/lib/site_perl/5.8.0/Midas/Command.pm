# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Command.pm
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

package Midas::Command;
use strict;

use Getopt::Long;
use File::Spec;
use File::Basename;
use File::Spec;
use Cwd;

use Midas::Error;
use Midas::Globals;

use TRELoad 'BitFieldTie';

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(run_command chat fatal banner string2bf hexstring2bf
		 verbose opt_n
		);

our $Prg = basename $0;
#our %opt = ( verbose => 1 );
our $Verbose = 1;
our $N = 0;

##############################################################################

sub verbose {
  return $$Verbose if ref $Verbose;
  return $Verbose;
}

##############################################################################

sub opt_n {
  return $$N if ref $N;
  return $N;
}

##############################################################################

sub fatal {
  my $msg = shift;
  my $code = shift;

  my $obj = Midas::Error->throw($msg, $code);

  die $obj;
}

##############################################################################

sub chat {
  my $msgs = shift;
  my $level = shift;

  $level = 1 unless defined $level;
  return unless verbose >= $level;

  local($_);
  my @lines = split /\n/, "$msgs";
  my $string = "$Prg: " . (join "\n$Prg: $_", @lines);

  print "$string\n";
}

##############################################################################

sub banner {
  my @lines = @_;

  chat "###########################################################\n", 2;

  foreach my $line (@lines) {
    print "$Prg: ##  $line\n" if verbose > 0;
  }

  chat "###########################################################\n", 2;
}

##############################################################################

sub configure {
  my %args = @_;

  foreach my $key (keys %args) {
    if($key eq 'verbose') {
      $Verbose = $args{$key};
    } elsif($key eq 'n') {
      $N = $args{$key};
    } else {
      fatal "Midas::Command does not recongnize configuration option ".
	"$key.\n";
    }
  }

  return ( verbose => $Verbose,
	   n       => $N,
	 );

}

##############################################################################

sub run_command {
  my $command = shift;
  my @flags   = @_;

  my %cmd_opt = (
		 verbose   => 1,
		 fatal     => 1,
		 errcode   => M_CMDFAIL,
		 pass_errcode => 0,
		);
  my @options = qw( verbose=i fatal! errcode=i pass_errcode! );
  local (@ARGV) = @flags;
  Getopt::Long::Configure('no_pass_through');
  GetOptions(\%cmd_opt, @options) or
    fatal "Cannot parse flags to run_command: @flags\n";

  if(verbose >= $cmd_opt{verbose}) {
    print "$Prg: $command\n";
  }
  my $status = 0;
  $status = system($command) unless opt_n;
  if($cmd_opt{fatal} and $status) {
    my $exit = $status >> 8;
    my $sig  = $status & 127;
    my $core = $status & 128;
    my $core_msg = $core ? "Dumped core." : "";

    if($sig) {
      fatal "Command \"$command\" died via signal $sig. $core_msg\n",
	$cmd_opt{errcode};
    }

    if($cmd_opt{pass_errcode} and exists $ERRCODES{$exit}) {
      fatal "Command \"$command\" failed. $core_msg\n", $exit;	
    } else {
      fatal "Command \"$command\" failed with status $exit. $core_msg\n",
	$cmd_opt{errcode};
    }
  }
}

##############################################################################

sub string2bf {
  my $string      = shift;
  my $width       = shift;

  fatal "Cannot run string2bf without a width argument!\n", M_CODE
    unless defined $width;

  my $ishex = 0;
  if($string =~ /^\s*0[xX]/ or ref($string) or $CONFIG{default_radix} eq 'hex')
    {
      $ishex = 1;
      # Test for overflow
      (my $mystring = $string) =~ s/^\s*0[xX]//;
      $mystring =~ s/\s*$//;
      my $max_digits = int($width / 4);
      $max_digits++ if (($max_digits) * 4 != $width);

      if(length $mystring > $max_digits) {
	my $difference = (length $mystring) - $max_digits;
	my $leader = substr($mystring, 0, $difference);
	return "Hex overflow: \"$string\" won't fit in $width bits!\n"
	  unless $leader eq ('0' x $difference);
      }
    } else {

      my $max_bf = BitFieldTie->new(65, "1");
      $max_bf->left_shift($width);

      my $test_bf;
      eval {
	$test_bf = BitFieldTie->new_dec(65, $string);
      };
      if(not $@) {
	if($test_bf->ucompare($max_bf) >= 0) {
	  return "Dec Overflow: \"$string\" won't fit in $width bits!\n";
	}
      }

    }


  my $bf;
  eval {
    if($ishex) {
      $bf = BitFieldTie->new($width, $string);
    } else {
      $bf = BitFieldTie->new_dec($width, $string);
    }
  };
  if($@) {
    return $@;
  } else {
    return $bf;
  }
}

##############################################################################

sub hexstring2bf {
  my $string = shift;
  my $width = shift;

  $string = "0x$string" unless $string =~ /^\s*0[xX]/;
  return string2bf($string, $width);
}

##############################################################################
1;
