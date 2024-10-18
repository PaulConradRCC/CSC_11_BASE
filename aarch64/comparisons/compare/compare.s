.global main

.align 8
.section .rodata
prompt:		.asciz "Enter two 32 bit integers: "
scan_str:	.asciz	"%d %d"

.align 8
.section .data
val1:		.word	0
val2:		.word	0

.align 8
.text
adr_prompt:	.dword	prompt
adr_scan_str:	.dword	scan_str
adr_val1:	.dword	val1
adr_val2:	.dword	val2

main:
	stp fp, lr, [sp, -16]!		// save lr (return address from main) on stack for end of main
	// assembly program here
	ldr x18, adr_val1
	ldr x19, adr_val2

	// prompt user for two 32 bit integers
	ldr x0, adr_prompt
	bl printf

	// read in the two 32 bit integers from the keyboard via scanf
	ldr x0, adr_scan_str
	mov x1, x18
	mov x2, x19
	bl scanf

	// load from memory, the values for val1 and val2,
	// storing the values in w4 and w5, respectively
	// note that w registers are used to store variables declared as words
	ldr w4, [x18]
	ldr w5, [x19]

	cmp w4, w5 // use debugger see what happens to CPSR...
bkpt:	mov x0, x0 // bogus instruction for our breakpoint...

	mov w0, #0 // return code for your program
	ldp fp, lr, [sp], 16
	ret
