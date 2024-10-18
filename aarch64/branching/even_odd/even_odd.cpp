#include <cstdio>
int main()
{
	int value;
	char* prompt = "Enter an integer value: ";
	char* scan_str = "%d";
	char* msg1 = "%d is an even number!\n";
	char* msg2 = "%d is an odd number!\n";

	// prompt for an integer value
	printf(prompt);

	// read in from the keyboard the integer value
	scanf(scan_str, &value);

	// do a logical AND 1 against value, if 0, value is even, else value is odd 
	if ( (value & 1)==0 )
	{
		printf(msg1, value);
	}
	else
	{
		printf(msg2, value);
	} // end if/else block

	return 0;
}
