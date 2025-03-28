.global main

.text
main:
	mov r1, #2		// r1 = 2
	mov r2, #3		// r2 = 3
	add r3, r2, r1, lsl #1	// r3 = r2 + r1 * 2

	mov r0, #0
	mov pc, lr
