.align 8
.section .rodata
/* Prompt message */
prompt: .asciz "Hi there! Please type in four integer values (seperated by a space): "

/* Response message */
response: .asciz "I read the numbers %d, %d, %d and %d from the keyboard\n"

/* Format pattern for scanf */
pattern: .asciz "%d %d %d %d"

.align 8
.section .data
/* Where scanf will store the number read */
value_read1: .word 0
value_read2: .word 0
value_read3: .word 0
value_read4: .word 0

.align 8
.text
.global main

adr_prompt:	.dword	prompt
adr_response:	.dword	response
adr_pattern:	.dword	pattern
adr_value_read1:.dword	value_read1
adr_value_read2:.dword	value_read2
adr_value_read3:.dword	value_read3
adr_value_read4:.dword	value_read4

main:
	stp x29, x30, [sp, -16]!	/* save our frame pointer and return address */

	ldr x18, adr_value_read1    /* x18 contains pointer to variable label where our first number is stored */
        ldr x19, adr_value_read2    /* x19 contains pointer to variable label where our second number is stored */
        ldr x20, adr_value_read3
        ldr x21, adr_value_read4

    	ldr x0, adr_prompt		/* x0 contains pointer to prompt message */
    	bl printf		/* call printf to output our prompt */

    	ldr x0, adr_pattern 	/* x0 contains pointer to format string for our scan pattern */
    	mov x1, x18	 	/* x18 contains pointer to variable label where our first number is stored */
	mov x2, x19		/* x19 contains pointer to variable label where our second number is stored */
	mov x3, x20
	mov x4, x21
    	bl scanf              	/* call to scanf */
next:
	ldr x0, adr_response	/* x0 contains pointer to response message */
	ldr x1, [x18]		/* x1 contains value dereferenced from x18 */
	ldr x2, [x19]
	ldr x3, [x20]
	ldr x4, [x21]
	bl printf		/* call printf to output our response */

	mov w0, #0		/* exit code 0 = program terminated normally */
	ldp x29, x30, [sp], 16
	ret			/* exit our main function */
