// div_mod_1.cpp hand translated to ARM assembly language

//#include <cstdio>
.data
// int a, b;
a: .word 0
b: .word 0

prompt_a: .asciz "Enter a value for a: "
prompt_b: .asciz "Enter a value for b: "

output_1: .asciz "%d / %d = %d\n"
output_2: .asciz "%d %% %d = %d\n"

scan_pattern: .asciz "%d"

.text
.global main
//int main()
main:
	push {lr} // {

        //printf("Enter a value for a: ");
	ldr r0, =prompt_a
	bl printf

        //scanf("%d",&a);
	ldr r0, =scan_pattern
	ldr r1, =a
	bl scanf

        //printf("Enter a value for b: ");
	ldr r0, =prompt_b
	bl printf

        //scanf("%d",&b);
	ldr r0, =scan_pattern
	ldr r1, =b
	bl scanf

        //R3=a;
	ldr r3, =a
	ldr r3, [r3]
        //R2=b;
	ldr r2, =b
	ldr r2, [r2]

	//Loop with subtracting the denominator
        mov r0, r3 //R0=R3; //Place the Numerator in R0

WHL_R0GTER2: //  while(R0>=R2){ //Loop until the division is over
	cmp r0, r2 // compare r0 and r2
	blt WHL_R0GTER2_DONE // branch if r0 < r2 to WHL_R0GTER2_DONE
	//R1++; //Increment the Division Counter
	adds r1,#1 // r1=r1+1

	//R0-=R2; //Subtract the Denominator from the Numerator
	subs r0, r2 // r0=r0-r2
	bal WHL_R0GTER2
WHL_R0GTER2_DONE:        //}

        //Output the results
        //printf("%d / %d = %d\n",R3,R2,R1);
	push {r0,r1,r2,r3} // have to save our registers from loop above since printf uses R0 for
	// pointer to format string and could change the values of R1-R3....
	// We will be accessing them via stack pointer, eg: R0 value is at [sp, #12]; R1 value at [sp, #8], etc.
	ldr r0, =output_1
	ldr r1, [sp,#12]
	ldr r2, [sp,#8]
	ldr r3, [sp,#4]
	bl printf

        //printf("%d %% %d = %d\n",R3,R2,R0);
	ldr r0, =output_2
	ldr r1, [sp,#12]
	ldr r2, [sp,#8]
	ldr r3, [sp]
	bl printf
	// readjust stack pointer after we are done
	add sp,#16 // same as popping the four values off the stack that we pushed on earlier

        // return value of 0
        mov r0, #0 //return 0;
	pop {pc} // }
