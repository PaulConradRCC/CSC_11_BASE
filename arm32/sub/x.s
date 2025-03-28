.global main

.data

x: .word 5

.text
main:
	mov r0, r0
	adr r0, x

	mov pc, lr

x_ptr: .word x
