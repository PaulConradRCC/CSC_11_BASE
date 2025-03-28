.global main	// allow linker to find main

.data	// data section

format_str:	.asciz	"x=%d, y=%d!\n"
x:		.word 	1231
y:		.word	5432

.text	// text section is where machine code goes
main:
	push {lr}	// save the lr register in case it gets modified

	// demo to display formatted string to screen via printf
	ldr r0, =format_str	// r0 holds address to format_str
	ldr r1, =x		// r1 holds address of x
	ldr r1, [r1]		// r1 holds value stored at r1 (dereferenced)
	ldr r2, =y		// r2 holds address of y
	ldr r2, [r2]		// r2 holds value stored at r2 (dereferenced)
	bl printf		// call printf

	// return a return value of 0
	mov r0, #0
	pop {pc}		// pc should hold original value of lr
