.global main
.align 4
.section .rodata
filename: .asciz "my_file.txt"
filemode: .asciz "w"

.align 4
.text
main:
	push {lr}
	ldr r0, =filename
	ldr r1, =filemode
	bl fopen

	bl fclose

	pop {pc}
