.global main

.data
out_msg: .asciz "Value was %d, now is %d\n"

.align 4
.text
main:
	push {lr}
	ldr r4, =out_msg	// use r4 to be temporary holding place for &out_msg
	ldr r5, =#-1610612737

	mov r1, r5
	mov r2, r1, ror #1
	mov r0, r4
	bl printf

	mov r1, r5
	mov r2, r1, rrx
	mov r0, r4
	bl printf

	pop {pc}

