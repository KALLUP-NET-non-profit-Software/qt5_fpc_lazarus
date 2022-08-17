#/bin/bash
# ----------------------------------------------------------------
# This build file is part of Makefile.
#
# (c) Copyright 2022 Jens Kallup - paule32
# only for non-profit usage !!!
# ----------------------------------------------------------------
# since we have multiple PATH's set, I explicit set the MingW-64
# path for GNU make. Other "make" files could have inconsistences
# with a acceptable result ...
# ----------------------------------------------------------------
/usr/bin/make -f Makefile build
