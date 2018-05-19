# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Output.pm
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

package DiagList::Output;

use strict;
use Carp;

use DiagList::Settings;
use TRELoad 'OutputDirector';

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(chat fatal $OUT );

our $OUT = OutputDirector->new();

##############################################################################

sub chat {
  my $msg = shift;
  $OUT->print_status("$msg") if debug;
}

##############################################################################

sub fatal {
  my $msg  = shift;
  my $file = shift;
  my $line = shift;

  my $str = "DiagList: $msg\n";
  if(defined $file or defined $line) {
    $str .= "File=$file, " if defined $file;
    $str .= "Line=$line"   if defined $line;
    $str .= "\n";
  }

  croak $str;
}

###############################################################################
1;
