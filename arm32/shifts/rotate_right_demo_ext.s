.data
/* Prompt message */
prompt: .asciz "Please type an integer number: "

/* Response message */
response_even: .asciz "The number %d is even\n"
response_odd:  .asciz "The number %d is odd\n"

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
	ldr r1, [r4]
	movs r2, r1, rrx
	ldrcc r0, =response_even
	ldrcs r0, =response_odd
a_pause:
	// output the results
	bl printf		/* call printf to output our response */

	mov r0, #0		/* exit code 0 = program terminated normally */
	pop {pc}		/* exit our main function */
