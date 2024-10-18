/* -- eor.s -- */
.global main // main is our entry point to program and must be global

.align 8
.section .text
main:
	mov x0, #123	// load the value 123 into x0 register
	mov x1, #345	// load the value 345 into x1 register
	eor x2, x0, x1	// bitwise eor x0 and x1, store result in x2
	eor x3, x2, x0  // bitwise eor x2 and x0, store result in x3 (same value as x1)
	eor x4, x2, x1  // bitwise eor x2 and x1, store result in x4 (same value as x0)
	ret


