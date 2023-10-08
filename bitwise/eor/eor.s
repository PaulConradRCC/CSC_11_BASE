/* -- eor.s -- */
.global main // main is our entry point to program and must be global

main:
	push {lr}   // push address of caller on stack
	mov r0, #123	// load the value 123 into r0 register
	mov r1, #345	// load the value 345 into r1 register
	eor r2, r0, r1	// bitwise eor r0 and r1, store result in r2
	eor r3, r2, r0  // bitwise eor r2 and r0, store result in r3 (same value as r1)
	eor r4, r2, r1  // bitwise eor r2 and r1, store result in r4 (same value as r0)
	pop {pc}	// return from main - several different ways we can exit from program



