# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: SunSectionAttrs.pm
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

package Midas::MMU::SunSectionAttrs;

use strict;

use Midas::Command;
use Midas::AttrBlock;
use Midas::Globals;
use Midas::Error;

use Midas::MMU::TTEFormat;

use TRELoad 'BitFieldTie';

use base qw(Midas::AttrBlock::MapAttrs);

use fields (
	    qw(
	      pa bypass
	      tsbonly notsb uninitialized

	      tte_size_ptr

	     ),
	    (
	     # Hard-code MMU type because 'use fields' directive needs
	     # to happen at compile-time
	     keys %{ get_union_tte_field_hash('ultra2') }
	    )
	   );
		

our @Settable = (
		 qw(
		    pa bypass
		    tsbonly notsb uninitialized

		    tte_size_ptr
		   ),
		  );

our %Settable = map {$_ => 1} Midas::MMU::SunSectionAttrs->settable();

our %FieldSizes =
  (
   tsbonly       => 1,
   notsb         => 1,
   bypass        => 1,
   uninitialized => 1,
   tte_size_ptr  => 3,
  );

###############################################################################

sub new {
  my $this = shift;
  my %args = @_;

  unless (ref $this) {
    $this = fields::new($this);
  }

  $this->SUPER::new();

  $this->{settable} = \%Settable;
  foreach my $key (keys %args) {
    $this->{$key} = $args{$key};
  }

  return $this;
}

###############################################################################

sub set_defaults {
  my $this = shift;

  $this->SUPER::set_defaults();

  $this->{bypass}        = 0 unless defined $this->{bypass};
  $this->{tsbonly}       = 0 unless defined $this->{tsbonly};
  $this->{notsb}         = 0 unless defined $this->{notsb};
  $this->{uninitialized} = 0 unless defined $this->{uninitialized};

  $this->{tte_size}      = 0 unless defined $this->{tte_size};
}

###############################################################################

sub get_field_size_hash {
  my $this = shift;

  my $sizes = $this->SUPER::get_field_size_hash();

  foreach my $field (keys %FieldSizes) {
    $sizes->{$field} = $FieldSizes{$field};
  }

  return $sizes;
}

###############################################################################

sub sanity_check {
  my $this = shift;

  my @messages = $this->SUPER::sanity_check();

  my $name     = $this->get_section_name();
  my $fline    = $this->get_fline();

  if($this->{uninitialized} && $this->{tsbonly}) {
    my $message = "Section '$name' redundantly specifies both tsbonly and ".
      "uninitialized.\n at $fline\n";
    push @messages, { message => $message, code => M_ATTRSYNTAX };
  }

  return @messages;
}


###############################################################################

sub settable {
  my $this = shift;
  my @settable = $this->SUPER::settable();
  push @settable, @Settable;
  return @settable;
}

###############################################################################

sub skip_image {
  my $this = shift;
  return 1 if $this->{tsbonly} || $this->{uninitialized};
  return 0;
}

###############################################################################

sub set_attr {
  my $this = shift;
  my $attr = shift;
  my $val  = shift;

  my $lcattr = lc $attr;
  if (exists $MapAttr_FieldMax{$lcattr}) {

    my $width = $MapAttr_FieldWidth{$lcattr};
    $this->attr_fatal("Attribute \"$attr\" set to non-numeric value: ".
		      "\"$val\"\n", M_NOTNUM)
      unless $val =~ /^\s*(0[xX])?[\da-fA-F]+\s*$/;

    my $val_bf = string2bf($val, 64);
    if(not ref $val_bf) {
      $this->attr_fatal("Value \"$val\" is not a ${width}-bit hex number:\n".
			"$val_bf",
			M_NOTNUM);
    }

    my $range_bf = $MapAttr_FieldMax{$lcattr};

    if($val_bf->ucompare($range_bf) >= 0) {
      $this->attr_fatal("Value \"$val\" is out of range for ".
			"${width}-bit field '$attr'.", M_OUTOFRANGE);
    }

    $val = $val_bf->extract($width-1, 0);
  }
  $this->SUPER::set_attr($attr => $val);
}

###############################################################################

sub get_data_addr_bits {
  my $this = shift;
  return (39, 13);
}

###############################################################################

