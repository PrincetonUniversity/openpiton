# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Configure.pm
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

package Midas::Configure;
use strict;

use File::Spec;
use Data::Dumper;

use Midas::Paths;
use Midas::Globals;
use Midas::Error;

require Midas::Command;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT    = qw(configure init_config add_cpp_defines);
our @EXPORT_OK = qw();


my %default_config =
  (
   verbose => 1,

   cpp_includes => {
		    diagroot => ['verif/diag/assembly/include'],
		    startdir => ['.'],
		    builddir => ['.'],
		    abs      => [],
		   },
   cpp_defines  => [ 'GOLDFINGER=1'
		   ],
   m4_includes  => {
		    diagroot => [],
		    startdir => ['.'],
		    builddir => ['.'],
		    abs      => [],
		   },

   cleanup       => 1,
   force_cleanup => 0,

   link_paths => {
		  diagroot => ['verif/diag'],
		  startdir => ['.'],
		  builddir => [],
		  abs      => [],
		 },

   csrc_includes => {
		  diagroot => ['verif/diag/c'],
		  startdir => ['.'],
		  builddir => [],
		  abs      => [],
		 },

   c_includes => {
		  diagroot => ['verif/diag/c/include'],
		  startdir => ['.'],
		  builddir => ['.'],
		  abs      => [],
		 },

   # Default build directory (this is used as a default for the State
   # version, which is the one that really gets used).  Can be full
   # path or relative to starting directory.

   build_dir    => './build',

   # Full path or relative to build_dir
   local_src    => 'diag.src',
   local_s      => 'diag.s',
   local_pl     => 'diag.pl',
   local_cpp    => 'diag.cpp',
   local_m4     => 'diag.m4',
   local_ldscr  => 'diag*.ld_scr',
   local_exe    => 'diag*.exe',
   local_image  => 'mem.image',
   local_events => 'diag.ev',
   local_symtab => 'symbol.tbl',
   local_goldfinger => 'diag.goldfinger',
   local_directives => 'diag.midas',

   local_cmdfile => '.midas_args',
   local_oldcmdfile => '.midas_args.old',
   local_oldm4 => '.midas.diag.m4.old',

   intermed_files => [qw(local_src local_s local_pl local_cpp local_m4
			 local_ldscr local_goldfinger local_directives
			 sec*.s sec*.o
			)],

   force_build => 0,

   allow_tsb_conflicts => 0,
   allow_empty_sections => 0,
   allow_illegal_page_sizes => 0,
   allow_duplicate_tags => 0,
   allow_misaligned_tsb_base => 0,
   gen_all_tsbs => 0,
   compress_image => 1,
   env_zero => 1,
   build_threads => 3,

   goldfinger_cmd => 'goldfinger',
   goldfinger_version => '1.07',

   default_radix => 'decimal',

   product_files => {
		     required => [qw(local_s local_image local_events
				     local_symtab local_exe)],
		     optional => [qw(local_pl)],
		     clean    => [qw(local_image local_events
				     local_symtab local_exe)],
		    },
   copy_products => 0,

   diff_cmd => 'diff',


   # If 1, use only full paths.  Otherwise use relative paths wherever
   # possible to make output more clear.
   full_paths   => 0,

   # Default MMU type
   mmu_type     => 'niagara',
   ttefmt       => 'sun4v',
   tsbtagfmt    => 'tagaccess',


   pal_cmd      => 'pal',
   pal_opt      => [],
   pal_diag_args => [],

   cpp_cmd      => 'bw_cpp',
   cpp_opt      => ['-B -P'],

   m4_cmd       => 'bw_m4',
   m4_opt       => [],

   as_cmd       => 'g_as',
   as_opt       => ['-xarch=v9b'],

   ld_cmd       => 'g_ld',
   ld_opt       => ['-b elf64-sparc', '-no-warn-mismatch',
		    '--no-check-sections'],

   gcc_cmd      => 'gcc',
   gcc_opt      => ['-m64', '-nostdinc', '-fno-common', '-fno-builtin'],

   perl_cmd     => 'perl',
  );


##############################################################################

