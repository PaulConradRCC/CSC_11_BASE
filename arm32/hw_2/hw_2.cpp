/* Homework #2
 * 
 * Add_Two_Integers
 *
 * Take the following C++ program and convert it to an Assembly Language program
 * with the techniques we have discussed in class:
 *
 * (1) put all variables, constants and literals in .data section as labels with their appropriate data types
 * (2) in the .text section, have a label for the main function
 * (3) code the appropriate assembly language instructions in the .text section
 *
*/

#include <cstdio>

int main()
{
	int number_1=0, number_2=0, sum=0;

	printf("Hello! Welcome to Add Two Integers.\n\n");

	printf("Enter an integer for first number: ");
	scanf("%d", &number_1);

	printf("Enter an integer for second number: ");
	scanf("%d", &number_2);

	sum = number_1 + number_2;

	printf("The sum of %d and %d is %d\n\n",number_1,number_2,sum);

	return 0;
}
