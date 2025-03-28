.global main

.section .rodata
filename:	.asciz	"my_file.bin"

data1:	.word 	0,0,0,0,0
data2:	.float	0.0,0.0,0.0,0.0,0.0
data3:	.double 0.0,0.0,0.0,0.0,0.0

.text
main:
	push {lr}

	ldr r0, =filename
	mov r1, #0000
	mov r7, #5
	svc #0
	mov r4, r0

	mov r0, r4
	ldr r1, =data1
	mov r2, #80
	mov r7, #3
	svc #0

	//mov r0, r4
	//mov r7, #118
	//svc #0
breakpt:
	mov r0, r4
	mov r7, #6
	svc #0

	pop {pc}
