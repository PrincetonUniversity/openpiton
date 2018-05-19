
###############################################################################
##                                                                           ##
##    Copyright (c) 2000 - 2004 by Steffen Beyer.                            ##
##    All rights reserved.                                                   ##
##                                                                           ##
##    This package is free software; you can redistribute it                 ##
##    and/or modify it under the same terms as Perl itself.                  ##
##                                                                           ##
###############################################################################

package Bit::Vector::Overload;

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK $VERSION);

use Bit::Vector;

require Exporter;

@ISA = qw(Exporter Bit::Vector);

@EXPORT = qw();

@EXPORT_OK = qw();

$VERSION = '6.4';

package Bit::Vector;

use Carp::Clan '^Bit::Vector\b';

use overload
      '""' => '_stringify',
    'bool' => '_boolean',
       '!' => '_not_boolean',
       '~' => '_complement',
     'neg' => '_negate',
     'abs' => '_absolute',
       '.' => '_concat',
       'x' => '_xerox',
      '<<' => '_shift_left',
      '>>' => '_shift_right',
       '|' => '_union',
       '&' => '_intersection',
       '^' => '_exclusive_or',
       '+' => '_add',
       '-' => '_sub',
       '*' => '_mul',
       '/' => '_div',
       '%' => '_mod',
      '**' => '_pow',
      '.=' => '_assign_concat',
      'x=' => '_assign_xerox',
     '<<=' => '_assign_shift_left',
     '>>=' => '_assign_shift_right',
      '|=' => '_assign_union',
      '&=' => '_assign_intersection',
      '^=' => '_assign_exclusive_or',
      '+=' => '_assign_add',
      '-=' => '_assign_sub',
      '*=' => '_assign_mul',
      '/=' => '_assign_div',
      '%=' => '_assign_mod',
     '**=' => '_assign_pow',
      '++' => '_increment',
      '--' => '_decrement',
     'cmp' => '_lexicompare',  #  also enables lt, le, gt, ge, eq, ne
     '<=>' => '_compare',
      '==' => '_equal',
      '!=' => '_not_equal',
       '<' => '_less_than',
      '<=' => '_less_equal',
       '>' => '_greater_than',
      '>=' => '_greater_equal',
       '=' => '_clone',
'fallback' =>   undef;

$CONFIG[0] = 0;
$CONFIG[1] = 0;
$CONFIG[2] = 0;

#  Configuration:
#
#  0 = Scalar Input:        0 = Bit Index  (default)
#                           1 = from_Hex
#                           2 = from_Bin
#                           3 = from_Dec
#                           4 = from_Enum
#
#  1 = Operator Semantics:  0 = Set Ops    (default)
#                           1 = Arithmetic Ops
#
#      Affected Operators:  "+"  "-"  "*"
#                           "<"  "<="  ">"  ">="
#                           "abs"
#
#  2 = String Output:       0 = to_Hex()   (default)
#                           1 = to_Bin()
#                           2 = to_Dec()
#                           3 = to_Enum()

