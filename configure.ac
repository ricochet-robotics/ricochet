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

AC_CONFIG_FILES(
 Makefile)

AC_OUTPUT