.fpu neon

.data
x:	.word 11,12,13,14	// row 0
	.word 15,16,17,18	// row 1
	.word 19,20,21,22	// row 2
	.word 23,24,25,26	// row 3

.text
.global main
main:
	push {lr}

	ldr r0, =x
	vld1.32 {q0}, [r0]	// load in row 0, stride of 1, 32 bits
	add r0, #16		// add 16 bytes to r0 for address of next row
	vld2.32 {q1}, [r0] 	// load in row 1, stride of 2, 32 bits
	add r0, #16		// add 16 bytes to r0 for address of next row
	vld4.32 {q2,q3}, [r0]	// load in row 2, stride of 1, 32 bits
	ldr r0, =x
	vld2.16 {q4,q5}, [r0]	// load in row 0, stride of 2, 16 bits

	pop {pc}

