.global main

.section .rodata

result:	.asciz	"The result of %d times 2 via logical shift left is %d\n"

.data
value:	.word	-1073741825
.text
main:
	push {lr}

	ldr r1, =value
	ldr r1, [r1]
	mov r2, r1, lsl #1
	ldr r0, =result

	bl printf

	pop {pc}
