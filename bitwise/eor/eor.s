/* -- eor.s -- */
.global main // main is our entry point to program and must be global

.align 4
.section .rodata
message:        .asciz  "%d EOR %d is %d\n"

.align 4
.text
main:
	push {lr}   // push address of caller on stack
	mov r4, #123	// load the value 123 into r4 register
	mov r5, #345	// load the value 345 into r5 register
	eor r6, r4, r5	// bitwise eor r4 and r5, store result in r6
	eor r7, r6, r4  // bitwise eor r6 and r4, store result in r7 (same value as r5)
	eor r8, r6, r5  // bitwise eor r6 and r5, store result in r8 (same value as r4)
	ldr r0, =message
	mov r1, r4
	mov r2, r5
	mov r3, r6
	bl printf

	ldr r0, =message
	mov r1, r6
	mov r2, r4
	mov r3, r7
	bl printf

	ldr r0, =message
	mov r1, r6
	mov r2, r5
	mov r3, r8
	bl printf

	pop {pc}	// return from main - several different ways we can exit from program



