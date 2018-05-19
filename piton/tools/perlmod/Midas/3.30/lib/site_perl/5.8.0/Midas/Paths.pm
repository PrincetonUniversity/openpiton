# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Paths.pm
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

package Midas::Paths;
use strict;

require Exporter;
use Cwd;
use File::Spec;


use Midas::Command;
use Midas::Error;

our @ISA = qw(Exporter);
our @EXPORT = qw(cd compact_path full_path
		 path_to_build_file);

our $Full_paths = 0;

##############################################################################

# Note this function is not at all robust.  Should work on that
sub are_dirs_same {
  my $dir1 = shift;
  my $dir2 = shift;

  my $canon_dir1 = File::Spec->canonpath(File::Spec->rel2abs($dir1));
  my $canon_dir2 = File::Spec->canonpath(File::Spec->rel2abs($dir2));

  return ($canon_dir1 eq $canon_dir2);
}

##############################################################################

# ACTUALLY A CLASS METHOD
sub pushd {
  my $class = shift;
  my $dir   = shift;

  my $this = {};
  bless $this, $class;

  if(not are_dirs_same($dir, getcwd)) {
    $this->{old} = getcwd;
    cd($dir);
  }

  return $this;
}

##############################################################################

# Not for public consumption
sub popd {
  my $this = shift;
  return unless defined $this->{old};
  cd(compact_path($this->{old}));
}

##############################################################################

# implicit call to popd
sub DESTROY {
  my $this = shift;
  $this->popd();
}

##############################################################################

sub opt_full_paths {
  return $$Full_paths if ref $Full_paths;
  return $Full_paths;
}

##############################################################################

sub configure {
  my %args = @_;

  foreach my $key (keys %args) {
    if($key eq 'full_paths') {
      $Full_paths = $args{$key};
    } else {
      fatal "Midas::Paths does not recongnize configuration option ".
	"$key.\n", M_BADCONFIG;
    }
  }

  return ( full_paths => opt_full_paths );

}

##############################################################################

# compact_path
# Converts to full or relative (to $relto or cwd) path, whichever is shorter.
# If Full_Paths is enabled, then always return full path.

##############################################################################

sub compact_path {
  my $path = shift;
  my $relto = shift;

  $relto = getcwd unless defined $relto;
  my $abs = File::Spec->rel2abs($path, $relto);
  my $rel = File::Spec->abs2rel($abs, $relto);

  my $compact = ((length $rel) < (length $abs)) ? $rel : $abs;
  $compact = '.' if length($compact) == 0;

  return opt_full_paths() ? $abs : $compact;
}

##############################################################################

sub full_path {
  my $path = shift;
  my $relto = shift;

  $relto = getcwd unless defined $relto;
  my $abs = File::Spec->rel2abs($path, $relto);
  return $abs;
}

##############################################################################

sub cd {
  my $dir = shift;
  if(opt_full_paths()) {
    $dir = File::Spec->rel2abs($dir);
  }
  chat "cd $dir\n";
  chdir $dir or fatal "Can't cd to $dir: $!\n", M_DIR;
}

##############################################################################

# Get filename.  $file argument is a full path or a path relative to
# build_dir. Second argument defines build_dir.  If no second
# argument, assume build_dir is cwd.  If it's a string, assume the
# string is build_dir.  If it's a reference, assume it's a
# Midas::State object.  Return value is the compact path to the file.

##############################################################################

sub path_to_build_file {
  my $file  = shift;
  my $arg   = shift;  # either build_dir or state object or undef for build=cwd

  my $build_dir;
  if(not defined $arg) {
    $build_dir = getcwd;
  } elsif (ref $arg) {
    my $state = $arg;

    # Do the require at this late date so as to not mess up exports
    # (this is a circular include).

    require Midas::State;

    $build_dir = $state->get_build_dir('-abs');
  } else {
    $build_dir = $arg;
  }

  my $expanded_file;
  if($file =~ m|^/|) {
    $expanded_file = $file;
  } else {
    $expanded_file = File::Spec->rel2abs($file, $build_dir);
  }

  return compact_path $expanded_file;
}

##############################################################################
##############################################################################

1;
