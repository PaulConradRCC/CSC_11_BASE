// add the integers from 1 to 10, storing result in r0.

.global main

.align 4
.section .rodata
prompt: .asciz "Enter an integer between 1 and 92681: "
scan_s: .asciz "%u"
err_mg: .asciz "ERROR - Value not in range of 1 to 92681...\n"

out_msg: .asciz "Sum of integers from 1 to %u is %u\n"

.align 4
.section .data
value:  .word 0

.align 4
.text
main:
	push {lr}

/// insert input_check data input/validation code here, with appropriate modifications

while_true:
	ldr r0, =prompt
	bl printf

	ldr r0, =scan_s
	ldr r1, =value
	bl scanf
	ldr r0, =value
	ldr r0, [r0]

	cmp r0, #1
	blt err_out
	ldr r1, =#92681
	cmp r0, r1
	ble end_while_loop
err_out:
	ldr r0, =err_mg
	bl printf
	b while_true
end_while_loop:

/// code below will sum all integers from 1 to the user input; then output to screen.

	mov r0, #1	// r0 is loop counter, initialized to 1
	ldr r1, =value	// r1 holds address of value
	ldr r1, [r1]	// r1 now holds data stored in value
	mov r2, #0	// r2 holds the sum from 1 to value
do_r0_le_r1:
	add r2, r2, r0	// r2 = r2 + r0
	add r0, #1	// r0++  or r0 = r0 + 1 -> add r0, r0, r1

	cmp r0, r1	// compare r0 to r1
	ble do_r0_le_r1 // if r0 <= r1, we continue with loop

	ldr r0, =out_msg
	bl printf

	pop {pc}
