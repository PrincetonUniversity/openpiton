# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Script.pm
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

package DiagList::Script;

use strict;

use DiagList::Objects;
use DiagList::Output;
use DiagList::Settings;


use Getopt::Long;
use Pod::Usage;
use File::Spec;
use File::Basename;
use File::Find;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(dlist construct_dlist get_diag_display build_tags);
our @EXPORT_OK = qw( $Default_cpp_cmd $Default_cpp_args );

our $Default_cpp_cmd = 'bw_cpp';
our $Default_cpp_args = '-undef -B';

my %opt =
  (
   cpp_cmd => $Default_cpp_cmd,
   cpp_args => $Default_cpp_args,
   stdinc => 1,
   nocpp => 0,
  );

my @options =
  qw(
     h
     nocpp
     cpp=s
     cpp_args=s
     stdinc!
     I=s@
     D=s@
     diag_root=s
     diaglist=s
     group=s
     buildtag:s
     find
     q
    );

my ($GMAXLEN, $BMAXLEN, $NMAXLEN);

###############################################################################

sub dlist {
  my @args = @_;

  local (@ARGV) = @args;

  # Make -D and -I options more palatable to GetOptions
  @ARGV = map { /^(-[DI])(\S.*)/ ? ($1, $2) : $_ } @ARGV;

  if(not GetOptions(\%opt, @options)) {
    pod2usage(-exitval => 'NOEXIT',
	      -verbose => 1);
    return -1;
  }

  if($opt{h}) {
    pod2usage(-exitval => 'NOEXIT', -verbose => 2);
    return 0;
  }

  if(not defined $opt{diaglist}) {

    if(not defined $opt{diag_root}) {
      die "dlist: Must set \$DV_ROOT or use -diag_root or -diaglist.\n"
	unless exists $ENV{DV_ROOT};
      $opt{diag_root} = File::Spec->catdir($ENV{DV_ROOT}, 'verif', 'diag');
    }

    $opt{diaglist} = File::Spec->catfile($opt{diag_root}, 'master_diaglist');

  }

  if(defined $opt{find} and $opt{find} and not defined $opt{diag_root}) {
    die "dlist: Must set \$DV_ROOT or use -diag_root with -find\n" unless exists $ENV{DV_ROOT};
    $opt{diag_root} =  File::Spec->catdir($ENV{DV_ROOT}, 'verif', 'diag');
  }

  $opt{q} = 1 if $opt{find};

  die "dlist: Diag list \"$opt{diaglist}\" not found.\n"
    unless -e $opt{diaglist};

  my $dlist = construct_dlist(\%opt);

  build_tags($dlist, $opt{buildtag}, \%opt) if defined $opt{buildtag};

  my $diagname = shift @ARGV;
  #pod2usage(-exitval => -1, -verbose => 1,
  #	  -message => "You must specify a diag name!\n")
  #  unless defined $diagname;


  my ($alias, $group, $nametag);

  $group = $opt{group};

  if(defined $diagname) {
    if($diagname =~ /^(\S+):(\S+)$/) {
      $alias = $1;
      $nametag = $2;
      $group = $opt{group};
    } else {
      $alias = $diagname;
    }
  }


  my @display_list;
  if(not defined $group) {
    if(defined $diagname) {
      foreach my $gr ($dlist->group_list()) {
	push @display_list, get_diag_display($dlist, $alias, $nametag, $gr, 
					     \%opt);
      }
    } else {
      foreach my $gr ($dlist->group_list()) {
	$OUT->print_status("Group: $gr\n");
      }
    }

  } else {

    if(defined $diagname) {
      push @display_list, get_diag_display($dlist, $alias, $nametag, $group, 
					   \%opt);
    } else {
      my $g_obj = $dlist->find_group($group);
      die "dlist: Group \"$group\" not found!\n" unless defined $g_obj;
      foreach my $bt ($g_obj->build_tags()) {
	my @diags = $g_obj->list_diags($bt);
	foreach my $diagname (@diags) {
	  my $d_obj = $g_obj->find_diag($bt, $diagname);
	  $alias = $d_obj->get_alias();
	  $nametag = $d_obj->get_nametag();
	
	  push @display_list, get_diag_display($dlist, $alias, $nametag, $group,
					       \%opt);

	}
      }
    }

}

  @display_list = sort { $a->{name} cmp $b->{name} } @display_list;

  $GMAXLEN = maxlen( map { $_->{group}    } @display_list);
  $BMAXLEN = maxlen( map { $_->{buildtag} } @display_list);
  $NMAXLEN = maxlen( map { $_->{name}     } @display_list);

  if($opt{find}) {
    my %findhash;
    foreach my $elem (@display_list) {
      my $file = $elem->{diag}->get_file();
      if(exists $findhash{$file}) {
	$elem->{full} = $findhash{$file};
      } else {
	$elem->{full} = find_file($file, $opt{diag_root});
	$findhash{$file} = $elem->{full};
      }
    }
  } else {
    foreach my $elem (@display_list) {
      $elem->{full} = '';
    }
  }

  if($opt{q}) {
    # All I'm printing is the filename, so only grab one entry for each name
    # Otherwise, I'll get lots of messy duplicates
    @display_list = values %{{ map { $_->{name} . $_->{full}, $_ } @display_list}};
  }

  foreach my $elem (@display_list) {
    $elem->display(\%opt);
  }
  return 0;
}

