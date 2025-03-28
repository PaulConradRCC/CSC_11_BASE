//#include <cstdio>
.data
//int a, b;
a: .word 0
b: .word 0

prompt_a: .asciz "Enter a value for a: "
prompt_b: .asciz "Enter a value for b: "

output_1: .asciz "%d / %d = %d\n"
output_2: .asciz "%d %% %d = %d\n"

scan_pattern: .asciz "%d"

.global main
.text
main:
//int main()
    push {lr} // {
    //Declaration of variables, working registers
    //unsigned int R0; //Result of R5%R4 start with Numerator
    //unsigned int R1; //Result of R5/R4 start with 0
    //unsigned int R2; //Increment value start with 1
    //unsigned int R3; //Decrement value start with Denominator
    //Declaration of variables holding inputs
    //unsigned int R4=0; //Denominator
    //unsigned int R5=0; //Numerator

    // printf("Enter a value for a: ");
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
_shift_left:
        //R3<<=1; //Denominator shift left
	mov r3, r3, asl #1
        //R2<<=1; //Division shift left
	mov r2, r2, asl #1
    //if(R0>R3)goto _shift_left;//Shift Left until Decrement/Division Greater than Numerator
    cmp r0, r3 // compare r0 to r3
    bgt _shift_left // branch if greater than to _shift_left label
    //R3>>=1; //Shift Denominator right
    mov r3, r3, asr #1
    //R2>>=1; //Shift Division right
    mov r2, r2, asr #1
    //Loop and keep subtracting off the shifted Denominator
_subtract:
    //if(R0<R3)goto _output;
    cmp r0, r3 // compare r0 to r3
    blt _output // branch if less than to _output
        //R1+=R2; //Increment division by the increment
	adds r1, r2
        //R0-=R3; //Subtract shifted Denominator with remainder of Numerator
	subs r0, r3
        //Shift right until denominator is less than numerator
        _shift_right:
        //if(R2==1) goto _subtract;
	cmp r2, #1 // compare r2 to #1
	beq _subtract // branch if equal to _subtract
        //if(R3<=R0)goto _subtract;
	cmp r3, r0 // compare r3 to r0
	ble _subtract // branch if less than or equal to _subtract
            //R2>>=1; //Shift Increment left
	    mov r2, r2, asr #1
            //R3>>=1; //Shift Denominator left
	    mov r3, r3, asr #1
        //goto _shift_right; //Shift Denominator until less than Numerator
	bal _shift_right
    //goto _subtract; //Keep Looping until the division is complete
    bal _subtract
    //Output the results
    _output:
    // going to save all of the contents of r0-r5 on the stack and
    // access their values off the stack frame for easy pickin's
    // remember that when done with the stack frame, add (# of words pushed)*4
    // back to the stack pointer so the stack is in the state it was before this push
    push {r0-r5}
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

    // clean up the stack when done with temporary values for r0-r5 that were
    // pushed on the stack
    add sp, #24

    // return value of 0
    //return 0;
    mov r0, #0
    pop {pc}//}
