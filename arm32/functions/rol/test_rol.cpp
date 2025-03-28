#include <cstdio>

extern "C" int rol(int x, int b);

int main()
{
	int x, b;

	printf("Enter x as hex, and b as decimal: ");
	scanf("%x %d",&x,&b);

	int result = rol(x,b);

	printf("0x%08x rotated left %d bits is 0x%08x\n",x,b,result);
	return 0;
}