sub get_tag {
  my $this           = shift;
  my $force_ctx_zero = shift;

  $this->attr_fatal("Getting tag for unmapped section.\n", M_CODE)
    unless $this->is_mapped();

  my $addr = '0';
  my $tag = tte_hash_to_tsb_tag($this->{mmutype},
				$CONFIG{tsbtagfmt}, $this,
				$addr, $force_ctx_zero);
  fatal "Combination of MMU type $this->{mmutype} and TSB tag format ".
    "$CONFIG{tsbtagfmt}\n is not legal\n", M_ATTRSYNTAX unless defined $tag;
  return $tag;

}

###############################################################################

sub legal_page_bits {
  my $this = shift;
  return (0 .. 7);
}

###############################################################################

sub get_pa_bf {
  my $this = shift;

  return unless $this->is_mapped();
  return unless exists $this->{pa} and defined $this->{pa};

  my $pa = string2bf($this->{pa}, $PASIZE);
  if(not ref $pa) {
    $this->attr_fatal("Cannot interpret PA \"$this->{pa}\":\n$pa\n", M_NOTNUM);
  }
  return $pa;
}

###############################################################################

sub is_mapped {
  my $this = shift;
  return 1 unless $this->{bypass};
  return;
}

###############################################################################

sub get_data {
  my $this      = shift;
  my $tsb       = shift;

  my $ttefmt = $tsb->get_ttefmt();

  $this->attr_fatal("Getting data for unmapped section.\n", M_CODE)
    unless $this->is_mapped();

  $this->attr_fatal("Trying to generate TTE data in illegal format ".
		    "'$ttefmt'\n", M_ATTRSYNTAX) unless 
		      is_good_format_for_mmu($this->{mmutype}, $ttefmt);



  my $addr = 0;
  my $data = tte_hash_to_tsb_data($this->{mmutype},
				  $ttefmt, $this, $addr);

  fatal "Combination of MMU type $this->{mmutype} and TTE format $ttefmt ".
    " is not legal\n", M_ATTRSYNTAX unless defined $data;
  return $data;
}

###############################################################################

sub get_clump_data {
  my $this      = shift;
  my $tsb       = shift;

  my $ttefmt = $tsb->get_ttefmt();

  $this->attr_fatal("Getting data for unmapped section.\n", M_CODE)
    unless $this->is_mapped();

  $this->attr_fatal("Trying to generate TTE data in illegal format ".
		    "'$ttefmt'\n", M_ATTRSYNTAX) unless 
		      is_good_format_for_mmu($this->{mmutype}, $ttefmt);



  my $addr = 0;
  my $data = tte_hash_to_tsb_clump_data($this->{mmutype},
				  $ttefmt, $this, $addr);

  fatal "Combination of MMU type $this->{mmutype} and TTE format $ttefmt ".
    " is not legal\n", M_ATTRSYNTAX unless defined $data;
  return $data;
}

##############################################################################

