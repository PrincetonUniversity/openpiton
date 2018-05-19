# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Segment.pm
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

package Midas::Segment;
use strict;
use warnings;
use Carp;
use Tie::IxHash;
use Midas::Command;
use Midas::Error;

use fields qw(type);

use constant
  {
    SEG_UNDEF  => 0,
    SEG_TEXT   => 1,
    SEG_DATA   => 2,
    SEG_BSS    => 3,
  };

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(SEG_UNDEF SEG_TEXT SEG_DATA SEG_BSS);



our %Segments =
  (
   SEG_TEXT()    => {
		     name        => 'text',
		     link_suffix => 't',
		     va_name     => 'text_va',
		     elfname     => '.text',
		     include_elf => [qw(.rodata)],
		     elfname_out => '.text* .rodata*',
		  },
   SEG_DATA()    => {
		     name        => 'data',
		     link_suffix => 'd',
		     va_name     => 'data_va',
		     elfname     => '.data',
		  },
   SEG_BSS()    =>  {
		     name        => 'bss',
		     link_suffix => 'b',
		     va_name     => 'bss_va',
		     elfname     => '.bss',
	          },
  );



our %RevNames = map { ( $Segments{$_}{name}, $_) } keys %Segments;
our %ElfNames = map
  { defined $Segments{$_}{elfname} ?
      ( $Segments{$_}{elfname}, $Segments{$_}{name} ) : () } keys %Segments;

foreach my $code (keys %Segments) {
  next unless exists $Segments{$code}{include_elf};
  foreach my $included (@{$Segments{$code}{include_elf}}) {
    $ElfNames{$included} = $Segments{$code}{name};
  }
}

our %LinkSuffixes = map
  { ( $Segments{$_}{link_suffix}, $Segments{$_}{name} ) } keys %Segments;

# rodata must appear before text or the linker will merge them
#our @Names = qw(rodata text data bss);
our @Names = qw(text data bss);

my @keys = keys %Segments;
if(@keys > @Names) {
  fatal "In Midas::Segment, @Names is incomplete.\n", M_CODE;
} elsif(@Names > @keys) {
  fatal "In Midas::Segment, @Names has extra entry\n", M_CODE;
}
foreach my $name (@Names) {
  fatal "Segment name '$name' is not set up correctly in Midas::Segment\n",
    M_CODE unless exists $RevNames{$name};
}

###############################################################################

sub new {
  my $class = shift;
  my $type = shift;

  $type = $class->name2type($type) if $type =~ /[a-zA-Z]/;

  my $this;
  if(ref $class) {
    my $classtype = ref $class;
    $this = fields::new($classtype);
    $this->{type} = $class->type() if defined $class->type();
  } else {
    $this = fields::new($class);
    $this->{type} = $type if defined $type;
  }
  return $this;
}

###############################################################################

sub type {
  my $this = shift;
  my $set  = shift;

  if(defined $set) {
    fatal Carp::longmess("No such segment type '$set'.\n"), M_CODE
      unless exists $Segments{$set}{name};
    $this->{type} = $set;
  }
  return $this->{type};
}

###############################################################################

sub name {
  my $this = shift;
  my $set  = shift;

  if(defined $set) {
    $this->type($this->name2type($set));
  }
  return $this->type2name($this->{type});
}

###############################################################################
###############################################################################

sub is_segment_name {
  my $class = shift;
  my $name = shift;

  return 1 if exists $RevNames{$name};
  return 0;
}

###############################################################################

sub name2type {
  my $class = shift;
  my $name  = shift;

  fatal Carp::longmess("No such segment name '$name'.\n"), M_CODE
    unless exists $RevNames{$name};

  return $RevNames{$name};
}

###############################################################################

sub name2va_name {
  my $class = shift;
  my $name  = shift;

  fatal Carp::longmess("No such segment name '$name'.\n"), M_CODE
    unless exists $RevNames{$name};

  return $Segments{$RevNames{$name}}{va_name};
}

###############################################################################

sub name2elf_name {
  my $class = shift;
  my $name  = shift;

  fatal Carp::longmess("No such segment name '$name'.\n"), M_CODE
    unless exists $RevNames{$name};

  return exists $Segments{$RevNames{$name}}{elfname_out} ?
    $Segments{$RevNames{$name}}{elfname_out} :
      $Segments{$RevNames{$name}}{elfname};
}

###############################################################################

sub name2link_suffix {
  my $class = shift;
  my $name  = shift;

  fatal Carp::longmess("No such segment name '$name'.\n"), M_CODE
    unless exists $RevNames{$name};

  return $Segments{$RevNames{$name}}{link_suffix};
}

###############################################################################

sub type2name {
  my $class = shift;
  my $type  = shift;

  fatal Carp::longmess("No such segment type '$type'.\n"), M_CODE
    unless exists $Segments{$type}{name};

  return $Segments{$type}{name};
}

###############################################################################

sub all_names {
  my $class = shift;
  return @Names;
}

###############################################################################

sub all_va_names {
  my $class = shift;
  return map { $Segments{$_}{va_name} } keys %Segments;
}

###############################################################################
###############################################################################
1;
