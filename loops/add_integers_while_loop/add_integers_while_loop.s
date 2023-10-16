// add the integers from 1 to 10, storing result in r0.

.global main

.section .rodata
out_msg: .asciz "Sum is %d\n"

.align 4
.text
main:
	mov r0, #1	// r0 is loop counter, initialized to 1
	mov r1, #0	// r1 holds the sum
while_r0_le_10:
	cmp r0, #10	// compare r0 to #10
	bgt end_while_r0_le_10 // if r0 > 10, we're done with loop

	add r1, r1, r0	// r1 = r1 + r0
	add r0, #1	// r0++
	b while_r0_le_10 // branch back up to test r0 against 10 again
end_while_r0_le_10:

	push {lr}
	ldr r0, =out_msg
	bl printf
	pop {pc}
