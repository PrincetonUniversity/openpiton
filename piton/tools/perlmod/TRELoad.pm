# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: TRELoad.pm
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
package TRELoad;

use 5.008;
use strict;
use warnings;
use Carp qw(!&verbose);
use File::Spec;
require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use TRELoad ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '1.02';
our $Id      = 'TRELoad: ';
our $Verbose = 0 unless defined $Verbose;

our $ModuleBase = $ENV{PERL_MODULE_BASE};

our $PerlVers = '5.8.0';
our $TRE_ENTRY = $ENV{TRE_ENTRY};

our %Loaded;


#########################################################################

sub import {
  my @args = @_;

  my @caller = caller;
  my $callpkg = $caller[0];
  if($callpkg ne 'main') {
    $TRE_ENTRY .= '/' unless $TRE_ENTRY =~ m|/$|;
    $TRE_ENTRY .= $callpkg;

  }

  print "$Id CALLING from '$callpkg' with entry '$TRE_ENTRY'\n" if $Verbose;

  my @modules = parse_import_list(@_);
  foreach my $importmod (@modules) {
    my $module     = $importmod->{module};
    my $importlist = exists $importmod->{importlist} ?
      $importmod->{importlist} : [':DEFAULT'];
    my $tre_entry  = $importmod->{tre_entry};

    if(@$importlist and $importlist->[0] =~ /^\!/) {
      # First element is a deletion, so prepend :DEFAULT
      unshift @$importlist, ':DEFAULT';
    }

    my $module_dir = get_module_dir($module, $tre_entry);
    my $libdir = File::Spec->catdir($module_dir, 'lib', 'site_perl',
				    $PerlVers);
    unshift @INC, $libdir;
    # Perhaps we'd need to add this to PERL5LIB to make C libraries work.
    # Add that if we need to.

    print "$Id Searching for module $module in $libdir.\n" if $Verbose;

    require "$module.pm";

    local ($_);
    my @symbol_list = map { get_tag_contents($module, $_) } @$importlist;
    @symbol_list = negate_symbols(@symbol_list);

    if(@symbol_list) {

      my $caller = caller;
      print "$Id Exporting symbols from $module into $caller: @symbol_list \n" 
	if $Verbose;
      # $Exporter::Verbose = 1;


      $module->export_to_level(1, $module, @symbol_list);
    }

  }


}

#########################################################################

sub get_module_dir {
  my $module    = shift;
  my $tre_entry = shift;

  my $command    = "configsrch $module $tre_entry";
  my $cmd_output = `$command`;
  if($?) {
    my $status = $? >> 8;
    my $signal = $? & 127;
    my $core   = $? & 128;

    if($status) {
      confess "Execution of \"$command\" failed with status $status.\n";
    }
    if($signal) {
      my $corestring = $core ? '' : ' (core dumped)';
      confess "Command \"$command\" died with signal $signal$corestring.\n";
    }
    # should never get here
    die "$command failed\n";
  }
  my @words = split ' ', $cmd_output;
  my $version = shift @words;

  if($version !~ /\d+.\d+/) {
    croak "Could not find TRE version for module $module.\n";
  }

  if(exists $Loaded{$module}) {
    my $loaded_vers = $Loaded{$module};
    if($version ne $loaded_vers) {
      warn << "EOT";
$Id WARNING: Previously loaded $module version $loaded_vers, but now TRE_ENTRY
$tre_entry
specfies version $version.  You cannot load two different
versions of the same module in a script, so going with version $loaded_vers.
This may lead to unexpected behavior.
EOT
    }
  } else {
    $Loaded{$module} = $version;
  }

  my $module_dir = File::Spec->catdir($ModuleBase, $module, $version);
  croak "Model directory \"$module_dir\" does not exist.\n"
    unless -d $module_dir;

  # Obviously, this will need to do the right thing once TRE is in place.
  return $module_dir;
}

#########################################################################

sub negate_symbols {
  my @symbols_in = @_;

  local ($_);
  my %hash = map {$_, 1} @symbols_in;
  foreach my $key (keys %hash) {
    if($key =~ /^\!(.*)/) {
      delete $hash{$key};
      delete $hash{$1};
    }
  }
  return keys %hash;
}

#########################################################################

