# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: DiagList.pm
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
package DiagList;

use 5.008;
use strict;
use warnings;

use IO::File;
use Tie::IxHash;
use File::Spec;
use Carp;

require Exporter;


use DiagList::Objects;
use DiagList::Output;
use DiagList::Settings;
use DiagList::Script;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use DiagList ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.

our @script = qw(dlist);
our @triage = qw(hookup_triage_interface);
our @functions = qw(dlist construct_dlist get_diag_display build_tags);

our %EXPORT_TAGS = ( all => [ @script, @triage, @functions ],
		     func => [ @functions ],
		     triage => [ @triage ],
		     script => [ @script ],
		   );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

our $VERSION = '1.11';

##############################################################################

sub hookup_triage_interface {
  my $code =
    q{
      use DiagList::TriageInterface;
     };

  eval $code;
  die $@ if $@;
}

##############################################################################
##############################################################################
##############################################################################
1;
__END__

=head1 NAME

DiagList - perl module for parsing diag lists

=head1 SYNOPSIS

 use DiagList;

 my $dlist = DiagList->new('./master_diaglist');
 my $group = $dlist->find_group('cmp_regr');

 foreach my $buildtag ($group->build_tags) {

   my $buildargs = $dlist->build_args($buildtag);

   foreach my $diagname ($group->list_diags($buildtag)) {
     my $diag    = $group->find_diag($buildtag, $diagname);
     my $runargs = $diag->get_cmdline();
   }

 }


=head1 ABSTRACT

  This is a perl module for parsing diag lists.  It uses
  XML-like syntax to define regression arguments.

=head1 DESCRIPTION

This module exists to parse diaglists and return results in a usable
format.  The Synopsis section above describes common usage.  This is
an object module with no exported functions.  The top-level object is
of type DiagList.  Sub-objects are returned of type DiagList::Group
and DiagList::Diag.  The public interface of each is described below.

=head2 DiagList Object

This is the only type of object the user will create explicitly.

=over 4

=item new($file, [$fh]) E<lt>class methodE<gt>

Parse the given diaglist file and return a new DiagList object.
Throws an exception if it cannot parse the file.  If an optional
second argument is provided, it is treated as a file handle to read
from.  It can be either an IO::File object or a bare file handle.  In
this case the first argument, $file, is used purely for reporting
errors.

=item build_list()

Returns a list of the build tags that were seen in the file.

=item build_args($build_tag)

Returns the build arguments for the specified build tag.  Returns
undef if a build tag called $build_tag was not seen in the file.  The
build arguments are the ones specified in the group tag defintion.
The only processing done is that name=E<lt>...E<gt> is stripped out
completely and sys=E<lt>...E<gt> is replaced by -sys=E<lt>...E<gt>.

=item build_hash()

Returns a reference to a hash where the keys are build tags and the
values are the build args.  Note that this is a reference into the
internal state of the object, so modifying this hash will modify the
DiagList object.

=item group_list()

Returns a list of group names that were seen in the file.

=item find_group($groupname)

Returns a DiagList::Group object for the specified $groupname.
Returns undef if no such $groupname was seen in the file.

=item group_hash()

Returns a reference to a hash where keys are group names and values
are DiagList::Group objects.  Note that this is a reference into the
internal state of the object, so modifying the hash will modify the
DiagList object.

=back

=head2 DiagList::Group Object

These objects are created by the DiagList object and can be returned
to the user via the DiagList methods find_group and group_hash (both
described above).  The DiagList::Group objects support the following
methods.

=over 4

=item name([$name])

Accessor function for the group name.  If an argument $name is
provided, the name of the group is set to $name.  The name of the
group is returned, whether or not it has changed.  Changing the name
with this method is highly discouraged for user code, but it is
perfectly acceptable to call name() with no arugments to get the name.

=item build_tags()

Returns a list of build_tags that are applicable to this group.

=item list_diags($buildtag)

Returns a list of diag names in this group that correspond to the
given $buildtag.

=item find_diag($buildtag, $diagname)

Returns a DiagList::Diag object that corresponds the the given
$diagname and the provided $buildtag.  Returns undef if no such
$buildtag or no such $diagname was found.

=item diag_hash($buildtag)

Returns a reference to a hash where the keys are diag names and the
values are DiagList::Diag objects.  Note tha this is a reference into
the internal state of the object, so modifying the hash will modify
the object.

=back

=head2 DiagList::Diag Object

DiagList::Diag objects represent the state associated with a diag.
They are returned by the DiagList::Group methods find_diag() and
diag_hash().  DiagList::Diag objects support the following methods.

=over 4

=item get_alias()

Returns the diag alias, as provided in the diaglist file.

