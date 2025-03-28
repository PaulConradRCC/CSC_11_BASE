.global main

.section .rodata
filename:	.asciz	"my_file.bin"

data1:	.word 	1,3,5,7,9
data2:	.float	1.1,2.2,4.4,8.8,10.1
data3:	.double 1.4,2.6,3.8,4.0,5.12

.text
main:
	push {lr}

	ldr r0, =filename
	mov r1, #0106		// 0x0100 | 0x0002 | 0x0004 = O_CREAT|O_WRONLY|O_BINARY
	ldr r2, =#0x0644
	mov r7, #5
	svc #0
	mov r4, r0

	mov r0, r4
	ldr r1, =data1
	mov r2, #80
	mov r7, #4
	svc #0

	//mov r0, r4
	//mov r7, #118
	//svc #0

	mov r0, r4
	mov r7, #6
	svc #0

	pop {pc}
