.global main

.align 8
.section .rodata
prompt:		.asciz "Enter two unsigned 64 bit integers: "
scan_str:	.asciz	"%lu %lu"
format_string:	.asciz "%lu + %lu = %lu\n"
format_string2:	.asciz "%lu - %lu = %lu\n"
format_string3:	.asciz "%lu * %lu = %lu\n"
format_string4:	.asciz "%lu * %lu = %llu (umull)\n"

.align 8
.section .data
val1:		.word	0
val2:		.word	0

.align 8
.text
adr_prompt:		.dword	prompt
adr_scan_str:		.dword	scan_str
adr_format_string:	.dword	format_string
adr_format_string2:	.dword	format_string2
adr_format_string3:	.dword	format_string3
adr_format_string4:	.dword	format_string4
adr_val1:		.dword	val1
adr_val2:		.dword	val2

main:
	stp fp, lr, [sp, -16]!

	// x18 is pointer to val1, x19 is pointer to val2
	ldr x18, adr_val1
	ldr x19, adr_val2

	// assembly program here
	// prompt user for two 32 bit integers
	ldr x0, adr_prompt
	bl printf

	// read in the two 32 bit integers from the keyboard via scanf
	ldr x0, adr_scan_str
	mov x1, x18
	mov x2, x19
	bl scanf

	// load from memory, the values for val1 and val2,
	// storing the values in x21 and x22, respectively
	ldr x21, [x18]
	ldr x22, [x19]

	adds x23, x21, x22		// x23 = x21 + x22, s=update cpsr
	subs x24, x21, x22  		// x24 = x21 - x22, s=update cpsr
	mul x25, x21, x22  		// x25 = x21 * x22, s=update cpsr
	umull x26, w21, w22	// x26 = x21 * x22 (63:0), x27 = x21 * x22 (127:64)??????

	ldr x0, adr_format_string	// x0 = address of format_string
	mov x1, x21			// x1 = x21
	mov x2, x22			// x2 = x22
	mov x3, x23			// x3 = x23
	bl printf			// call printf with bl (branch with link)

	ldr x0, adr_format_string2	// x0 = address of format_string2
	mov x1, x21			// x1 = x21
	mov x2, x22			// x2 = x22
	mov x3, x24			// x3 = x24
	bl printf			// call printf with bl (branch with link)

	ldr x0, adr_format_string3	// x0 = address of format_string3
	mov x1, x21			// x1 = x21
	mov x2, x22			// x2 = x22
	mov x3, x25			// x3 = x25
	bl printf			// call printf with bl (branch with link)

	ldr x0, adr_format_string4		// x0 = address of format_string4
	mov x1, x21			// x1 = x21
	mov x2, x22			// x2 = x22
	mov x3, x26			// x3 = x26
	bl printf			// call printf with bl (branch with link)

	mov w0, #0 			// return code for your program (must be 8 bits)
	ldp fp, lr, [sp], 16
	ret
