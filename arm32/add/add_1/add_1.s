// bare bones source file
.global main

.align 4
.text
main:
	// assembly program here
	mov  r0, #-3	// r0 = -3
	mov  r1, #2	// r1 = 2
	adds r2, r0, r1	// r2 = r0 + r1, set status flag if warranted

	mov r0, #0 // return code for your program (must be 8 bits)
	mov pc, lr

