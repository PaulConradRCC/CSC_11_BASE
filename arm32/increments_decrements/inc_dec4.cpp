#include <cstdio>

int main()
{
	int r1=5, r2=6, r3;
	r3 = r1++ + r2++;

	printf("r1=%d, r2=%d, r3=%d\n",r1,r2,r3);
	return 0;
}
