// this program is a demonstration that we cannot have four registers for a single add
// instruction, this should not build.
.global main

.align 8
.text
main:
	mov x0, #1
	mov x1, #2
	mov x2, #3
	add x0, x0, x1, x2
	ret
