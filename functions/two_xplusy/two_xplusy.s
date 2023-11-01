.align 4
.section .rodata
/* Prompt message */
prompt: .asciz "Please type in two integer values (seperated by a space): "

/* Response message */
response: .asciz "The result of 2 times ( %d + %d ) is %d\n"

/* Format pattern for scanf */
pattern: .asciz "%d %d"

.align 4
.data
/* Where scanf will store the number read */
value_read1: .word 0
value_read2: .word 0

.align 4
.section .text
.global main
two_xplusy:
	add r0, r0, r1
	mov r0, r0, lsl #1
	mov pc, lr

main:
	push {lr}		/* save our return address */

	// use r4, r5 as registers holding pointers to value_read1, and value_read2
	ldr r4, =value_read1
	ldr r5, =value_read2

    	ldr r0, =prompt		/* r0 contains pointer to prompt message */
    	bl printf		/* call printf to output our prompt */

    	ldr r0, =pattern 	/* r0 contains pointer to format string for our scan pattern */
    	mov r1, r4	  	/* r1 contains pointer to variable label where our first number is stored */
	mov r2, r5		/* r2 contains pointer to variable label where our second number is stored */
    	bl scanf              	/* call to scanf */
next:
	// do whatever it is we need
	ldr r0, [r4]
	ldr r1, [r5]
	bl two_xplusy
	mov r3, r0

	// output any response at the end of program
	ldr r0, =response	/* r0 contains pointer to response message */
	// mov r1, r4		/* r4 contains pointer to value_read1 */
	ldr r1, [r4]		/* r1 contains value dereferenced from r4 */
	// mov r2, r5
	ldr r2, [r5]
	bl printf		/* call printf to output our response */

	mov r0, #0		/* exit code 0 = program terminated normally */
	pop {pc}		/* exit our main function */
