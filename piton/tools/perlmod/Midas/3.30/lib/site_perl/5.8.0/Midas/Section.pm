# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Section.pm
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

package Midas::Section;
use strict;

use File::Spec;
use File::Copy;
use File::Basename;
use Carp;

use Midas::Command;
use Midas::Configure;
use Midas::Paths;
use Midas::Preprocess ':internals';
use Midas::State;
use Midas::Globals;
use Midas::Source;
use Midas::Application;
use Midas::Error;
use Midas::Segment;

use TRELoad 'BitFieldTie';

use fields qw(
	      name

	      seg_attrs
	      link_attrs

	      files

	      srcfile
	      srcline
	      srcfilestop
	      srclinestop

	      args

	      appobj

	     );

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(init_section);

our $Num = 0;

##############################################################################

sub init_section {
  $Num = 0;
}

##############################################################################

sub new {
  my $this = shift;
  my %args = @_;

  unless (ref $this) {
    $this = fields::new($this);
  }

  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }
  return $this;
}

##############################################################################

sub new_from_line {
  my $class     = shift;
  my $startline = shift;
  my $fh        = shift;
  my $srcfile   = shift;
  my $srcline   = shift;
  my $appobj    = shift;

  my $srcfile_start = $srcfile;
  my $srcline_start = $srcline;

  local ($_);
  $_ = $startline;


  my $mmu = $STATE->get_mmu();


  fatal "Badly formatted SECTION line=$srcline, file=$srcfile:\n$_",
    M_SECSYNTAX unless /^\s*SECTION\s*(\S+)\s*(.*)\s*$/;

  my $secname = $1;
  my @secargs = split ',', $2;

  my $link_attrs;


  my $section_args = {};
  foreach my $secarg (@secargs) {
    $secarg =~ s/\s+//g;
    if($secarg =~ /(\S+)=(\S+)/) {
      $section_args->{lc $1} = $2;
    } elsif($secarg =~ /(\S+)/) {
      $section_args->{lc $1} = 1;
    }
  }

  if(keys %$section_args) {
    $link_attrs = $mmu->create_attrs_object('link');
    $link_attrs->init_from_args($srcfile, $srcline, name => $secname,
				%$section_args);
  }


  my $name = lc $secname;
  $name =~ s/^\.//;
  my $secnum = $Num++;
  my $file = "sec${secnum}.${name}.s";

  $file = path_to_build_file $file; # in build_dir


  (my $ofile = $file) =~ s/\.s$/.o/;

  my $source = Midas::Source::Assembly->new(sfile => $file,
					    ofile => $ofile,
					    fullsource => $file,
					   );

  my %seg_hash = ();
  foreach my $segment (Midas::Segment->all_names()) {
    $seg_hash{$segment} = [];
  }

  my $this = Midas::Section->new
    (
     name         => $secname,
     args         => $section_args,
     seg_attrs    => \%seg_hash,
     link_attrs   => defined $link_attrs ? [ $link_attrs ] : [],
     files        => [ $source ],
     srcfile      => $srcfile_start,
     srcline      => $srcline_start,
     srcfilestop  => $srcfile,
     srclinestop  => $srcline,
     appobj       => $appobj,
    );

  return $this;

}

##############################################################################

sub get_segment_attrs {
  my $this = shift;
  my $segment = shift;
  return @{$this->{seg_attrs}{$segment}};
}

##############################################################################

sub add_attrs {
  my $this = shift;
  my $attrs = shift;

  if($attrs->{type} eq 'link') {
    push @{$this->{link_attrs}}, $attrs;
  } elsif(exists $this->{seg_attrs}{$attrs->{type}}) {
    my $len = @{$this->{seg_attrs}{$attrs->{type}}};
    push @{$this->{seg_attrs}{$attrs->{type}}}, $attrs;
    $attrs->unique_name($this->secname . "_$attrs->{type}_$len");
  }
}

##############################################################################

sub get_map_attrs {
  my $this = shift;
  my @attrs;
  foreach my $seg (Midas::Segment->all_names()) {
    push @attrs, $this->get_segment_attrs($seg);
  }
  return @attrs;
}

##############################################################################

