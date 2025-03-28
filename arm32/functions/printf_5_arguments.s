.global main

.align 4
.text
main:
	push {lr}

	mov r1, #2
	mov r2, #5
	mov r3, #8
	add r4, r1, r2
	add r4, r4, r3
	ldr r0, =fmt_str
	push {r4}
	bl printf
	pop {r4}	// can be any register, or add sp, #4

	pop {pc}

.align 4
.section .rodata
fmt_str: .asciz "a=%d, b=%d, c=%d, d=%d\n"
