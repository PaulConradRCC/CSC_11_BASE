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

	ldr r0, [ =my_value1 ]	// r0 = *(&my_value1);

	ldr r1, [ =my_value2 ]	// r1 = *(&my_value2);

	ldr r2, [ =my_value3 ]	// r2 = *(&my_value3);

	pop {pc}		// retrieve original lr value off stack and store in pc
