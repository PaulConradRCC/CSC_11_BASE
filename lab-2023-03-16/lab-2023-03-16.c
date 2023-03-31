#include <cstdio>
using namespace std;

int main()
{
	printf("Name:  Paul J. Conrad\n");
	printf("Course: CIS/CSC 11 - Assembly Language\n");
	printf("Meeting: Tue/Thurs 6:00PM In Person / Online\n");

	// some variables
	int value1, value2, sum;

	// prompt user for value1 and value2
	printf("Enter first integer value: ");
	scanf("%d", &value1);

	printf("Enter second integer value: ");
	scanf("%d", &value2);

	// add value1 and value2, storing result in sum
	sum = value1 + value2;

	// output the result
	printf("%d + %d = %d\n", value1, value2, sum);

	return 0;
}
