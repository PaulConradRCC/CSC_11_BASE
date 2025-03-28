.section .data
/* Prompt message */
prompt:  .ascii "ROL function test program...\n"
prompt2: .asciz "Please type in two values (first value is number in hex,\n second value is number of bits in dec): "

/* Response message */
response: .asciz "0x%08x rotated left %d bits is: 0x%08x\n"

diag_msg: .asciz "----- Hello from rol .... -----\n"

/* Format pattern for scanf */
pattern: .asciz "%x %d"

/* Where scanf will store the number read */
number: .word 0
bits: .word 0

.section .text
.global main
rol:
	push {r0, r1}
	ldr r0, =diag_msg
	bl printf
	pop {r0, r1}

	rsb r1, r1, #32		// r1 = 32 - r1
	mov r0, r0, ror r1	// r0 = r0 >> r1??? will this be allowed?
	mov pc, lr

main:
	push {lr}		/* save our return address */

	// use r4, r5 as registers holding pointers to value_read1, and value_read2
	ldr r4, =number
	ldr r5, =bits

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
	bl rol

	mov r3, r0
	ldr r0, =response
	ldr r1, [r4]
	ldr r2, [r5]
	bl printf

	mov r0, #0		/* exit code 0 = program terminated normally */
	pop {pc}		/* exit our main function */
