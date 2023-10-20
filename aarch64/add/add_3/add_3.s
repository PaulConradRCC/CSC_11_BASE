// bare bones source file
.global main

.align 8
.section .rodata
prompt:		.asciz "Enter two unsigned 32 bit integers: "
scan_str:	.asciz	"%u %u"
format_string:	.asciz "%u + %u = %u\n"
format_str2:	.asciz "%u - %u = %u\n"
format_str3:	.asciz "%u * %u = %u\n"

.align 8
.data
val1:		.word	0
val2:		.word	0

.align 8
.text
main:
	stp fp, lr, [sp, -16]!

	// assembly program here
	// prompt user for two 32 bit integers
	adrp x0, prompt
	add x0, x0, :lo12: prompt
	bl printf

	// read in the two 32 bit integers from the keyboard via scanf
	adrp x0, scan_str
	add x0, x0, :lo12: scan_str
	adrp x1, val1
	add x1, x1, :lo12: val1
	adrp x2, val2
	add x2, x2, :lo12: val2
	bl scanf
scanf_bp:
	// load from memory, the values for val1 and val2,
	// storing the values in x4 and x5, respectively
	adrp x0, val1
	adrp x1, val2
	add x0, x0, :lo12: val1
	add x1, x1, :lo12: val2
	ldr x19, [x0]
	ldr x20, [x1]

	adds x6, x19, x20	// x6 = x9 + x10, s=update cpsr
	subs x21, x19, x20  	// x11 = x9 - x10, s=update cpsr
	mul x22, x19, x20  	// x12 = x9 * x10

	adrp x0, format_string	// x0 = &format_string
	add x0, x0, :lo12: format_string
	mov x1, x19	// x1 = x4
	mov x2, x20	// x2 = x5
	mov x3, x6	// x3 = x6
	bl printf	// call printf with bl (branch with link)

	adrp x0, format_str2	// x0 = &format_str2
	add x0, x0, :lo12: format_str2
	mov x1, x19	// x1 = x4
	mov x2, x20	// x2 = x5
	mov x3, x21	// x3 = x7
	bl printf	// call printf with bl (branch with link)

	adrp x0, format_str3	// x0 = &format_str3
	add x0, x0, :lo12: format_str3
	mov x1, x19	// x1 = x4
	mov x2, x20	// x2 = x5
	mov x3, x22	// x3 = x8
	bl printf	// call printf with bl (branch with link)

	mov w0, #0 // return code for your program (must be 8 bits)
	ldp fp, lr, [sp], 16
	ret
