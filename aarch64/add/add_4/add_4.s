.global main

.align 8
.section .rodata
prompt:		.asciz "Enter two unsigned 32 bit integers: "
scan_str:	.asciz	"%u %u"
format_string:	.asciz "%u + %u = %u\n"
format_string2:	.asciz "%u - %u = %u\n"
format_string3:	.asciz "%u * %u = %u\n"
format_string4:	.asciz "%u * %u = "
format_str4_2:	.asciz "%llu (umull)\n"

.align 8
.section .data
val1:		.word	0
val2:		.word	0

.align 8
.text
main:
	stp fp, lr, [sp, -16]!

	// x19 is pointer to val1, x20 is pointer to val2
	adrp x19, val1
	add x19, x19, :lo12: val1
	adrp x20, val2
	add x20, x20, :lo12: val2

	// assembly program here
	// prompt user for two 32 bit integers
	adrp x0, prompt
	add x0, x0, :lo12: prompt
	bl printf

	// read in the two 32 bit integers from the keyboard via scanf
	adrp x0, scan_str
	add x0, x0, :lo12: scan_str
	mov x1, x19
	mov x2, x20
	bl scanf

	// load from memory, the values for val1 and val2,
	// storing the values in x21 and x22, respectively
	ldr x21, [x19]
	ldr x22, [x20]

	adds x23, x21, x22	// x23 = x21 + x22, s=update cpsr
	subs x24, x21, x22  	// x24 = x21 - x22, s=update cpsr
	mul x25, x21, x22  	// x25 = x21 * x22, s=update cpsr
	umull x26, w21, w22 	// x26 = x21 * x22 (31:0), x27 = x21 * x22 (63:32)??????

	adrp x0, format_string	// x0 = &format_string
	add x0, x0, :lo12: format_string
	mov x1, x21	// x1 = x21
	mov x2, x22	// x2 = x22
	mov x3, x23	// x3 = x23
	bl printf	// call printf with bl (branch with link)

	adrp x0, format_string2	// x0 = &format_string
	add x0, x0, :lo12: format_string2
	mov x1, x21	// x1 = x21
	mov x2, x22	// x2 = x22
	mov x3, x24	// x3 = x24
	bl printf	// call printf with bl (branch with link)

	adrp x0, format_string3	// x0 = &format_string
	add x0, x0, :lo12: format_string3
	mov x1, x21	// x1 = x21
	mov x2, x22	// x2 = x22
	mov x3, x25	// x3 = x25
	bl printf	// call printf with bl (branch with link)

	adrp x0, format_string4	// x0 = &format_string
	add x0, x0, :lo12: format_string4
	mov x1, x21	// x1 = x21
	mov x2, x22	// x2 = x22
	mov x3, x26	// x3 = x26
	bl printf	// call printf with bl (branch with link)

	adrp x0, format_str4_2
	add x0, x0, :lo12: format_str4_2
	mov x1, x11
	mov x2, x22	// x3 = x20
	mov x3, x27
	bl printf	// call printf with bl (branch with link)

	mov w0, #0 // return code for your program (must be 8 bits)

	ldp fp, lr, [sp], 16
