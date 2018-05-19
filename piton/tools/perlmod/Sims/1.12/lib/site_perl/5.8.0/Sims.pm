# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Sims.pm
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
package Sims;

use 5.008;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Sims ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.

## Default project is BW.  Perhaps it should not be set.  [Viranjit 3/29/04]
## mmckeown: Changing to OpenPiton by default
my $project = exists $ENV{PROJECT} ? $ENV{PROJECT} : "OpenPiton";
our %proj_vars;

if ( $project eq 'OpenSPARCT1' ) {
    %proj_vars = (
      'proj'		=> 'OpenSPARCT1',
      'sims_config'	=> 'tools/src/sims',
      'diaglist'	=> 'verif/diag',
      'sas'		=> 'bas',
      'sasconfig'	=> 'basconfig',
      'sims_db'		=> [],
      'vcsprefix'       => '',
      'cc_dv_root'      => '',
      'has_denali'  => '0'
    ) ;
} elsif ( $project eq 'OpenPiton' ) {
    %proj_vars = (
      'proj'        => 'OpenPiton',
      'sims_config' => 'tools/src/sims',
      'diaglist'    => 'verif/diag',
      'sas'     => 'bas',
      'sasconfig'   => 'basconfig',
      'sims_db'     => [],
      'vcsprefix'       => '',
      'cc_dv_root'      => '',
      'has_denali'  => '0'
    ) ;
} else {
    die   "Sims.pm: Unknown project: \$PROJECT = $ENV{PROJECT}," .
	"\n         only OpenSPARCT1 or OpenPiton is supported, please do one of the following:" .
	"\n         setenv PROJECT OpenSPARCT1\nOR\n         setenv PROJECT OpenPiton\nOR\n         unsetenv PROJECT\n"
;
}

our %EXPORT_TAGS = ( 'all' => [ qw( %proj_vars
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '1.12';


# Preloaded methods go here.

1;
__END__

=head1 NAME

Sims - Perl module to configure sims for a given project

=head1 SYNOPSIS

use Sims;

=head1 ABSTRACT

Exports project-specific variables to B<sims> simulation script.

=head1 DESCRIPTION

A hash called %proj_vars is exported, which has the following fields:

	proj		the name of the project, OpenSPARCT1 or OpenPiton
	sims_config	directory of config files for sys=<foo> argument
	diaglist	path to top of diag directory
	sas		name of architectural simulator
	sasconfig	name of program to generate sas config file
	sims_db		list of directories where big-brother logs are kept

Paths are relative to B<dv_root>.
The values in %proj_vars depend on the environment variable B<$PROJECT>.

=head2 EXPORT

':all'	exports the hash %proj_vars.
No default export.

=head1 SEE ALSO

L<sims -h>

=cut
