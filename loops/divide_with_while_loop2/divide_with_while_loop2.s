// divide_with_while_loop2 source file
.global main

.align 4
.section .rodata
// all constant data goes here
prompt_values:	.asciz	"Enter two integer values and I'll compute the quotient and modulus: "
scan_str:	.asciz	"%d %d"
output_msg_div:	.asciz	"%d / %d = %d\n"
output_msg_mod:	.asciz	"%d %% %d = %d\n"

.align 4
.section .data
// all non-constant, initialized data goes here
value1:		.word 	0
value2:		.word	0

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	ldr r4, =value1
	ldr r5, =value2

	// output our prompt
	ldr r0, =prompt_values
	bl printf

	// read in the values
	ldr r0, =scan_str
	mov r1, r4		// r1 has copy of address in r4 (address of value1)
	mov r2, r5		// r2 has copy of address in r5 (address of value2)
	bl scanf		// read in the two values

	ldr r4, [r4]		// r4 = *(r4);
	ldr r5, [r5]		// r5 = *(r5);

	// while loop to compute: R4 / R5, and R4 % R5
	// have result of the division stored in r0, and modulus in r1.

	// while loop division alg:
	mov r2, r5
	mov r1, r4
	mov r0, #0

	// check to see if r4 is negative
	mov r6, #0		// r6 = 0 => r6 is false, number hasn't been checked yet
	cmp r4, #0		// r4 < 0?
	movlt r6, #-1		// r6 = -1 => r6 is true, we have a negative value
	mullt r4, r6, r4	// r4 = r6 * r4

while_r1_ge_r2:
	cmp r1, r2
	blt end_while_r1_ge_r2

	add r0, r0, #1		// r0 = r0 + 1
	sub r1, r1, r2		// r1 = r1 - r2
	b while_r1_ge_r2
end_while_r1_ge_r2:

	cmp r6, #-1		// r6 == -1?
	muleq r4, r6, r4	// r4 = r6 * r4
	muleq r0, r6, r0	// r0 = r6 * r0

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

