# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Measurement.pm
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

package AnalyzeDiag::Measurement;

use strict;
use warnings;

use AnalyzeDiag::SymbolTable;

use fields qw(name start end
	     );

###############################################################################

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

###############################################################################

sub name {
  my $this = shift;
  my $name = shift;
  $this->{name} = $name if defined $name;
  return $this->{name};
}

###############################################################################

sub start {
  my $this = shift;
  my $start = shift;
  $this->{start} = $start if defined $start;
  return $this->{start};
}

###############################################################################

sub end {
  my $this = shift;
  my $end  = shift;
  $this->{end} = $end if defined $end;
  return $this->{end};
}

###############################################################################
1;
