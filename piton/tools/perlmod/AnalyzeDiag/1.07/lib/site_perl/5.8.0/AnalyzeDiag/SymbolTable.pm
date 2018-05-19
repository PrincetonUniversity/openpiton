# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: SymbolTable.pm
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

package AnalyzeDiag::SymbolTable;

use strict;
use warnings;
use File::Spec;
use IO::File;
use Tie::IxHash;

use AnalyzeDiag::Output;

use fields qw(filename);

###############################################################################

sub create_from_dir {
  my $class = shift;
  my $dir = shift;

  my $symtab = File::Spec->catfile($dir, 'symbol.tbl');
  my $obj;
  if(-e $symtab) {
    $obj = AnalyzeDiag::SymbolTable->new();
    $obj->filename($symtab);
  } else {
    script_die "Cannot find '$symtab'.\n";
  }
  return $obj;
}

###############################################################################

sub new {
  my $this = shift;

  unless (ref $this) {
    $this = fields::new($this);
  }

  return $this;
}

###############################################################################

sub filename {
  my $this = shift;
  my $filename = shift;
  $this->{filename} = $filename if defined $filename;
  return $this->{filename};
}

###############################################################################

sub get_vas_for_labels {
  my $this = shift;
  my $labellist = shift;

  my $fh = IO::File->new($this->filename()) or
    script_die "Can't open '". $this->filename() ."': $!\n";

  tie my %labels, 'Tie::IxHash';
  foreach my $label (@$labellist) {
    $labels{$label} = [];
  }

  while(<$fh>) {
    my ($full_label, $va, $ra, $pa) = split ' ';
    next unless defined $pa;
    foreach my $label (@$labellist) {
      if($label eq $full_label or $full_label =~ /\.$label$/) {
	push @{$labels{$label}}, $va;
      }
    }
  }
  return \%labels;
}

###############################################################################
1;
