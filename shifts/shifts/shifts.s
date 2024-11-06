.global main

.align 4
.section .rodata
out_msg: .asciz "Value was %X, now is %X\n"

.align 4
.text
main:
	push {lr}
	ldr r4, =out_msg	// use r4 to be temporary holding place for &out_msg
	ldr r5, =#0xD2345678	// 0xD2345678 = -768321928 decimal

	mov r1, r5
	mov r2, r1, lsl #1	// logical shift left 1 bit
	mov r0, r4
	bl printf

	mov r1, r5
	mov r2, r1, lsr #1	// logical shift right 1 bit
	mov r0, r4
	bl printf

	mov r1, r5
	mov r2, r1, asl #1	// "arithmetic" shift left 1 bit
	mov r0, r4
	bl printf

	mov r1, r5
	mov r2, r1, asr #1	// arithmetic shift right 1 bit
	mov r0, r4
	bl printf

	mov r1, r5
	lsl r2, r1, #2		// r2 = r1 << 2
	mov r0, r4
	bl printf

	mov r0, #47
	add r2, r0, r0, lsl #4	// r2 = r0 + r0 * 16 -> r2 = r0 * 17

	pop {pc}