sub parse_import_list {
  my @import_list = @_;

  my $curpkg = shift @import_list;


  print "$Id Parsing import list...\n" if $Verbose;

  my @parsed;
  my $i = 0;
  my $start_len = $#import_list + 1;
  while($i < $start_len) {
    my $entry = {};
    $entry->{module} = $import_list[$i++];
    print "$Id  module   $entry->{module}\n" if $Verbose;
    if(ref $import_list[$i]) {
      if(ref $import_list[$i] eq 'ARRAY') {
        $entry->{importlist} = $import_list[$i++];
        print "$Id  import   @{$entry->{importlist}}\n" if $Verbose;
      } elsif(ref $import_list[$i] eq 'HASH') {
        $entry->{hash} = $import_list[$i++];
        if(exists $entry->{hash}{import}) {
          $entry->{importlist} = $entry->{hash}{import};
          print "$Id  import   @{$entry->{importlist}}\n" if $Verbose;
        }
        if(exists $entry->{hash}{tre_entry}) {
          $entry->{tre_entry} = $entry->{hash}{tre_entry};
          print "$Id  treentry $entry->{tre_entry}\n" if $Verbose;

        }
      }
    }
    $entry->{tre_entry} = $TRE_ENTRY unless exists $entry->{tre_entry};
    push @parsed, $entry;
  }

  print "$Id Done parsing import list.\n" if $Verbose;

  return @parsed;
}

#########################################################################

sub get_tag_contents {
  my $pkg = shift;
  my $tag = shift;

  my $is_negated = 0;
  if($tag =~ s/^\!//) {
    $is_negated = 1;
  }

  print "$Id Expanding module=$pkg tag=$tag\n" if $Verbose;
  if(defined $tag and $tag !~ /^:/) {
    $tag = "!$tag" if $is_negated;
    print "$Id   $tag\n" if $Verbose;
    return $tag;
  } else {
    $tag =~ s/^://;
  }

  my %tags;
  my @export;
  {
    # add a block where I can break all the rules
    no strict 'refs';
    %tags   = %{"$pkg" . "::EXPORT_TAGS" };
    @export = @{"$pkg" . "::EXPORT"      };
  }

  if(exists $tags{$tag}) {
    @{$tags{$tag}} = map { "!$_" } @{$tags{$tag}} if $is_negated;
    print "$Id   @{$tags{$tag}}\n" if $Verbose;
    return @{$tags{$tag}};
  } elsif($tag eq 'DEFAULT') {
    print "$Id   @export\n" if $Verbose;
    @export = map { "!$_" } @export if $is_negated;
    return @export;
  } else {
    confess "No such tag $tag in package $pkg\n";
  }
}

#########################################################################



1;
__END__

=head1 NAME

TRELoad - Perl extension for loading modules under TRE control

=head1 SYNOPSIS

  use TRELoad 'Foo' => ['abc', 'def'],
              'Bar',
              'Baz' => [ '$somevar' ];

  which is the same as

  use Foo 'abc', 'def';
  use Bar;
  use Baz '$somevar';


=head1 ABSTRACT

 This module adds a layer of indirection between modules under
 TRE control and the scripts/modules that use them.  It allows
 the TRE-controlled modules to be intstalled unmodified.  TRELoad
 emulates the Exporter, so client modules are able to import
 symbols from the TRE modules.

=head1 DESCRIPTION

The TRELoad module exists as a layer of indirection between perl
modules under TRE control and scripts/modules that use them.  The
basic idea is that we want to use TRE mechanisms to find perl modules,
rather than the include mechanisms built into perl.  That said, we
want to support arbitrary perl modules and fully export the perl
exporter.

=head2 USING A TRE MODULE

The entire usage for the TRELoad module is the 'use' line.  The syntax is:

  use TRELoad <list>;

In its simplest (and most common) usage, the list contains the names
of modules to import.  For instance, the TRE equivalent of:

  use Foo;
  use Bar;

is

  use TRELoad 'Foo', 'Bar';

With this syntax (i.e., no import list explicitly defined for the
modules), you import symbols in the default export list, just as you
would with the bare 'use' directives.

A normal use directive can also contain a list of symbols to import,
which override the default export list of the module.  For instance:

  use Foo 'abc', 'def';

will load the Foo module and import the symbols 'abc' and 'def'
instead of the default export list.  The TRELoad equivalent is to use
an array reference immediately following the module name in the
TRELoad argument list.  The above TRELoad equivalent would be:

  use TRELoad 'Foo' => ['abc', 'def'];

The perl exporter also supports tags (pseudo-symbols starting with
':'), which are names for lists of symbols.  There is a predefined tag
called ':DEFAULT' which contains all of the symbols in the default
export list.  These tags are also supported by TRELoad.  Therefore,
the following statement:

  use Foo ':DEFAULT', 'abc';

has the TRE equivalent of:

  use TRELoad 'Foo' => [':DEFAULT', 'abc']

