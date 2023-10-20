// hello world source file
// assemble: g++ hello_world.s -g -o hello_world
// ( -g is optional for generating debug info )

.global main

.align 8
.section .rodata
// all constant data goes here
hello_msg:	.asciz "Hello world!\n"

.align 8
.text
main:	// assembly program here
	stp x29, x30, [sp, -16]!	// save link register x30

	adrp x0, hello_msg 		// x0 = &hello_msg
	add x0, x0, :lo12: hello_msg	// x0 = x0 + (lo12) hello_msg
	bl printf		// call printf

	ldp x29, x30, [sp], 16
	mov w0, #0 // return code for your program (must be 8 bits)

	ret
