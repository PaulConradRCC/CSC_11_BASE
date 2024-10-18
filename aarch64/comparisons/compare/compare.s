// bare bones source file
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
	// prompt user for two 32 bit integers
	ldr x0, adr_prompt
	bl printf

	// read in the two 32 bit integers from the keyboard via scanf
	ldr x0, adr_scan_str
	ldr x1, adr_val1
	ldr x2, adr_val2
	bl scanf

	// load from memory, the values for val1 and val2,
	// storing the values in r4 and r5, respectively
	ldr x0, adr_val1
	ldr x1, adr_val2
	ldr x4, [x0]
	ldr x5, [x1]

	cmp x4, x5 // use debugger see what happens to CPSR...
bkpt:	mov x0, x0 // bogus instruction for our breakpoint...

	mov w0, #0 // return code for your program
	ldp fp, lr, [sp], 16
	ret
