.global main

.text
main:
	mov r0, #1
	mov r1, #2
	mov r2, #3
	add r0, r0,r1,r2
	mov pc, lr