sub Configuration
{
    my(@commands);
    my($assignment);
    my($which,$value);
    my($m0,$m1,$m2,$m3,$m4);
    my($result);
    my($ok);

    if (@_ > 2)
    {
        croak('Usage: $oldconfig = Bit::Vector->Configuration( [ $newconfig ] );');
    }
    $result  =   "Scalar Input       = ";
    if    ($CONFIG[0] == 4) { $result .= "Enumeration"; }
    elsif ($CONFIG[0] == 3) { $result .= "Decimal"; }
    elsif ($CONFIG[0] == 2) { $result .= "Binary"; }
    elsif ($CONFIG[0] == 1) { $result .= "Hexadecimal"; }
    else                    { $result .= "Bit Index"; }
    $result .= "\nOperator Semantics = ";
    if    ($CONFIG[1] == 1) { $result .= "Arithmetic Operators"; }
    else                    { $result .= "Set Operators"; }
    $result .= "\nString Output      = ";
    if    ($CONFIG[2] == 3) { $result .= "Enumeration"; }
    elsif ($CONFIG[2] == 2) { $result .= "Decimal"; }
    elsif ($CONFIG[2] == 1) { $result .= "Binary"; }
    else                    { $result .= "Hexadecimal"; }
    shift if (@_ > 0);
    if (@_ > 0)
    {
        $ok = 1;
        @commands = split(/[,;:|\/\n&+-]/, $_[0]);
        foreach $assignment (@commands)
        {
            if    ($assignment =~ /^\s*$/) { }  #  ignore empty lines
            elsif ($assignment =~ /^([A-Za-z\s]+)=([A-Za-z\s]+)$/)
            {
                $which = $1;
                $value = $2;
                $m0 = 0;
                $m1 = 0;
                $m2 = 0;
                if ($which =~ /\bscalar|\binput|\bin\b/i)       { $m0 = 1; }
                if ($which =~ /\boperator|\bsemantic|\bops\b/i) { $m1 = 1; }
                if ($which =~ /\bstring|\boutput|\bout\b/i)     { $m2 = 1; }
                if    ($m0 && !$m1 && !$m2)
                {
                    $m0 = 0;
                    $m1 = 0;
                    $m2 = 0;
                    $m3 = 0;
                    $m4 = 0;
                    if ($value =~ /\bbit\b|\bindex|\bindice/i) { $m0 = 1; }
                    if ($value =~ /\bhex/i)                    { $m1 = 1; }
                    if ($value =~ /\bbin/i)                    { $m2 = 1; }
                    if ($value =~ /\bdec/i)                    { $m3 = 1; }
                    if ($value =~ /\benum/i)                   { $m4 = 1; }
                    if    ($m0 && !$m1 && !$m2 && !$m3 && !$m4) { $CONFIG[0] = 0; }
                    elsif (!$m0 && $m1 && !$m2 && !$m3 && !$m4) { $CONFIG[0] = 1; }
                    elsif (!$m0 && !$m1 && $m2 && !$m3 && !$m4) { $CONFIG[0] = 2; }
                    elsif (!$m0 && !$m1 && !$m2 && $m3 && !$m4) { $CONFIG[0] = 3; }
                    elsif (!$m0 && !$m1 && !$m2 && !$m3 && $m4) { $CONFIG[0] = 4; }
                    else                                        { $ok = 0; last; }
                }
                elsif (!$m0 && $m1 && !$m2)
                {
                    $m0 = 0;
                    $m1 = 0;
                    if ($value =~ /\bset\b/i)      { $m0 = 1; }
                    if ($value =~ /\barithmetic/i) { $m1 = 1; }
                    if    ($m0 && !$m1) { $CONFIG[1] = 0; }
                    elsif (!$m0 && $m1) { $CONFIG[1] = 1; }
                    else                { $ok = 0; last; }
                }
                elsif (!$m0 && !$m1 && $m2)
                {
                    $m0 = 0;
                    $m1 = 0;
                    $m2 = 0;
                    $m3 = 0;
                    if ($value =~ /\bhex/i)  { $m0 = 1; }
                    if ($value =~ /\bbin/i)  { $m1 = 1; }
                    if ($value =~ /\bdec/i)  { $m2 = 1; }
                    if ($value =~ /\benum/i) { $m3 = 1; }
                    if    ($m0 && !$m1 && !$m2 && !$m3) { $CONFIG[2] = 0; }
                    elsif (!$m0 && $m1 && !$m2 && !$m3) { $CONFIG[2] = 1; }
                    elsif (!$m0 && !$m1 && $m2 && !$m3) { $CONFIG[2] = 2; }
                    elsif (!$m0 && !$m1 && !$m2 && $m3) { $CONFIG[2] = 3; }
                    else                                { $ok = 0; last; }
                }
                else { $ok = 0; last; }
            }
            else { $ok = 0; last; }
        }
        unless ($ok)
        {
            croak('configuration string syntax error');
        }
    }
    return($result);
}

sub _error
{
    my($name,$code) = @_;
    my($text);

    if ($code == 0)
    {
        $text = $@;
        $text =~ s!\s+! !g;
        $text =~ s!\s+at\s.*$!!;
        $text =~ s!^(?:Bit::Vector::)?[a-zA-Z0-9_]+\(\):\s*!!i;
        $text =~ s!\s+$!!;
    }
    elsif ($code == 1) { $text = 'illegal operand type'; }
    elsif ($code == 2) { $text = 'illegal reversed operands'; }
    else               { croak('unexpected internal error - please contact author'); }
    $text .= " in overloaded ";
    if (length($name) > 5) { $text .= "$name operation";  }
    else                   { $text .= "'$name' operator"; }
    croak($text);
}

