# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Globals.pm
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

package Midas::Globals;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw( $STATE %CONFIG $VASIZE $RASIZE $PASIZE $CONFIG_FILE
		  %MapAttr_Settable %MapAttr_FieldMax %MapAttr_FieldWidth
		  clear_globals $PROJECT );


our $STATE;
our %CONFIG;
our $CONFIG_FILE = 'midasconfig.pl';
# mmckeown: Changing default to OpenPiton
our $PROJECT = $PROJECT = exists $ENV{PROJECT} ? $ENV{PROJECT} : "OpenPiton";

our $VASIZE;
our $RASIZE;
our $PASIZE;
our %MapAttr_Settable;
our %MapAttr_FieldMax;
our %MapAttr_FieldWidth;

sub clear_globals { undef $STATE; undef %CONFIG;
		    undef $VASIZE; undef $RASIZE; undef $PASIZE;
		    undef %MapAttr_Settable;
		    undef %MapAttr_FieldMax;
		    undef %MapAttr_FieldWidth;
		    $CONFIG_FILE = 'midasconfig.pl';
            # mmckeown: Changing default to OpenPiton
		    $PROJECT = exists $ENV{PROJECT} ? $ENV{PROJECT} : "OpenPiton";
		  }

1;
