// bare bones source file
.global main

.section .rodata
format_string:	.asciz "%d + %d = %d\n"

.align 8
.text
main:
	stp x29, x30, [sp, -16]!
	// assembly program here
	mov x4, #1	// x4 = 1
	mov x5, #2	// x5 = 2
	add x6, x4, x5	// x6 = x4 + x5

	adrp x0, format_string	// x0 = &format_string
	add x0, x0, :lo12: format_string
	mov x1, x4	// x1 = x4
	mov x2, x5	// x2 = x5
	mov x3, x6	// x3 = x6

	bl printf	// call printf with bl (branch with link)

	mov w0, #0 // return code for your program (must be 8 bits)
	ldp x29, x30, [sp], 16
	ret

