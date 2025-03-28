// demonstrate add and adds
.global main
.text
main:
	mov r0, #5	// r0 = 5
	mov r1, #-10	// r1 = -10?

	add r2, r0, r1	// r2 = r0 + r1, no CPSR update?

	adds r2, r0, r15// r2 = r0 + r1, CPSR update?

	mov pc, lr	// pc = lr (this points pc back to lr)
