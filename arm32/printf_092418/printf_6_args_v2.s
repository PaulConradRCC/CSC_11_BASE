// bare bones source file 
.global main

.align 4
.section .rodata
// all constant data goes here
output_msg:	.asciz	"x=%d, y=%d, z=%d, a=%d, b=%d, c=%d\n"

.align 4
.data
// all non-constant, initialized data goes here
x:	.word	1
y:	.word	2
z:	.word	4

a:	.word	12
b:	.word	22
c:	.word	32

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	// assembly program here
	ldr r0, adr_msg
	ldr r1, adr_x
	ldr r2, adr_y
	ldr r3, adr_z
	ldr r4, adr_a
	ldr r5, adr_b
	ldr r6, adr_c

	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	ldr r7, [r6]
	push {r7}
	ldr r7, [r5]
	push {r7}
	ldr r7, [r4]
	push {r7}
	bl printf
	add sp, #12
	// exiting main
	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

adr_msg:        .word   output_msg

adr_x:          .word   x
adr_y:          .word   y
adr_z:          .word   z

adr_a:		.word	a
adr_b:		.word	b
adr_c:		.word	c
