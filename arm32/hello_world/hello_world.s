// hello world source file
// assemble: g++ hello_world.s -g -o hello_world
// ( -g is optional for generating debug info )

.global main

.align 4
.section .rodata
// all constant data goes here
hello_msg:	.asciz "Hello world!\n"

.align 4
.text
main:	push {lr}

	// assembly program here
	ldr r0, =hello_msg 	// r0 = &hello_msg
	bl printf		// call printf

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}
