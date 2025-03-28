.global main

.data

x:	.word	0
y:	.word	0
sum:	.word	0

prompt_xy:	.asciz	"Enter a value for x and y (seperated by space): "

result_message:	.asciz	"Sum of %d and %d is %d\n"

input_format:	.asciz	"%d %d"

.text
main:
	push {lr}

	// prompt for x and y
	ldr r0, =prompt_xy
	bl printf

	ldr r0, =input_format
	ldr r1, =x
	ldr r2, =y
	bl scanf

	// calculate sum
	ldr r0, =x
	ldr r0, [r0]

	ldr r1, =y
	ldr r1, [r1]

	add r2, r0, r1

	ldr r0, =sum
	str r2, [r0]

	// output the results to screen
	ldr r0, =result_message
	ldr r1, =x
	ldr r1, [r1]
	ldr r2, =y
	ldr r2, [r2]
	ldr r3, =sum
	ldr r3, [r3]
	bl printf

	mov r0, #0	// return 0
	pop {pc}
