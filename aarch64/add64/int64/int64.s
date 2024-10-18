.global main

.align 8
.data
x:	.quad	0x0123456789abcdef

.align 8
.text
adr_x:	.dword	x

main:
	ldr x0, adr_x
	ldr w2, [x0]
	mov x0, x0, lsl #2
	ldr w3, [x0]
	ret
