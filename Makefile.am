## Process this file with automake to produce Makefile.in

## Copyright © 2012 Keith Packard
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; version 2 of the License.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License along
## with this program; if not, write to the Free Software Foundation, Inc.,
## 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.

AUTOMAKE_OPTIONS = foreign

ricochetlibdir=@ricochetlibdir@

UTILFILES = \
	array.5c		\
	list.5c			\
	shuffle.5c		\
	timer.5c

RRFILES = \
	rr.5c			\
	rr-lex.5c		\
	rr-send.5c

CLIENTFILES = \
	client.5c		\
	client-board.5c		\
	client-draw.5c		\
	client-games.5c		\
	client-link.5c		\
	client-main.5c		\
	client-messages.5c	\
	client-net.5c		\
	client-svg.5c		\
	client-update.5c	\
	client-userlist.5c	\
	client-window.5c	\
	nichrome-rrboard.5c	\
	nichrome-timer.5c

SERVERFILES = \
	server.5c		\
	server-boards.5c	\
	server-clients.5c	\
	server-dispatch.5c	\
	server-games.5c		\
	server-main.5c		\
	server-net.5c		\
	server-readreq.5c	\
	server-show.5c

SVG=\
	svg/cell1.svg \
	svg/cell2.svg \
	svg/robot_blue.svg \
	svg/robot_green.svg \
	svg/robot_red.svg \
	svg/robot_yellow.svg \
	svg/target_blue_circle.svg \
	svg/target_blue_octagon.svg \
	svg/target_blue_square.svg \
	svg/target_blue_triangle.svg \
	svg/target_green_circle.svg \
	svg/target_green_octagon.svg \
	svg/target_green_square.svg \
	svg/target_green_triangle.svg \
	svg/target_red_circle.svg \
	svg/target_red_octagon.svg \
	svg/target_red_square.svg \
	svg/target_red_triangle.svg \
	svg/target_whirl.svg \
	svg/target_yellow_circle.svg \
	svg/target_yellow_octagon.svg \
	svg/target_yellow_square.svg \
	svg/target_yellow_triangle.svg \
	svg/wall.svg \
	svg/robot_shadow.svg

NICKLEFILES = $(UTILFILES) $(RRFILES) $(CLIENTFILES) $(SERVERFILES)

EXTRA_DIST = protocol $(NICKLEFILES) rrclient.in rrserve.in svg/bin2cstring.5c $(SVG)

ricochetlib_DATA = $(NICKLEFILES)

bin_SCRIPTS = rrclient rrserve

rrclient: rrclient.in
	sed 's#%ricochetlibdir%#@ricochetlibdir@#' ${srcdir}/rrclient.in > $@ && chmod +x $@

rrserve: rrserve.in
	sed 's#%ricochetlibdir%#@ricochetlibdir@#' ${srcdir}/rrserve.in > $@ && chmod +x $@

client-svg.5c: $(SVG) svg/bin2cstring.5c
	$(RM) $@
	nickle svg/bin2cstring.5c $(SVG) > $@

clean-local:
	$(RM) client-svg.5c rrclient rrserve