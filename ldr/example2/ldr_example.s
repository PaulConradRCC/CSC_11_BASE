// to assemble: g++ ldr_example.s -g -o ldr_example

.global main

.align 4
.section .data
// data that is read/write go here, no constants

my_value1:	.word	1
my_value2:	.word	2
my_value3:	.word	4

// code section
.align 4
.text
main:	push {lr}		// save current value of lr onto stack

	ldr r4, =my_value1	// r4 = &my_value1;
	ldr r5, =my_value2	// r5 = &my_value2
	ldr r6, =my_value3	// r6 = &my_value3

	ldr r0, [r4]		// r0 = *r4;
	ldr r1, [r5]		// r1 = *r5;
	ldr r2, [r6]		// r2 = *r6;

	pop {pc}		// retrieve original lr value off stack and store in pc
