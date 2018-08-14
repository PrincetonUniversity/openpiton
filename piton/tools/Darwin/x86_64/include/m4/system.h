/* GNU m4 -- A simple macro processor
   Copyright (C) 2000-2001, 2003, 2006-2008, 2010, 2013-2014, 2017 Free
   Software Foundation, Inc.

   This file is part of GNU M4.

   GNU M4 is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   GNU M4 is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/**
 * @configure_output@
 *
 * This file is installed, so cannot rely on the contents of config.h.
 * It works best if included _before_ system headers.
 **/

#ifndef M4_SYSTEM_H
#define M4_SYSTEM_H 1

#include <gnu/stdlib--.h>
#include <gnu/stdio--.h>
#include <gnu/unistd--.h>

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <limits.h>
#include <stdint.h>
#include <sys/types.h>
#include <sys/stat.h>


#include <gnu/error.h>
#include <gnu/obstack.h>
#include <gnu/regex.h>
#include <stdbool.h>

#include <gnu/xalloc.h>
#include <gnu/xprintf.h>
#include <gnu/xstrndup.h>

/* In addition to EXIT_SUCCESS and EXIT_FAILURE, m4 can fail with version
   mismatch when trying to load a frozen file produced by a newer m4 than
   the version doing the reload.  */
#define EXIT_MISMATCH 63

/* This is okay in an installed file, because it will not change the
   behaviour of the including program whether ENABLE_NLS is defined
   or not.  */
#ifndef _
# ifdef ENABLE_NLS
#  include <libintl.h>
#  define _(Text) gettext (Text)
#  define N_(Text) gettext_noop (Text)
# else
#  define _(Text) (Text)
#  define N_(Text) (Text)
# endif
#endif


/* All header files should be inside BEGIN_C_DECLS ... END_C_DECLS, so
   that the library can be linked into a C++ program.  The multi-include
   guard macros must be outside, as should any #includes -- for simplicity
   everything else should go inside.  */

#ifndef BEGIN_C_DECLS
# ifdef __cplusplus
#  define BEGIN_C_DECLS extern "C" {
#  define END_C_DECLS           }
# else /* !__cplusplus */
#  define BEGIN_C_DECLS /* empty */
#  define END_C_DECLS           /* empty */
# endif /* __cplusplus */
#endif /* !BEGIN_C_DECLS */

BEGIN_C_DECLS



/* Canonicalize UNIX recognition macros.  */
#if defined unix || defined __unix || defined __unix__ \
  || defined _POSIX_VERSION || defined _POSIX2_VERSION \
  || defined __NetBSD__ || defined __OpenBSD__ \
  || defined __APPLE__ || defined __APPLE_CC__
# define UNIX 1
#endif

/* Canonicalize Windows recognition macros.  */
#if (defined _WIN32 || defined __WIN32__) && !defined __CYGWIN__
# define W32_NATIVE 1
#endif

/* Canonicalize OS/2 recognition macro.  */
#ifdef __EMX__
# define OS2 1
# undef UNIX
#endif


/* M4_STMT_START/END are used to create macros which expand to a
   a single compound statement in a portable way, but crucially in
   a way sympathetic to the compiler to maximise optimization.  */
#undef M4_STMT_START
#undef M4_STMT_END
#if defined __GNUC__ && !defined __STRICT_ANSI__ && !defined __cplusplus
# define M4_STMT_START        (void)(
# define M4_STMT_END          )
#else
# if defined sun || defined __sun__
#  define M4_STMT_START      if (1)
#  define M4_STMT_END        else (void)0
# else
#  define M4_STMT_START      do
#  define M4_STMT_END        while (0)
# endif
#endif



/* Take advantage of GNU C compiler source level optimization hints,
   using portable macros.  */
#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 6)
# define M4_GNUC_ATTRIBUTE(args)        __attribute__ (args)
#else
# define M4_GNUC_ATTRIBUTE(args)
#endif  /* __GNUC__ */

#define M4_GNUC_PRINTF(fmt, arg)                                \
  M4_GNUC_ATTRIBUTE ((__format__ (__printf__, fmt, arg)))
#define M4_GNUC_SCANF(fmt, arg)                                 \
  M4_GNUC_ATTRIBUTE ((__format__ (__scanf__, fmt, arg)))
#define M4_GNUC_NORETURN        M4_GNUC_ATTRIBUTE ((__noreturn__))
#define M4_GNUC_CONST           M4_GNUC_ATTRIBUTE ((__const__))
#define M4_GNUC_UNUSED          M4_GNUC_ATTRIBUTE ((__unused__))
#define M4_GNUC_PURE            M4_GNUC_ATTRIBUTE ((__pure__))



#if !defined __PRETTY_FUNCTION__
# define __PRETTY_FUNCTION__    "<unknown>"
#endif


/* Preprocessor token manipulation.  */

/* The extra indirection to the _STR and _CONC macros is required so that
   if the arguments to STR() (or CONC()) are themselves macros, they will
   be expanded before being quoted.   */
#ifndef STR
# define _STR(arg)      #arg
# define STR(arg)       _STR (arg)
#endif

#ifndef CONC
# define _CONC(a, b)    a##b
# define CONC(a, b)     _CONC (a, b)
#endif

END_C_DECLS

#endif /* !M4_SYSTEM_H */
