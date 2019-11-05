// examples of non updating indexing modes
// the registers used inside [ .... ] are not updated
.global main

.align 4
.section .data
arr:	.word	1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024

.align 4
.text
main:
	ldr r0, =arr	// r0 will hold address of array
	mov r1, #16	// used for #2 from class
	ldr r2, [r0], #4 // r2 = *(r0), then r0=r0+4, r2=1
	ldr r2, [r0], r1 // r2 = *(r0), then r0=r0+r1, r2=2
	ldr r2, [r0], r1, lsr #1 // r2 = *(r0), then r0=r0+ r1/2, r2=32
	ldr r2, [r0], #0 // r2 = 128, then r0=r0+0, still r0...
	mov pc, lr
