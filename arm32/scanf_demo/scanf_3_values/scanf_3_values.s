.align 4
.section .rodata
/* Prompt message */
prompt: .asciz "Hi there! Please type in three integer values (seperated by a space): "

/* Response message */
response: .asciz "I read the numbers %d, %d and %d from the keyboard\n"

/* Format pattern for scanf */
pattern: .asciz "%d %d %d"

.align 4
.section .data
/* Where scanf will store the number read */
value_read1: .word 0
value_read2: .word 0
value_read3: .word 0

.align 4
.text
.global main
main:
	push {lr}		/* save our return address */

	// r4 hold address of value_read1, r5 holds address of value_read2, r6 holds address of value_read3
	ldr r4, =value_read1
	ldr r5, =value_read2
	ldr r6, =value_read3

    	ldr r0, =prompt		/* r0 contains pointer to prompt message */
    	bl printf		/* call printf to output our prompt */

    	ldr r0, =pattern 	/* r0 contains pointer to format string for our scan pattern */
    	mov r1, r4  		/* r1 contains pointer to variable label where our first number is stored */
	mov r2, r5		/* r2 contains pointer to variable label where our second number is stored */
	mov r3, r6
    	bl scanf              	/* call to scanf */
next:
	ldr r0, =response	/* r0 contains pointer to response message */
	ldr r1, [r4]		/* r1 contains value dereferenced from r4 */
	ldr r2, [r5]
	ldr r3, [r6]
	bl printf		/* call printf to output our response */

	mov r0, #0		/* exit code 0 = program terminated normally */
	pop {pc}		/* exit our main function */
