#include <cstdio>
int main() {
    //Declaration of variables, working registers
    unsigned int R0; //Result of R5%R4 start with Numerator
    unsigned int R1; //Result of R5/R4 start with 0
    unsigned int R2; //Increment value start with 1
    unsigned int R3; //Decrement value start with Denominator
    //Declaration of variables holding inputs
    unsigned int R4=0; //Denominator
    unsigned int R5=0; //Numerator
    
    int a, b;
    
    printf("Enter a value for a: ");
    scanf("%d",&a);
    printf("Enter a value for b: ");
    scanf("%d",&b);
    
    R5=a; R4=b;
    
	//Initialize the working registers with the data
    R0=R5;R1=0;R2=1;R3=R4;
        
    //Shift the denominator left until greater than numerator, then shift back
    do{
        R3<<=1; //Denominator shift left
        R2<<=1; //Division shift left
    }while(R0>R3); //Shift Left until Decrement/Division Greater than Numerator
    R3>>=1; //Shift Denominator right
    R2>>=1; //Shift Division right
    //Loop and keep subtracting off the shifted Denominator
    while(R0>=R3){ //Keep Looping until the division is complete
        R1+=R2; //Increment division by the increment
        R0-=R3; //Subtract shifted Denominator with remainder of Numerator
        //Shift right until denominator is less than numerator
        while(R2>1)
	{
	    while(R3>R0){ //Shift Denominator until less than Numerator
                R2>>=1; //Shift Increment left
                R3>>=1; //Shift Denominator left
            }
	}
    }
    //Output the results
    printf("%d / %d = %d\n",R5,R4,R1);
    printf("%d %% %d = %d\n",R5,R4,R0);

    // return code of 0
    return 0;
}
