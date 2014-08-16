/*
 *  vsprintf-xint: a possible free-software replacement for mprintf
 *
 *  public domain
 */
#include <stdarg.h>
#include <stdint.h>

static const char hex[] = "0123456789abcdef";

static int number(char *out, unsigned value, int base, int lead, int wid)
{
	char tmp[16];
	int i = 16, ret, negative = 0;

	/* No error checking at all: it is as ugly as possible */
	if ((signed)value < 0 && base == 10) {
		negative = 1;
		value = -value;
	}
	while (value && i) {
		tmp[--i] = hex[value % base];
		value /= base;
	}
	if (i == 16)
		tmp[--i] = '0';
	if (negative && lead == ' ') {
		tmp[--i] = '-';
		negative = 0;
	}
	while (i > 16 - wid + negative)
		tmp[--i] = lead;
	if (negative)
		tmp[--i] = '-';
	ret = 16 - i;
	while (i < 16)
		*(out++) = tmp[i++];
	return ret;
}

int pp_vsprintf(char *buf, const char *fmt, va_list args)
{
	char *s, *str = buf;
	int base, lead, wid;

	for (; *fmt ; ++fmt) {
		if (*fmt != '%') {
			*str++ = *fmt;
			continue;
		}

		base = 10;
		lead = ' ';
		wid = 1;
	repeat:
		fmt++;		/* Skip '%' initially, other stuff later */
		switch(*fmt) {
		case '\0':
			goto ret;
		case '0':
			lead = '0';
			goto repeat;

		case '*':
			/* should be precision, just eat it */
			base = va_arg(args, int);
			/* fall through: discard unknown stuff */
		default:
			if (*fmt >= '1' && *fmt <= '9')
				wid = *fmt - '0';
			goto repeat;

			/* Special cases for conversions */

		case 'c': /* char: supported */
			*str++ = (unsigned char) va_arg(args, int);
			break;
		case 's': /* string: supported */
			s = va_arg(args, char *);
			while (*s)
				*str++ = *s++;
			break;
		case 'n': /* number-thus-far: not supported */
			break;
		case '%': /* supported */
			*str++ = '%';
			break;

			/* integers are more or less printed */
		case 'p':
		case 'x':
		case 'X':
			base = 16;
		case 'o':
			if (base == 10) /* yet unchaged */
				base = 8;
		case 'd':
		case 'i':
		case 'u':
			str += number(str, va_arg(args, int), base, lead, wid);
			break;
		}
	}
 ret:
	*str = '\0';
	return str - buf;


}
