# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Source.pm
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

package Midas::Source;

use Midas::Command;
use Midas::Globals;
use Midas::Paths;
use Midas::Error;

use File::Spec;
use File::Copy;
use File::Basename;


use strict;

use fields qw(ofile args fullsource);

###############################################################################

sub new {
  my $class = shift;
  my %args = @_;

  my $this = fields::new($class);
  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }

  return $this;
}

###############################################################################

sub set_defaults {
  my $this = shift;

}

###############################################################################

sub get_full_source_file {
  my $this = shift;
  return $this->{fullsource};
}

###############################################################################

sub get_source_file {
  my $this = shift;
  return basename $this->get_full_source_file();
}

###############################################################################

sub get_object_file {
  my $this = shift;
  return $this->{ofile};
}

###############################################################################

sub is_library {
  my $this = shift;
  return 0;
}

###############################################################################

sub from_diag_source {
  my $this = shift;
  return 0;
}

###############################################################################

sub copy_to_build_dir {
  my $this = shift;

  fatal "Cannot copy_to_build_dir of file generated from diag source\n", M_FILE
    if $this->from_diag_source();

  my @search       = $this->get_search_paths();
  my $full_source  = $this->get_full_source_file();
  my $local_source = path_to_build_file($this->get_source_file(), $STATE);

  foreach my $testdir (@search) {
    my $testfile = File::Spec->catfile($testdir, $full_source);
    if(-e $testfile) {
      chat "Copying $testfile to $local_source\n";
      copy($testfile, $local_source);
      last;
    }
  }
  if(not -e $local_source) {
    fatal "Could not find \"$full_source\" in search path: @search\n", M_FILE;
  }

}

###############################################################################

sub get_search_paths {
  my $this = shift;
  fatal "Cannot get_search_paths of abstract superclass\n", M_CODE;
}

###############################################################################

sub process_source {
  my $this = shift;
}

###############################################################################

sub build {
  my $this = shift;
  fatal "Cannot build source file in abstract superclass\n", M_CODE;
}

###############################################################################

sub debug_string {
  my $this = shift;

  my $str = "O=$this->{ofile} ";
  $str   .= "ARGS=\"$this->{args}\" " if defined $this->{args};

  return $str;
}
###############################################################################
###############################################################################

package Midas::Source::Assembly;

use strict;

use Midas::Paths;
use Midas::Globals;
use Midas::Command;
use Midas::Error;

use base 'Midas::Source';
use fields qw(sfile);

###############################################################################

sub new {
  my $class = shift;
  my %args = @_;

  my $this = fields::new($class);
  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }

  return $this;
}

###############################################################################

sub set_defaults {
  my $this = shift;
  $this->SUPER::set_defaults();
}

###############################################################################

sub get_search_paths {
  my $this = shift;
  return;
}

###############################################################################

sub from_diag_source {
  my $this = shift;
  return 1;
}

###############################################################################

sub debug_string {
  my $this = shift;

  my $str = "ASM: S=$this->{sfile} ";
  $str .= $this->SUPER::debug_string();
  return $str;
}

###############################################################################

# This function may be called from a child thread, sot it is important
# that it doesn't write any state (i.e., have any side-effects)
sub build {
  my $this = shift;
  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  my $source = $this->get_source_file();
  my $cmd = "$CONFIG{as_cmd} ";
  $cmd   .= "$this->{args} " if defined $this->{args};
  $cmd   .= join ' ', @{$CONFIG{as_opt}};
  $cmd   .= " $source -o $this->{ofile}";

  run_command($cmd, -errcode => M_ASMFAIL);
}

###############################################################################
###############################################################################

package Midas::Source::C;

use strict;

use Midas::Globals;
use Midas::Preprocess ':all';
use Midas::Command;
use Midas::Paths;
use Midas::Error;


use base 'Midas::Source';
use fields qw(cfile sfile);

###############################################################################

sub new {
  my $class = shift;
  my %args = @_;

  my $this = fields::new($class);
  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }

  return $this;
}

###############################################################################

