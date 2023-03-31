/* -- first.s -- */
.global main // main is our entry point to program and must be global

main:
	push {lr}   // push address of caller on stack
	mov r0, #3	// load the value 3 into r0 register
	add r0, #7	// add immediate value of 7 to r0, store result in r0 register
	pop {pc}	// return from main - several different ways we can exit from program



