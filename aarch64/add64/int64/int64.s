.global main

.data
x:	.quad	0x0123456789abcdef

.text
main:
	ldr r0, =x
	ldr r1, [r0]
	mov r0, r0, lsl #2
	ldr r0, [r0]
	mov pc,lr
