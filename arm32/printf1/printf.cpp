#include <cstdio>

int main()
{
	// compile with: g++ -fomit-frame-pointer -S printf.cpp
	printf("Hello everyone!\n");
	
	int x=1,y=3,z=5,a=42,b=35,c=21;
	printf("x=%d, y=%d, z=%d, a=%d, b=%d, c=%d\n",x,y,z,a,b,c);

	return 0;
}
