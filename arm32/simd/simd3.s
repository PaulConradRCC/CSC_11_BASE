.fpu neon

.data
x:	.hword 11,12,13,14,15,16,17,18	// row 0
	.hword 19,20,21,22,23,24,25,26	// row 1
r:	.hword 0,0,0,0,0,0,0,0
	.hword 0,0,0,0,0,0,0,0

.text
.global main
main:
	push {lr}

	ldr r0, =x
	vld1.16 {q0,q1}, [r0]	// load in row 0, stride of 1, 32 bits
	vadd.u16 q2,q0,q1	// q2 = q0 + q1
	vmul.u16 q3,q0,q1	// q3 = q0 * q1
	ldr r0, =r
	vst1.16 {q2,q3}, [r0]
//	add r0, #16
//	vst1.16 {q3}, [r0]

	pop {pc}

