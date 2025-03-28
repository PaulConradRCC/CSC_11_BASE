#include <cstdio>

int main()
{
	int r1=3, r2=5, r3=8, r4;

	r4 = r1++ + ++r2 + --r3;

	printf("r1=%d, r2=%d, r3=%d, r4=%d\n",r1,r2,r3,r4);
	return 0;
}
