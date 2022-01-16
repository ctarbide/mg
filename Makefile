
INSTALL = ./tools/install.sh

PREFIX = $(HOME)/local
BINDIR = $(PREFIX)/bin
LIBDIR = $(PREFIX)/lib/mg
SHAREDIR = $(PREFIX)/share/mg
MAN1DIR = $(PREFIX)/share/man/man1

CC = gcc
CFLAGS = -std=c99 -g -O2 -Wall -I${HOME}/local/include
# CFLAGS += -Werror -fmax-errors=3
LIBS = -L${HOME}/local/lib64 -L${HOME}/local/lib
LIBS += -lm -lncursesw -lutil

# OPTFLAGS = -ggdb3 -O0
OPTFLAGS = -g -O2
WERROR = -pedantic -Werror -fmax-errors=5
CFLAGS_QA = -std=c99 $(OPTFLAGS) \
    -Wall -Wextra -Wstrict-prototypes -Wmissing-prototypes \
    -Wshadow -Wconversion -Wdeclaration-after-statement \
    -Wno-unused-parameter \
    $(WERROR) \
    -I${HOME}/local/include
#CFLAGS = $(CFLAGS_QA)

OBJS = \
    autoexec.o \
    basic.o \
    bell.o \
    buffer.o \
    cinfo.o \
    cmode.o \
    cscope.o \
    dir.o \
    dired.o \
    display.o \
    echo.o \
    extend.o \
    file.o \
    fileio.o \
    fparseln.o \
    funmap.o \
    grep.o \
    help.o \
    interpreter.o \
    kbd.o \
    keymap.o \
    line.o \
    log.o \
    macro.o \
    main.o \
    match.o \
    modes.o \
    paragraph.o \
    reallocarray.o \
    region.o \
    re_search.o \
    search.o \
    spawn.o \
    strlcat.o \
    strlcpy.o \
    strtonum.o \
    tags.o \
    tty.o \
    ttyio.o \
    ttykbd.o \
    undo.o \
    util.o \
    version.o \
    window.o \
    word.o \
    yank.o

SRCS = \
    autoexec.c \
    basic.c \
    bell.c \
    buffer.c \
    cinfo.c \
    cmode.c \
    cscope.c \
    dir.c \
    dired.c \
    display.c \
    echo.c \
    extend.c \
    file.c \
    fileio.c \
    fparseln.c \
    funmap.c \
    grep.c \
    help.c \
    interpreter.c \
    kbd.c \
    keymap.c \
    line.c \
    log.c \
    macro.c \
    main.c \
    match.c \
    modes.c \
    paragraph.c \
    reallocarray.c \
    region.c \
    re_search.c \
    search.c \
    spawn.c \
    strlcat.c \
    strlcpy.c \
    strtonum.c \
    tags.c \
    tty.c \
    ttyio.c \
    ttykbd.c \
    undo.c \
    util.c \
    version.c \
    window.c \
    word.c \
    yank.c

all: mg

.SUFFIXES: .o
.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

mg: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LIBS)

protos.h: *.nw
	nofake.sh -L -Rprotos -oprotos.h *.nw

.PHONY: install
install: mg mg.1 tutorial
	$(INSTALL) -D -m 755 mg '$(BINDIR)/mg'
	$(INSTALL) -D -m 644 tutorial '$(SHAREDIR)/tutorial'
	$(INSTALL) -D -m 644 mg.1 '$(MAN1DIR)/mg.1'

clean:
	rm -f $(OBJS) mg
