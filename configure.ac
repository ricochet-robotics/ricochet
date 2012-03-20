dnl Process this file with autoconf to produce a configure script.

dnl Copyright © 2012 Keith Packard
dnl This program is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation; version 2 of the License.
dnl
dnl This program is distributed in the hope that it will be useful, but
dnl WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
dnl General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License along
dnl with this program; if not, write to the Free Software Foundation, Inc.,
dnl 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.

AC_PREREQ([2.64])

AC_INIT([server-main.5c],[0.1],[http://rr.nickle.org],[ricochet])

AC_CONFIG_SRCDIR([server-main.5c])
AC_CONFIG_AUX_DIR(.)

AM_INIT_AUTOMAKE([foreign])

AM_MAINTAINER_MODE

AC_PROG_INSTALL

ricochetlibdir=`eval echo ${datadir}`/ricochet

AC_SUBST(ricochetlibdir)

AC_ARG_ENABLE([gameman],
[  --enable-gameman  Install manual pages in section 6 rather than section 1],
[case "${enableval}" in
  yes) gameman=true ;;
  no) gameman=false ;;
  *) AC_MSG_ERROR([bad value ${enableval} for --enable-gameman]) ;;
esac],[gameman=false])

AM_CONDITIONAL([GAMEMAN], [test x$gameman = xtrue])

if test x$gameman = xtrue; then
	MAN_SECTION=6
else
	MAN_SECTION=1
fi

AC_SUBST(MAN_SECTION)

BUILD_DATE=`date +%F`

AC_SUBST(BUILD_DATE)

AC_CONFIG_FILES(
 Makefile
 rrclient.man
 rrserve.man
 )

AC_OUTPUT