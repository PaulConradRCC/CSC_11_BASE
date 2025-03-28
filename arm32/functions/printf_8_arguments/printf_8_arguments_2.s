// instead of pop {r4-r7} on line 24, we will show example of just adding the number of pushed bytes
// to the stack pointer.

.global main

.align 4
.text
main:
	// variables/registers mapping
	// a=r1, b=r2, c=r3, d=r4, e=r5, f=r6, g=r7
	push {lr}

	mov r1, #2
	mov r2, #5
	mov r3, #8
	add r4, r1, r2
	add r4, r4, r3 // d=a+b+c
	sub r5, r3, r2 // e=c-b
	sub r5, r5, r1 // e=e-a
	mul r6, r1, r2 // f=a*b
	mul r6, r3, r6 // f=f*c
	add r7, r1, r2, lsl #2 // what is in r7?
	ldr r0, =fmt_str
	push {r4-r7}
	bl printf
	add sp, #16

	pop {pc}

.align 4
.section .rodata
fmt_str: .asciz "a=%d, b=%d, c=%d, d=%d, e=%d, f=%d, g=%d\n"
