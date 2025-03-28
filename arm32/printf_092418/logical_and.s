.global main

.align 4
.section .rodata
// all constant data goes here
scanf_str:	.asciz	"%d %d"

prompt_msg:	.asciz	"Enter a value for x and y (and I'll AND them): "
output_msg:	.asciz	"%d AND %d is %d\n"

.align 4
.data
// all non-constant, initialized data goes here
x:	.word	0
y:	.word	0

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	// assembly program here
	ldr r0, =prompt_msg
	bl printf

	// get x and y from keyboard
	ldr r0, =scanf_str
	ldr r1, =x
	ldr r2, =y
	bl scanf

	// demonstrate logical AND
	ldr r1, =x
	ldr r2, =y
	ldr r1, [r1]
	ldr r2, [r2]

	and r3, r1, r2

	// output the result
	ldr r0, =output_msg
	bl printf

	// exiting main
	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

