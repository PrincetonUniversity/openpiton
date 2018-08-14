dnl Stress test for recursion algorithms.  Usage:
dnl m4 -Ipath/to/examples [-Doptions] loop.m4
dnl Options include:
dnl -Dalt[=<n>] - test with foreachq<n> instead of foreachq2, default 3
dnl -Dlimit=<num> - set upper limit of sequence to <num>, default 1000
dnl -Dverbose - print the sequence to the screen, rather than discarding
dnl -Ddebug[=<code>] - execute <code> after forloop but before foreach
dnl -Dsleep=<num> - sleep for <num> seconds before exit, to allow time
dnl   to examine peak process memory usage
include(`forloop2.m4')dnl
include(`quote.m4')dnl
ifelse(alt, `alt', `define(`alt', `2')', alt, `', `define(`alt', `3')')dnl
include(`foreachq'alt`.m4')dnl
ifdef(`limit', `', `define(`limit', `1000')')dnl
ifdef(`verbose', `', `divert(`-1')')dnl
ifdef(`debug', `', `define(`debug')')dnl
foreachq(`i', dquote(1forloop(`i', `2', limit, `,i'))debug, ` i')
ifdef(`sleep',`syscmd(`echo done>/dev/tty;sleep 'sleep)')dnl