=item get_nametag()

Returns the diag nametag, as provided in the diaglist file.

=item get_name()

Returns the diag name which is the diag alias with :E<lt>nametagE<gt>
appended.

=item get_full_name()

Returns the full diag name with alias, nametag, and group, separated
by ':'.

=item get_file()

Returns the first file mentioned in the diag line.

=item get_owner()

Get debug owner form diag list.

=item get_cmdline()

Returns the command-line for the diag.  This includes arguments
specified in the DiagList::Group object that contains this object,
followed by arguments specified on the diag command line.  If the
containing group happens to be a buildtag (i.e., has a
sys=E<lt>somethingE<gt>), the sys=E<lt>somethingE<gt> is stripped out
of the diag command-line.

=item get_cmd_argv()

This is the same as get_cmdline, except that it processes the
command-line with a shell and returns a list that can be treated as an
argv list.  Using this instead of get_cmdline allows diaglist entries
to be written the same way they would be on the command-line.

=back

=head2 Syntax of the Diaglist file

The syntax of the Diaglist file is somewhat strange.  It makes the
most sense to describe how it evolved than to try to explain the
entire syntax all at once.

=head3 Diag Lines

A diag line is a line in the diaglist that specifies a diag.  Its syntax is:

 <alias> <args>

Where E<lt>aliasE<gt> is a name for the diag, and E<lt>argsE<gt> are
arguments to B<sims> used to run the diag.  For instance:

 mydiag  mydiag.s -max_cycle=300000

creates a diag alias "mydiag", which B<sims> will invoke as "mydiag.s
-max_cycle=300000".  One argument is special, however.  If an argument
is "debugowner=E<lt>usernameE<gt>", that argument is removed from the
command-line before it is passed to B<sims>.  The debugowner is
available to clients of the DiagList module via the get_owner()
function, but it is not part of the command line because there is
nothing B<sims> to do with it at runtime.  It is useful, however, for
informing the B<diagstatus> database of who owns which diags.

=head3 Groups

The main organizational structure in the diaglist is a group.  A group
defines a list of diags for a regression and arguments to use for all
diags in that regression.  The syntax for a group is an XML-like tag.
The definition can contain arguments.

For example:

  <foo -foo1 -foo2>

     abc    abc.s -abc
     def    def.s -def

  </foo>

This defines regression group named "foo".  The arguments for the
group are prepended to each diag command line.  B<sims> uses
Getopt::Long to parse its arguments, so if conflicting options are
repeated on its command-line, the later option takes precedence.  This
means that diag-line options override group options if they are in
conflict.  If group foo were run in B<sims>, it would run a diag with
alias "abc" and arguments "-foo1 -foo2 abc.s -abc" and an alias "def"
with arguments "-foo1 -foo2 def.s -def".

Groups can be opened multiple times, and they may have different
arguments each time.  Arguments are only used in the diags contained
in that particular tag.  For example:

 <foo -foo1 -foo2>

     abc    abc.s -abc
     def    def.s -def

 </foo>

 <foo -foo3>

     ghi    ghi.s -ghi

 </foo>

This would run "abc" and "def" exactly the same as before.  The diag
"ghi" would be run with "-foo3 ghi.s -ghi" and would not include
"-foo1 or -foo2".

Group definitions may nest, but this does B<not> imply any
relationship between the groups.

  <foo -foo1>
   <bar -bar1>

      abc  abc.s -abc

   </bar>
  </foo>

This defines two different regressions, "foo" and "bar".  In
regression "foo", "abc" will have arguments "-foo1 abc.s -abc".  In
regression "bar", it will have arguments "-bar1 abc.s -abc".  There is
no notion of group "foo" containing group "bar" or anything like that.
They just happen to have some diag lines in common.

Note that this means that a diag alias by itself does not define a
unique test (diag plus arguments).  The alias/group combination is
necessary, but not sufficient, to make a diag unique.  More on that
later.


=head3 Nesting tags

One special tag, E<lt>runargsE<gt> specifies arguments to all enclosed
diags, regardless of their group.

  <runargs -runrun>
    <foo -foo1>
     <bar -bar1>

        abc  abc.s -abc

     </bar>
    </foo>
  </runargs>

This means that in group "foo", the diag "abc" will run as "-runrun
-foo1 abc.s -abc" and in group "bar", it will be "-runrun -bar1 abc.s
-abc".

You can nest E<lt>runargsE<gt> tags.  Inner tags will append to the
argument list so inner E<lt>runargsE<gt> will override outer tags if
any arguments are in conflict.  Please note that a E<lt>runargsE<gt>
tag does B<not> define a regression, so there is no group called
"runargs".

