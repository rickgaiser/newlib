## Process this file with automake to generate Makefile.in

AUTOMAKE_OPTIONS = cygnus

INCLUDES = $(NEWLIB_CFLAGS) $(CROSS_CFLAGS) $(TARGET_CFLAGS)

LIB_SOURCES = \
	clearerr.c 			\
	fclose.c 			\
	fdopen.c 			\
	feof.c 				\
	ferror.c 			\
	fflush.c 			\
	fgetc.c 			\
	fgetpos.c 			\
	fgets.c 			\
	fileno.c			\
	findfp.c 			\
	fiprintf.c 			\
	flags.c 			\
	fopen.c 			\
	fprintf.c 			\
	fputc.c 			\
	fputs.c 			\
	fread.c 			\
	freopen.c 			\
	fscanf.c 			\
	fseek.c 			\
	fsetpos.c 			\
	ftell.c 			\
	fvwrite.c 			\
	fwalk.c 			\
	fwrite.c 			\
	getc.c 				\
	getchar.c 			\
	gets.c 				\
	getw.c				\
	iprintf.c 			\
	makebuf.c			\
	mktemp.c 			\
	perror.c 			\
	printf.c 			\
	putc.c 				\
	putchar.c 			\
	puts.c 				\
	putw.c				\
	refill.c 			\
	remove.c 			\
	rename.c 			\
	rewind.c 			\
	rget.c 				\
	scanf.c 			\
	setbuf.c 			\
	setvbuf.c 			\
	siprintf.c 			\
	snprintf.c			\
	sprintf.c 			\
	sscanf.c 			\
	stdio.c 			\
	tmpfile.c 			\
	tmpnam.c 			\
	ungetc.c 			\
	vfscanf.c 			\
	vprintf.c 			\
	vscanf.c			\
	vsnprintf.c			\
	vsprintf.c 			\
	vsscanf.c			\
	wbuf.c 				\
	wsetup.c 

LIBADD_OBJS = vfiprintf.$(oext) vfprintf.$(oext)

libstdio_la_LDFLAGS = -Xcompiler -nostdlib

if USE_LIBTOOL
noinst_LTLIBRARIES = libstdio.la
libstdio_la_SOURCES = $(LIB_SOURCES)
libstdio_la_LIBADD = $(LIBADD_OBJS)
LIB_COMPILE = $(LTCOMPILE)
noinst_DATA = objectlist.awk.in
else
noinst_LIBRARIES = lib.a
lib_a_SOURCES = $(LIB_SOURCES)
lib_a_LIBADD = $(LIBADD_OBJS)
LIB_COMPILE = $(COMPILE)
noinst_DATA =
endif # USE_LIBTOOL

include $(srcdir)/../../Makefile.shared

# This rule is needed so that libtool compiles vfiprintf before vfprintf. Otherwise
# libtool moves vfprintf.o and subsequently can't find it.

vfprintf.$(oext): vfprintf.c
	$(LIB_COMPILE) -c $(srcdir)/vfprintf.c

vfiprintf.$(oext): vfprintf.c
	$(LIB_COMPILE) -DINTEGER_ONLY -c $(srcdir)/vfprintf.c -o $@

CHEWOUT_FILES = \
	clearerr.def		\
	fclose.def		\
	fdopen.def		\
	feof.def		\
	ferror.def		\
	fflush.def		\
	fgetc.def		\
	fgetpos.def		\
	fgets.def		\
	fileno.def		\
	fiprintf.def		\
	fopen.def		\
	fputc.def		\
	fputs.def		\
	fread.def		\
	freopen.def		\
	fseek.def		\
	fsetpos.def		\
	ftell.def		\
	fwrite.def		\
	getc.def		\
	getchar.def		\
	gets.def		\
	getw.def		\
	iprintf.def		\
	mktemp.def		\
	perror.def		\
	putc.def		\
	putchar.def		\
	puts.def		\
	putw.def		\
	remove.def		\
	rename.def		\
	rewind.def		\
	setbuf.def		\
	setvbuf.def		\
	siprintf.def		\
	sprintf.def		\
	sscanf.def		\
	tmpfile.def		\
	tmpnam.def		\
	vfprintf.def		\
	vfscanf.def

SUFFIXES = .def

CHEW = ../../doc/makedoc -f $(srcdir)/../../doc/doc.str

.c.def:
	$(CHEW) < $< > $*.def 2> $*.ref
	touch stmp-def

TARGETDOC = ../tmp.texi

doc: $(CHEWOUT_FILES)
	cat $(srcdir)/stdio.tex >> $(TARGETDOC)

CLEANFILES = $(CHEWOUT_FILES) *.ref

fclose.$(oext): local.h
fdopen.$(oext): local.h
fflush.$(oext): local.h
findfp.$(oext): local.h
fopen.$(oext): local.h
fputs.$(oext): fvwrite.h
fread.$(oext): local.h
freopen.$(oext): local.h
fseek.$(oext): local.h
ftell.$(oext): local.h
fvwrite.$(oext): local.h fvwrite.h
fwalk.$(oext): local.h
fwrite.$(oext): local.h fvwrite.h
makebuf.$(oext): local.h
puts.$(oext): fvwrite.h
refill.$(oext): local.h
scanf.$(oext): local.h
setbuf.$(oext): local.h
setvbuf.$(oext): local.h
siprintf.$(oext): local.h
sprintf.$(oext): local.h
sscanf.$(oext): local.h
stdio.$(oext): local.h
ungetc.$(oext): local.h
vfiprintf.$(oext): local.h
vfprintf.$(oext): local.h
vfscanf.$(oext): local.h floatio.h
vscanf.$(oext): local.h
vsscanf.$(oext): local.h
wbuf.$(oext): local.h fvwrite.h
wsetup.$(oext): local.h
