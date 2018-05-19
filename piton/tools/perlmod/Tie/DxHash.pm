# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: DxHash.pm
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
package Tie::DxHash;

use strict;
use vars qw($VERSION @ISA);

use Tie::Hash;



$VERSION = '0.93';
@ISA     = qw(Tie::StdHash);



sub CLEAR {
	my($self) = @_;

	$self->{data}        = [];
	$self->{iterators}   = {};
	$self->{occurrences} = {};
	$self->ckey(0);

	$self;
}



sub DELETE {
	my($self, $key) = @_;

	my($offset);

	$offset = 0;

      ELEMENT:
	while ($offset < @{$self->{data}}) {
		if ($key eq $self->{data}[$offset]{key}) {
			splice @{$self->{data}}, $offset, 1;
		}
		else {
			$offset++;
		}
	}

	delete $self->{iterators}{$key};
	delete $self->{occurrences}{$key};
	$self;
}



sub EXISTS {
	my($self, $key) = @_;

	exists $self->{occurrences}{$key};
}



sub FETCH {
	my($self, $key) = @_;

	my($dup, $offset);

	$dup = 1;

      HASH_KEY:
	foreach $offset (0 .. @{$self->{data}} - 1) {
		next HASH_KEY unless $key eq $self->{data}[$offset]{key};
		next HASH_KEY unless $dup++ == $self->{iterators}{$key};
		$self->{iterators}{$key}++;
		$self->{iterators}{$key} = 1 if $self->{iterators}{$key} > $self->{occurrences}{$key};
		return $self->{data}[$offset]{value};
	}

	return;
}



sub FIRSTKEY {
	my($self) = @_;

	$self->ckey(0);
	$self->NEXTKEY;
}



sub NEXTKEY {
	my($self) = @_;

	my($ckey, $key);

	$ckey = $self->ckey;
	$self->ckey($ckey + 1);
	$self->{data}[$ckey]{key};
}



sub STORE {
	my($self, $key, $value) = @_;

	push @{$self->{data}}, { key => $key, value => $value };
	$self->{iterators}{$key} ||= 1;
	$self->{occurrences}{$key}++;

	$self;
}



sub TIEHASH {
	my($class, @args) = @_;

	my($self);

	$self = {};
	bless $self, $class;

	$self->init(@args);
	$self;
}



sub ckey {
	my($self, $ckey) = @_;

	$self->{ckey} = $ckey if defined $ckey;
	$self->{ckey};
}



sub init {
	my($self, @args) = @_;

	my($key, $value);

	$self->CLEAR;
	$self->STORE($key, $value) while ($key, $value) = splice(@args, 0, 2);
	$self;
}



1;
__END__

=head1 NAME

Tie::DxHash - keeps insertion order; allows duplicate keys

=head1 SYNOPSIS

 use Tie::DxHash;
 my(%vhost);
 tie %vhost, 'Tie::DxHash' [, LIST];
 %vhost = (
   ServerName  => 'foo',
   RewriteCond => 'bar',
   RewriteRule => 'bletch',
   RewriteCond => 'phooey',
   RewriteRule => 'squelch',
 );

=head1 DESCRIPTION

This module    was written to   allow   the  use of   rewrite  rules  in  Apache
configuration files written  with Perl Sections.  However,  a potential user has
stated that he  needs it to support the  use of  multiple ScriptAlias directives
within a  single Virtual Host (which is  required by FrontPage, apparently).  If
you find a completely different use for it, great.

The original purpose of this  module is not quite  so obscure as it might sound.
Perl Sections   bring the power   of a general-purpose  programming  language to
Apache configuration files and,  having  used them  once,  many people use  them
throughout.  (I take this approach since, even  in sections of the configuration
where  I do  not need  the  flexibility, I find  it  easier to use  a consistent
syntax.  This also makes the code easier for XEmacs to  colour in ;-) Similarly,
mod_rewrite is easily the most powerful way to  perform URL rewriting and I tend
to use it  exclusively, even when a  simpler directive  would  do the  trick, in
order to group my redirections together and keep them consistent.  So, I came up
against the following problem quite early on.

The synopsis  shows  some syntax which  might  be needed when using  mod_rewrite
within a  Perl Section.  Clearly,  using an ordinary hash will   not do what you
want.  The two additional features we  need are to  preserve insertion order and
to allow  duplicate keys.   When retrieving an  element from  the hash by  name,
successive requests for the same name must iterate through the duplicate entries
(and,  presumably, wrap around when  the end of  the chain is reached).  This is
where Tie::DxHash  comes   in.   Simply  by  tying   the  offending   hash,  the
corresponding configuration directives work as expected.

Running an Apache syntax  check (with docroot check)  on your configuration file
(with C<httpd -t>) and checking virtual host settings (with C<httpd -S>) succeed
without complaint.   Incidentally,  I  strongly recommend building   your Apache
configuration files with make (or equivalent) in  order to enforce the above two
checks, preceded by a Perl syntax check (with C<perl -cx>).

=head1 INTERNALS

For those interested, Tie::IxHash works by storing the  hash data in an array of
hash references  (containing  the key/value  pairs).  This  preserves  insertion
order.  A separate set  of iterators (one per  distinct key) keeps track of  the
last retrieved value for a given key, thus  allowing the successive retrieval of
multiple values for the same key to work as expected.

=head1 SEE ALSO

perltie(1), for information on ties generally.

Tie::IxHash(3), by Gurusamy Sarathy, if you need to preserve insertion order but
not allow duplicate keys.

For   information  on  Ralf S.  Engelschall's   powerful  URL  rewriting module,
mod_rewrite,      check       out     the      reference      documentation   at
"http://httpd.apache.org/docs/mod/mod_rewrite.html" and  the URL Rewriting Guide
at "http://httpd.apache.org/docs/misc/rewriteguide.html".

For help in using Perl Sections to configure Apache,  take a look at the section
called           "Apache        Configuration      in            Perl"        at
"http://perl.apache.org/guide/config.html#Apache_Configuration_in_Perl", part of
the mod_perl    guide, by Stas Bekman.    Alternatively,  buy the  O'Reilly book
Writing Apache Modules with Perl and C, by Lincoln  Stein & Doug MacEachern, and
study Chapter 8: Customizing the Apache Configuration Process.

=head1 BUGS

The algorithms used to retrieve and delete elements by  key run in O(N) time, so
do not expect  this  module to work well   on large data  sets.   This is not  a
problem for the module's intended  use.  If you find  another use for the module
which involves larger quantities of data, let me know and I will put some effort
into optimising for speed.

The  mod_rewrite  directives for  which   this module  was   written  (primarily
RewriteCond and RewriteRule) can  occur in all  four configuration file contexts
(i.e. server config,  virtual host, directory, .htaccess).  However, Tie::DxHash
only helps when  you are using  a directive which  is mapped  onto a  Perl hash.
This limits you to  directives which are block  sections with begin and end tags
(like  <VirtualHost>  and  <Directory>).   I  get  round  this  by   sticking my
mod_rewrite directives in  a name-based virtual host container  (as shown in the
synopsis) even in the degenerate case where the  web server only has one virtual
host.

=head1 AUTHOR

Kevin Ruscoe

=cut