Another special tag that applies to all enclosed diags, regardless of
their group, is E<lt>debugownerE<gt>.  Just as described for the diag
line, E<lt>debugownerE<gt> does not affect the command line at all,
but it does provide information to the B<diagstatus> database about
who owns which diags.

  <debugowner someuser>

  ...

  </debugowner>

This is the same as having "debugowner=someuser" on every diag line in
its scope.  Note that if a diag line contains a "debugowner=..." and
it is inside a E<lt>debugownerE<gt> tag, the diag line will take
precedence.

=head3 Special Groups

There are two types of special groups, buildtags and nametags.  They
are syntacticaly just like any other groups, and they define
regressions just like any other groups.  They have special meanings
and restrictions, however.

=head4 Build Tags

A buildtag is any group that has "sys=E<lt>sysnameE<gt>" in its
argument list.  (Note that all B<sims> options begin with '-', so any
argument of the form "E<lt>nameE<gt>=E<lt>valueE<gt>" is an argument
to the diaglist parser).

A buildtag defines the model that should be built for the regression
and the B<sims> options of how to build the model.

  <build1 sys=cmp -arg1 -arg2>

  ...

  </build1>

This creates a buildtag called "build1" that specifies that all diags
inside it should be run with the B<sims> "cmp" model, which can be
built with "-arg1 -arg2".

Unlike other groups, buildtags do B<not> nest.  Each diag line must
appear in B<exactly one> build tag.  All diaglines in all groups
inside the scope of the buildtag will be run on the specified model.

  <build1 sys=cmp -arg1 -arg2>
   <foo -foo1>
    <bar -bar1>
      mydiag mydiag.s -diag1
    </bar>
   </foo>
  </build1>

When you run regression "foo", it will build a cmp model with args
"-arg1 -arg2".  It will then run "mydiag" with arguments "-foo1
mydiag.s -diag1".  Similarly, if you ran regression "bar", it would
build the same cmp model and run "mydiag" with "-bar1 mydiag.s
-diag1".  Note that "-arg1" and "-arg2" are used at build time for
groups "foo" and "bar", but they do not appear on the diag
command-line during the run.

A build tag also defines a regression, so you could run a regression
"build1" with the above diaglist.  It would build with "-arg1 -arg2"
and would run "mydiag" with "-arg1 -arg2 mydiag.s -diag1".  There is
no way for the diaglist parser to tell build-time arguments from
run-time arguments when a buildtag is used as a regression group.
Fortunately, B<sims> will ignore run-time options at build time and
vice-versa, so using buildtags as groups is perfectly legal.


=head4 Name Tags

An ambiguity is possible with multiple groups that contain diags with the same alias.  For example:

  <both>

   <foo>
     <runargs -foo1>
       mydiag  mydiag.s
     </runargs>
   </foo>


   <bar>
     <runargs -bar1>
       mydiag  mydiag.s
     </runargs>
   </bar>

  </both>

Note that we use E<lt>runargsE<gt> tags instead of putting them in the
"foo" and "bar" regressions directly, since we want the "both" group
to run "mydiag" once with "-foo1" and again with "-bar1".  The problem
with the above diaglist is that both runs of "mydiag" have the same
alias/group combination when run in group "both".  Some other
identifier is needed to give each diag a unique name.

Nametags are used for this purpose.  A nametag is a group that has
"name=E<lt>nameE<gt>" in its argument list.  The name is appended to
the alias do define a name that is unique within a group.  The
alias/nametag/group combination is enough to make a diag unique
overall.  As with buildtags, nametags do not nest, and each diag must
appear in B<exactly one> nametag.  We can rewrite the above diaglist
as:


  <both>

   <foo_group name=foo>
     <runargs -foo1>
       mydiag  mydiag.s
     </runargs>
   </foo>


   <bar_group name=bar>
     <runargs -bar1>
       mydiag  mydiag.s
     </runargs>
   </bar>

  </both>

Group "foo_group" contains the diag "mydiag:foo" with args "-foo1
mydiag.s".  Group "bar_group" contains the diag "mydiag:bar" with args
"-bar1 mydiag.s".  Group "both" contains two diags: "mydiag:foo" with
"-foo1 mydiag.s" and "mydiag:bar" with args "-bar1 mydiag.s".

When B<sims> creates a directory to run a directory, it uses
E<lt>aliasE<gt>:E<lt>nametagE<gt>:E<lt>groupE<gt> to get a unique
directory name.  In contexts where only a single group is relevant,
then E<lt>aliasE<gt>:E<lt>nametagE<gt> is sufficent to name a diag.






=head1 SEE ALSO

sims(1).