###############################################################################
##############################################################################

{
  package DisplayEntry;

  use DiagList::Output;

  use fields qw( name buildtag group diag full );

  ############################################################################

  sub new {
    my $class = shift;
    my %args = @_;

    my $this = fields::new($class);
    foreach my $key (keys %args) {
      $this->{$key} = $args{$key};
    }
    return $this;
  }

  ############################################################################

  sub display {
    my $this = shift;
    my $opt  = shift;

    my $npad = ' ' x ($NMAXLEN - length $this->{name});

    $OUT->print_status("$this->{name}$npad");
    if($opt->{q}) {
      my $file = $this->{diag}->get_file();
      $file = $this->{full} if $opt->{find};
      $OUT->print_status("   $file");
    } else {
      my $gpad = ' ' x ($GMAXLEN - length $this->{group});
      my $bpad = ' ' x ($BMAXLEN - length $this->{buildtag});
      $OUT->print_status("   ");
      $OUT->print_status("gr=$this->{group}$gpad ");
      $OUT->print_status("build=$this->{buildtag}$bpad ");
      $OUT->print_status("  " . $this->{diag}->get_cmdline());
    }
    $OUT->print_status("\n");

  }

  ############################################################################
}

##############################################################################

sub get_diag_display {
  my $dlist = shift;
  my $alias = shift;
  my $nametag = shift;
  my $group = shift;
  my $opt = shift;

  my @groups;
  die "dlist: No group specified!\n" unless defined $group;
  my $g = $dlist->find_group($group);
  die "dlist: No group \"$group\" specified!\n" unless defined $g;

  my @list;

  foreach my $bt ($g->build_tags()) {
    my $dhash = $g->diag_hash($bt);
    my @keys = keys %$dhash;
    foreach my $key (@keys) {
      if($key =~ /^$alias:(\S+)/) {
	next if defined $nametag && $nametag ne $1;
	push @list, DisplayEntry->new( buildtag => $bt,    name => $key,
				       group    => $group, diag => $dhash->{$key});
      }
    }
  }

  return @list;


}

##############################################################################

sub find_file {
  my $file = shift;
  my $root = shift;

  die("dlist: Can't find with root \"$root\": No such directory.\n")
    unless -d $root;

  my $found;
  my $found_ref = \$found;
  my $wanted = sub {
    if($file eq $_) {
      $$found_ref = $File::Find::name;
    }
  };

  find($wanted, $root);

  $found = "<could_not_find>" unless defined $found;

  return $found;
}

##############################################################################

sub build_tags {
  my $dlist = shift;
  my $buildtag = shift;
  my $opt = shift;

  if($buildtag ne '') {
    local ($_);
    my %thash = map { $_, 1 } $dlist->build_list();
    die "dlist: Build tag $buildtag not defined\n" 
      unless exists $thash{$buildtag};
    if($opt->{q}) {
      $OUT->print_status("$buildtag\n");
    } else {
      $OUT->print_status("$buildtag  " . $dlist->build_args($buildtag) . "\n");
    }
  } else {
    my @tags = $dlist->build_list();
    my $maxlen = maxlen(@tags);
    foreach my $bt (@tags) {
      my $pad = ' ' x ($maxlen - length $bt);
      if($opt->{q}) {
	$OUT->print_status("$bt\n");
      } else {
	$OUT->print_status("$bt$pad  " . $dlist->build_args($bt) . "\n");
      }
	
    }
  }

  exit(0);
}

##############################################################################

sub maxlen {
  my @list = @_;

  my $maxlen = 0;
  foreach my $elem (@list) {
    $maxlen = ((length $elem) > $maxlen) ? length $elem : $maxlen;
  }
  return $maxlen;
}

##############################################################################

sub construct_dlist {
  my $opt      = shift;

  my $dlist;
  if($opt->{nocpp}) {
    $dlist = DiagList->new($opt->{diaglist});
  } else {

    local($_, *PIPE);

    my $cmd = "$opt->{cpp_cmd} $opt->{cpp_args} ";
    my @incs;
    if($opt->{stdinc}) {
      my $abs = File::Spec->rel2abs($opt->{diaglist});
      my $dir = dirname $abs;
      push @incs, $dir;
    }
    push @incs, @{$opt->{I}} if defined $opt->{I};
    if(@incs) {
      $cmd .= join ' ', (map { "-I$_" } @incs);
      $cmd .= ' ';
    }

    my @defs;
    push @defs, @{$opt->{D}} if defined $opt->{D};
    if(@defs) {
      $cmd .= join ' ', (map { "-D$_" } @defs);
      $cmd .= ' ';
    }

    $cmd .= $opt->{diaglist};

    open(PIPE, "$cmd |") or die "dlist: Can't start command \"$cmd\": $!\n";

    $dlist = DiagList->new($opt->{diaglist}, \*PIPE);

    close(PIPE);
  }
  return $dlist;
}


##############################################################################
1;
