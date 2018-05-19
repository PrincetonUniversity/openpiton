
###############################################################################
##                                                                           ##
##    Copyright (c) 2004 by Steffen Beyer.                                   ##
##    All rights reserved.                                                   ##
##                                                                           ##
##    This package is free software; you can redistribute it                 ##
##    and/or modify it under the same terms as Perl itself.                  ##
##                                                                           ##
###############################################################################

package Bit::Vector::String;

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK $VERSION);

use Bit::Vector;

require Exporter;

@ISA = qw(Exporter Bit::Vector);

@EXPORT = qw();

@EXPORT_OK = qw();

$VERSION = '6.4';

package Bit::Vector;

use strict;
use Carp::Clan '^Bit::Vector\b';

my $Factor = log(10) / log(2);

sub to_Oct
{
    croak('Usage: $vector->to_Oct();') unless (@_ == 1);
    my($self) = @_;
    my($string) = '';
    local $@;

    eval { $string = reverse(join('', $self->Chunk_List_Read(3))); };
    if ($@)
    {
        $string = $@;
        $string =~ s!^[A-Za-z0-9_]+(?:::[A-Za-z0-9_]+)*\(\):\s+!!;
        $string =~ s!\s+at\s.*$!!;
        croak($string);
    }
    return $string;
}

