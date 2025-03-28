// examples of post-updating indexing modes
.global main

.align 4
.section .data
myst:	.word	100, 200, 300, 400, 500, 600, 700, 800
arr:	.word	1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024

.align 4
.text
main:
	ldr r0, =arr			// r0 will hold address of array
	mov r1, #16			// used for #2 from class
	ldr r2, [r0], #4 		// r2 = *(r0), then r0=r0+4, r2=1 (mode #4)
	ldr r2, [r0], r1 		// r2 = *(r0), then r0=r0+r1, r2=2 (mode #5)
	ldr r2, [r0], r1, lsr #1 	// r2 = *(r0), then r0=r0+ r1/2, r2=32 (mode #6)
	ldr r2, [r0], #0 		// r2 = 128, then r0=r0+0, still r0...

	ldr r0, =arr
	ldr r2, [r0], #-4 		// r2 = *(r0), then r0=r0 - 4, r2=1 (mode #4)
	ldr r2, [r0], -r1 		// r2 = *(r0), then r0=r0 - r1, r2=800 (mode #5)
	ldr r2, [r0], -r1, lsr #1 	// r2 = *(r0), then r0=r0 - r1/2, r2=500 (mode #6)
	ldr r2, [r0], #-0 		// r2 = 200, then r0=r0+0, still r0...

	mov pc, lr
