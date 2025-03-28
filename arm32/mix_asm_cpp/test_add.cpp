#include <cstdio>

/* our assembly function - this is not defined here, it is defined in add.s
 * we have to declare the function here in order to call it though! */
extern "C" int add_asm(int a, int b);
extern "C" int add_asm2(int a, int b, int c);
extern "C" int add_arr(int *a, int sz);

/* the main function */
int main( ) {

	int aa[15] = { 1,3,5,7,9,11,2,4,6,8,10,12,13,14,15 };

	/* call assembly function */
	int result = add_asm(5, 7);
	int result2 = add_asm2(2,3,4);
	int result3 = add_arr(aa,15);

	printf("The sum of 5 and 7 is %d\n",result);
	printf("The sum of 2, 3, and 4 is %d\n",result2);
	printf("The sum of the array aa is %d\n",result3);

	return 0;
}
