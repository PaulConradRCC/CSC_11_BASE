// Sum of Integer Assignment:
//
// Convert the sum of integers C++ program to ARM Assembly Language
// Full credit only given to submissions that match exactly with the
// output of this program.
//

#include <cstdio>

int main()
{
	int sum = 0;
	int n;

	do
	{
		printf("Enter a positive value for N: ");
		scanf("%d",&n);
		if ( n<0 ) printf("Invalid value for N, must be positive!\n");
	} while (n<0);

	int counter=1;

	while(counter<=n)
	{
		sum=sum+counter;
		counter++;
	}

	printf("The sum from 1 to %d is %d\n",n,sum);
	return 0;
}

