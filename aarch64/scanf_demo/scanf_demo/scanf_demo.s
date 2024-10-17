.align 8
.section .rodata	// read only data section
/* Prompt message */
prompt: .asciz "Hi there! Please enter an integer number: "

/* Response message */
response: .asciz "I read the number %d from the keyboard.\n"

/* Format pattern for scanf */
pattern: .asciz "%d"

.align 8
.section .data
/* Where scanf will store the number read */
value_read: .word 0

.align 8
.text
.global main

adr_value_read:	.dword	value_read
adr_prompt:	.dword	prompt
adr_response:	.dword	response
adr_pattern:	.dword	pattern

main:
	stp x29, x30, [sp, -16]!	/* save our frame pointer and return address */

	// register x18 holds address to value_read
	ldr x18, adr_value_read

    	ldr x0, adr_prompt		/* x0 contains pointer to prompt message */
    	bl printf			/* call printf to output our prompt */

    	ldr x0, adr_pattern 	/* x0 contains pointer to format string for our scan pattern */
    	mov x1, x18	  	/* x1 contains pointer to variable label where our number is stored */
    	bl scanf              	/* call to scanf */
next:
	ldr x0, adr_response	/* x0 contains pointer to response message */
	ldr x1, [x18]		/* x1 contains value dereferenced from x18 pointer */
	bl printf		/* call printf to output our response */

	mov w0, #0		/* exit code 0 = program terminated normally */
	ldp x29, x30, [sp], 16
	ret			/* exit our main function */
