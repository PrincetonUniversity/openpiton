
###############################################################################
##                                                                           ##
##    Copyright (c) 1995 - 2004 by Steffen Beyer.                            ##
##    All rights reserved.                                                   ##
##                                                                           ##
##    This package is free software; you can redistribute it                 ##
##    and/or modify it under the same terms as Perl itself.                  ##
##                                                                           ##
###############################################################################

package Bit::Vector;

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK $VERSION @CONFIG);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw();

@EXPORT_OK = qw();

$VERSION = '6.4';

bootstrap Bit::Vector $VERSION;

1;

__END__

