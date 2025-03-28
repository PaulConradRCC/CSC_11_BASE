.global main

.align 4
.section .rodata
output_r4_and_r5: .asciz "R4=%d, R5=%d\n"

.align 4
.text
swap_function:
	push {r0, r1}
	pop {r1}
	pop {r0}
	mov pc, lr

main:
	push {lr}

	mov r4, #10
	mov r5, #14

	ldr r0, =output_r4_and_r5
	mov r1, r4
	mov r2, r5
	bl printf

	mov r0, r4
	mov r1, r5
	bl swap_function
	mov r4, r0
	mov r5, r1

	ldr r0, =output_r4_and_r5
	mov r1, r4
	mov r2, r5
	bl printf

	mov r0, #0
	pop {pc}
