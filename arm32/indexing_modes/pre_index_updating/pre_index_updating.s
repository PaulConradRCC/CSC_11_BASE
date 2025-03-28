// examples of pre-updating indexing modes
.global main

.align 4
.section .data
myst:	.word	100, 200, 300, 400, 500, 600, 700, 800
arr:	.word	1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024

.align 4
.text
main:
	ldr r0, =arr	// r0 will hold address of array
	mov r1, #16	// used for #2 from class

	ldr r2, [r0, #4]! // r0=r0+4, then r2 = *(r0), r2=2 (mode #7)
	ldr r2, [r0, r1]! // r0=r0+r1, then r2 = *(r0), r2=32 (mode #8)
	ldr r2, [r0, r1, lsr #1]! // r0=r0+r1/8, r2 = *(r0 + r1/2), r2=128 (mode #9)

	ldr r0, =arr
	ldr r2, [r0, #-4]! // r0=r0-4, then r2 = *(r0), r2=800 (mode #7)
	ldr r2, [r0, -r1]! // r0=r0-r1, then r2 = *(r0), r2=400 (mode #8)
	ldr r2, [r0, -r1, lsr #1]! // r0=r0-r1/2, r2 = *(r0 + r1/2), r2=200 (mode #9)

	mov pc, lr
