#include <cstdio>
#include <stdint.h>
#include <cstdlib>

const int ITERATIONS = 1000;

uint32_t ccnt_read()
{
	uint32_t cc = 0;
	__asm__ volatile ("mrc p15, 0, %0, c9, c13, 0":"=r"(cc));
	return cc;
}

int main()
{
	uint32_t t0 = ccnt_read();
	uint32_t t1 = ccnt_read(), loop_overhead;
	printf("ccnt_read() call took %u clock cycles\n", t1-t0);

	int w=0, x, y, z;

	t0 = ccnt_read();
	for(int i=0;i<ITERATIONS;i++);
	t1 = ccnt_read();
	loop_overhead = (t1-t0) / ITERATIONS;
	printf("loop overhead is %u clock cycles\n",loop_overhead);

	x = rand();
	y = rand();
	z = rand();

	printf("%d%d%d\n",x,y,z);

	t0 = ccnt_read();
	for(int i=0;i<ITERATIONS;i++)
		w+=x+y+z+i;
	t1 = ccnt_read();

	printf("%d\n",w);

	printf("Clocks for x=y+z statement: %u\n",t1-t0);
	return 0;
}
