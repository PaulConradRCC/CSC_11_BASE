#include <cstdio>
using namespace std;

int main()
{
	int value;
	int r2;		// in assembly use r2 for the sum

	printf("Enter an integer and I'll add all integers from 1 to your entered integer: ");
	scanf("%d",&value);

	int r1=1;	// use register r1 as counter

	r2=0;
	while(r1 <= value )
	{
		r2=r2+r1;
		r1++;
	}

	printf("Sum of integers from 1 to %d is %d\n",value,r2);

	return 0;
}
