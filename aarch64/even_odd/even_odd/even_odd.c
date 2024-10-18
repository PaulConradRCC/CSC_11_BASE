#include <cstdio>

int main()
{
	int number;

	printf("Enter a 32 bit signed integer: ");
	scanf("%d", &number);

	printf("DEBUG: number=%d, %d & 1 = %d\n",number,number,number & 1);

	if ( (number & 1) == 0 )
		printf("%d is even!\n",number);
	else
		printf("%d is odd!\n",number);

	return 0;
}