sub set_defaults {
  my $this = shift;

  $this->SUPER::set_defaults();
}

###############################################################################

sub get_search_paths {
  my $this = shift;
  return get_includes($CONFIG{csrc_includes});
}

###############################################################################

sub process_source {
  my $this = shift;
  # Run gcc -S if assembly

  if(defined $this->{sfile}) {
    my $cmd = $CONFIG{gcc_cmd};
    my $gccopt = join ' ', @{$CONFIG{gcc_opt}};

    my @incs = map { "-I$_" } get_includes($CONFIG{c_includes});

    # Don't use cfile directly, since it may contain path seperator.
    my $c_file = $this->get_source_file();

    $cmd .= " $gccopt @incs " if defined $gccopt;
    $cmd .= " $this->{args} " if defined $this->{args};
    $cmd .= " $c_file -o $this->{sfile}";

    $cmd =~ s/\s+/ /g;

    chat "Compiling C code $c_file to generate $this->{sfile}\n";
    run_command($cmd, -errcode => M_CCFAIL);
  }
}

###############################################################################

# This function may be called from a child thread, sot it is important
# that it doesn't write any state (i.e., have any side-effects)
sub build {
  my $this = shift;
  my $pushd = Midas::Paths->pushd($STATE->get_build_dir);

  if(defined $this->{sfile}) {
    # Already compiled to assembly - now just assemble

    my $args = join ' ', @{$CONFIG{as_opt}};
    run_command("$CONFIG{as_cmd} $args $this->{sfile} -o $this->{ofile}",
	       -errcode => M_ASMFAIL);

  } else {
    # Need to compile from .c

    my $cfile = $this->get_source_file();

    my $cmd = $CONFIG{gcc_cmd};
    my $gccopt = join ' ', @{$CONFIG{gcc_opt}};
    my @incs = map { "-I$_" } get_includes($CONFIG{c_includes});
    $cmd .= " $gccopt @incs " if defined $gccopt;
    $cmd .= " -c $cfile -o $this->{ofile}";
    $cmd =~ s/\s+/ /g;
    run_command($cmd, -errcode => M_CCFAIL);
  }

}

###############################################################################

sub debug_string {
  my $this = shift;

  my $str = "C: C=$this->{cfile} ";
  $str   .= "S=$this->{sfile} " if defined $this->{sfile};
  $str .= $this->SUPER::debug_string();
  return $str;
}

###############################################################################
###############################################################################

package Midas::Source::Object;

use strict;

use Midas::Globals;
use Midas::Preprocess ':all';


use base 'Midas::Source';
use fields qw();

###############################################################################

sub new {
  my $class = shift;
  my %args = @_;

  my $this = fields::new($class);
  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }

  return $this;
}

###############################################################################

sub set_defaults {
  my $this = shift;

  $this->SUPER::set_defaults();
}

###############################################################################

sub build {
  my $this = shift;
}

###############################################################################

sub get_search_paths {
  my $this = shift;
  return get_includes($CONFIG{link_paths});
}

###############################################################################

sub debug_string {
  my $this = shift;
  my $str = "O: ";
  $str .= $this->SUPER::debug_string();
  return $str;
}

###############################################################################
###############################################################################

package Midas::Source::Library;

use strict;

use Midas::Globals;
use Midas::Preprocess ':all';


use base 'Midas::Source';
use fields qw();

###############################################################################

sub new {
  my $class = shift;
  my %args = @_;

  my $this = fields::new($class);
  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }

  return $this;
}

###############################################################################

sub set_defaults {
  my $this = shift;

  $this->SUPER::set_defaults();
}

###############################################################################

sub build {
  my $this = shift;
}

###############################################################################

sub get_search_paths {
  my $this = shift;

  return get_includes($CONFIG{link_paths});
}

###############################################################################

sub debug_string {
  my $this = shift;
  my $str = "L: ";
  $str .= $this->SUPER::debug_string();
  return $str;
}

###############################################################################

sub is_library {
  my $this = shift;
  return 1; # libraries need to link after everything else
}

###############################################################################
###############################################################################
1;
