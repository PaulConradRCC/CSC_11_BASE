#include <cstdio>
using namespace std;

const int MIN = 1;
const int MAX = 65535;

int main()
{
	int value;
	int r2;		// in assembly use r2 for the sum

	do
	{
		printf("Enter an integer and I'll add all integers\n");
		printf("from 1 to your entered integer (between %d and %d) ",MIN,MAX);
		scanf("%d",&value);

		if ( value < MIN || value > MAX )
		{
			printf("Out of range, try again!!!!\n");
		}
	}
	while( value < MIN || value > MAX );

	int r1=1;	// use register r1 as counter

	int r0;
	r0=value;
	r2=0;
	while(r1 <= r0 )
	{
		r2=r2+r1;
		r1++;
	}

	printf("Sum of integers from 1 to %d is %d\n",value,r2);

	return 0;
}
