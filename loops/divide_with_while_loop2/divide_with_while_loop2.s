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

	// check to see if r4 is negative
	mov r6, #0		// r6 = 0 => r6 is false, sign for r4 (0=positive, -1=negative)
	mov r7, #0		// r7 = 0 => r7 is false, sign for r5 (0=positive, -1=negative)
	mov r8, #0		// r8 used for dividend and divisor states
				// dividend    divisor   r8 state    r5 value     r4 value	r0 = r4 / r5     r1 = r4 % r5
				// ------------------------------------------------------------------------------------------
				//  positive   positive  state 0    +divisor     +dividend      no sign changes needed
				//  positive   negative  state 1    -divisor     +dividend	r0 = -r0         r1 = r1 - r5
				//  negative   positive  state 2    +divisor     -dividend      r0 = -r0         r1 = r5 - r1
			        //  negative   negative  state 3    -divisor     -divisor       no change        r1 = -r1
	cmp r5, #0		// r5 < 0?
	movlt r6, #-1		// r6 = -1 => r6 is true, we have a negative value
	cmp r4, #0
	movlt r7, #-1

	// set state of r8 reg based on above table
	cmp r6, #0
	bne r6_negative
	cmp r7, #0
	bne r6_positive_r7_negative
	// next line only executes when r6==0 AND r7==0
	mov r8, #0		// r8 = do no changes state
	b end_state_set
r6_positive_r7_negative:
	// next line only executes when r6==0 AND r7==-1
	mov r8, #2		// r8 = state 2 (negative / positive)
	b end_state_set
r6_negative:
	cmp r7, #0
	bne r6_negative_r7_negative
	// next line only executes when r6==-1 AND r7==0
	mov r8, #1		// r8 = state 1 (positive / negative)
	b end_state_set
r6_negative_r7_negative:
	// next line only executes when r6==-1 AND r7==-1
	mov r8, #3		// r8 = state 3 (negative / negative)
end_state_set:

	// set r4 and r5 as needed based on r8 state
	cmp r8, #1
	muleq r5, r6, r5	// r5 = r6 * r5, r6 should be -1, simply flip r5's sign to positive for now

	cmp r8, #2
	muleq r4, r7, r4	// r4 = r7 * r4, r7 should be -1, simply flip r4's sign to positive for now

	cmp r8, #3		// this is essentially state 1 and state 2 for (negative / negative)
	muleq r4, r6, r4	// see for state 1
	muleq r5, r7, r5	// see for state 2

	// when we reach this point, r4 and r5 should be positive values and r8 should be set to the appropriate state
	// for the signs of the dividend and divisor, so carry out the division algorithm via successive subtraction
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

	// adjust r0 and r1 based on the state of r8 (see the table about the state of r8 above for reference
	// set r4 and r5 back to their orginal signs as needed based on r8 state
	cmp r8, #1
	muleq r0, r6, r0	// r0 = r6 * r0, r6 should be -1
	subeq r1, r1, r5	// r1 = r1 - r5
	muleq r5, r6, r5	// r5 = r6 * r5, r6 should be -1, simply flip r5's sign back to negative

	cmp r8, #2
	muleq r0, r7, r0	// r0 = r7 * r0, r7 should be -1
	subeq r1, r5, r1	// r1 = r5 - r1
	muleq r4, r7, r4	// r4 = r7 * r4, r7 should be -1, simply flip r4's sign back to negative

	cmp r8, #3		// this is essentially state 1 and state 2 for (negative / negative)
	muleq r1, r6, r1	// r1 = r6 * r1, r6 should be negative (note: could've used r7 as it should be negative as well)
	muleq r4, r6, r4	// see for state 1
	muleq r5, r7, r5	// see for state 2

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