sub _vectorize_
{
    my($vector,$scalar) = @_;

    if    ($CONFIG[0] == 4) { $vector->from_Enum($scalar); }
    elsif ($CONFIG[0] == 3) { $vector->from_Dec ($scalar); }
    elsif ($CONFIG[0] == 2) { $vector->from_Bin ($scalar); }
    elsif ($CONFIG[0] == 1) { $vector->from_Hex ($scalar); }
    else                    { $vector->Bit_On   ($scalar); }
}

sub _scalarize_
{
    my($vector) = @_;

    if    ($CONFIG[2] == 3) { return( $vector->to_Enum() ); }
    elsif ($CONFIG[2] == 2) { return( $vector->to_Dec () ); }
    elsif ($CONFIG[2] == 1) { return( $vector->to_Bin () ); }
    else                    { return( $vector->to_Hex () ); }
}

sub _fetch_operand
{
    my($object,$argument,$flag,$name,$build) = @_;
    my($operand);

    if ((defined $argument) && ref($argument) && (ref($argument) !~ /^[A-Z]+$/))
    {
        eval
        {
            if ($build && (defined $flag))
            {
                $operand = $argument->Clone();
            }
            else { $operand = $argument; }
        };
        if ($@) { &_error($name,0); }
    }
    elsif ((defined $argument) && (!ref($argument)))
    {
        eval
        {
            $operand = $object->Shadow();
            &_vectorize_($operand,$argument);
        };
        if ($@) { &_error($name,0); }
    }
    else { &_error($name,1); }
    return($operand);
}

sub _check_operand
{
    my($argument,$flag,$name) = @_;

    if ((defined $argument) && (!ref($argument)))
    {
        if ((defined $flag) && $flag) { &_error($name,2); }
    }
    else { &_error($name,1); }
}

