# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Settings.pm
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

package DiagList::Settings;

use strict;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(configure debug display_warnings);

our $Debug = 0;
our $Disp_warnings = 0;

##############################################################################

sub configure {
  my %args = @_;

  foreach my $key (keys %args) {
    if($key eq 'debug') {
      $Debug    = $args{$key};
    } elsif($key eq 'display_warnings') {
      $Disp_warnings = $args{$key};
    } else {
      fatal("No such configure key \"$key\" in DiagList!");
    }
  }
}

###############################################################################

sub debug {
  return $$Debug if ref $Debug;
  return $Debug;
}

##############################################################################

sub display_warnings {
  return $$Disp_warnings if ref $Disp_warnings;
  return $Disp_warnings;
}

##############################################################################
1;
