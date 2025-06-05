.align 8
.section .rodata
/* Prompt message */
prompt: .asciz "Please type in two integer values (seperated by a space): "

/* Response message */
response: .asciz "I read the numbers %d and %d from the keyboard\n"

/* Format pattern for scanf */
pattern: .asciz "%d %d"

.align 8
.section .data
/* Where scanf will store the number read */
value_read1: .word 0
value_read2: .word 0

.align 8
.section .text
.global main
adr_prompt:	.dword	prompt
adr_response:	.dword	response
adr_pattern:	.dword	pattern
adr_value_read1:.dword	value_read1
adr_value_read2:.dword	value_read2

main:
	stp fp, lr, [sp, -16]!		/* save our frame pointer and link register */

	// use x18, x19 as registers holding pointers to value_read1, and value_read2
	ldr x18, adr_value_read1
	ldr x19, adr_value_read2

    	ldr x0, adr_prompt		/* x0 contains pointer to prompt message */
    	bl printf			/* call printf to output our prompt */

    	ldr x0, adr_pattern 		/* x0 contains pointer to format string for our scan pattern */
    	mov x1, x18	  		/* x1 contains pointer to variable label where our first number is stored */
	mov x2, x19			/* x2 contains pointer to variable label where our second number is stored */
    	bl scanf              		/* call to scanf */
next:
	// do whatever it is we need

	// output any response at the end of program
	ldr x0, adr_response	/* x0 contains pointer to response message */
	ldr x1, [x18]		/* x1 contains value dereferenced from x18 */
	ldr x2, [x19]
	bl printf		/* call printf to output our response */

	mov w0, #0		/* exit code 0 = program terminated normally */
	ldp fp, lr, [sp], 16
	ret			/* exit our main function */
