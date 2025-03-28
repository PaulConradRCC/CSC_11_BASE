// bare bones source file
.global main

.data
format_string:	.asciz "%d + %d = %d\n"

.align 4
.text
main:
	push {lr}	// save lr (return address from main) on stack for end of main
	// assembly program here
	mov r4, #1	// r4 = 1
	mov r5, #2	// r5 = 2
	add r6, r4, r5	// r6 = r4 + r5

	ldr r0, =format_string	// r0 = &format_string
	mov r1, r4	// r1 = r4
	mov r2, r5	// r2 = r5
	mov r3, r6	// r3 = r6
	//push {lr}
	bl printf	// call printf with bl (branch with link)
	//pop {lr}
	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}
	//mov pc, lr

