// examples of non updating indexing modes
// the registers used inside [ .... ] are not updated
.global main

.align 4
.section .data
myst:	.word	100, 200, 300, 400, 500, 600, 700, 800
arr:	.word	1, 2, 4, 8, 16

.align 4
.text
main:
	ldr r0, =arr	// r0 will hold address of array
	mov r1, #16	// used for #2 from class
	ldr r2, [r0, #4]// r2 = *(r0 + 4), r2 should hold 2 (mode #1)
	ldr r2, [r0, r1]// r2 = *(r0 + r1), r2 should hold 16 (mode #2)
	ldr r2, [r0, r1, lsr #1]// r2 = *(r0 + r1/2), r2 should hold 4 (mode #3)

	ldr r3, [r0, #-4] // what does r3 hold?  does it hold 800?
	ldr r3, [r0, -r1] // what does r3 hold now? is it 500?
	ldr r3, [r0, -r1, lsl #1] // what is r3? is it 100?

	mov pc, lr
