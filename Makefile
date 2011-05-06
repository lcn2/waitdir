#!/bin/make
# @(#)Makefile	1.2 04 May 1995 02:06:57
#
# waitdir - wait for a directory to exist
#
# @(#) $Revision$
# @(#) $Id$
# @(#) $Source$
#
# Copyright (c) 2011 by Landon Curt Noll.  All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright, this permission notice and text
# this comment, and the disclaimer below appear in all of the following:
#
#       supporting documentation
#       source copies
#       source works derived from this source
#       binaries derived from this source or from derived source
#
# LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
# EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
# USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
# chongo (Landon Curt Noll, http://www.isthe.com/chongo/index.html) /\oo/\
#
# Share and enjoy! :-)


SHELL= /bin/sh
CC= cc
CFLAGS= -O3 -g3

TOPNAME= cmd
INSTALL= install

DESTDIR= /usr/local/bin

TARGETS= waitdir

all: ${TARGETS}

waitdir: waitdir.sh
	rm -f $@
	cp waitdir.sh $@
	chmod 0555 $@

configure:
	@echo nothing to configure

clean quick_clean quick_distclean distclean:

clobber quick_clobber: clean
	rm -f waitdir

install: all
	${INSTALL} -m 0555 ${TARGETS} ${DESTDIR}
