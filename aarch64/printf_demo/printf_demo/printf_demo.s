// demonstration of the use of the printf function from C

.global main

.align 8
.text
main:
	stp x29, x30, [sp, -16]!	// save x29 (frame pointer) and x30 (link register) on stack

_loop:	//adrp x0, string			// load into x0 the upper 52 address of string label
	//add x0, x0, :lo12: string	// add lower 12 bits of address for string to x0, and save in x0
	ldr x0, adr_string

	//adrp x1, iterations
	//add x1, x1, :lo12: iterations
	ldr x1, adr_iterations
	ldr x1, [x1]			// load data from address in x1, into register x1
	bl printf			// print out to the screen

	adrp x1, iterations		// load into x1 the address of iterations label
	add x1, x1, :lo12: iterations
	ldr x1, [x1]			// load data from address in x1, into register rx
	sub x1, x1, #1			// subtract 1 from register x1, and store result in register rx
	adrp x2, iterations		// load into x2 the address of iterations label
	add x2, x2, :lo12: iterations
	str x1, [x2]			// storing content of register x1 in memory at address in x2

	cmp x1, #0
	bne _loop			// branch to _loop if not equal to zero

	mov w0, #0			// return value of 0 must in r0
	ldp x29, x30, [sp], 16
	ret	// exit main function

adr_string:	.dword	string
adr_iterations:	.dword	iterations

.align 8
.section .rodata
string:		.asciz "Current value of iteration is %d\n"

.align 8
.section .data
iterations:	.word 5

