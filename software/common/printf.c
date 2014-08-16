/*
 * Basic printf based on vprintf based on vsprintf
 *
 * Alessandro Rubini for CERN, 2011 -- public domain
 * (please note that the vsprintf is not public domain but GPL)
 */
#include <stdarg.h>
#include <pp-printf.h>

#define CONFIG_PRINT_BUFSIZE 128

static char print_buf[CONFIG_PRINT_BUFSIZE];

int pp_vprintf(const char *fmt, va_list args)
{
	int ret;

	ret = pp_vsprintf(print_buf, fmt, args);
	puts(print_buf);
	return ret;
}

int pp_sprintf(char *s, const char *fmt, ...)
{
	va_list args;
	int ret;

	va_start(args, fmt);
	ret = pp_vsprintf(s, fmt, args);
	va_end(args);
	return ret;
}


int pp_printf(const char *fmt, ...)
{
	va_list args;
	int ret;

	va_start(args, fmt);
	ret = pp_vprintf(fmt, args);
	va_end(args);

	return ret;
}
