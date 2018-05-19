# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: AttrBlock.pm
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
{
 package Midas::AttrBlock;
 use strict;

 use Midas::Command;
 use Midas::Error;
 use Midas::Globals;

 use fields qw(
	       name

	       type
	       srcfile
	       srcline

	       secobj

	       endfile
	       endline

	       has_set

	       settable
	      );

 our @Settable = qw(name section);
 our %Settable = map { $_ => 1 } Midas::AttrBlock->settable();

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

   $this->{settable} = \%Settable;

   return $this;
 }

 ##############################################################################

 sub set_defaults {
   my $this = shift;
   $this->{has_set} = {};
 }

 ##############################################################################

 sub set_end_file_line {
   my $this = shift;
   my $endfile = shift;
   my $endline = shift;
   $this->{endfile} = $endfile;
   $this->{endline} = $endline;
 }

 ##############################################################################

 sub get_end_file_line {
   my $this = shift;
   return ($this->{endfile}, $this->{endline});
 }

 ##############################################################################

 sub clone {
   my $this = shift;

   my $class = ref $this;
   my $that = $class->new();

   $that->copy($this);
   return $that;
 }

 ##############################################################################

 sub copy {
   my $this = shift;
   my $src  = shift;

   my @fields = keys %$this;

   my @shallow_refs = qw(Midas::Section);

   # Note this does a shallow copy of elements in arrays and values in hashes.
   # May need to fix that if this gets more complicated

   foreach my $field (@fields) {
     if(not ref $src->{$field}) {
       $this->{$field} = $src->{$field};
     } else {
       my $reftype = ref $src->{$field};
       if($reftype eq 'ARRAY') {
	 $this->{$field} = [ @{$src->{$field}} ];
       } elsif($reftype eq 'HASH') {
	 $this->{$field} = { %{$src->{$field}} };
       } elsif(grep /^$reftype$/, @shallow_refs) {
	 $this->{$field} = $src->{$field};
       } else {
	 $this->{$field} = $src->{$field}->clone();
       }
     }
   }

 }

 ##############################################################################

 sub settable {
   my $this = shift;
   return @Settable;
 }

 ##############################################################################

 sub is_settable {
   my $this = shift;
   my $attr = shift;

   $attr = lc $attr;
   return 1 if exists $this->{settable}{$attr};
   return;
 }

 ##############################################################################

 sub set_attr {
   my $this  = shift;
   my $attr  = shift;
   my $value = shift;

   $this->attr_fatal("Attribute \"$attr\" is not a settable attribute.",
		     M_ILLEGALPARAM) unless $this->is_settable($attr);

   $attr = lc $attr;

   # make "section" a synonym for "name"
   if ($attr eq 'section') {
     $attr = 'name';
   }

   if ($this->{has_set}{$attr}) {
     $this->attr_fatal("Attribute \"$attr\" is set multiple times.",
		       M_ILLEGALPARAM);
   }

   $this->{$attr} = $value;

   $this->{has_set}{$attr} = 1;

   return $value;
 }

 ##############################################################################

 sub sanity_check {
   my $this = shift;
   my $message;

   my $fline = $this->get_fline();
   my @messages;
   if(not defined $this->{name}) {
     my $message = '' unless defined $message;
     $message .= "Block has no \"name\" or \"section\" tag.\n";
     push @messages, { message => $message, code => M_ATTRSYNTAX }
   }

   return @messages;
 }

 ##############################################################################

 sub get_section_name {
   my $this = shift;
   return lc $this->{name};
 }

 ##############################################################################

 sub secobj {
   my $this = shift;
   my $obj = shift;

   $this->{secobj} = $obj if defined $obj;

   return $this->{secobj};
 }

 ##############################################################################

 sub get_fline {
   my $this = shift;
   my $fline = "File=$this->{srcfile}, Line=$this->{srcline}";
   return $fline;
 }

 ##############################################################################

 sub attr_fatal {
   my $this = shift;
   my $message = shift;
   my $errcode = shift;
   my $secname = $this->{name};
   my $fline   = $this->get_fline();

   chomp $message;
   fatal "SECTION '$secname': $message\n  At $fline\n", $errcode;
 }

 ##############################################################################

 sub init_from_args {
   my $this = shift;
   my $srcfile = shift;
   my $srcline = shift;
   my %args = @_;

   $this->{srcfile} = $srcfile;
   $this->{srcline} = $srcline;


   # Make sure that name => or section => gets set first.  That way, if any
   # later attributes cause an error, at least the error message will
   # look good.
   my @attr_names = keys %args;
   if(exists $args{name}) {
     my $name = $args{name};
     delete $args{name};
     @attr_names = ('name', keys %args);
     $args{name} = $name;
   }
   if(exists $args{section}) {
     my $section = $args{section};
     delete $args{section};
     @attr_names = ('section', keys %args);
     $args{section} = $section;
   }

   foreach my $attr (@attr_names) {
     if ($this->is_settable($attr)) {
       $this->set_attr($attr, $args{$attr});
     } else {
       $this->attr_fatal("No such attribute '$attr'.",M_ILLEGALPARAM);
     }
   }
 }

 ##############################################################################
}

