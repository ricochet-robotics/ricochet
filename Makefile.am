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

UTILSRC = \
	array.5c		\
	list.5c			\
	shuffle.5c		\
	timer.5c

RRSRC = \
	rr.5c			\
	rr-lex.5c		\
	rr-send.5c

CLIENTSRC = \
	client.5c		\
	client-board.5c		\
	client-draw.5c		\
	client-games.5c		\
	client-link.5c		\
	client-main.5c		\
	client-messages.5c	\
	client-net.5c		\
	client-update.5c	\
	client-userlist.5c	\
	client-window.5c	\
	nichrome-rrboard.5c	\
	nichrome-timer.5c

CLIENTBUILT = \
	client-svg.5c


SERVERSRC = \
	server.5c		\
	server-boards.5c	\
	server-clients.5c	\
	server-dispatch.5c	\
	server-games.5c		\
	server-main.5c		\
	server-net.5c		\
	server-readreq.5c	\
	server-show.5c

if GAMEMAN
man6_MANS = ricochet.man rrserve.man
else
man1_MANS = ricochet.man rrserve.man
endif

MANSRC=ricochet.man.in rrserve.man.in

SVG=\
	$(top_srcdir)/svg/cell1.svg \
	$(top_srcdir)/svg/cell2.svg \
	$(top_srcdir)/svg/robot_blue.svg \
	$(top_srcdir)/svg/robot_green.svg \
	$(top_srcdir)/svg/robot_red.svg \
	$(top_srcdir)/svg/robot_yellow.svg \
	$(top_srcdir)/svg/target_blue_circle.svg \
	$(top_srcdir)/svg/target_blue_octagon.svg \
	$(top_srcdir)/svg/target_blue_square.svg \
	$(top_srcdir)/svg/target_blue_triangle.svg \
	$(top_srcdir)/svg/target_green_circle.svg \
	$(top_srcdir)/svg/target_green_octagon.svg \
	$(top_srcdir)/svg/target_green_square.svg \
	$(top_srcdir)/svg/target_green_triangle.svg \
	$(top_srcdir)/svg/target_red_circle.svg \
	$(top_srcdir)/svg/target_red_octagon.svg \
	$(top_srcdir)/svg/target_red_square.svg \
	$(top_srcdir)/svg/target_red_triangle.svg \
	$(top_srcdir)/svg/target_whirl.svg \
	$(top_srcdir)/svg/target_yellow_circle.svg \
	$(top_srcdir)/svg/target_yellow_octagon.svg \
	$(top_srcdir)/svg/target_yellow_square.svg \
	$(top_srcdir)/svg/target_yellow_triangle.svg \
	$(top_srcdir)/svg/wall.svg \
	$(top_srcdir)/svg/robot_shadow.svg

NICKLESRC = $(UTILSRC) $(RRSRC) $(CLIENTSRC) $(SERVERSRC)

NICKLEFILES = $(NICKLESRC) $(CLIENTBUILT)

DEBIAN = debian/changelog debian/compat \
	 debian/control debian/copyright debian/rules \
	 debian/source/format

EXTRA_DIST = protocol \
	$(NICKLESRC) \
	ricochet.in rrserve.in \
	svg/bin2cstring.5c \
	$(SVG) $(DEBIAN) LICENSE $(MANSRC)

ricochetlib_DATA = $(NICKLEFILES)

bin_SCRIPTS = ricochet rrserve

ricochet: ricochet.in
	sed -e 's#%ricochetlibdir%#@ricochetlibdir@#' -e 's#%ricochetbindir%#$(bindir)#' ${srcdir}/ricochet.in > $@ && chmod +x $@

rrserve: rrserve.in
	sed -e 's#%ricochetlibdir%#@ricochetlibdir@#' ${srcdir}/rrserve.in > $@ && chmod +x $@

client-svg.5c: $(SVG) svg/bin2cstring.5c
	$(RM) $@
	nickle $(top_srcdir)/svg/bin2cstring.5c $(SVG) > $@

clean-local:
	$(RM) client-svg.5c ricochet rrserve

TARFILE=$(PACKAGE)-$(VERSION).tar.gz
DEBFILE=$(PACKAGE)_$(VERSION)-1_all.deb
SRPMFILE=$(RPMDIR)/SRPMS/$(PACKAGE)-$(VERSION)-1.src.rpm
RPMFILE=$(RPMDIR)/RPMS/$(PACKAGE)-$(VERSION)-1.all.rpm
RELEASE_FILES = $(TARFILE) $(DEBFILE) $(SRPMFILE) $(RPMFILE)
DEB_TAR_DIR=$(PACKAGE)_$(VERSION).orig
DEB_TAR=$(DEB_TAR_DIR).tar.gz

debuild: $(DEBFILE)

$(DEBFILE): $(DEB_TAR) $(TARFILE)
	tar xzf $(TARFILE)
#	(cd $(distdir) && pdebuild --buildresult $(abs_top_builddir) --auto-debsign)
	(cd $(distdir) && debuild)

debuild-unsigned: $(DEB_TAR) $(TARFILE)
	tar xzf $(distdir).tar.gz
	(cd $(distdir)/debian && debuild -us -uc)

$(DEB_TAR): $(TARFILE)
	rm -f $(DEB_TAR)
	rm -rf $(DEB_TAR_DIR)
	tar xzf $(TARFILE)
	mv $(distdir) $(DEB_TAR_DIR)
	rm -rf $(DEB_TAR_DIR)/debian
	tar czf $(DEB_TAR) $(DEB_TAR_DIR)

$(TARFILE): dist-gzip $(DISTFILES)
	touch $(TARFILE)
	echo $(TARFILE) ready

#
# This assumes you've got Mike Harris's rpmbuild-nonroot stuff installed
# using the defaults
#
RPMDIR=$(HOME)/rpmbuild

rpm: $(RPMFILE) $(SRPMFILE)

$(RPMFILE): $(TARFILE) ricochet.spec
	mkdir -p $(RPMDIR)/$(PACKAGE)-$(VERSION)
	cp $(TARFILE) $(RPMDIR)/$(PACKAGE)-$(VERSION)
	rpmbuild -ba ricochet.spec

$(SRPMFILE): $(RPMFILE)

release-files: $(RELEASE_FILES)

release: $(RELEASE_FILES)
	scp $(RELEASE_FILES) nickle.org:/var/www/nickle/release

.PHONY: debuild debuild-signed debuild-unsigned debuild-dirs rpm force
