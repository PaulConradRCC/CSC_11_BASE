.global main	// allow linker to find main

.data	// data section

hello_msg:	.asciz	"Hello class!\n"

.text	// text section is where machine code goes
main:
	push {lr}	// save the lr register in case it gets modified

	// demo to display hello_msg to screen via printf
	ldr r0, =hello_msg	// r0 holds address to hello_msg
	bl printf		// call printf

	// return a return value of 0
	mov r0, #0
	pop {pc}		// pc should hold original value of lr