###############################################################################
###############################################################################

{
  package Midas::AttrBlock::LinkAttrs;

  use strict;
  use Midas::Command;
  use Midas::Globals;
  use Midas::Error;
  use Midas::Segment;
  use TRELoad 'BitFieldTie';

  use base 'Midas::AttrBlock';

  BEGIN: {
      require fields;
      fields->import(Midas::Segment->all_va_names());
    }

  our @Settable = Midas::Segment->all_va_names();
  our %Settable = map { $_ => 1 } Midas::AttrBlock::LinkAttrs->settable();

  #############################################################################

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

    $this->{settable} = \%Settable;

    return $this;
  }

  #############################################################################

  sub settable {
    my $this = shift;
    my @settable = $this->SUPER::settable();
    push @settable, @Settable;
    return @settable;
  }

  #############################################################################

  sub has_segment {
    my $this = shift;
    my $segment = shift;

    return 1 if defined $this->{ Midas::Segment->name2va_name($segment) };
    return;
  }

  #############################################################################

  sub get_segment_va_bf {
    my $this = shift;
    my $segment = shift;


    $this->attr_fatal("No segment argument to has_segment.\n", M_CODE)
     unless defined $segment;

    my $vaname = Midas::Segment->name2va_name($segment);

    return unless defined $this->{$vaname};

    my $va = string2bf($this->{$vaname}, $VASIZE);
    my $uc = uc $segment;
    if(not ref $va) {
      $this->attr_fatal("Cannot interpret $uc \"$this->{$vaname}\":\n$va",
			M_NOTNUM);
    }

    return $va;
  }

 #############################################################################

 sub get_segment_va {
   my $this = shift;
   my $segment = shift;
   my $va_bf = $this->get_segment_va_bf($segment);
   return unless ref $va_bf;
   return "0x$va_bf";
 }

 #############################################################################

 sub defined_segments {
   my $this = shift;
   return grep { $this->has_segment($_) } Midas::Segment->all_names();
 }

 #############################################################################

 sub sanity_check {
   my $this = shift;

   my @messages = $this->SUPER::sanity_check();

   my $name = $this->get_section_name();
   my $fline = $this->get_fline();

   my %seg_vas;

   foreach my $segment ($this->defined_segments()) {
     my $vaname = Midas::Segment->name2va_name($segment);
     my $va = string2bf($this->{$vaname}, $VASIZE);
     if (not ref $va) {
       my $message = "Section '$name' specified ${segment}_va isn't a ".
	 "number:\n".
	 "$va\n at $fline\n";
       push @messages, { message => $message, code => M_NOTNUM };
     } else {
       $seg_vas{$segment} = $va;

       my $dword_offset = $va->extract(2, 0);
       if ($dword_offset != 0) {
	 my $message = "Section '$name' ${segment}_va 0x$va is not 8-byte ".
	   "aligned.\n at $fline\n";
	 push @messages, { message => $message, code => M_BADALIGN };
       }
	
     }
   }

   my %rev;
   foreach my $segment (keys %seg_vas) {
     my $vastring = $seg_vas{$segment};

     if(exists $rev{$vastring}) {
       my $oldseg = $rev{$vastring};

       my $message = "Section '$name', ${oldseg}_va and ${segment}_va are ".
	 "the same\n at $fline\n";
       push @messages, { message => $message, code => M_SECSYNTAX };
     }

     $rev{$vastring} = $segment;
   }



   return @messages;
 }

 #############################################################################

}

###############################################################################
###############################################################################

{
  package Midas::AttrBlock::MapAttrs;

  use strict;
  use Carp;
  use Midas::Command;
  use Midas::Globals;
  use Midas::Error;
  use Midas::Segment;

  use base 'Midas::AttrBlock';
  use fields qw(
		segment

		unique_name
		compressimage

		tsbnames
        tsbcsmnames

		va
		end_va
		start_label
		end_label

		mmutype

	       );
  our @Settable = qw(
		     compressimage
		     va end_va
		     start_label end_label
		    );

  our %Settable = map { $_ => 1} Midas::AttrBlock::MapAttrs->settable();


  #############################################################################

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

    $this->{settable} = \%Settable;

    return $this;
  }

  #############################################################################

  sub set_defaults {
    my $this = shift;
    $this->{segment} = Midas::Segment->new(SEG_UNDEF)
      unless defined $this->{segment};
    $this->SUPER::set_defaults;
    $this->{tsbnames} = [];
    $this->{tsbcsmnames} = [];
    $this->{mmutype} = 'generic' unless defined $this->{mmutype};
  }

  #############################################################################

  sub settable {
    my $this = shift;
    my @settable = $this->SUPER::settable();
    push @settable, @Settable;
    return @settable;
  }

 ##############################################################################

 sub is_settable {
   my $this = shift;
   my $attr = shift;

   $attr = lc $attr;

   return 1 if exists $MapAttr_Settable{$attr};
   return;
 }

 #############################################################################

 sub get_field_size_hash {
   my $this = shift;
   return {};
 }

 #############################################################################

 sub set_attr {
   my $this  = shift;
   my $attr  = shift;
   my $value = shift;

   $attr = lc $attr;

   if(exists $STATE->{tsbs}{$attr}) {
     push @{$this->{tsbnames}}, $attr;
     $STATE->{tsbs}{$attr}->touch();
   } 
   elsif(exists $STATE->{tsbcsms}{$attr}) {
     push @{$this->{tsbcsmnames}}, $attr;
     $STATE->{tsbcsms}{$attr}->touch();
   } else {
     return $this->SUPER::set_attr($attr, $value);
   }

   return $value;
 }
 # Add for CSM
