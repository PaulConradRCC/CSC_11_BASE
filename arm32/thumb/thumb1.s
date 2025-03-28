.global main
.arm
.text 
main:
	push {lr}
	adr r0, thumbcode+1
	mov lr, pc
	bx r0
	mov r0, #0
	pop {pc}
.thumb
thumbcode:
	mov r3, #0
lp:
	add r3, #1
	sub r0, r1
	bge lp
	add r2, r0, r1
	bx lr
