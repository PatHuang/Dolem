# Process this file with autoconf to produce a configure script.
#---------------------------------------
#
# Copyright (c) 2008-2014 The Dolem project.
#
# This file is a part of the Dolem project, and is 
# copyrighted by Pat Huang and/or others who actually
# wrote it.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# See also
# <http://www.opensource.org/licenses/mit-license.php>
#
# Contact the project <staff.effo@gmail.com> or 
# contact Pat Huang <pat.sh.cn@gmail.com>
#
#---------------------------------------

# In order for some versions of Sun Studio to compile our C++ test cases
# correctly, we need Autoconf 2.64 or better to handle the restrict
# keyword in at least string.h from gnulib.
AC_PREREQ([2.64])
m4_pattern_forbid([^gl_[A-Z]])
AC_INIT([Dolem],[0.3.02.02],[staff.effo@gmail.com])
AC_SUBST([PACKAGE_COPYRIGHT_YEAR], [2008-2014])
AC_DEFINE_UNQUOTED([PACKAGE_COPYRIGHT_YEAR], [$PACKAGE_COPYRIGHT_YEAR],
	[The copyright year for this package]
)

AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADERS([config.h:config.h.in])
# AC_CONFIG_AUX_DIR must be called before AM_INIT_AUTOMAKE, all shell help scripts go to aux dir.
AC_CONFIG_AUX_DIR([dotaux])
# autoreconf won't invoke automake if no AM_INIT_AUTOMAKE specified
# autoreconf --install --force -Wall -v
# autoreconf -ifv -Wall
AM_INIT_AUTOMAKE([silent-rules dist-bzip2 -Wall -Werror])
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

AC_CONFIG_MACRO_DIR([dotaux])

# dotAux - a replacement for build-aux
m4_define([DAUX], [dotaux])

#AC_REQUIRE_AUX_FILE([tap-driver.sh])

# supress gnulib caused warning: AC_COMPILE_IFELSE was called before AC_USE_SYSTEM_EXTENSIONS
#AC_USE_SYSTEM_EXTENSIONS 

# Checks for programs.
#skip detection of Fortran
AC_PROG_CC
# Gnulib (early checks).
gl_EARLY
AC_PROG_CXX
AC_PROG_CPP
AC_PROG_AWK
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MKDIR_P
AC_PROG_MAKE_SET
AC_PROG_RANLIB
# not yet in my autotools AC_PROG_MAKE_CASE_SENSITIVE
# not yet in my autotools AC_PROG_GNU_M4
## ------------ ##
## Grep & sed.  ##
## ------------ ##
AC_PROG_GREP
AC_PROG_SED

#LT_INIT
LT_INIT

# Checks for libraries.
# Some distro may not have pthread_cancel, so use pthread_create
AC_SEARCH_LIBS([pthread_create], [pthread], [], [AC_MSG_ERROR([pthread_create was not found in libpthread])])
AC_SEARCH_LIBS([main], [rt], [], [AC_MSG_ERROR([main was not found in librt])])

# Checks for header files.
AC_CHECK_HEADERS([arpa/inet.h fcntl.h inttypes.h limits.h memory.h netdb.h netinet/in.h stddef.h stdint.h stdlib.h string.h strings.h sys/ioctl.h sys/param.h sys/socket.h sys/time.h termios.h unistd.h utime.h])

# gnulib cause warning
AC_CHECK_HEADERS([OS.h sys/timeb.h wchar.h wctype.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_INLINE
AC_TYPE_INT8_T
AC_TYPE_UINT8_T
AC_TYPE_INT16_T
AC_TYPE_UINT16_T
AC_TYPE_INT32_T
AC_TYPE_UINT32_T
AC_TYPE_INT64_T
AC_TYPE_UINT64_T
AC_TYPE_SIZE_T
AC_TYPE_SSIZE_T
AC_TYPE_OFF_T
AC_CHECK_TYPES([ptrdiff_t])

# gnulib cause warning
AC_TYPE_MODE_T
AC_TYPE_PID_T
AC_TYPE_UID_T

# Checks for library functions.
AC_FUNC_ERROR_AT_LINE
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([clock_gettime getcwd gettimeofday memmove memset strchr strerror strrchr strspn strstr strtoul sysinfo])

# gnulib cause warning
AC_CHECK_FUNCS([dup2 getpagesize strcasecmp strncasecmp strtol tzset])

# Gnulib (later checks).  Putting them here rather than right after
# gl_EARLY avoids some redundant checks.
gl_INIT

#AM_MISSING_PROG([AUTOM4TE], [autom4te])

m4_include(DAUX[/dmeta/das.m4])
m4_include(DAUX[/dmeta/dac.m4])

# Import dotAux
DAC_SHELL_FN

# Dolem
DOLEM

#
AS_VAR_SET([dac_myaux], m4_defn([DAUX]))
m4_undefine([DAUX])
AC_SUBST([DAUX], [$dac_myaux])

# Distribute final those may be changed above
AS_VAR_APPEND([AM_CPPFLAGS], [" -I\$(top_srcdir)/include -I\$(top_builddir)/include"])
# gnulib include path
AS_VAR_APPEND([AM_CPPFLAGS], [" -I\$(top_srcdir)/dolem/lib -I\$(top_builddir)/dolem/lib"])
# Support storage capacity or file size > 2/4GB
AS_VAR_APPEND([AM_CPPFLAGS], [" -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE"])
AC_SUBST([AM_CPPFLAGS])

AC_CONFIG_FILES([Makefile])

# my header
AC_CONFIG_FILES([include/dolem/dolem.h])

# gnulib source
AC_CONFIG_FILES([dolem/lib/Makefile])

# pkg-config
AC_CONFIG_FILES([dolem/dolem.pc])

# Initialize the test suite.
AC_CONFIG_TESTDIR(tests)
AC_CONFIG_FILES([tests/atlocal tests/Makefile])

AC_OUTPUT

