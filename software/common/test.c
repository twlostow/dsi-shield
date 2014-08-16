#define CPU_CLOCK 24000000

#define CALC_BAUD(baudrate) \
    ( ((( (unsigned long long)baudrate * 8ULL) << (16 - 7)) + \
      (CPU_CLOCK >> 8)) / (CPU_CLOCK >> 7) )

main()
{
	printf("%d\n", CALC_BAUD(115200));
}