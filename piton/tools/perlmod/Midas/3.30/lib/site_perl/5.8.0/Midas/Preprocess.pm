# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Preprocess.pm
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

package Midas::Preprocess;
use strict;
use warnings;

use IO::File;
use File::Temp 'tempfile';
use File::Copy;

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
our @EXPORT = qw(preprocess);
our @EXPORT_OK = qw();
our %EXPORT_TAGS = (
		    all =>       [qw(
				     preprocess
				     run_cpp
				     run_m4
				     get_includes
				     get_cpp_includes
				     get_m4_includes
				    ),
				 ],
		    internals => [qw(
				     get_includes
				     get_cpp_includes
				     get_m4_includes
				     ),
				 ],
		   );

Exporter::export_ok_tags('all', 'internals');

##############################################################################

# Perform both cpp and m4 preprocessing

##############################################################################

sub preprocess {
  my $sfile   = shift;
  my $cppfile = shift;
  my $m4file  = shift;

  banner "PREPROCESSING PHASE";

  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  $m4file  = path_to_build_file($CONFIG{local_m4}, $STATE)
    unless defined $m4file;

  if(exists $CONFIG{ttefmt} and defined $CONFIG{ttefmt}) {
    my $ttefmt = uc $CONFIG{ttefmt};
    add_cpp_defines(
		    "$ttefmt=1",
		   );
  }
  if(exists $CONFIG{"csm_en"} and defined $CONFIG{"csm_en"}) {
    print "exists CSM_ENABLE\n";
    my $csm_enable = uc $CONFIG{"csm_en"};
    add_cpp_defines("CSM_ENABLE");
    my $afile   = path_to_build_file($CONFIG{local_s}, $STATE);
    my $dv_root = $ENV{"DV_ROOT"};
    my $command = `$dv_root/tools/bin/insert_csm_fields.py $afile`;
    print "Ran python script\n";
  }

  run_cpp($sfile, $cppfile);
  run_m4($cppfile, $m4file);

}

##############################################################################

sub get_includes {
  my $include_hash = shift;

  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  my %roothash = (
		  diagroot => $STATE->get_diag_root(),
		  startdir => $STATE->get_start_dir(),
		  builddir => $STATE->get_build_dir(),
		  abs      => '/',
		 );

  my @root_order = qw(builddir startdir diagroot abs);

  my @incs;
  foreach my $root (@root_order) {
    next unless exists $include_hash->{$root};
    fatal "Unknown include root $root in includes\n", M_DIR
      unless exists $roothash{$root};

    my $rootpath = $roothash{$root};
    foreach my $dir (@{$include_hash->{$root}}) {
      my $path = File::Spec->catdir($rootpath,
				    split /\//, $dir);
      push @incs, $path;
    }
  }
  return @incs;

}

##############################################################################

sub get_cpp_includes {
  return get_includes($CONFIG{cpp_includes});
}

##############################################################################

sub get_m4_includes {
  return get_includes($CONFIG{m4_includes});
}

##############################################################################

# Use cpp to convert from assembly file to .cpp file

##############################################################################

sub run_cpp {
  my $sfile   = shift;
  my $cppfile = shift;

  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  $sfile   = path_to_build_file($CONFIG{local_s}, $STATE)
    unless defined $sfile;
  $cppfile = path_to_build_file($CONFIG{local_cpp}, $STATE)
    unless defined $cppfile;

  local ($_);
  # Don't compact path, b/c we want full path for standard includes
  my @incs = map { "-I$_" } get_cpp_includes();
  my @defs = map { "-D$_" } @{$CONFIG{'cpp_defines'}};

  my $need_space = (scalar @incs and scalar @defs) ? ' ' : '';

  my $mmu_argstring = '';
  my @mmu_args = @{$STATE->get_mmu()->mmu_cpp_args()};
  if(@mmu_args) {

    $mmu_argstring .= ' ' . join ' ', @mmu_args;
  }

  my $arglist =
    (join ' ', @{$CONFIG{cpp_opt}}) . ' '         .
    (join ' ', @incs )              . $need_space .
    (join ' ', @defs) . $mmu_argstring;
  run_command("$CONFIG{cpp_cmd} $arglist $sfile > $cppfile",
	     -errcode => M_CPPFAIL);
}

##############################################################################

# Take output of cpp and run through m4.

##############################################################################

sub run_m4 {
  my $cppfile = shift;
  my $m4file  = shift;

  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  $cppfile = path_to_build_file($CONFIG{local_cpp}, $STATE)
    unless defined $cppfile;
  $m4file  = path_to_build_file($CONFIG{local_m4}, $STATE)
    unless defined $m4file;

  local ($_);
  # Don't compact path, b/c we want full path for standard includes
  my @incs = map { "--include=$_" } get_m4_includes();
  my $arglist =
    (join ' ', @{$CONFIG{m4_opt}}) . ' '.
    (join ' ', @incs);
  run_command("$CONFIG{m4_cmd} $arglist < $cppfile > $m4file",
	      -errcode => M_M4FAIL
	     );

}

##############################################################################
1;
