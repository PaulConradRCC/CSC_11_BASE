// bare bones source file 
.global main

.align 4
.section .rodata
// all constant data goes here
output_msg:	.asciz	"x=%d, y=%d, z=%d\n"

.align 4
.section .bss
// all uninitialized data goes here

.align 4
.data
// all non-constant, initialized data goes here
x:	.word	1
y:	.word	2
z:	.word	4

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	// assembly program here
	ldr r0, =output_msg
	ldr r1, =x
	ldr r2, =y
	ldr r3, =z
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	bl printf
	// exiting main
	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

