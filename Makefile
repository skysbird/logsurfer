# Generated automatically from Makefile.in by configure.
# Makefile for logsurfer
# 
#	original written by W. Ley and U. Ellermann
#	updated by K. Thompson
#

version = 1.8

# Where is the default configuration file
#
etcdir = /usr/local/etc
DEF_CONFFILE = $(etcdir)/logsurfer.conf

# Where should we dump or status (default location)
#
DEF_DUMPFILE = /dev/null

# 
# You can define CPPFLAGS on the command line.  Aside from system-specific
# flags, you can define:
#   -DSENDMAIL_FLUSH
#    to use the ugly sendmail hack (see README)
#   -DWARN_ROOT
#    print a warning if the program is started as root (see README)
CPPFLAGS = -DVERSION=\"$(version)\" -DWARN_ROOT #-DDEBUG

# Which C-Compiler?
CC = gcc

# Define your C-Compiler options
#  -g
#   to enable debug information
#  -O2 -Wall
#   to optimize and show all warnings
CFLAGS = -g -O

# If you need specify additional options for the linker define them here
#  -s
#   to strip the symbol table and generate a smaller executable
# LDFLAGS = -s
LDFLAGS = 

# Any additional libraries we need?
LIBS = 

# Where to install the logsurfer executable
prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
# Where to install manual pages
mandir = ${prefix}/man

# Use cp if you don't have install.
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644


# The following definitions are detected by configure
DEFS = -DHAVE_CONFIG_H


######################################################################
# end of user configuration
######################################################################

srcdir = .

SHELL = /bin/sh

SUBDIRS = man src




######################################################################
# defines we want to pass to subdirs
######################################################################

MDEFINES = prefix='$(prefix)' bindir='$(bindir)' mandir='$(mandir)' \
CPPFLAGS='$(CPPFLAGS)' CC='$(CC)' CFLAGS='$(CFLAGS)' LDFLAGS='$(LDFLAGS)' \
DEF_DUMPFILE='$(DEF_DUMPFILE)' DEF_CONFFILE='$(DEF_CONFFILE)' \
LIBS='$(LIBS)' INSTALL='$(INSTALL)' \
INSTALL_PROGRAM='$(INSTALL_PROGRAM)' INSTALL_DATA='$(INSTALL_DATA)' \
DEFS='$(DEFS)'

######################################################################
# start of tags
######################################################################

all install: Makefile config.h
	for subdir in $(SUBDIRS); do \
		echo making $@ in $$subdir ; \
		(cd $$subdir; $(MAKE) $(MDEFINES) $@); \
	done

clean:
	for subdir in $(SUBDIRS); do \
		echo making $@ in $$subdir ; \
		(cd $$subdir; $(MAKE) $@); \
	done

distclean:
	$(RM) Makefile config.h config.cache config.log config.status stamp-h
	for subdir in $(SUBDIRS); do \
		echo making $@ in $$subdir ; \
		(cd $$subdir; $(MAKE) $@); \
	done

${srcdir}/configure: configure.in
	cd ${srcdir} && autoconf

# autoheader might not change config.h.in, so touch a stamp file.
${srcdir}/config.h.in: stamp-h.in
${srcdir}/stamp-h.in: configure.in
	cd ${srcdir} && autoheader
	echo timestamp > ${srcdir}/stamp-h.in

config.h: stamp-h
stamp-h: config.h.in config.status
	./config.status

Makefile: Makefile.in config.status
	./config.status

config.status: configure
	./config.status --recheck


