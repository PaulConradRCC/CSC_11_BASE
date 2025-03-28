.global get_integer
.align 4
.text
get_integer:
	push { R11, LR }
	sub R11, SP, #4
	sub SP, R11, #4	// allocate space for a 4 byte local variable
	ldr R0, =scan_s
	mov R1, R11
	bl scanf
	cmp r0, #0
	ldrne R0, [R11]
	moveq R0, #0
	add SP, R11, #4
	pop { R11, PC }

scan_s: .asciz "%d"
