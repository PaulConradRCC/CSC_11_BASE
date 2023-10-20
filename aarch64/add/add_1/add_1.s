// bare bones source file
.global main

.align 4
.text
main:
	// assembly program here
	mov  x0, #-3	// x0 = -3
	mov  x1, #2	// x1 = 2
	adds x2, x0, x1	// x2 = x0 + x1, set status flag if warranted

	mov x0, #0 // return code for your program (must be 8 bits)
	//	mov pc, lr
	ret

