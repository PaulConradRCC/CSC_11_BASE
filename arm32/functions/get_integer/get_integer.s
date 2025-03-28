.global get_integer
.align 4
.text
get_integer:
	push { R11, LR }	// save R11 and LR (R14) onto the stack
	sub R11, SP, #4		// R11 is the frame pointer - the "frame" holds our local variables
	sub SP, R11, #4		// allocate space for a 4 byte local variable
	ldr R0, =scan_s		// R0 has address of our scan_s format string
	mov R1, R11		// R1 contains address of the top of the frame pointer
	bl scanf		// call scanf
	ldr R0, [R11]		// store the user input value into register R0
	add SP, R11, #4		// deallocate the 4 bytes for our local variable
	pop { R11, PC }		// restore contents of R11 and PC (LR)

scan_s: .asciz "%d"
