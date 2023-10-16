// add the integers from 1 to 10, storing result in r0.

.global main

.section .rodata
out_msg: .asciz "Sum is %d\n"

.align 4
.text
main:
	mov r0, #1	// r0 is loop counter, initialized to 1
	mov r1, #0	// r1 holds the sum
do_r0_le_10:
	add r1, r1, r0	// r1 = r1 + r0
	add r0, #1	// r0++

	cmp r0, #10	// compare r0 to #10
	ble do_r0_le_10 // if r0 <= 10, we continue with loop

	push {lr}
	ldr r0, =out_msg
	bl printf
	pop {pc}
