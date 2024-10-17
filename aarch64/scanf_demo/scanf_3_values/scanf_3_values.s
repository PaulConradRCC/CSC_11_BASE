.align 8
.section .rodata
/* Prompt message */
prompt: .asciz "Hi there! Please type in three integer values (seperated by a space): "

/* Response message */
response: .asciz "I read the numbers %d, %d and %d from the keyboard\n"

/* Format pattern for scanf */
pattern: .asciz "%d %d %d"

.align 8
.section .data
/* Where scanf will store the number read */
value_read1: .word 0
value_read2: .word 0
value_read3: .word 0

.align 8
.text
.global main

adr_prompt:	.dword	prompt
adr_response:	.dword	response
adr_pattern:	.dword	pattern
adr_value_read1:.dword	value_read1
adr_value_read2:.dword	value_read2
adr_value_read3:.dword	value_read3

main:
	stp x29, x30, [sp, -16]!	/* save our frame pointer and return address */

	// r4 hold address of value_read1, r5 holds address of value_read2, r6 holds address of value_read3
	ldr x18, adr_value_read1
	ldr x19, adr_value_read2
	ldr x20, adr_value_read3

    	ldr x0, adr_prompt		/* r0 contains pointer to prompt message */
    	bl printf		/* call printf to output our prompt */

    	ldr x0, adr_pattern 	/* r0 contains pointer to format string for our scan pattern */
    	mov x1, x18  		/* r1 contains pointer to variable label where our first number is stored */
	mov x2, x19		/* r2 contains pointer to variable label where our second number is stored */
	mov x3, x20
    	bl scanf              	/* call to scanf */
next:
	ldr x0, adr_response	/* r0 contains pointer to response message */
	ldr x1, [x18]		/* r1 contains value dereferenced from r4 */
	ldr x2, [x19]
	ldr x3, [x20]
	bl printf		/* call printf to output our response */

	mov w0, #0		/* exit code 0 = program terminated normally */
	ldp x29, x30, [sp], 16
	ret			/* exit our main function */

