/* -- first.s -- */
.global main // main is our entry point to program and must be global

main:
	mov r0, #1	// load the value 3 into r0 register
	mov r0, #2	// load the value 2 into r0 register
	mov r0, lr	// load the content of the lr into r0
	mov pc, lr	// return from main - several different ways we can exit from program
