// 64 bit long int
.global main

.align 8
.section .rodata
format_string:	.asciz "%ld + %ld = %ld\n"

.align 8
.text
adr_format_string:	.dword	format_string

main:
	stp fp, lr, [sp, -16]!
	// assembly program here
	ldr x4, a_big_num1		// x4 = a_big_num1
	ldr x5, a_big_num2		// x5 = a_big_num2
	add x6, x4, x5			// x6 = x4 + x5

	ldr x0, adr_format_string	// x0 = address of format_string
	mov x1, x4			// x1 = x4
	mov x2, x5			// x2 = x5
	mov x3, x6			// x3 = x6

	bl printf			// call printf with bl (branch with link)

	mov w0, #0 			// return code for your program (must be 8 bits)
	ldp fp, lr, [sp], 16
	ret

a_big_num1:	.dword	12345678901234567
a_big_num2:	.dword	23456789012345678
