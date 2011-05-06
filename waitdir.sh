#!/bin/sh -
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

USAGE="usage $0 [-s sec] [-v] dir ..."
S_FLAG=16
V_FLAG=
set -- `/usr/bin/getopt s:v $*`
if [ $? != 0 ]; then
    echo "$0: unknown or invalid -flag" 1>&2
    echo $USAGE 1>&2
    exit 1
fi
for i in $*; do
    case "$i" in
    -s) S_FLAG="$2"; ;;
    -v) V_FLAG=true; ;;
    --) shift; break ;;
    esac
    shift
done
if [ $# -lt 1 ]; then
    echo "$0: must have at least one arg" 1>&2
    echo $USAGE 1>&2
    exit 2
fi

# loop until we find a directory
#
while :; do

   # Look for a directory 
   #
   for i in $@; do

	# exit if directory exists
	#
	if [[ -n "$V_FLAG" ]]; then
	    echo "test: $i"
	fi
	if [[ -d "$i" ]]; then
	    if [[ -n "$V_FLAG" ]]; then
		echo "Found: $i"
	    fi
	    exit 0
	fi
   done

   # no directory yet, wait as needed and retry
   #
   if [[ "$S_FLAG" -gt 0 ]]; then
	if [[ -n "$V_FLAG" ]]; then
	    echo -n "wait: $S_FLAG ..."
	fi
	sleep "$S_FLAG"
	if [[ -n "$V_FLAG" ]]; then
	    echo
	fi
   fi
   if [[ -n "$V_FLAG" ]]; then
	echo
   fi
done
exit 3
