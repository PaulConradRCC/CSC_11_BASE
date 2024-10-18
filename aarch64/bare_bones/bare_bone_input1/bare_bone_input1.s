.global main

.align 8
.section .rodata
/* Prompt message */
prompt: .asciz "Hi there! Please type an integer number: "

/* Response message */
response: .asciz "I read the number %d from the keyboard\n"

/* Format pattern for scanf */
pattern: .asciz "%d"

.align 8
.section .data
/* Where scanf will store the number read */
value_read: .word 0

.align 8
.text
adr_prompt:	.dword	prompt
adr_response:	.dword	response
adr_pattern:	.dword	pattern
adr_value_read:	.dword	value_read

main:
	stp fp, lr, [sp, -16]!		/* save frame pointer and link register */

	// register r4 holds address to value_read
	ldr x18, adr_value_read		/* LoaD Register into x18 address of value_read */

    	ldr x0, adr_prompt		/* x0 contains pointer to prompt message */
    	bl printf			/* call printf to output our prompt */

    	ldr x0, adr_pattern 		/* x0 contains pointer to format string for our scan pattern */
    	mov x1, x18	  		/* x1 contains pointer to variable label where our number is stored */
    	bl scanf              		/* call to scanf */
next:
	ldr x0, adr_response		/* x0 contains pointer to response message */
	ldr x1, [x18]			/* x1 contains value dereferenced from address in x18 */
	bl printf			/* call printf to output our response */

	mov w0, #0			/* exit code 0 = program terminated normally */
	ldp fp, lr, [sp], 16
	ret				/* exit our main function */
