/* -- and.s -- */
.global main // main is our entry point to program and must be global

.align 4
.section .rodata
message:	.asciz	"%d AND %d is %d\n"

.align 4
.text
main:
	push {lr}   	// push address of caller on stack
	ldr r0, =message
	mov r1, #123	// load the value 123 into r1 register
	mov r2, #345	// load the value 345 into r2 register
	and r3, r1, r2	// bitwise and r1 and r2, store result in r3
	bl printf
	pop {pc}	// return from main - several different ways we can exit from program



