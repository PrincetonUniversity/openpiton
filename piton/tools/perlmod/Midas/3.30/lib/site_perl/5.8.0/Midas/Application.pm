# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Application.pm
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

package Midas::Application;

use strict;

use File::Copy;

use Midas::AttrBlock;
use Midas::Configure;
use Midas::Globals;
use Midas::Command;
use Midas::Segment;
use Midas::Paths;
use Midas::Error;
use Midas::Preprocess ':all';
require Midas::Section;


use fields qw(name filetag sections srcfile srcline args
	      is_linked external_path goldfinger_cmds
	     );

##############################################################################

sub new {
  my $this = shift;
  my %args = @_;

  unless (ref $this) {
    $this = fields::new($this);
  }

  $this->set_defaults();

  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }

  $this->parse_args() if defined $this->{args};

  return $this;
}

##############################################################################

sub set_defaults {
  my $this = shift;
  $this->{sections} = [] unless defined $this->{sections};
  $this->{goldfinger_cmds} = [] unless defined $this->{goldfinger_cmds};
  $this->{is_linked} = 0;
}

##############################################################################

sub name {
  my $this = shift;
  return $this->{name};
}

##############################################################################

sub parse_args {
  my $this = shift;

  my $args = $this->{args};
  $args =~ s/\s//g;
  my @args = split /,/, $args;
  foreach my $arg (@args) {
    if($args =~ /FILE\=(\S+)/i) {
      $this->{is_linked} = 1;
      $this->{external_path} = $1;

      $this->copy_external_to_build_dir();
    }
  }
}

##############################################################################

sub is_blank {
  my $this = shift;

  return 0 if @{$this->{sections}};
  return 0 if $this->{is_linked};
  return 1;
}

##############################################################################

sub copy_external_to_build_dir {
  my $this = shift;


  my @search = get_includes($CONFIG{link_paths});
  my $local_exe = path_to_build_file($this->exe_name(), $STATE);

  foreach my $testdir (@search) {
    my $testfile = File::Spec->catfile($testdir, $this->{external_path});
    if(-e $testfile) {
      chat "Copying $testfile to $local_exe\n";
      copy($testfile, $local_exe);
      last;
    }
  }

  if(not -e $local_exe) {
    fatal "Couldn't find \"$this->{external_path}\" in search path: @search\n",
      M_FILE;
  }
}

##############################################################################

sub filetag {
  my $this = shift;

  return '' if($this->name() eq 'default');

  my $tag = lc $this->{name};
  $tag =~ s/\.//;
  $tag =~ s/\.$//;
  return $tag;
}

##############################################################################

sub is_linked {
  my $this = shift;
  return $this->{is_linked};
}

##############################################################################

sub exe_name {
  my $this = shift;

  return $this->expand_file($CONFIG{local_exe});
}

##############################################################################

sub ldscr_name {
  my $this = shift;

  return $this->expand_file($CONFIG{local_ldscr});

}

##############################################################################

sub expand_file {
  my $this = shift;
  my $file = shift;
  my $name = $this->{name};

  my $filetag = $this->filetag();

  $filetag = '.' . $filetag unless ($filetag =~ /^\./ or $filetag eq '');
  $file =~ s/\*/${filetag}/;
  return $file;
}

##############################################################################

sub add_section {
  my $this       = shift;
  my $section    = shift;

  if($this->{is_linked}) {
    my $appname = $this->{name};
    my $secname = $section->{name};
    my $srcfile = $section->{srcfile};
    my $srcline = $section->{srcline};
    fatal "Application $appname cannot contain SECTIONs\n" .
      "($secname at file=$srcfile, line=$srcline\n", M_SECSYNTAX;
  }

  push @{$this->{sections}}, $section;
}

##############################################################################

sub add_goldfinger_cmd {
  my $this = shift;
  my $cmdstring = shift;

  push @{$this->{goldfinger_cmds}}, $cmdstring;
}

##############################################################################

sub get_sec_list {
  my $this = shift;
  return @{ $this->{sections} };
}

##############################################################################

sub write_to_goldfinger {
  my $this = shift;
  my $fh   = shift;

  my $app_name = $this->name();
  my $exe_name = $this->exe_name();
  my $exe = path_to_build_file($exe_name, $STATE);
  my $srcfile = $this->{srcfile};
  my $srcline = $this->{srcline};

  print $fh "APP $app_name\n";
  print $fh "\n";
  print $fh "  ELF_FILE = \"$exe\";\n";
  print $fh "  SRC_FILE = \"$srcfile\";\n" if defined $srcfile;
  print $fh "  SRC_LINE = $srcline;\n" if defined $srcline;
  print $fh "\n";

  my @sections = $this->get_sec_list();


  foreach my $section (@sections) {
    foreach my $seg (Midas::Segment->all_names()) {
      my @attrs = $section->get_segment_attrs($seg);
      next unless @attrs;
	
      my $linkname = $section->get_segment_link_name($seg);

      foreach my $attr (@attrs) {
	$attr->write_to_goldfinger($seg, $linkname, $fh);
      }
    }
  }

  print $fh "\n";

  foreach my $cmd (@{$this->{goldfinger_cmds}}) {
    print $fh "$cmd\n";
    print $fh "\n";
  }

  print $fh "END APP\n";
  print $fh "\n";
}

##############################################################################

sub print_debug {
  my $this = shift;

  chat "App: $this->{name}\n", 3;
  foreach my $sec (@{$this->{sections}}) {
    my $str = '';
    $str .= "  Section: \"$sec->{name}\"  ";

    my @link_attrs = $sec->get_link_attrs();

    foreach my $seg (Midas::Segment->all_names()) {
      my $va = $link_attrs[0]->get_segment_va($seg);
      $str .= "${seg}_va=$va " if defined $va;
    }

    chat "$str\n", 3 if $str =~ /\S/;
  }
}

##############################################################################
1;