sub from_Oct
{
    croak('Usage: $vector->from_Oct($string);') unless (@_ == 2);
    my($self,$string) = @_;
    local $@;

    if ($string =~ /^[0-7]+$/)
    {
        eval { $self->Chunk_List_Store(3, split(//, reverse($string))); };
        if ($@)
        {
            $string = $@;
            $string =~ s!^[A-Za-z0-9_]+(?:::[A-Za-z0-9_]+)*\(\):\s+!!;
            $string =~ s!\s+at\s.*$!!;
            croak($string);
        }
    }
    else
    {
        croak("unknown string type");
    }
    return $self;
}

sub new_Oct
{
    croak('Usage: Bit::Vector->new_Oct($bits,$string);') unless (@_ == 3);
    my($class,$bits,$string) = @_;
    my($self);
    local $@;

    if ($string =~ /^[0-7]+$/)
    {
        unless (defined $bits) { $bits = 3 * length($string); }
        eval { $self = Bit::Vector->new($bits); $self->Chunk_List_Store(3, split(//, reverse($string))); };
        if ($@)
        {
            $string = $@;
            $string =~ s!^[A-Za-z0-9_]+(?:::[A-Za-z0-9_]+)*\(\):\s+!!;
            $string =~ s!\s+at\s.*$!!;
            croak($string);
        }
    }
    else
    {
        croak("unknown string type");
    }
    return $self;
}

sub String_Export
{
    croak('Usage: $vector->String_Export($type);') unless (@_ == 1 or @_ == 2);
    my($self,$type) = @_;
    my($string) = '';
    local $@;

    if (not defined $type or not $type)
    {
        eval { $string = '0x' . $self->to_Hex(); };
    }
    elsif ($type eq '1' or $type =~ /^b(?:in)?$/i)
    {
        eval { $string = '0b' . $self->to_Bin(); };
    }
    elsif ($type eq '2' or $type =~ /^o(?:ct)?$/i)
    {
        eval { $string = '0o' . reverse(join('', $self->Chunk_List_Read(3))); };
    }
    elsif ($type eq '3' or $type =~ /^d(?:ec)?$/i)
    {
        eval { $string = $self->to_Dec(); };
    }
    elsif ($type eq '4' or $type =~ /^(?:h(?:ex)?|x)$/i)
    {
        eval { $string = '0x' . $self->to_Hex(); };
    }
    elsif ($type eq '5' or $type =~ /^e(?:num)?$/i)
    {
        eval { $string = '{' . $self->to_Enum() . '}'; };
    }
    elsif ($type eq '6' or $type =~ /^p(?:ack)?$/i)
    {
        eval { $string = ':' . $self->Size() . ':' . $self->Block_Read(); };
    }
    else
    {
        croak("unknown string type '$type'");
    }
    if ($@)
    {
        $string = $@;
        $string =~ s!^[A-Za-z0-9_]+(?:::[A-Za-z0-9_]+)*\(\):\s+!!;
        $string =~ s!\s+at\s.*$!!;
        croak($string);
    }
    return $string;
}

sub String_Import
{
    croak('Usage: $vector->String_Import($string);') unless (@_ == 2);
    my($self,$string) = @_;
    my($type) = 0;
    local $@;

    if ($string =~ /^(?:0[bB])?([01]+)$/)
    {
        $type = 1;
        eval { $self->from_Bin($1); };
    }
    elsif ($string =~ /^(?:0[oO])?([0-7]+)$/)
    {
        $type = 2;
        eval { $self->Chunk_List_Store(3, split(//, reverse($1))); };
    }
    elsif ($string =~ /^(?:[+-])?[0-9]+$/)
    {
        $type = 3;
        eval { $self->from_Dec($string); };
    }
    elsif ($string =~ /^(?:0[hHxX])?([0-9A-Fa-f]+)$/)
    {
        $type = 4;
        eval { $self->from_Hex($1); };
    }
    elsif ($string =~ /^[(<{\[]?([0-9]+(?:-[0-9]+)?(?:,[0-9]+(?:-[0-9]+)?)*)[)>}\]]?$/)
    {
        $type = 5;
        eval { $self->from_Enum($1); };
    }
    elsif ($string =~ s!^:\d+:!!)
    {
        $type = 6;
        eval { $self->Block_Store($string); };
    }
    else
    {
        croak("unknown string type");
    }
    if ($@)
    {
        $string = $@;
        $string =~ s!^[A-Za-z0-9_]+(?:::[A-Za-z0-9_]+)*\(\):\s+!!;
        $string =~ s!\s+at\s.*$!!;
        croak($string);
    }
    return $type;
}

sub new_String
{
    croak('Usage: Bit::Vector->new_String($bits,$string);') unless (@_ == 3);
    my($class,$bits,$string) = @_;
    my($type) = 0;
    my($self);
    local $@;

    if ($string =~ /^(?:0[bB])?([01]+)$/)
    {
        $type = 1;
        unless (defined $bits) { $bits = length($1); }
        eval { $self = Bit::Vector->new_Bin($bits,$1); };
    }
    elsif ($string =~ /^(?:0[oO])?([0-7]+)$/)
    {
        $type = 2;
        unless (defined $bits) { $bits = 3 * length($1); }
        eval { $self = Bit::Vector->new($bits); $self->Chunk_List_Store(3, split(//, reverse($1))); };
    }
    elsif ($string =~ /^(?:[+-])?([0-9]+)$/)
    {
        $type = 3;
        unless (defined $bits) { $bits = int( length($1) * $Factor + 1 ); }
        eval { $self = Bit::Vector->new_Dec($bits,$string); };
    }
    elsif ($string =~ /^(?:0[hHxX])?([0-9A-Fa-f]+)$/)
    {
        $type = 4;
        unless (defined $bits) { $bits = 4 * length($1); }
        eval { $self = Bit::Vector->new_Hex($bits,$1); };
    }
    elsif ($string =~ /^[(<{\[]?([0-9]+(?:-[0-9]+)?(?:,[0-9]+(?:-[0-9]+)?)*)[)>}\]]?$/)
    {
        $type = 5;
        $string = $1;
        unless (defined $bits)
        {
            $bits = 0;
            while ($string =~ /([0-9]+)/g) { $bits = $1 if ($1 > $bits); }
            $bits++;
        }
        eval { $self = Bit::Vector->new_Enum($bits,$string); };
    }
    elsif ($string =~ s!^:(\d+):!!)
    {
        $type = 6;
        $bits = $1 unless (defined $bits);
        eval { $self = Bit::Vector->new($bits); $self->Block_Store($string); };
    }
    else
    {
        croak("unknown string type");
    }
    if ($@)
    {
        $string = $@;
        $string =~ s!^[A-Za-z0-9_]+(?:::[A-Za-z0-9_]+)*\(\):\s+!!;
        $string =~ s!\s+at\s.*$!!;
        croak($string);
    }
    if (wantarray) { return($self,$type); }
    return $self;
}

1;

__END__

