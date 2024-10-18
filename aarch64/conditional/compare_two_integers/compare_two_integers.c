#include <cstdio>

int main()
{

	int R4, R5;

	// prompt
	printf("Enter two integers, value 1 and value 2 (separate values with a space): ");
	scanf("%d %d", &R4, &R5);

	if ( R4 > R5 )
		printf("Value 1 is greater than value 2...\n");
	else
		printf("Value 1 is less than or equal to value 2...\n");

	return 0;
}
