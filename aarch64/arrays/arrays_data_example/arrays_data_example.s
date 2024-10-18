// this program does nothing other than show how to create an array of 10,485,760 bytes

.section .text
.balign 8
.global main
main:
	push {lr}

	pop {pc}

.section .data
.balign 8

a: .skip 10485760 // array of 10 megabytes of space
b: .word 1,3,5,7,9,2,4,6,8,-1

