.global main

.text
main:
	mov r1, #2	// r1 = 2
	mov r2, #3	// r2 = 3
	add r3, r2, r1, lsl #1 // r3 = r2 + (r1 * 2)
	sub r4, r2, r1, lsl #2 // r4 = r2 - (r1 * 4)
	rsb r5, r2, r1, lsl #2 // r5 = (r1 * 4) - r2 ???

	mov r0, #0
	mov pc, lr
