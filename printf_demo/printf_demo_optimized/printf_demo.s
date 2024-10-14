// demonstration of the use of the printf function from C

	.global main

main:
	push {lr}		// push lr onto stack, need it for pc at the end of program
	ldr r4, =iterations	// register r4 is pointer to iterations label

_loop:	ldr r0, =string		// load into r0 the address of string label
	ldr r1, [r4]		// load data from address in r4, into register r1
	bl printf		// print out to the screen

	ldr r1, [r4]		// load data from address in r1, into register r1
	subs r1, #1		// subtract 1 from register r1, and store result in register r1
	str r1, [r4]		// storing content of register r1 in memory at address in r2

	bne _loop		// branch to _loop if not equal to zero

	mov r0, #0		// return value of 0 must in r0
	pop {pc}		// exit main function

.data
string:		.asciz "Current value of iteration is %d\n"
iterations:	.word 5

