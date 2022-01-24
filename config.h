
/* Copyright (c) 2021, C. Tarbide.
 * All rights reserved.
 *
 * Permission to distribute and use this work for any
 * purpose is hereby granted provided this copyright
 * notice is included in the copy.  This work is provided
 * as is, with no warranty of any kind.
 */

#ifndef _DEFAULT_SOURCE
#define _DEFAULT_SOURCE
#endif

#ifndef _ISOC99_SOURCE
#define _ISOC99_SOURCE
#endif

#ifndef _SVID_SOURCE
#define _SVID_SOURCE
#endif

#ifndef _BSD_SOURCE
#define _BSD_SOURCE
#endif

#ifndef _XOPEN_SOURCE
#define _XOPEN_SOURCE 700
#endif

#ifndef _XOPEN_SOURCE_EXTENDED
#define _XOPEN_SOURCE_EXTENDED
#endif

#ifndef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE 200809L
#endif

#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#ifndef TCSASOFT
#define TCSASOFT        0
#endif

#ifndef REGEX
#define REGEX 1
#endif

#ifndef HAVE_PTY_H
#define HAVE_PTY_H 1
#endif

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <limits.h>
#include <time.h>

#include <assert.h>

#include <ctype.h>
#include <dirent.h>
#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <fnmatch.h>
#include <libgen.h>
#include <limits.h>
#include <locale.h>
#include <poll.h>
#include <pwd.h>
#include <signal.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/resource.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <term.h>
#include <termios.h>
#include <time.h>
#include <unistd.h>

#if HAVE_PTY_H == 1
#include <pty.h>
#include <utmp.h>
#elif HAVE_UTIL_H
#include <util.h>
#endif

#if REGEX == 1
#include <regex.h>
#endif

#define strlcat         internal_strlcat
#define strlcpy         internal_strlcpy
#define reallocarray    internal_reallocarray
#define strtonum        internal_strtonum
#define fparseln        internal_fparseln

#include "protos.h"

#include "queue.h"
#include "tree.h"

#include "chrdef.h"
#include "def.h"
#include "funmap.h"
#include "kbd.h"
#include "key.h"
#include "macro.h"
#include "pathnames.h"
#include "libutil.h"

#if MGLOG == 1
#include "log.h"
#endif
