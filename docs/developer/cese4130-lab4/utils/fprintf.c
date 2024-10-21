/* fprintf.c */

/*
 * Copyright (c) 1997-2010, 2013-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <stdarg.h>
#include <stdio.h>
#include "io.h"

#define DESC(d) ((void *)d)

int fprintf(FILE *F, const char *format, ...)
{
	va_list vargs;
	int     r;

	va_start(vargs, format);
	r = __libc_prf(__libc_fputc_safe, DESC(F), format, vargs);
	va_end(vargs);

	return r;
}

int vfprintf(FILE *F, const char *format,
	     va_list vargs)
{
	int r;

	r = __libc_prf(__libc_fputc_safe, DESC(F), format, vargs);

	return r;
}

int printf(const char *format, ...)
{
	va_list vargs;
	int     r;

	va_start(vargs, format);
	r = __libc_prf(__libc_fputc_safe, DESC(stdout), format, vargs);
	va_end(vargs);

	return r;
}

int vprintf(const char *format, va_list vargs)
{
	int r;

	r = __libc_prf(__libc_fputc_safe, DESC(stdout), format, vargs);

	return r;
}