sub _stringify
{
    my($vector) = @_;
    my($name) = 'string interpolation';
    my($result);

    eval
    {
        $result = &_scalarize_($vector);
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _boolean
{
    my($object) = @_;
    my($name) = 'boolean test';
    my($result);

    eval
    {
        $result = $object->is_empty();
    };
    if ($@) { &_error($name,0); }
    return(! $result);
}

sub _not_boolean
{
    my($object) = @_;
    my($name) = 'negated boolean test';
    my($result);

    eval
    {
        $result = $object->is_empty();
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _complement
{
    my($object) = @_;
    my($name) = '~';
    my($result);

    eval
    {
        $result = $object->Shadow();
        $result->Complement($object);
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _negate
{
    my($object) = @_;
    my($name) = 'unary minus';
    my($result);

    eval
    {
        $result = $object->Shadow();
        $result->Negate($object);
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _absolute
{
    my($object) = @_;
    my($name) = 'abs()';
    my($result);

    eval
    {
        if ($CONFIG[1] == 1)
        {
            $result = $object->Shadow();
            $result->Absolute($object);
        }
        else
        {
            $result = $object->Norm();
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _concat
{
    my($object,$argument,$flag) = @_;
    my($name) = '.';
    my($result);

    $name .= '=' unless (defined $flag);
    if ((defined $argument) && ref($argument) && (ref($argument) !~ /^[A-Z]+$/))
    {
        eval
        {
            if (defined $flag)
            {
                if ($flag) { $result = $argument->Concat($object); }
                else       { $result = $object->Concat($argument); }
            }
            else
            {
                $object->Interval_Substitute($argument,0,0,0,$argument->Size());
                $result = $object;
            }
        };
        if ($@) { &_error($name,0); }
        return($result);
    }
    elsif ((defined $argument) && (!ref($argument)))
    {
        eval
        {
            if (defined $flag)
            {
                if ($flag) { $result = $argument . &_scalarize_($object); }
                else       { $result = &_scalarize_($object) . $argument; }
            }
            else
            {
                if    ($CONFIG[0] == 2) { $result = $object->new( length($argument) ); }
                elsif ($CONFIG[0] == 1) { $result = $object->new( length($argument) << 2 ); }
                else                    { $result = $object->Shadow(); }
                &_vectorize_($result,$argument);
                $object->Interval_Substitute($result,0,0,0,$result->Size());
                $result = $object;
            }
        };
        if ($@) { &_error($name,0); }
        return($result);
    }
    else { &_error($name,1); }
}

sub _xerox  #  (in Brazil, a photocopy is called a "xerox")
{
    my($object,$argument,$flag) = @_;
    my($name) = 'x';
    my($result);
    my($offset);
    my($index);
    my($size);

    $name .= '=' unless (defined $flag);
    &_check_operand($argument,$flag,$name);
    eval
    {
        $size = $object->Size();
        if (defined $flag)
        {
            $result = $object->new($size * $argument);
            $offset = 0;
            $index = 0;
        }
        else
        {
            $result = $object;
            $result->Resize($size * $argument);
            $offset = $size;
            $index = 1;
        }
        for ( ; $index < $argument; $index++, $offset += $size )
        {
            $result->Interval_Copy($object,$offset,0,$size);
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _shift_left
{
    my($object,$argument,$flag) = @_;
    my($name) = '<<';
    my($result);

    $name .= '=' unless (defined $flag);
    &_check_operand($argument,$flag,$name);
    eval
    {
        if (defined $flag)
        {
            $result = $object->Clone();
            $result->Insert(0,$argument);
#           $result->Move_Left($argument);
        }
        else
        {
#           $object->Move_Left($argument);
            $object->Insert(0,$argument);
            $result = $object;
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _shift_right
{
    my($object,$argument,$flag) = @_;
    my($name) = '>>';
    my($result);

    $name .= '=' unless (defined $flag);
    &_check_operand($argument,$flag,$name);
    eval
    {
        if (defined $flag)
        {
            $result = $object->Clone();
            $result->Delete(0,$argument);
#           $result->Move_Right($argument);
        }
        else
        {
#           $object->Move_Right($argument);
            $object->Delete(0,$argument);
            $result = $object;
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _union_
{
    my($object,$operand,$flag) = @_;

    if (defined $flag)
    {
        $operand->Union($object,$operand);
        return($operand);
    }
    else
    {
        $object->Union($object,$operand);
        return($object);
    }
}

sub _union
{
    my($object,$argument,$flag) = @_;
    my($name) = '|';
    my($operand);

    $name .= '=' unless (defined $flag);
    $operand = &_fetch_operand($object,$argument,$flag,$name,1);
    eval
    {
        $operand = &_union_($object,$operand,$flag);
    };
    if ($@) { &_error($name,0); }
    return($operand);
}

sub _intersection_
{
    my($object,$operand,$flag) = @_;

    if (defined $flag)
    {
        $operand->Intersection($object,$operand);
        return($operand);
    }
    else
    {
        $object->Intersection($object,$operand);
        return($object);
    }
}

sub _intersection
{
    my($object,$argument,$flag) = @_;
    my($name) = '&';
    my($operand);

    $name .= '=' unless (defined $flag);
    $operand = &_fetch_operand($object,$argument,$flag,$name,1);
    eval
    {
        $operand = &_intersection_($object,$operand,$flag);
    };
    if ($@) { &_error($name,0); }
    return($operand);
}

sub _exclusive_or
{
    my($object,$argument,$flag) = @_;
    my($name) = '^';
    my($operand);

    $name .= '=' unless (defined $flag);
    $operand = &_fetch_operand($object,$argument,$flag,$name,1);
    eval
    {
        if (defined $flag)
        {
            $operand->ExclusiveOr($object,$operand);
        }
        else
        {
            $object->ExclusiveOr($object,$operand);
            $operand = $object;
        }
    };
    if ($@) { &_error($name,0); }
    return($operand);
}

sub _add
{
    my($object,$argument,$flag) = @_;
    my($name) = '+';
    my($operand);

    $name .= '=' unless (defined $flag);
    $operand = &_fetch_operand($object,$argument,$flag,$name,1);
    eval
    {
        if ($CONFIG[1] == 1)
        {
            if (defined $flag)
            {
                $operand->add($object,$operand,0);
            }
            else
            {
                $object->add($object,$operand,0);
                $operand = $object;
            }
        }
        else
        {
            $operand = &_union_($object,$operand,$flag);
        }
    };
    if ($@) { &_error($name,0); }
    return($operand);
}

sub _sub
{
    my($object,$argument,$flag) = @_;
    my($name) = '-';
    my($operand);

    $name .= '=' unless (defined $flag);
    $operand = &_fetch_operand($object,$argument,$flag,$name,1);
    eval
    {
        if ($CONFIG[1] == 1)
        {
            if (defined $flag)
            {
                if ($flag) { $operand->subtract($operand,$object,0); }
                else       { $operand->subtract($object,$operand,0); }
            }
            else
            {
                $object->subtract($object,$operand,0);
                $operand = $object;
            }
        }
        else
        {
            if (defined $flag)
            {
                if ($flag) { $operand->Difference($operand,$object); }
                else       { $operand->Difference($object,$operand); }
            }
            else
            {
                $object->Difference($object,$operand);
                $operand = $object;
            }
        }
    };
    if ($@) { &_error($name,0); }
    return($operand);
}

sub _mul
{
    my($object,$argument,$flag) = @_;
    my($name) = '*';
    my($operand);

    $name .= '=' unless (defined $flag);
    $operand = &_fetch_operand($object,$argument,$flag,$name,1);
    eval
    {
        if ($CONFIG[1] == 1)
        {
            if (defined $flag)
            {
                $operand->Multiply($object,$operand);
            }
            else
            {
                $object->Multiply($object,$operand);
                $operand = $object;
            }
        }
        else
        {
            $operand = &_intersection_($object,$operand,$flag);
        }
    };
    if ($@) { &_error($name,0); }
    return($operand);
}

sub _div
{
    my($object,$argument,$flag) = @_;
    my($name) = '/';
    my($operand);
    my($temp);

    $name .= '=' unless (defined $flag);
    $operand = &_fetch_operand($object,$argument,$flag,$name,1);
    eval
    {
        $temp = $object->Shadow();
        if (defined $flag)
        {
            if ($flag) { $operand->Divide($operand,$object,$temp); }
            else       { $operand->Divide($object,$operand,$temp); }
        }
        else
        {
            $object->Divide($object,$operand,$temp);
            $operand = $object;
        }
    };
    if ($@) { &_error($name,0); }
    return($operand);
}

sub _mod
{
    my($object,$argument,$flag) = @_;
    my($name) = '%';
    my($operand);
    my($temp);

    $name .= '=' unless (defined $flag);
    $operand = &_fetch_operand($object,$argument,$flag,$name,1);
    eval
    {
        $temp = $object->Shadow();
        if (defined $flag)
        {
            if ($flag) { $temp->Divide($operand,$object,$operand); }
            else       { $temp->Divide($object,$operand,$operand); }
        }
        else
        {
            $temp->Divide($object,$operand,$object);
            $operand = $object;
        }
    };
    if ($@) { &_error($name,0); }
    return($operand);
}

sub _pow
{
    my($object,$argument,$flag) = @_;
    my($name) = '**';
    my($operand,$result);

    $name .= '=' unless (defined $flag);
    $operand = &_fetch_operand($object,$argument,$flag,$name,0);
    eval
    {
        if (defined $flag)
        {
            $result = $object->Shadow();
            if ($flag) { $result->Power($operand,$object); }
            else       { $result->Power($object,$operand); }
        }
        else
        {
            $object->Power($object,$operand);
            $result = $object;
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _assign_concat
{
    my($object,$argument) = @_;

    return( &_concat($object,$argument,undef) );
}

sub _assign_xerox
{
    my($object,$argument) = @_;

    return( &_xerox($object,$argument,undef) );
}

sub _assign_shift_left
{
    my($object,$argument) = @_;

    return( &_shift_left($object,$argument,undef) );
}

sub _assign_shift_right
{
    my($object,$argument) = @_;

    return( &_shift_right($object,$argument,undef) );
}

sub _assign_union
{
    my($object,$argument) = @_;

    return( &_union($object,$argument,undef) );
}

sub _assign_intersection
{
    my($object,$argument) = @_;

    return( &_intersection($object,$argument,undef) );
}

sub _assign_exclusive_or
{
    my($object,$argument) = @_;

    return( &_exclusive_or($object,$argument,undef) );
}

sub _assign_add
{
    my($object,$argument) = @_;

    return( &_add($object,$argument,undef) );
}

sub _assign_sub
{
    my($object,$argument) = @_;

    return( &_sub($object,$argument,undef) );
}

sub _assign_mul
{
    my($object,$argument) = @_;

    return( &_mul($object,$argument,undef) );
}

sub _assign_div
{
    my($object,$argument) = @_;

    return( &_div($object,$argument,undef) );
}

sub _assign_mod
{
    my($object,$argument) = @_;

    return( &_mod($object,$argument,undef) );
}

sub _assign_pow
{
    my($object,$argument) = @_;

    return( &_pow($object,$argument,undef) );
}

sub _increment
{
    my($object) = @_;
    my($name) = '++';
    my($result);

    eval
    {
        $result = $object->increment();
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _decrement
{
    my($object) = @_;
    my($name) = '--';
    my($result);

    eval
    {
        $result = $object->decrement();
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _lexicompare
{
    my($object,$argument,$flag) = @_;
    my($name) = 'cmp';
    my($operand);
    my($result);

    $operand = &_fetch_operand($object,$argument,$flag,$name,0);
    eval
    {
        if ((defined $flag) && $flag)
        {
            $result = $operand->Lexicompare($object);
        }
        else
        {
            $result = $object->Lexicompare($operand);
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _compare
{
    my($object,$argument,$flag) = @_;
    my($name) = '<=>';
    my($operand);
    my($result);

    $operand = &_fetch_operand($object,$argument,$flag,$name,0);
    eval
    {
        if ((defined $flag) && $flag)
        {
            $result = $operand->Compare($object);
        }
        else
        {
            $result = $object->Compare($operand);
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _equal
{
    my($object,$argument,$flag) = @_;
    my($name) = '==';
    my($operand);
    my($result);

    $operand = &_fetch_operand($object,$argument,$flag,$name,0);
    eval
    {
        $result = $object->equal($operand);
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _not_equal
{
    my($object,$argument,$flag) = @_;
    my($name) = '!=';
    my($operand);
    my($result);

    $operand = &_fetch_operand($object,$argument,$flag,$name,0);
    eval
    {
        $result = $object->equal($operand);
    };
    if ($@) { &_error($name,0); }
    return(! $result);
}

sub _less_than
{
    my($object,$argument,$flag) = @_;
    my($name) = '<';
    my($operand);
    my($result);

    $operand = &_fetch_operand($object,$argument,$flag,$name,0);
    eval
    {
        if ($CONFIG[1] == 1)
        {
            if ((defined $flag) && $flag)
            {
                $result = ($operand->Compare($object) < 0);
            }
            else
            {
                $result = ($object->Compare($operand) < 0);
            }
        }
        else
        {
            if ((defined $flag) && $flag)
            {
                $result = ((!$operand->equal($object)) &&
                            ($operand->subset($object)));
            }
            else
            {
                $result = ((!$object->equal($operand)) &&
                            ($object->subset($operand)));
            }
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _less_equal
{
    my($object,$argument,$flag) = @_;
    my($name) = '<=';
    my($operand);
    my($result);

    $operand = &_fetch_operand($object,$argument,$flag,$name,0);
    eval
    {
        if ($CONFIG[1] == 1)
        {
            if ((defined $flag) && $flag)
            {
                $result = ($operand->Compare($object) <= 0);
            }
            else
            {
                $result = ($object->Compare($operand) <= 0);
            }
        }
        else
        {
            if ((defined $flag) && $flag)
            {
                $result = $operand->subset($object);
            }
            else
            {
                $result = $object->subset($operand);
            }
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _greater_than
{
    my($object,$argument,$flag) = @_;
    my($name) = '>';
    my($operand);
    my($result);

    $operand = &_fetch_operand($object,$argument,$flag,$name,0);
    eval
    {
        if ($CONFIG[1] == 1)
        {
            if ((defined $flag) && $flag)
            {
                $result = ($operand->Compare($object) > 0);
            }
            else
            {
                $result = ($object->Compare($operand) > 0);
            }
        }
        else
        {
            if ((defined $flag) && $flag)
            {
                $result = ((!$object->equal($operand)) &&
                            ($object->subset($operand)));
            }
            else
            {
                $result = ((!$operand->equal($object)) &&
                            ($operand->subset($object)));
            }
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _greater_equal
{
    my($object,$argument,$flag) = @_;
    my($name) = '>=';
    my($operand);
    my($result);

    $operand = &_fetch_operand($object,$argument,$flag,$name,0);
    eval
    {
        if ($CONFIG[1] == 1)
        {
            if ((defined $flag) && $flag)
            {
                $result = ($operand->Compare($object) >= 0);
            }
            else
            {
                $result = ($object->Compare($operand) >= 0);
            }
        }
        else
        {
            if ((defined $flag) && $flag)
            {
                $result = $object->subset($operand);
            }
            else
            {
                $result = $operand->subset($object);
            }
        }
    };
    if ($@) { &_error($name,0); }
    return($result);
}

sub _clone
{
    my($object) = @_;
    my($name) = 'automatic duplication';
    my($result);

    eval
    {
        $result = $object->Clone();
    };
    if ($@) { &_error($name,0); }
    return($result);
}

1;

__END__