which means to import all symbols in the default export list, plus the
symbol 'abc'.

TRELoad also supports negations, see 'perldoc Exporter' for more
details.  As a more complicated example, consider:

  use Foo 'abc';
  use Bar ':DEFAULT', 'aaa', '!bbb', '!:ccc';
  use Baz;

This means, load Foo, Bar, and Baz.  Import the symbol 'abc' from Foo,
import all the default symbols from Bar, plus 'aaa', minus the symbol
'bbb' and minus all symbols in the tag ':ccc'.  Finally, import the
symbols in the default export list from Baz.

The TRE equivalent is:

  use TRELoad 'Foo' => [ 'abc' ],
              'Bar' => [ ':DEFAULT', 'aaa', '!bbb', '!:ccc'],
              'Baz';

I assume you get the idea.

=head2 OVERRIDING TRE_ENTRY

The TRELoad module obeys the TRE mechanism of appending tool paths to
TRE_ENTRY.  It is possible, however, to override the TRE_ENTRY
setting.  To do this requires a more general syntax.  Basically,
whereever an array reference can appear in the usage list, you may
substitute a hash reference.  The legal keys of this hash are 'import'
(whose value is an array reference that is treated as an import list)
and 'tre_entry' (whose value is intrepreted as a string to use as a
value for TRE_ENTRY).

For example:

  use TRELoad 'Foo' => ['abc', 'def'];

and

  use TRELoad 'Foo' => { import => ['abc', 'def'] };

are exactly identical.

  use TRELoad 'Foo' => { import    => ['abc', 'def'],
                         tre_entry => '/SomeTool' };

is the same thing except that it will use the TRE_ENTRY of
"/SomeTool".


=head2 INSTALLING A MODULE

Modules are installed using the normal perl install mechanism.  The
only TRE-specific step is to override the default install prefix:

  make clean     # if Makefile is already present
  perl Makefile.PL \
     PREFIX=$PERL_MODULE_BASE/<module_name>/<version>
  make
  make install

If it is a new module, you will also need to add a .tver entry for the
module name.

=head2 EXPORT

None.

=head2 RESTRICTIONS

There are couple of restrictions to be aware of:

=over 4

=item

You cannot use pattern rules in an import list (i.e., import symbols
that begin with '/' or '!/'.  There is no reason this couldn't be made
to work, but it's a fair amount of work and this feature is almost
never used.

=item

You can only use TRELoad on a top-level module.  For instance, if a
module Foo contains a Foo.pm with interface code for the underlying
modules Foo::Bar and Foo::Baz, you must use a "use TRELoad 'Foo'",
since Foo::Bar and Foo::Baz will not be recognized by configsrch.  If
you need to use those modules directly (which usually is not a good
idea), you can do:

  use TRELoad 'Foo';
  use Foo::Bar;
  use Foo::Baz;

The TRELoad line will add the appropriate version of Foo to the
include path, so you can just use a regular 'use' for its sub-modules.



=item

Using a number to specify a minimum version is not supported (as in:
"use Foo 3.01;") on the TRELoad 'use' line.  You can get the effect,
however, by using:

  use TRELoad 'Foo';
  use Foo 3.01;

The TRELoad line will add the correct version of Foo to the include
path, so the following line will work correctly.

=item

Use perl-style version numbers for your TRE versions.  That is to say,
use two decimal places after the '.'.  The reason is that perl does a
simple ASCII comparison when it compares version numbers, so it
believes 1.9 to be more recent than 1.10.  TRE does not care, but perl
does, so if users want to check the version of the module (see
previous bullet), this convention is required.


=item

You cannot load two different versions of a module in the same script.
For instance, suppose you had a module called Abc and another module
called Composite, where Composite itself used Abc.  If your .tver file
consisted of:

 Abc / 1.01
 Abc /Composite 1.02
 Composite / 2.01

you would be able to use Abc by itself, and you would get version
1.01.  You could use Composite by itself, which would get version 1.02
of Abc.  What you cannot do is include Abc by itself AND from within
Composite via something like:

  use TRELoad 'Abc', 'Composite';

This is because it would try to load BOTH versions of 1.01 and 1.02
of Abc in the same interpreter, and the names would conflict.  In this
case, TRELoad prints a warning message to stderr and uses the first
version loaded of the module in question.  It is impossible to make
this work without modifying the modules themselves, and the major
design goal of TRELoad was to enable the TRE use of arbitrary perl
modules.

=back

=head1 SEE ALSO

 perlmod(1), Exporter(3),

=cut
