// demonstration of the use of the printf function from C

.global main

.align 8
.text

adr_iterations:	.dword	iterations
adr_string:	.dword	string

main:
	stp x29, x30, [sp, -16]!	// push x29 and x30 onto stack
	//adrp x18, iterations		// register x18 is upper 52 bit address pointer to iterations label
	//add x18, x18, :lo12: iterations	// add lower 12 bits of iterations to x18 and store result in x18
	ldr x18, adr_iterations

_loop:	//adrp x0, string			// load into x0 the address of string label
	//add x0, x0, :lo12: string	// add lower 12 bits of string to x0 and store result in x0
	ldr x0, adr_string
	ldr x1, [x18]			// load data from address in x18, into register x1
	bl printf			// print out to the screen

	ldr x1, [x18]			// load data from address in x18, into register x1
	sub x1, x1, #1			// subtract 1 from register x1, and store result in register x1
	str x1, [x18]			// storing content of register x1 in memory at address in x18

	cmp x1, #0
	bne _loop			// branch to _loop if not equal to zero

	mov w0, #0			// return value of 0 must in r0
	ldp x29, x30, [sp], 16
	ret				// exit main function

.align 8
.section .rodata
string:		.asciz "Current value of iteration is %d\n"

.align 8
.section .data
iterations:	.word 5

