.global main

.align 8
.section .rodata
prompt:		.asciz "Enter two unsigned 64 bit integers: "
scan_str:	.asciz	"%lu %lu"
format_string:	.asciz "%lu + %lu = %lu\n"
format_str2:	.asciz "%lu - %lu = %lu\n"
format_str3:	.asciz "%lu * %lu = %lu\n"

.align 8
.section .data
val1:		.dword	0
val2:		.dword	0

.align 8
.text
adr_prompt:		.dword	prompt
adr_scan_str:		.dword	scan_str
adr_format_string:	.dword	format_string
adr_format_str2:	.dword	format_str2
adr_format_str3:	.dword	format_str3
adr_val1:		.dword	val1
adr_val2:		.dword	val2

main:
	stp fp, lr, [sp, -16]!
	// assembly program here
	ldr x18, adr_val1		// x18 is pointer to val1
	ldr x19, adr_val2		// x19 is pointer to val2

// prompt user for two 32 bit integers
	ldr x0, adr_prompt
	bl printf

	// read in the two 32 bit integers from the keyboard via scanf
	ldr x0, adr_scan_str		// x0 contains address of scan_str
	mov x1, x18			// x1 has copy of pointer to val1 (in x18)
	mov x2, x19			// x2 has copy of pointer to val2 (in x19)
	bl scanf
scanf_bp:
	// load from memory, the values for val1 and val2,
	// storing the values in x20 and x21, respectively
	ldr x20, [x18]
	ldr x21, [x19]

	adds x22, x20, x21	// x22 = x20 + x21, s=update cpsr
	subs x23, x20, x21  	// x23 = x20 - x21, s=update cpsr
	mul x24, x20, x21  	// x24 = x20 * x21

	ldr x0, adr_format_string
	mov x1, x20			// x1 = x20
	mov x2, x21			// x2 = x21
	mov x3, x22			// x3 = x22
	bl printf			// call printf with bl (branch with link)

	ldr x0, adr_format_str2
	mov x1, x20			// x1 = x20
	mov x2, x21			// x2 = x21
	mov x3, x23			// x3 = x23
	bl printf			// call printf with bl (branch with link)

	ldr x0, adr_format_str3
	mov x1, x20			// x1 = x20
	mov x2, x21			// x2 = x21
	mov x3, x24			// x3 = x24
	bl printf			// call printf with bl (branch with link)

	mov w0, #0 // return code for your program (must be 8 bits)
	ldp fp, lr, [sp], 16
	ret
