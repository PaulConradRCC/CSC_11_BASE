#include <cstdio>

extern "C" int get_integer();

int main()
{
	printf("Enter an integer please: ");
	int value = get_integer(); // get_integer is our assembly language function
	printf("You entered %d\n", value);
	return 0;
}
