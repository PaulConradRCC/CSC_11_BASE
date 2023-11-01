// pass_by_value
.global main

.align 4
.section .rodata
output1:	.asciz	"%d\n"
R0_msg:		.asciz  "R0: %d\n"
R1_msg:		.asciz	"R1: %d\n"
R2_msg:		.asciz	"R2: %d\n"

val1_msg:	.asciz  "val1: %d\n"
val2_msg:	.asciz	"val2: %d\n"
val3_msg:	.asciz	"val3: %d\n"

.align 4
.data
// all non-constant, initialized data goes here
val1:	.word	125
val2:	.word	100
val3:	.word	245

.align 4
.text
pass_by_value_example:
	push {LR}

	add R3, R0, R1	// R3 = R0 + R1
	add R3, R3, R2	// R3 = R3 + R2

	push { R0-R2 }	// save contents of R0-R2 because they are used as scratch registers in printf
	ldr R0, =output1
	mov R1, R3
	bl printf
	pop { R0-R2 }	// restore contents of R0-R2 after printf call

	add R0, R0, #1	// add R0, #1
	add R1, R1, #3	// add R1, #3
	sub R2, R2, #2	// sub R2, #2

	push { R0-R2 }
	mov R1, R0	// copy of R0's value in R1 for printf
	ldr R0, =R0_msg
	bl printf
	pop { R0-R2 }

	push { R0-R2 }
	ldr R0, =R1_msg
	bl printf
	pop { R0-R2 }

	push { R0-R2 }
	mov R1, R2	// copy of R0's value in R1 for printf
	ldr R0, =R2_msg
	bl printf
	pop { R0-R2 }

	pop { PC }


main: 	push {lr} // save link register, this is one of many ways this can be done

	// assembly program here
	// our pointers to val1, val2 and val3
	ldr R4, =val1
	ldr R5, =val2
	ldr R6, =val3

	ldr R0, [R4]	// R0 = *R4;
	ldr R1, [R5]	// R1 = *R5;
	ldr R2, [R6]	// R2 = *R6;
	bl pass_by_value_example

	ldr R0, =val1_msg
	ldr R1, [R4]		// R1 = *R4
	bl printf

	ldr R0, =val2_msg
	ldr R1, [R5]		// R1 = *R5
	bl printf

	ldr R0, =val3_msg
	ldr R1, [R6]		// R1 = *R6
	bl printf

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