sub get_link_attrs {
  my $this = shift;
  return @{$this->{link_attrs}};
}

##############################################################################

sub print_debug {
  my $this = shift;

  chat "Section $this->{name}\n", 3;

  foreach my $seg (Midas::Segment->all_names()) {
    my $num = $this->get_segment_attrs($seg);
    chat " num_$seg\t=$num\n", 3;
  }


  my $nl = $this->get_link_attrs();
  chat " num_link   = $nl\n", 3;

  my @files = @{$this->{files}}; my $n_files = @files;
  chat " FILES ($n_files)\n", 3;
  foreach my $f (@files) {
    chat "    " . $f->debug_string . "\n", 3;
  }
}

##############################################################################

# This function may be called from a child thread, sot it is important
# that it doesn't write any state (i.e., have any side-effects)
sub build {
  my $this = shift;
  foreach my $source (@{$this->{files}}) {
    $source->build();
  }
}

#############################################################################

sub secname {
  my $this = shift;
  return lc $this->{name};
}

##############################################################################

sub preprocess_midas_directive {
  my $this = shift;
  my $line = shift;

  my $output = $line;


  $output =~ s/(\$(\w+))/exists $ENV{$2} ? $ENV{$2} : $1/ge;

  return $output;
}

##############################################################################

sub parse_midas_cc_line {
  my $this = shift;
  my $line = shift;
  my $srcline = shift;
  my $srcfile = shift;

  my ($file, $output, $args);
  my $processed = $this->preprocess_midas_directive($line);
  if($processed =~ /\bFILE\s*=\s*(\S+)/) {
    $file = $1;
  }
  if($processed =~ /\bOUTPUT\s*=\s*(\S+)/) {
    $output = $1;
  }
  if($processed =~ /\bARGS\s*=\s*(.*)$/) {
    $args = $1;
  }

  fatal "MIDAS_CC line does not contain FILE argument at line=$srcline, ".
    "file=$srcfile\n", M_DIRECTIVESYNTAX unless defined $file;

  my $assemble = 0;
  $assemble = 1 if defined $args && $args =~ /(\s|\A)-S(\s|\Z)/;

  my $sfile;
  my $ofile;

  my $full_file = $file;
  $file = basename $file;

  if($assemble) {
    $sfile = $output;
    if(not defined $output) {
      if($file =~ /\.c$/) {
	($sfile = $file) =~ s/\.c$/.s/;
      } else {
	$sfile = $file . ".s";
      }
      ($ofile = $sfile) =~ s/\.s$/.o/;
    } elsif($sfile =~ /\.s$/) {
      ($ofile = $sfile) =~ s/\.s$/.o/;
    } elsif($sfile =~ /\.o$/) {
      $ofile = $sfile;
      $sfile =~ s/\.o$/.s/;
    } else {
      $ofile = $sfile . ".o";
    }
  } else {
    $ofile = $output;
    if(not defined $output) {
      if($file =~ /\.c$/) {
	($ofile = $file) =~ s/\.c$/.o/;
      } else {
	$ofile = $file . ".o";
      }
    }
  }

  my $rec = {
	     cfile => $file,
	     sfile => $sfile,
	     ofile => $ofile,
	     assemble => $assemble,
	     args => $args,
	    };

  chat "LINE: $line\n", 3;
  chat "  cfile = $file\n", 3;
  chat "  sfile = $sfile\n", 3;
  chat "  ofile = $ofile\n", 3;
  chat "  assemble = $assemble\n", 3;
  chat "  args = $args\n", 3;
  chat "  fullsource = $full_file", 3;

  my $source = Midas::Source::C->new(
				     cfile => $file,
				     sfile => $sfile,
				     ofile => $ofile,
				     args => $args,
				     fullsource => $full_file,
				    );

  $source->copy_to_build_dir();
  $source->process_source();

  push @{$this->{files}}, $source;

}

##############################################################################