sub init_config {
  my $def_config= \%default_config;

  Midas::Command::chat "init_config, project is $PROJECT.\n";
  my $dumper = Data::Dumper->new([$def_config]);

  $dumper->Purity(1)->Deepcopy(1);
  my $new_config = eval "no strict; " . $dumper->Dump;

  Midas::Command::fatal("Deepcopy of config failed!: $@\n", M_CODE) if $@;

  %CONFIG = %{ $new_config };

  {
    package Config_Sandbox;
    our %PROJ_CONFIG;
    unless(my $return = do $Midas::Globals::CONFIG_FILE) {
       Midas::Command::chat
	   ("WARNING! Can't parse config file ".
	    "'$Midas::Globals::CONFIG_FILE': $@\n".
	    "Using defaults.\n", 1) if $@;
       Midas::Command::chat
	   ("WARNING! Can't find config file ".
	    "'$Midas::Globals::CONFIG_FILE': $!\n".
	    "Using defaults.\n", 1) unless defined $return;
    } else {
      if(exists $PROJ_CONFIG{$Midas::Globals::PROJECT}) {
	 Midas::Command::chat
	     ("Setting project defaults for project ".
	      "'$Midas::Globals::PROJECT'.\n");
	 foreach my $key (keys %{ $PROJ_CONFIG{$Midas::Globals::PROJECT} } ) {
	   $Midas::Globals::CONFIG{$key} =
	     $PROJ_CONFIG{$Midas::Globals::PROJECT}{$key};
	 }
      } else {
	Midas::Command::chat("WARNING! No project config for project ".
			     "'$Midas::Globals::PROJECT'.\n".
			     "Using defaults.\n", 1);
      }
    }
  }


  (my $MAJOR_VERSION = $Midas::VERSION) =~ s/\..*$//;
  (my $MINOR_VERSION = $Midas::VERSION) =~ s/^.*\.//;

  add_cpp_defines(
		  "MIDAS_VERSION=$Midas::VERSION",
		  "MIDAS_MAJOR_VERS=$MAJOR_VERSION",
		  "MIDAS_MINOR_VERS=$MINOR_VERSION"
		 );

  # Make Path's version of full_paths a *reference* to the Configure version.
  # This way, when one changes, they both change.  Ditto for verbose.
  Midas::Paths::configure(full_paths => \$CONFIG{full_paths});
  Midas::Command::configure(verbose => \$CONFIG{verbose});
}

##############################################################################

sub configure {
  my %args = @_;

  foreach my $key (keys %args) {
    $CONFIG{$key} = $args{$key};
  }

  return %CONFIG;
}

##############################################################################

sub add_cpp_includes {
  my @includes = @_;
  $CONFIG{cpp_includes}{abs} = [] unless exists $CONFIG{cpp_includes}{abs};
  unshift @{$CONFIG{cpp_includes}{abs}}, @includes;
}

##############################################################################

sub add_m4_includes {
  my @includes = @_;
  $CONFIG{m4_includes}{abs} = [] unless exists $CONFIG{m4_includes}{abs};
  unshift @{$CONFIG{m4_includes}{abs}}, @includes;
}

##############################################################################

sub add_link_includes {
  my @includes = @_;
  $CONFIG{link_path}{abs} = [] unless exists $CONFIG{link_path}{abs};
  unshift @{$CONFIG{link_path}{abs}}, @includes;
}

##############################################################################

sub add_csrc_includes {
  my @includes = @_;
  $CONFIG{csrc_includes}{abs} = [] unless exists $CONFIG{csrc_includes}{abs};
  unshift @{$CONFIG{csrc_includes}{abs}}, @includes;
}

##############################################################################

sub add_cpp_defines {
  my @defines = @_;
  push @{$CONFIG{cpp_defines}}, @defines;
}

##############################################################################

sub add_pal_diag_args {
  my @args = @_;
  push @{$CONFIG{pal_diag_args}}, @args;
}

##############################################################################

sub append_configuration {
  my %args = @_;
  foreach my $key (keys %args) {
    if(ref $CONFIG{$key}) {
      if(ref $CONFIG{$key} eq 'ARRAY') {
	push @{$CONFIG{$key}}, @{$args{$key}};
      } else {
	Midas::Command::fatal
	    ("Only know how to append configuration to arrays (not $key).\n");
      }
    } else {
      Midas::Command::fatal("Can't append to scalar key $key\n", M_CODE);
    }
  }
}

##############################################################################
##############################################################################
1;