sub write_goldfinger_mmu_params {
  my $this = shift;
  my $ofh = shift;

  my $tsblist = $this->get_tsb_list();
  my $tsbcsmlist = $this->get_tsb_csm_list();
  my $clump_data = BitFieldTie->new(64, 0);

  print $ofh "    no_end_range_check = 1;\n" if $this->{uninitialized};

  print $ofh "    PA_EQ_VA;\n" if not $this->is_mapped();
  print $ofh "    RA_EQ_VA;\n" if $this->{bypass};

  if(@$tsblist) {


    my ($tag_bit_hi, $tag_bit_lo) = $this->get_tag_addr_bits();
    my ($tte_tag_bit_hi, $tte_tag_bit_lo) = $this->get_tte_tag_addr_bits();
    my ($data_bit_hi, $data_bit_lo) = $this->get_data_addr_bits();

    foreach my $tsbname (@$tsblist) {	
      my $tsb  = $STATE->{tsbs}{$tsbname};
      my $data = $this->get_data($tsb);
      $clump_data = $this->get_clump_data($tsb);

      my $sizeptr;

      if(defined $this->{tte_size_ptr}) {
	$sizeptr = $this->{tte_size_ptr};
      } elsif(defined $tsb->page_size()) {
	$sizeptr = $tsb->page_size();
      } else {
	$sizeptr = $this->{tte_size};
      }
	
      my $pagesize = 8192 * (8 ** $sizeptr);
      my $size3 = 3 * $sizeptr;
      my $va_ind_hi = 21+$size3;
      my $va_ind_lo = 13+$size3;


      my $force_ctx_zero = $tsb->is_force_ctx_zero();
      my $tag = $this->get_tag($force_ctx_zero);

      print $ofh "    BLOCK_TSB $tsbname\n";

      print $ofh "      page_size = $pagesize;\n";
      print $ofh "      va_index_bits  = $va_ind_hi : $va_ind_lo;\n";
      print $ofh "      tag_addr_bits  = $tag_bit_hi : $tag_bit_lo;\n";
      print $ofh "      tte_tag_addr_bits = $tte_tag_bit_hi : $tte_tag_bit_lo;\n";
      print $ofh "      data_addr_bits = $data_bit_hi : $data_bit_lo;\n";
      print $ofh "      tag_base = 0x$tag;\n";
      print $ofh "      data_base = 0x$data;\n";
      print $ofh "    END BLOCK_TSB\n";
    }

  }
  if(@$tsbcsmlist) {

  # my %fields;
  #  my $descr = $TSB_DATA_FORMAT{$mmu_type}{$ttefmt}{CLUMP};
  #  my $clump_hi = $descr->{hi};
  #  my $clump_lo = $descr->{lo};
    
    foreach my $tsbname (@$tsbcsmlist) {	
        print $ofh "    BLOCK_TSB_CSM $tsbname\n";

        print $ofh "      clump_num = 0x$clump_data;\n";
        print $ofh "    END BLOCK_TSB_CSM\n";
    }
  }

}


###############################################################################

sub get_tag_addr_bits {
  my $this = shift;
  if($CONFIG{tsbtagfmt} eq 'tagtarget') {
    return (41, 0);
  } else {
    return (63, 13);
  }
}

##############################################################################

sub get_tte_tag_addr_bits {
  my $this = shift;
  if($CONFIG{tsbtagfmt} eq 'tagtarget') {
    return (63, 22);
  } else {
    return (63, 13);
  }
}

###############################################################################
###############################################################################

