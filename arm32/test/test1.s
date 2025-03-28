.global main
.text
main:
	mov r0, #0
	ldr r1, =inp
	mov r2, #4
	mov r7, #3
	swi 0

	mov pc, lr

.data
inp:	.asciz "%d"
