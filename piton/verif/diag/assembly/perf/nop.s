// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: nop.s
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
! Diag:	 nop.s
!
! This diag actually does do something useful, despite its name.  Though the
! program doesn't do much, the nops still have to be fetched, so it tests
! the various I-miss cases.  The embedded perl script checks the timing.
	
#include "boot.s"

.global main
main:
	nop	! I_TLB miss
	nop
	nop
	nop

	nop
	nop
	nop

	! Need two instructions for each miss (cause of miss and prev)
	! since simulator and RTL are timed differently
	! Real miss time is the sum of these two instruction latencies
	! minus 1 cycles (for the one that hits).
l1_miss_1_start:	
	nop

	nop	! L1 miss
	
l1_miss_1_end:
	nop
	nop
	nop

	nop
	nop
	nop

l2_miss_1_start:
	nop

	nop	! L2 miss
l2_miss_1_end:
	nop
	nop
	nop

	nop
	nop
	nop

l1_miss_2_start:
	nop

	nop	! L1 miss
l1_miss_2_end:	
	nop
	nop
	nop

	nop
	nop
	nop

l2_miss_2_start:
	nop

	nop	! L2 miss
l2_miss_2_end:
time_end:
	nop

	ta	T_GOOD_TRAP
	nop


__PERL__
# -*- perl -*-
	

use strict;
use TRELoad 'AnalyzeDiag';

verbose(0);

my $dir = '.'; 

my $analyzer = AnalyzeDiag::Analyzer->new(dir => $dir);


my $measurements = 2;
my $clock_ratio = 7;
my $dram_tolerance = $clock_ratio;

tie my %values, 'Tie::IxHash';
%values =
  (
   l1_miss => {
	       pretty_name => 'I$ miss to L2',
               expect => 21,
               tolerance => 0,
              },
   l2_miss => {
	       pretty_name => 'I$ miss to DRAM',
               expect => 133,
               tolerance => $dram_tolerance,
              }
  );

my @measures;
my %measure_to_value;
foreach my $value (keys %values) {
  foreach my $i (1 .. $measurements) {
    my $name = "${value}_$i";
    push @measures, AnalyzeDiag::Measurement->new(name => $name,
						  start => "${name}_start",
						  end   => "${name}_end");
    $measure_to_value{$name} = $value;
  }
}

$analyzer->add_measurements(@measures);


my %results = $analyzer->analyze();

# Collect results for each value
foreach my $measure_name (keys %results) {
  my $value = $measure_to_value{$measure_name};
  $values{$value}{results} = [] unless exists $values{$value}{results};
  push @{$values{$value}{results}}, @{$results{$measure_name}};
}

foreach my $value (keys %values) {
  diag_ok(exists $values{$value}{results}, "Found results for '$value'\n");


  if(exists $values{$value}{results}) {

    # Compute average

    my $total = 0;
    foreach my $elem (@{$values{$value}{results}}) {
      $total += $elem;
    }
    $total /= @{$values{$value}{results}};
    $total = sprintf "%0.2f", $total;

    # subtract 1 since we're using 2 instructions and one hits
    $total--;

    # Test vs expected
    if(exists $values{$value}{expect}) {
      my $tol =
	exists $values{$value}{tolerance} ? $values{$value}{tolerance} : 0;

      my $pretty_name = exists $values{$value}{pretty_name} ?
	$values{$value}{pretty_name} : $value;

      diag_is_numeric($total, $values{$value}{expect},
		      "$pretty_name", $tol);
    }

  }
}

script_exit;
