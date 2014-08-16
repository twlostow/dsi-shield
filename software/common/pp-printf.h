#include <stdarg.h>

extern int pp_printf(const char *fmt, ...)
        __attribute__((format(printf,1,2)));

extern int pp_sprintf(char *s, const char *fmt, ...)
        __attribute__((format(printf,2,3)));

extern int pp_vprintf(const char *fmt, va_list args);

extern int pp_vsprintf(char *buf, const char *, va_list)
        __attribute__ ((format (printf, 2, 0)));

/* This is what we rely on for output */
extern int puts(const char *s);


