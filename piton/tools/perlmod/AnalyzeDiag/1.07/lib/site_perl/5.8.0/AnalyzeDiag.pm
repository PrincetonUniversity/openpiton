# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: AnalyzeDiag.pm
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
package AnalyzeDiag;

use 5.008;
use strict;
use warnings;

use AnalyzeDiag::Output;
use AnalyzeDiag::Measurement;
use AnalyzeDiag::Analyzer;
require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use AnalyzeDiag ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = (qw(
		  pattern_match
		 ), @AnalyzeDiag::Output::EXPORT);

our $VERSION = '1.07';

###############################################################################

sub pattern_match {
  my $filename = shift;
  my $href = shift;

  my %enable_patterns;
  my %match_patterns;

  foreach my $pat (keys %$href) {
    if(ref $href->{$pat} eq 'HASH') {
      $enable_patterns{$pat} = $href->{$pat}{enable};
      $match_patterns{$pat}  = $href->{$pat}{match};
    } else {
      $match_patterns{$pat} = $href->{$pat};
    }
  }

  my %results = map { $_ => [] } keys %match_patterns;
  my $fh = IO::File->new("<$filename") or
    script_die "Can't open '$filename': $!\n";

  my @enabled_patterns = grep { not exists $enable_patterns{$_} }
    keys %match_patterns;

  while(<$fh>) {
    foreach my $pat_name (keys %enable_patterns) {
      if(/$enable_patterns{$pat_name}/) {
	push @enabled_patterns, $pat_name;
	delete $enable_patterns{$pat_name};
      }
    }

    foreach my $pat_name (@enabled_patterns) {
      my $pat = $match_patterns{$pat_name};
      my @matchlist = /$pat/;
      push @{$results{$pat_name}}, \@matchlist    if @matchlist;
    }
  }

  undef $fh;

  return \%results;
}


###############################################################################
###############################################################################


1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

AnalyzeDiag - Perl module for analyzing diag log files

=head1 SYNOPSIS

  use AnalyzeDiag;

  my $dir = '.';
  my $analyzer = AnalyzeDiag::Analyzer->new(dir => $dir);

  $analyzer->add_measurements
    (
     AnalyzeDiag::Measurement->new(name  => 'PointerChase',
  				   start => 'chase_start',
	  			   end   => 'chase_end')
    );
  my %results = $analyzer->analyze();

  my @times = @{ $Results{PointerChase} };						

  # Do something with times

  script_exit;

=head1 ABSTRACT

  This module exports some functions that analyze diag log
  files.  It is intended to be used by diags that write
  their own post-processing scripts.

=head1 DESCRIPTION

The AnalyzeDiag module contains two user-accessible classes:
AnalyzeDiag::Analyzer and AnalyzeDiag::Measurement.

The general usage is to create an AnalyzeDiag::Analyzer diag, given a
directory argument (see the example in the previous section).  You
then add AnalyzeDiag::Measurement objects to the analyzer.  Finally,
the call to the analyze method will produce a hash where the keys are
names of measurements and the values are arrays of times (in cycles)
for those measurements.

The AnalyzeDiag::Measurement object has a contructor called 'new'.
Its argument is a hash with keys 'name', 'start', and 'end'.  The name
field is used to identify the measurement.  The 'start' and 'end'
values define PCs at which the measurement should start and end.  They
may be virtual addresses (hex numbers without 0x) or labels.

=head2 EXPORT

=over 4

=item verbose( [$level] )

If $level is specified, set verbose level to that.  Returns verbosity
level.

=item script_say(@msg)

Print the message always.

=item chat(@msg)

Print the message if verbose level >= 1.

=item debug(@msg)

Print the message if verbose level >= 2.

=item script_warning(@msg)

Print a warning message.

=item script_die(@msg)

Print an error message, print a stack backtrace, and exit with status
2.

=item diag_ok( $bool, $name )

Perform a test named '$name'.  Test passes if $bool evaluates to true
and fails otherwise.

=item diag_is($got, $expected, $name)

Perform a test called '$name'.  Test passes if $got eq $expected (yes,
that is a string comparison) and fails otherwise.  This is a special
case of $diag_ok, but it produces much better output since the
function actually knows what is being compared.

=item diag_is_numeric($got, $expected, $name, [$tolerance])

Same as diag_is except the comparison is numeric.  If $tolerance is
specified, the test passes if $got is within $tolerance of $expected.

=item script_exit

Prints the exit status and exits with that status.  Exit status will
be 0 unless one or more tests have failed, in which case it will be 1.

=back


=head1 SEE ALSO

perl(1).

=cut
