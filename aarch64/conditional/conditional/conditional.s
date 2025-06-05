.global main

.align 8
.text

main:
	mov x0, #10 	// move into x0, the integer literal 10
	cmp x0, #10 	// compare x0 and integer literal 10, does test: x0-10 == 0?
	// conditional execution from ARM32 commented out as it will not work with ARM64
	//moveq r1, #1 	// if r0 is equal to 10, then move into r1 the value 1
	//movne r1, #2 	// if r0 is not equal to 10, then move into r1, the value 2
	// code below is a way to do the commented code above in ARM64
	bne x0_ne_10
	mov x1, #1
	b end_x0_ne_10
x0_ne_10:
	mov x1, #2
end_x0_ne_10:
	mov w0, #0
	ret
