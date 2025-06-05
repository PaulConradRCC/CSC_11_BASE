/* -- and.s -- */
.global main // main is our entry point to program and must be global

.align 8
.section .rodata
message:        .asciz  "%d AND %d is %d\n"


.align 8
.section .text
main:
	stp fp, lr, [sp, -16]!

	ldr x0, adr_message
	mov x1, #123	// load the value 123 into x1 register
	mov x2, #345	// load the value 345 into x2 register
	and x3, x1, x2	// bitwise and x0 and x1, store result in x3
	bl printf

	ldp fp, lr, [sp], 16

	ret

adr_message:	.dword	message