sub parse_midas_obj_line {
  my $this = shift;
  my $line = shift;
  my $srcline = shift;
  my $srcfile = shift;

  my $file;
  my $processed = $this->preprocess_midas_directive($line);
  if($processed =~ /\bFILE\s*=\s*(\S+)/) {
    $file = $1;
  }

  fatal "MIDAS_OBJ line does not contain FILE argument at line=$srcline, ".
    "file=$srcfile\n", M_DIRECTIVESYNTAX unless defined $file;

  chat "LINE: $line\n", 3;
  chat "  ofile = $file\n", 3;

  my $source = Midas::Source::Object->new(
					  ofile => $file,
					  fullsource => $file,
					 );

  $source->copy_to_build_dir();
  $source->process_source();

  push @{$this->{files}}, $source;

}

##############################################################################

sub parse_midas_lib_line {
  my $this = shift;
  my $line = shift;
  my $srcline = shift;
  my $srcfile = shift;

  my $file;
  my $processed = $this->preprocess_midas_directive($line);
  if($processed =~ /\bFILE\s*=\s*(\S+)/) {
    $file = $1;
  }

  fatal "MIDAS_LIB line does not contain FILE argument at line=$srcline, ".
    "file=$srcfile\n", M_DIRECTIVESYNTAX unless defined $file;

  chat "LINE: $line\n", 3;
  chat "  ofile = $file\n", 3;

  my $source = Midas::Source::Library->new(
					   ofile => $file,
					   fullsource => $file,
					  );

  $source->copy_to_build_dir();
  $source->process_source();

  push @{$this->{files}}, $source;

}

##############################################################################

sub get_object_list {
  my $this = shift;

  my @olist =
    map { $_->get_object_file() }
      grep { ! $_->is_library() }
	@{$this->{files}};
  return @olist;
}

##############################################################################

sub get_library_list {
  my $this = shift;

  my @alist =
    map { $_->get_object_file() }
      grep { $_->is_library() }
	@{$this->{files}};
  return @alist;
}

##############################################################################

sub sanity_check {
  my $this = shift;

  my $fline = "File=$this->{srcfile}, Line=$this->{srclinestop}";

  my $error = 0;
  my @messages;

  if(scalar($this->get_map_attrs()) == 0) {
    my $message = "Section $this->{name} has no attr blocks!\n";
    $message .="  at $fline\n";
    push @messages, { message => $message, code => M_SECSYNTAX };
  }

  my %link_seg;
  foreach my $link_attr ($this->get_link_attrs()) {
    push @messages, $link_attr->sanity_check();

    foreach my $seg (Midas::Segment->all_names()) {
      $link_seg{$seg} = 0 unless exists $link_seg{$seg};
      $link_seg{$seg} ||= $link_attr->has_segment($seg);
    }
  }

  foreach my $attr ($this->get_map_attrs()) {
    push @messages, $attr->sanity_check();
  }

  foreach my $seg (Midas::Segment->all_names()) {
    my @seg_attrs = $this->get_segment_attrs($seg);
    if(not $CONFIG{allow_empty_sections}) {
      if($link_seg{$seg} and ! @seg_attrs) {
	my $message =
	  "Section $this->{name} has ${seg}_va but no attr_${seg} ".
	    "blocks\n at $fline\n";
	push @messages, { message => $message, code => M_SECSYNTAX };
      }
    }
    foreach my $attr (@seg_attrs) {
      my $attr_fline = $attr->get_fline();
      if(not $link_seg{$seg}) {
	my $message = "Section $this->{name} has attr_$seg but no ${seg}_va\n".
	  " at $attr_fline\n";
	push @messages, { message => $message, code => M_SECSYNTAX };
     }
    }
  }

  return @messages;
}

##############################################################################

sub has_segment {
  my $this = shift;
  my $segment = shift;
  return 1 if scalar $this->get_segment_attrs($segment);
  return;
}

##############################################################################

sub get_section_link_tag {
  my $this = shift;
  my @olist = $this->get_object_list();
  @olist = $this->get_library_list() unless @olist;
  my $sectag = basename $olist[0], '.o', '.a';
  return $sectag;
}

##############################################################################

sub get_segment_link_name {
  my $this = shift;
  my $segment = shift;
  my $sectag = $this->get_section_link_tag();
  my $link_suffix = Midas::Segment->name2link_suffix($segment);
  return "$sectag$link_suffix";
}

##############################################################################
##############################################################################


1;