#############################################################################

 sub set_csm_attr {
   my $this  = shift;
   my $attr  = shift;
   my $value = shift;

   $attr = lc $attr;

   if(exists $STATE->{tsbcsms}{$attr}) {
     push @{$this->{tsbcsmnames}}, $attr;
     $STATE->{tsbcsms}{$attr}->touch();
   } else {
     return $this->SUPER::set_csm_attr($attr, $value);
   }

   return $value;
 }

 #############################################################################

 sub get_tsb_list {
   my $this = shift;

   return [ @{$this->{tsbnames}} ];
 }

 #############################################################################

 sub get_tsb_csm_list {
   my $this = shift;

   return [ @{$this->{tsbcsmnames}} ];
 }

 #############################################################################


  sub is_segment {
    my $this = shift;
    my $segment = shift;

    return 1 if $this->{segment}->name() eq $segment;
    return 0;
  }

  #############################################################################

  sub get_type {
    my $this = shift;
    return $this->{segment}->name();
  }

  ############################################################################

  sub skip_image {
    my $this = shift;
    return 0;
  }

  ############################################################################

  sub is_mapped {
    my $this = shift;
    return 0;
  }

  #############################################################################

  sub write_to_segment {
    my $this = shift;
    my $segment = shift;
    return 1 if $this->is_segment($segment);
    return 0;
  }

  #############################################################################

  sub get_va_bf {
    my $this = shift;

    if(defined $this->{va}) {
      return BitFieldTie->new($VASIZE, $this->{va});
    }
    return;
  }

  #############################################################################

  sub get_va {
    my $this = shift;

    my $bf = $this->get_va_bf();
    return unless defined $bf;
    return "0x$bf";
  }

  ############################################################################

  sub get_pa_bf {
    my $this = shift;
    return undef;
  }

  ############################################################################

  sub get_pa {
    my $this = shift;
    my $bf = $this->get_pa_bf();
    return unless defined $bf;
    return "0x$bf";
  }

  ############################################################################

  sub get_ra_bf {
    my $this = shift;
    return $this->get_pa_bf();
  }

  ############################################################################

  sub get_ra {
    my $this = shift;
    my $bf = $this->get_ra_bf();
    return unless defined $bf;
    return "0x$bf";
  }

  #############################################################################

  sub unique_name {
    my $this = shift;
    my $name = shift;

    $this->{unique_name} = $name if defined $name;
    return $this->{unique_name};
  }

  #############################################################################

  sub write_to_goldfinger {
    my $this = shift;
    my $segment = shift;
    my $linkname = shift;
    my $fh   = shift;


    my $in_image = ((not $this->skip_image) and
		    $this->write_to_segment($segment)) ? 1 : 0;

    if (not defined $this->{compressimage}) {
      $this->{compressimage} = 0;
    }
    $this->{compressimage} &&= $CONFIG{compress_image};

    my $type = $this->get_type();

    my $name = $this->{name};
    my $va = $this->get_va();
    my $ra = $this->get_ra();
    my $pa = $this->get_pa();

    my $unique_name = $this->unique_name();
    $fh->print("  BLOCK $unique_name\n");
    $fh->print("    SECTION_NAME = \"$name\";\n");
    $fh->print("    SEGMENT_NAME = \"$type\";\n");
    $fh->print("    LINK_SECTION = \"$linkname\";\n");
    $fh->print("    SRC_FILE     = \"$this->{srcfile}\";\n");
    $fh->print("    SRC_LINE     = $this->{srcline};\n");
    $fh->print("    COMPRESS     = $this->{compressimage};\n");
    $fh->print("    VA           = $va;\n") if defined $va;
    $fh->print("    RA           = $ra;\n") if defined $ra;
    $fh->print("    PA           = $pa;\n") if defined $pa;
    $fh->print("    IN_IMAGE     = $in_image;\n");
    $fh->print("    END_VA       = $this->{end_va};\n")
      if defined $this->{end_va};
    $fh->print("    START_LABEL  = \"$this->{start_label}\";\n")
      if defined $this->{start_label};
    $fh->print("    END_LABEL    = \"$this->{end_label}\";\n")
      if defined $this->{end_label};
    $this->write_goldfinger_mmu_params($fh);

    $fh->print("  END BLOCK\n");
    $fh->print("\n");

  }

  #############################################################################

  sub write_goldfinger_mmu_params {
    my $fh = shift;
  }

  #############################################################################

}

###############################################################################
###############################################################################

1;
