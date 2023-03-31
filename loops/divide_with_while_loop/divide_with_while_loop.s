// divide_with_while_loop source file
.global main

.align 4
.section .rodata
// all constant data goes here
output_msg_div:	.asciz	"%d / %d = %d\n"
output_msg_mod:	.asciz	"%d %% %d = %d\n"

.align 4
.section .data
// all non-constant, initialized data goes here

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	mov r4, #21	// test value of 21
	mov r5, #4	// test value of 4

	// while loop to compute: 21 / 4 = 5, 21 % 4 = 1
	// have result of the division stored in r0, and modulus in r1.

	// while loop division alg:
	mov r2, r5
	mov r1, r4
	mov r0, #0

while_r1_ge_r2:
	cmp r1, r2
	blt end_while_r1_ge_r2

	add r0, r0, #1		// r0 = r0 + 1
	sub r1, r1, r2		// r1 = r1 - r2
	b while_r1_ge_r2
end_while_r1_ge_r2:

	mov r6, r0	// r6 is a copy of r0, which is r4 / r5
	mov r7, r1	// r7 is a copy of r1, which is r4 % r5

	// output div message
	ldr r0, =output_msg_div
	mov r1, r4		// copy into r1, value in r4
	mov r2, r5		// copy into r2, value in r5
	mov r3, r6		// copy into r3, value in r6, again is r4 / r5
	bl printf		// print out the message

	// output mod message
	ldr r0, =output_msg_mod
	mov r1, r4		// copy into r1, value in r4
	mov r2, r5		// copy into r2, value in r5
	mov r3, r7		// copy into r3, value in r7, again is r4 % r5
	bl printf		// print out the message

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

