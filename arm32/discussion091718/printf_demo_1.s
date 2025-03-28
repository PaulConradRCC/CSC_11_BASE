// hello program
.global main

.data

hello_message:	.asciz	"Hello world from ARM assembly!\n"

.text	// machine code begins here

main:
	push {lr}		// pseudo-instruction push, push lr on stack, save for later
	ldr r0, =hello_message	// r0 holds address to hello_message
	bl printf		// call printf

	mov r0, #0		// r0 holds integer return values, this case: 0
	pop {lr}		// pseudo-instruction pop, pop lr off the stack
	mov pc, lr		// set pc to address held in lr to exit program
