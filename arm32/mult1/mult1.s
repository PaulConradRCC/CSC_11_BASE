	.global main

.balign 4
.data

value1: .word 40

.balign 4
.text
main:
	push {lr}	// save link register (return address)
	ldr r1, =value1 // r1 contains address of value1
	ldr r1, [r1]	// r1 now contains value at value1
	add r1,r1,lsl #2 // see if r1=r1*5
	mov r0, r1	// put result of r1 into r0 for return value
	pop {pc}	// exit program