{
  package Midas::MMU::SunHyperAttrs;

  use Midas::Globals;
  use Midas::Error;
  use Midas::Command;

  use base qw(Midas::MMU::SunSectionAttrs);
  use fields qw(ra hypervisor );


  our @Settable = (qw(ra hypervisor));
  our %Settable = map { $_ => 1} Midas::MMU::SunHyperAttrs->settable();
  our %FieldSizes =
    (
     hypervisor => 1,
    );

  ############################################################################

  sub new {
    my $this = shift;
    my %args = @_;

    unless (ref $this) {
      $this = fields::new($this);
    }

    $this->{settable} = \%Settable;
    foreach my $key (keys %args) {
      $this->{$key} = $args{$key};
    }

    return $this;
  }

  ############################################################################

  sub set_defaults {
    my $this = shift;

    $this->SUPER::set_defaults();

    $this->{hypervisor} = 0 unless defined $this->{hypervisor};

  }

  #############################################################################

  sub settable {
    my $this = shift;
    my @settable = $this->SUPER::settable();
    push @settable, @Settable;
    return @settable;
  }

  #############################################################################

  sub get_field_size_hash {
    my $this = shift;
    my $sizes = $this->SUPER::get_field_size_hash();

    foreach my $field (keys %FieldSizes) {
      $sizes->{$field} = $FieldSizes{$field};
    }
    return $sizes;
  }

  ############################################################################


   sub get_ra_bf {
     my $this = shift;

     return unless $this->is_mapped();
     return unless exists $this->{ra} and defined $this->{ra};
     my $ra = BitFieldTie->new($RASIZE, $this->{ra});
     if(not ref $ra) {
       $this->attr_fatal("Cannot interpret RA \"$this->{ra}\":\n$ra",
			 M_NOTNUM);
     }
     return $ra;
   }

  ############################################################################

  sub sanity_check {
    my $this = shift;

    my @messages = $this->SUPER::sanity_check();

    my $name = $this->get_section_name();
    my $fline = $this->get_fline();

    if($this->{hypervisor}) {
      if(defined $this->{ra}) {
	my $message = "Section '$name' hypervisor block has RA defined\n".
	  " at $fline\n";
	push @messages, { message => $message, code => M_ATTRSYNTAX };
      }
      if(defined $this->{pa}) {
	my $message = "Section '$name' hypervisor block has PA defined\n".
	  " at $fline\n";
	push @messages, { message => $message, code => M_ATTRSYNTAX };
      }
      if($this->{bypass}) {
	my $message = "Section '$name' hypervisor block has bypass defined\n".
	  " at $fline\n";
	push @messages, { message => $message, code => M_ATTRSYNTAX };
      }

      my @settable = keys %MapAttr_Settable;

      foreach my $settable (@settable) {
	if(($settable =~ /^tte/ or $settable =~ /^tsb/ )
	   and $this->{has_set}{$settable})
	  {
	    my $message = "Section '$name' hypervisor block sets tte attr ".
	      "\"$settable\"\n".
		" at $fline\n";
	    push @messages, { message => $message, code => M_ATTRSYNTAX };
	  }
      }
    } else {
      if(not $CONFIG{allow_illegal_page_sizes}) {
	if(not grep /^$this->{tte_size}$/, $this->legal_page_bits()) {
	  my $message = "Section '$name' has illegal page size bits ".
	    "'$this->{tte_size}'\n".
	      "Not allowed unles -allow_illegal_page_sizses is used\n".
		" at $fline\n";
	  push @messages, { message => $message, code => M_ILLEGALPARAM };
	}

	if(defined $this->{tte_size_ptr}) {
	  if(not grep /^$this->{tte_size_ptr}$/, $this->legal_page_bits()) {
	    my $message = "Section '$name' has illegal page size ptr bits ".
	      "'$this->{tte_size_ptr}'\n".
		"Not allowed unles -allow_illegal_page_sizses is used\n".
		  " at $fline\n";
	    push @messages, { message => $message, code => M_ILLEGALPARAM };
	  }
	}

      }


      if(not defined $this->{pa} and not $this->skip_image()) {
	my $message = "Section '$name' non-hv block has no PA defined\n".
	  " at $fline\n";
	push @messages, { message => $message, code => M_ATTRSYNTAX };
      }
      if(not $this->{bypass} and not defined $this->{ra} and
	 not $this->{notsb})
	{
	  my $message = "Section '$name' is not bypass or hypervisor and\n".
	    "does not define RA.\n at $fline\n";
	  push @messages, { message => $message, code => M_ATTRSYNTAX };
	}
      if($this->{bypass} and defined $this->{ra}) {
	my $message = "Section '$name' defines both bypass and RA.\n".
	  " at $fline\n";
	push @messages, { message => $message, code => M_ATTRSYNTAX };
      }

      my $num_tsbs = @{ $this->{tsbnames} };
      if(not $num_tsbs and not $this->{notsb}) {
	my $message = "Section '$name' non-hv block defines no TSBs\n".
	  " at $fline\n";
	push @messages, { message => $message, code => M_ATTRSYNTAX };
      }
      if($num_tsbs and $this->{notsb}) {
	my $message = "Section '$name' defined $num_tsbs TSB(s) and notsb\n".
	  " at $fline\n";
	push @messages, { message => $message, code => M_ATTRSYNTAX };
      }

      if(defined $this->{va}) {
	my $va_bf = string2bf($this->{va}, $VASIZE);
	if(not ref $va_bf) {
	  my $message = "Section '$name' VA is not a number:\n$va_bf\n".
	    " at $fline\n";
	  push @messages, { message => $message, code => M_NOTNUM };
	} else {
	}
      }
      if(defined $this->{ra}) {
	my $ra_bf = string2bf($this->{ra}, $RASIZE);
	if(not ref $ra_bf) {
	  my $message = "Section '$name' RA is not a number:\n$ra_bf.\n".
	    " at $fline\n";
	  push @messages, { message => $message, code => M_NOTNUM };
	} else {
	}
      }
      if(defined $this->{pa}) {
	my $pa_bf = string2bf($this->{pa}, $PASIZE);
	if(not ref $pa_bf) {
	  my $message = "Section '$name' PA is not a number:\n$pa_bf.\n".
	    " at $fline\n";
	  push @messages, { message => $message, code => M_NOTNUM };
	} else {
	}
      }

    }


    return @messages;
  }

   ###########################################################################

   sub is_mapped {
     my $this = shift;
     return 1 unless $this->{hypervisor};
     return;
   }

   ###########################################################################


}


###############################################################################
###############################################################################
1;
