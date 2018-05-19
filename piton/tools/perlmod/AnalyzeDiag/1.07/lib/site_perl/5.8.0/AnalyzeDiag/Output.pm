# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Output.pm
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

package AnalyzeDiag::Output;

use strict;
use warnings;

use Carp;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(chat debug script_warning script_die script_say verbose
		 diag_ok diag_is diag_is_numeric
		 script_exit
		);

our $VERBOSE = 1;
our $EXIT_VAL = 0;

###############################################################################

sub verbose {
  my $verbose = shift;
  $VERBOSE = $verbose if defined $verbose;
  return $VERBOSE;
}

###############################################################################

sub _add_prefix {
  my $prefix = shift;
  my @text = @_;


  my @lines;
  foreach my $textline (@text) {
    push @lines, split /\n/, $textline;
  }
  @lines = map { "$prefix$_" } @lines;
  my $return = join "\n", @lines;
  $return .= "\n";
  return $return;
}

###############################################################################

sub chat {
  my @msg = @_;
  return unless $VERBOSE;
  my $text = _add_prefix("AnalyzeDiag: ", @msg);
  print $text;
}

###############################################################################

sub debug {
  my @msg = @_;
  return unless $VERBOSE >= 2;
  my $text = _add_prefix("AnalyzeDiag: ", @msg);
  print $text;

}

###############################################################################

sub script_warning {
  my @msg = @_;
  my $text = _add_prefix("AnalyzeDiag: WARNING:", @msg);
  print $text;
}

###############################################################################

sub script_die {
  my @msg = @_;
  my $backtrace = Carp::longmess();
  my $text = _add_prefix("AnalyzeDiag: ", @msg);
  print $text;

  print "---------\n";

  my $bt = _add_prefix("BACKTRACE:   ", $backtrace);
  print $bt;

  exit(2);
}

###############################################################################

sub script_say {
  my @msg = @_;
  my $text = _add_prefix("AnalyzeDiag: ", @msg);
  print $text;
}

###############################################################################

sub script_exit {
  script_say "Exiting with status $EXIT_VAL.\n";
  exit $EXIT_VAL;
}

###############################################################################

sub diag_ok {
  my $test = shift;
  my $name = shift;

  $name = "Test='$test'" unless defined $name;

  if($test) {
    script_say "Performance Test: PASS: $name\n";
  } else {
    script_say "Performance Test: FAIL: $name\n";
    $EXIT_VAL ||= 1;
  }

  # bool test to 1/0
  return 1 if $test;
  return 0;
}

###############################################################################

sub diag_is {
  my $got    = shift;
  my $expect = shift;
  my $name   = shift;

  $name = "Test='$got'=='$expect'" unless defined $name;

  if($got eq $expect) {
    script_say "Performance Test: PASS: $name\n";
  } else {
    script_say "Performance Test: FAIL: $name\n",
      "  Got '$got', Expected '$expect'\n";
    $EXIT_VAL ||= 1;
  }

  return 1 if $got eq $expect;
  return 0;
}

###############################################################################

sub diag_is_numeric {
  my $got    = shift;
  my $expect = shift;
  my $name   = shift;
  my $tolerance = shift;

  $tolerance = 0 unless defined $tolerance;
  $name = "Test='$got'=='$expect' (tolerance=$tolerance)" unless defined $name;

  my $booltest = ( $got >= ($expect - $tolerance) &&
		   $got <= ($expect + $tolerance));

  if($booltest) {
    my $str = ($got == $expect) ? "got expected $got" :
      "got $got, exp $expect, tol $tolerance";
    script_say "Performance Test: PASS: $name ($str)\n";
  } else {
    script_say "Performance Test: FAIL: $name\n",
      "  Got '$got', Expected '$expect' (tolerance=$tolerance)\n";
    $EXIT_VAL ||= 1;
  }

  return $booltest;
}

###############################################################################
1;
