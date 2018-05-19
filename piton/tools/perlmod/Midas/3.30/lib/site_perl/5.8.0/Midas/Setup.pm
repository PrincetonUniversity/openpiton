# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Setup.pm
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

package Midas::Setup;
use strict;
use warnings;

use IO::File;

use Midas::Command;
use Midas::Paths;
use Midas::Section;
use Midas::MMU;
use Midas::Configure;
use Midas::State;
use Midas::Globals;
use Midas::Error;

require Exporter;

our @ISA    = qw(Exporter);
our @EXPORT = qw(setup_files);
our @EXPORT_OK = qw();
our %EXPORT_TAGS = (
		    all =>       [qw(
				     setup_files
				     bring_local
				     split_perl_assembly
				    ),
				 ],
		    internals => [qw(
				     ),
				 ],
		   );

Exporter::export_ok_tags('all');

##############################################################################

# SETUP SECTION
#
# These functions prepare a diag for further processing.  The external
# interface is the setup_files) function.

##############################################################################

# setup_files($diag) - Exported function

# Prepares a diag for processing:
#
# 1.  If $STATE is undefined, create a new Midas::State object
# 2.  Create build directory if it doesn't already exist
# 3.  cd into build directory
# 4.  Copy diag from specified path to build directory (default name
#     is diag.src).
# 5.  Split diag.src into perl and assembly parts
#
# Return value is the Midas::State object used.  The function also has
# the side effect of changing the working directory to the build directory.


##############################################################################

sub setup_files {
  my $diag_path = shift;

  banner "SETUP PHASE";

  chat "### Will build in directory \"" .
    $STATE->get_build_dir('-abs') .
    "\"\n";

  bring_local($diag_path);

  cd $STATE->get_build_dir();

  my $pushd = Midas::Paths->pushd($STATE->get_build_dir());

  split_perl_assembly();

}

##############################################################################

# build_local($diag)
#
# Creates build_directory if it doesn't already exist.
# Copies $diag into build_directory.
# If the diag is a .pal diag, it runs PAL to convert it.

##############################################################################

sub bring_local {
  my $diag_path = shift;

  my $build_dir = $STATE->get_build_dir('-abs');

  my $src = path_to_build_file($CONFIG{local_src}, $STATE);
  if(not -d $build_dir) {
    run_command("mkdir $build_dir", -errcode => M_DIR);
    $STATE->set_created_build_dir(1);
  } else {
    my @intermed_files = map { path_to_build_file(exists $CONFIG{$_} ?
						  $CONFIG{$_} : $_, $STATE) }
      @{$CONFIG{intermed_files}};

    my $files_str = join ' ', @intermed_files;
    run_command("rm -f $files_str", -errcode => M_FILE) if @intermed_files;
  }

  if($diag_path =~ /\.pal$/) {
    my $pal_opt = join ' ', @{$CONFIG{pal_opt}};
    $pal_opt .= ' ' if length $pal_opt;
    my $pal_diag_args = join ' ', @{$CONFIG{pal_diag_args}};
    run_command("$CONFIG{pal_cmd} $pal_opt$diag_path $pal_diag_args > $src");
  } else {
    run_command("cp $diag_path $src", -errcode => M_FILE);
  }
  run_command("chmod ug+w $src", -verbose => 3, -errcode => M_FILE);
}

##############################################################################

# split_perl_assembly()
#
# Splits the diag.src into diag.s and diag.pl (of course, default names
# can be changed in Configure). Everything in diag.src before __PERL__ goes
# in diag.s.  Everything after goes in diag.pl

##############################################################################

sub split_perl_assembly {
  my $src = path_to_build_file($CONFIG{local_src}, $STATE);
  my $s   = path_to_build_file($CONFIG{local_s}, $STATE);
  my $pl  = path_to_build_file($CONFIG{local_pl}, $STATE);

  my $src_fh = IO::File->new("<$src") or fatal "Can't open $src: $!\n", M_FILE;
  my $s_fh   = IO::File->new(">$s")   or fatal "Can't open $s: $!\n", M_FILE;
  my $pl_fh;

  chat "Splitting $src into $s and $pl (if necessary).\n";

  while(<$src_fh>) {

    if(defined $pl_fh) {
      $pl_fh->print($_);
    } elsif(/^\s*__PERL__/) {
      chat "$src conitains perl code, so creating $pl\n", 2;
      $pl_fh = IO::File->new(">$pl") or fatal "Can't open $pl: $!\n", M_FILE;
    } else {
      $s_fh->print($_);
    }

  }
  # just in case the user didn't end with a newline
  $s_fh->print("\n");
  $pl_fh->print("\n") if defined $pl_fh;

  undef $src_fh;
  undef $s_fh;
  undef $pl_fh;
}

##############################################################################
1;
