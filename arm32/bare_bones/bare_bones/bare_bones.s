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

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	// assembly program here

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

