.global main
.arm
.text
main:
	mov r3, #0
	add r3, #1
	adr r0, thumbcode
	bx r0
.thumb
thumbcode:
	add r3, #1
	bx lr
