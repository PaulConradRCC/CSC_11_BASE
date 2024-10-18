// bare bones source file
.global main

.align 8
.section .rodata
// all constant data goes here

.align 8
.section .bss
// all uninitialized data goes here

.align 8
.section .data
// all non-constant, initialized data goes here

.align 8
.text
main: 	stp fp, lr, [sp, -16]!	// save link register and frame pointer

	// assembly program here

	mov w0, #0			// return code for your program
	ldp fp, lr, [sp], 16		// restore original link register and frame pointer
	ret				// return from main function 

