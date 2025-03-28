.fpu neon

.data
x:	.word 11,12,13,14	// row 0
	.word 15,16,17,18	// row 1
r:	.word 0,0,0,0
	.word 0,0,0,0

.text
.global main
main:
	push {lr}

	ldr r0, =x
	vld1.32 {q0,q1}, [r0]	// load in row 0, stride of 1, 32 bits
	vadd.u32 q2,q0,q1	// q2 = q0 + q1
	vmul.u32 q3,q0,q1	// q3 = q0 * q1
	ldr r0, =r
	vst1.32 {q2}, [r0]
	add r0, #16
	vst1.32 {q3}, [r0]

	pop {pc}

