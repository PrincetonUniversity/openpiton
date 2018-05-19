# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: TriageInterface.pm
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


package DiagList::TriageInterface;
use strict;

use DiagList::Script;
use DiagList::Objects;
use Pod::Usage;

use TRELoad 'Triage';
use Triage::Config;
use Triage::Output;
use Triage::Registrar;

$DiagList::Output::OUT = new_triage_OutputDirector();

#############################################################################
#############################################################################

sub cmd_dlist {
  my @args = shift;

  if(grep /^-h$/, @args) {
    print_status help_dlist();
  } else {
    dlist(@args);
  }
  return;
}

#############################################################################

sub help_dlist {
  system("dlist -h");
  return;
}

#############################################################################

register_global_commands
    (
     Triage::UserCommand->new
     (
      name => 'dlist',
      func => \&cmd_dlist,
      help => \&help_dlist,
      descr => "Query the diaglist",
     ),
    );


#############################################################################
1;
