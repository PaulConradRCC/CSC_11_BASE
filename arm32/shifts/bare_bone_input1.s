.data
/* Prompt message */
prompt: .asciz "Hi there! Please type an integer number: "

/* Response message */
response: .asciz "I read the number %d from the keyboard\n"

/* Format pattern for scanf */
pattern: .asciz "%d"

/* Where scanf will store the number read */
value_read: .word 0

.text
.global main
main:
	push {lr}		/* save our return address */

	// register r4 holds address to value_read
	ldr r4, =value_read

    	ldr r0, =prompt		/* r0 contains pointer to prompt message */
    	bl printf		/* call printf to output our prompt */

    	ldr r0, =pattern 	/* r0 contains pointer to format string for our scan pattern */
    	mov r1, r4	  	/* r1 contains pointer to variable label where our number is stored */
    	bl scanf              	/* call to scanf */
next:
	ldr r0, =response	/* r0 contains pointer to response message */
	mov r1, r4		/* r1 contains pointer to value_read */
	ldr r1, [r1]		/* r1 contains value dereferenced from r1 in previous instruction */
	bl printf		/* call printf to output our response */

	mov r0, #0		/* exit code 0 = program terminated normally */
	pop {pc}		/* exit our main function */
