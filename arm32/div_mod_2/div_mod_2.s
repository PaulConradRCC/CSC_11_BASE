// div_mod_2.cpp hand translated to ARM assembly language
.data
a: .word 0
b: .word 0

prompt_a: .asciz "Enter a value for a: "
prompt_b: .asciz "Enter a value for b: "

scan_pattern: .asciz "%d"

output_1: .asciz "%d / %d = %d\n"
output_2: .asciz "%d %% %d = %d\n"

//#include <cstdio>
//int main() 
.text
.global main
main:
	push {lr} //{
        //Declaration of variables, working registers
        //R0 contains result of R5%R4 start with Numerator
        //R1 contains result of R5/R4 start with 0
        //R2 contains increment value start with 1
        //R3 contains decrement value start with Denominator
        //Declaration of variables holding inputs
        //Denominator in R4
        //Numerator in R5

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

        //R5=a; R4=b;
	ldr r5, =a
	ldr r5, [r5]
	ldr r4, =b
	ldr r4, [r4]
    
	//Initialize the working registers with the data
        //R0=R5;R1=0;R2=1;R3=R4;
	mov r0, r5
	mov r1, #0
	mov r2, #1
	mov r3, r4
        
        //Shift the denominator left until greater than numerator, then shift back
DO_WHL1: //do{
        	//R3<<=1; //Denominator shift left
		lsl r3, #1
        	//R2<<=1; //Division shift left
		lsl r2, #1
        	//}while(R0>R3); //Shift Left until Decrement/Division Greater than Numerator
		cmp r0,r3
		bgt DO_WHL1 // if r0 greater than r3, goto DO_WHL1
        //R3>>=1; //Shift Denominator right
	lsr r3, #1
        //R2>>=1; //Shift Division right
	lsr r2, #1
        //Loop and keep subtracting off the shifted Denominator
WHL_R0GTER3: //while(R0>=R3){ //Keep Looping until the division is complete
		cmp r0, r3
		ble WHL_R0GTER3_DONE // if R0 < R3, we are done
        	//    R1+=R2; //Increment division by the increment
		adds r1,r2 // r1 = r1 + r2
        	//    R0-=R3; //Subtract shifted Denominator with remainder of Numerator
		subs r0,r3 // r0 = r0 - r3
        	//    //Shift right until denominator is less than numerator
        	//    while(R2>1&&R3>R0){ //Shift Denominator until less than Numerator
WHL_R2GT1_AND_R3GTR0:
		cmp r2, #1
		ble WHL_R2GT1_AND_R3GTR0_DONE
		cmp r3, r0 // compare r3 and r0
		ble WHL_R2GT1_AND_R3GTR0_DONE // if less than or equal, jump out of inner loop
        		//        R2>>=1; //Shift Increment left
			lsr r2, #1
        		//        R3>>=1; //Shift Denominator left
			lsr r3, #1
			bal WHL_R2GT1_AND_R3GTR0
WHL_R2GT1_AND_R3GTR0_DONE:        //    }
		bal WHL_R0GTER3
WHL_R0GTER3_DONE:        //}
        //Output the results
	push {r0,r1,r2,r3,r4,r5} // push all of the computed values on stack frame for easier access with
	// following printf calls
	//printf("%d / %d = %d\n",R5,R4,R1);
	ldr r0, =output_1
	ldr r1, [sp,#20]
	ldr r2, [sp,#16]
	ldr r3, [sp,#4]
	bl printf

	//printf("%d %% %d = %d\n",R5,R4,R0);
	ldr r0, =output_2
	ldr r1, [sp,#20]
	ldr r2, [sp,#16]
	ldr r3, [sp]
	bl printf
	add sp,#24

        // return code of 0
        //return 0;
	mov r0, #0
	pop {pc} //}
