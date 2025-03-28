// printf demo #2 source file
.global main

.align 4
.section .rodata
// all constant data goes here
output_str:	.asciz "value is %d\n"

.align 4
.data
// all non-constant, initialized data goes here
value1:		.word 	5
x:		.word	10
y:		.word	0

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	// assembly program here
	// printf(output_str, value1);
	ldr r0, =output_str
	ldr r1, =value1
	ldr r1, [r1]
	bl printf

	// printf(output_str, x+1);
	ldr r0, =output_str
	ldr r1, =x
	ldr r1, [r1]
	add r1, #1	// r1 = r1 + #1
	bl printf

	// printf(output_str, y>0 ? 1 : 0 );
	ldr r0, =output_str
	ldr r1, =y
	ldr r1, [r1]
	cmp r1, #0
	movgt r1, #1
	movle r1, #0
	bl printf

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

