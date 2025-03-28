#include <cstdio>

int main()
{
	int r0=5, r1=6, r2;
	r2 = ++r0 + r1++;

	printf("r0=%d, r1=%d, r2=%d\n",r0,r1,r2);
	return r0;
}
