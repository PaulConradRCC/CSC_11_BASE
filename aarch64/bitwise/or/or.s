/* -- or.s -- */
.global main // main is our entry point to program and must be global

.align 8
.section .text
main:
	mov x0, #123	// load the value 123 into x0 register
	mov x1, #345	// load the value 345 into x1 register
	orr x2, x0, x1	// bitwise or x0 and x1, store result in x2
	ret


