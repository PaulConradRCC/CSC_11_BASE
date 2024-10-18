// bare bones source file
.global main

.align 4
.section .rodata
// all constant data goes here

.align 4
.section .bss
// all uninitialized data goes here

.align 4
.data
// all non-constant, initialized data goes here
x:	.word	10

.align 4
.text
main:	ldr r0, =x
	ldr r0, [r0]

	// assembly program here

	mov r0, #0 // return code for your program (must be 8 bits)
	mov pc, lr // one of the few times it's safe to write to PC

