#include <cstdio>

int main() 
{
	//Declaration of variables a/b vs a%b
	//Note: we can use unsigned intergers with variable names as the same names
	//as the ARM registers to help us translate this C/C++ code to assembly!
        unsigned int R0; //Holds the result of R3%R2
        unsigned int R1=0; //Holds the result of R3/R2
        unsigned int R2=0; //Denominator (b)
        unsigned int R3=0; //Numerator (a)

        int a, b;

        printf("Enter a value for a: ");
        scanf("%d",&a);
        printf("Enter a value for b: ");
        scanf("%d",&b);

        R3=a;
        R2=b;

	//Loop with subtracting the denominator
        R0=R3; //Place the Numerator in R0
        while(R0>=R2){ //Loop until the division is over
            R1++; //Increment the Division Counter
            R0-=R2; //Subtract the Denominator from the Numerator
        }

        //Output the results
        printf("%d / %d = %d\n",R3,R2,R1);
        printf("%d %% %d = %d\n",R3,R2,R0);

        // return value of 0
        return 0;
}
