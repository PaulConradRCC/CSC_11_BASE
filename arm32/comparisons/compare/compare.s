// bare bones source file
.global main

.data
prompt:		.asciz "Enter two 32 bit integers: "
scan_str:	.asciz	"%d %d"

val1:		.word	0
val2:		.word	0

.align 4
.text
main:
	push {lr}	// save lr (return address from main) on stack for end of main
	// assembly program here
	// prompt user for two 32 bit integers
	ldr r0, =prompt
	bl printf

	// read in the two 32 bit integers from the keyboard via scanf
	ldr r0, =scan_str
	ldr r1, =val1
	ldr r2, =val2
	bl scanf

	// load from memory, the values for val1 and val2,
	// storing the values in r4 and r5, respectively
	ldr r0, =val1
	ldr r1, =val2
	ldr r4, [r0]
	ldr r5, [r1]

	cmp r4, r5 // use debugger see what happens to CPSR...
bkpt:	mov r0, r0 // bogus instruction for our breakpoint...

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}
	//mov pc, lr

