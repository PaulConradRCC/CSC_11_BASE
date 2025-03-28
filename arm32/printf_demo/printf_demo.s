// demonstration of the use of the printf function from C

	.global main

main:
	push {lr}		// push lr onto stack, need it for pc at the end of program

_loop:	ldr r0, =string		// load into r0 the address of string label
	ldr r1, =iterations	// load into r1 the address of iterations label
	ldr r1, [r1]		// load data from address in r1, into register r1
	bl printf		// print out to the screen

	ldr r1, =iterations	// load into r1 the address of iterations label
	ldr r1, [r1]		// load data from address in r1, into register r1
	subs r1, #1		// subtract 1 from register r1, and store result in register r1
	ldr r2, =iterations	// load into r2 the address of iterations label
	str r1, [r2]		// storing content of register r1 in memory at address in r2

	bne _loop		// branch to _loop if not equal to zero

	mov r0, #0		// return value of 0 must in r0
	pop {pc}		// exit main function

.data
string:		.asciz "Current value of iteration is %d\n"
iterations:	.word 5

