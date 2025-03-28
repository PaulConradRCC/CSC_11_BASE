// Sum of Integer Assignment:
//
// Convert the sum of integers C++ program to ARM Assembly Language
//

#include <cstdio>

// (This version is same as sum_of_integers.cpp except all string literals are
// moved outside the main function and transformed into const char * ....)

const char *prompt  = "Enter a positive value for N: ";
const char *scan_pt = "%d";
const char *err_msg = "Invalid value for N, must be positive!\n";
const char *output  = "The sum of integers  from 1 to %d is %d\n";
const char *output2 = "The sum of squares of integers from 1 to %d is %d\n";

int main()
{
	int sum = 0;
	int sum_squares = 0;
	int n;

	do
	{
		printf( prompt );
		scanf( scan_pt, &n);
		if ( n<0 ) printf( err_msg );
	} while (n<0);

	int counter=1;

	while(counter<=n)
	{
		sum=sum+counter;
		sum_squares=sum_squares+(counter*counter);

		counter++;
	}

	printf( output, n, sum);
	printf( output2, n, sum_squares );

	return 0;
}

