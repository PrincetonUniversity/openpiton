# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Objects.pm
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

package DiagList::Objects;

use strict;
use DiagList::Output;
use DiagList::Settings;

###############################################################################

{
  package DiagList;

  use DiagList::Output;
  use DiagList::Settings;

  use fields qw(
		file
		buildtags
		groups
	       );

  our $COMMENT_RE = qr|\/\/|;
  our $TAG_RE     =
  qr|^
  \s*
  \<
     \s*
     (\S+)
     \s*
     (.*)
  \>
  |x;

  #############################################################################

  sub new {
    my $class = shift;
    my $file  = shift;
    my $fh    = shift;

    my $this = {};
    bless $this, $class;

    tie my %buildtags, 'Tie::IxHash';
    $this->{buildtags} = \%buildtags;
    tie my %groups, 'Tie::IxHash';
    $this->{groups}    = \%groups;
    $this->parse($file, $fh) if defined $file;
    return $this;
  }

  #############################################################################

  sub parse {
    my $this = shift;
    my $file = shift;
    my $fh   = shift;

    chat "Reading $file";
    $this->{file} = $file;

    if(defined $fh and not (ref $fh and $fh->isa('IO::File'))) {
      my $handle = $fh;
      $fh = IO::File->new();
      $fh->fdopen(fileno($handle), "r") or
	fatal "Cannot create IO::File object from handle $handle\n";
    } else {
      $fh = IO::File->new("<$file") or fatal "Cannot open $file: $!";
    }

    my $line = 0;

    my $cur_build_tag;
    my $cur_name_tag;

    my @group_stack;
    my %group_args;
    my @runarg_stack;
    my @owner_stack;

    while(<$fh>) {
      $line++;
      chomp;
      s/$COMMENT_RE.*//;
      next unless /\S/;


      if(/^\#\s*(\d+)\s*\"(.*)\"/) {
	$line = $1 - 1;
	$file = $2;
	next;
      }

      if(/$TAG_RE/) {
	my ($tag, $args) = ($1, $2);

	if($tag =~ s|^\/||) {
	  # End tag

	  if($tag eq 'runargs') {
	    fatal "Nesting error, </runargs> with no matching beginning",
	      $file, $line unless @runarg_stack;
	    pop @runarg_stack;
	  } elsif($tag eq 'debugowner') {
	    fatal "Nesting error, </debugowners> with no matching beginning",
	      $file, $line unless @owner_stack;
	    pop @owner_stack;
	  } else {
	    my $group = pop @group_stack;
	    fatal "Nesting error: /$tag found, /$group->{name} expected",
	      $file, $line unless $tag eq $group->{name};

	    undef $cur_build_tag if $group->compile_tag;
	    undef $cur_name_tag  if $group->name_tag;
	    delete $group_args{$group->{name}};
	  }

	} else {

	  if($tag eq 'runargs') {
	    push @runarg_stack, $args;
	  } elsif($tag eq 'debugowner') {
	    push @owner_stack, $args;
	  } else {

	    # Start tag
	    my $buildtag = ($args =~ /\bsys=(\S+)/);
	    $buildtag = $1 if $buildtag;

	    my $nametag  = ($args =~ s/\bname=(\S+)\s*//);
	    $nametag  = $1 if $nametag;

	    # Error checking here
	    fatal "Build tag $tag multiply defined." , $file, $line
	      if exists $this->{buildtags}{$tag};


	    if($buildtag) {
	      chat "Inserting tags: $tag=$buildtag\n";

	      (my $buildargs = $args) =~ s/\b(sys=\S+)/-$1/;
	
	      $this->{buildtags}{$tag} = $buildargs;

	      # Strip sys= argument for use in group args
	      $args =~ s/\bsys=(\S)+\s*//;

	      $cur_build_tag = $tag;

	    }
	    if($nametag) {
	      fatal "Nametag $nametag defined within nametag $cur_name_tag",
		$file, $line if defined $cur_name_tag;
	      $cur_name_tag  = $nametag;
	    }


	    my $group;
	    if(exists $this->{groups}{$tag}) {
	      fatal "Group $tag is nested inside itself", $file, $line
		if exists $group_args{$tag};
	
	      $group = $this->{groups}{$tag};
	    } else {
	
	      $group = DiagList::Group->new(name => $tag);
	      $group->compile_tag($buildtag) if $buildtag;
	      $group->name_tag($nametag)     if $nametag;
	
	
	      $this->{groups}{$group->{name}} = $group;
	    }
	    $args =~ s/^\s+//;
	    $args =~ s/\s+$//;
	    $group_args{$group->{name}} = $args;
	    push @group_stack, $group;
	  }
	}
      } else {
	# Diag

	my $diag = DiagList::Diag->new_from_line($_, $cur_name_tag);

	fatal "Diag $diag->{alias} appears outside any group.", $file, $line
	  unless @group_stack;
	fatal "Diag $diag->{alias} appears outside any name tag.", $file, $line
	  unless defined $cur_name_tag;
	fatal "Diag $diag->{name} appears outside any build tag.", $file, $line
	  unless defined $cur_build_tag;

	foreach my $group (@group_stack) {
	  my $group_diag = $diag->new(); # Clone diag object
	  $group_diag->prepend_args([@runarg_stack,
				     $group_args{$group->{name}}]);
	  $group_diag->set_group($group->{name});
	  $group->add_diag($group_diag, $cur_build_tag);
	  if(@owner_stack) {
	    my $owner = $owner_stack[$#owner_stack];
	    $group_diag->add_owner($owner) unless
	      defined $group_diag->get_owner(); # diag has owner on cmdline
	  }
	}

      }

    }

    fatal "End of file with <runargs> still open!" if @runarg_stack;

    undef $fh;
  }

  #############################################################################

  sub build_hash {
    my $this = shift;
    return $this->{buildtags};
  }

  #############################################################################

  sub build_list {
    my $this = shift;
    return keys %{$this->{buildtags}};
  }

  #############################################################################

  sub build_args {
    my $this = shift;
    my $build_tag = shift;
    return unless exists $this->{buildtags}{$build_tag};
    return $this->{buildtags}{$build_tag};
  }

  #############################################################################

  sub group_hash {
    my $this = shift;
    return $this->{groups};
  }

  #############################################################################

  sub group_list {
    my $this = shift;
    return keys %{$this->{groups}};
  }

  #############################################################################

  sub find_group {
    my $this = shift;
    my $group = shift;

    return unless exists $this->{groups}{$group};
    return $this->{groups}{$group};
  }

  #############################################################################

}

###############################################################################
##############################################################################

{
  package DiagList::Group;
  use strict;

  use DiagList::Settings;

  use fields qw(
		name
		compile_tag
		name_tag

		tags
		);

  ############################################################################

  sub new {
    my $this = shift;
    my %args = @_;

    unless (ref $this) {
      $this = fields::new($this);
    }

    foreach my $arg (keys %args) {
      $this->{$arg} = $args{$arg};
    }
    $this->{tags}  = {} unless defined $this->{tags};

    return $this;
  }

  ############################################################################

  sub name {
    my $this = shift;
    my $name = shift;
    $this->{name} = $name if defined $name;
    return $this->{name};
  }

  ############################################################################

  sub compile_tag {
    my $this = shift;
    my $tag  = shift;

    $this->{compile_tag} = undef unless exists $this->{compile_tag};
    $this->{compile_tag} = $tag if defined $tag;
    return $this->{compile_tag};
  }

  ############################################################################

  sub name_tag {
    my $this = shift;
    my $tag  = shift;

    $this->{name_tag} = undef unless exists $this->{name_tag};
    $this->{name_tag} = $tag if defined $tag;
    return $this->{name_tag};
  }

  ############################################################################

  sub build_tags {
    my $this = shift;
    my $name = shift;
    return keys %{$this->{tags}};
  }

  ############################################################################

  sub list_diags {
    my $this     = shift;
    my $buildtag = shift;

    return unless exists $this->{tags}{$buildtag};
    return keys %{$this->{tags}{$buildtag}};
  }

  ############################################################################

  sub diag_hash {
    my $this     = shift;
    my $buildtag = shift;
    return unless exists $this->{tags}{$buildtag};
    return $this->{tags}{$buildtag};
  }

  ############################################################################

  sub find_diag {
    my $this     = shift;
    my $buildtag = shift;
    my $diagname = shift;

    return unless exists $this->{tags}{$buildtag};
    return unless exists $this->{tags}{$buildtag}{$diagname};
    return $this->{tags}{$buildtag}{$diagname};
  }

  ############################################################################

  sub add_diag {
    my $this   = shift;
    my $diag   = shift;
    my $buildtag   = shift;

    if(not defined $this->{tags}{$buildtag}) {
      tie my %sys, 'Tie::IxHash';
      $this->{tags}{$buildtag} = \%sys;
    }

    my $key = $diag->{name};
    my $gname = $this->{name};

    warn "WARNING: Diag $key multiply defined in group $gname\n"
      if (exists $this->{tags}{$buildtag}{$key} and display_warnings());

    $this->{tags}{$buildtag}{$key} = $diag;

  }

  ############################################################################
}

##############################################################################

{
  package DiagList::Diag;
  use strict;

  use Text::ParseWords;

  use fields qw(
		name
		alias
		files
		args

		nametag
		buildtag
		group
		debugowner
		);

  our @FILE_SUFFIXES = qw(s pal vr tpt);
		
  ############################################################################

  sub new {
    my $this = shift;
    my %args = @_;

    if(ref $this) {
      # Cloning!
      my $that = $this;
      $this = fields::new(ref $that);
      foreach my $field (keys %$that) {

	if(ref $that->{$field} eq 'ARRAY') {
	  $this->{$field} = [ @{$that->{$field}} ];
	} elsif(ref $that->{$field}) {
	  die "Don't know how to clone non-array ref field $field in ".
	    "DiagList::Diag\n";
	} else {
	  $this->{$field} = $that->{$field};
	}

      }

    } else {
      $this = fields::new($this);

      foreach my $arg (keys %args) {
	$this->{$arg} = $args{$arg};
      }

    }


    $this->{args}       = [] unless defined $this->{args};
    $this->{files}      = [] unless defined $this->{files};

    return $this;
  }

  ############################################################################

  sub new_from_line {
    my $class   = shift;
    my $line    = shift;
    my $nametag = shift;

    $nametag = '' unless defined $nametag;
    my @fields = split ' ', $line;
    my $alias  = shift @fields;

    my @args;
    my @files;
    my $debugowner;

    my $suffix_re = join '|', @FILE_SUFFIXES;
    $suffix_re = qr/($suffix_re)/;

    foreach my $field (@fields) {
      if($field !~ /^[-+]/ and $field =~ /\.$suffix_re$/o) {
	push @files, $field;
      } else {

	if($field =~ /^debugowner=(\S+)$/) {
	  $debugowner = $1;
	} else {
	  push @args, $field;
	}
      }
    }
	
    my $diag = $class->new(
			   alias => $alias,
			   nametag => $nametag,
			   name => "$alias:$nametag",
			   files => \@files,
			   args  => \@args,
			  );

    $diag->{debugowner} = $debugowner if defined $debugowner;
    return $diag;
  }

  ############################################################################

  sub get_file {
    my $this = shift;
    return $this->{files}[0];
  }

  ############################################################################

  sub prepend_args {
    my $this = shift;
    my $args = shift;

    unshift @{$this->{args}}, @$args;
  }

  ############################################################################

  sub add_owner {
    my $this = shift;
    my $owner = shift;

    $this->{debugowner} = $owner;
  }

  ############################################################################

  sub get_owner {
    my $this = shift;
    return $this->{debugowner} if defined $this->{debugowner};
    return;
  }

  ############################################################################

  sub get_cmdline {
    my $this = shift;

    my @args = grep { $_ =~ /\S/ } @{$this->{args}};
    my $args  = (scalar @args) ? join ' ', @args : '';
    my $files = join ' ', @{$this->{files}};
    my $sep = (length $args) ? ' ' : '';
    my $cmdline = "$args$sep$files";
    $cmdline =~ s/^\s+//;
    $cmdline =~ s/\s+$//;
    return $cmdline;
  }

  ############################################################################

  sub get_cmd_argv {
    my $this = shift;
    my $line = $this->get_cmdline;

    my $keep = 0;
    my @words = `showargv $line`;

    my @argv;
    my $i = 0;
    while($i <= $#words) {
      my $word = $words[$i];

      # Strip off ARGV stuff at beginning of line
      # If next line doesn't start with /^ARGV/, then there must be an
      # embedded newline
      $word =~ s/^ARGV\[\d+\]\://;
      chomp $word;
      $i++;

      if($i > $#words) {
	push @argv, $word;
	last;
      }

      while($words[$i] !~ /^ARGV/) {
	my $new_word = $words[$i];
	$word .= "\n" . $new_word;
	chomp $new_word;
	$i++;
	if($i > $#words) {
	  push @argv, $word;
	  last;
	}
      }

      push @argv, $word;
    }

    # get rid of argv[0] (showargv executable)
    shift @argv;

    return @argv;
  }

  ############################################################################

  sub get_name {
    my $this = shift;
    return $this->{name};
  }

  ############################################################################

  sub get_alias {
    my $this = shift;
    return $this->{alias};
  }

  ############################################################################

  sub get_nametag {
    my $this = shift;
    return $this->{nametag};
  }

  ############################################################################

  sub set_group {
    my $this = shift;
    my $group = shift;
    $this->{group} = $group if defined $group;
    return $this->{group};
  }

  ############################################################################

  sub get_group {
    my $this = shift;
    return $this->{group};
  }

  ############################################################################

  sub get_full_name {
    my $this = shift;
    my $fullname = $this->{alias} . ':' . $this->{nametag} . ':' .
      $this->{group};
    return $fullname;
  }

  ############################################################################


  ############################################################################
}

##############################################################################

1;
