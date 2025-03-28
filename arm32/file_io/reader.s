.global main

.align 2
.section .rodata
filename: .asciz "test.txt"
filemode: .asciz "r"
fscan_st: .asciz "%d"

.align 2
.text
main:
	push {r4, r5, r11, lr}
	sub r11, sp, #4
	sub sp, sp, #8

	ldr r0, =filename
	ldr r1, =filemode
	bl fopen
	mov r5, r0
	mov r4, #0
fread_lp:
	mov r0, r5
	ldr r1, =fscan_st
	mov r2, r11
	bl fscanf
	ldr r0, [r11]
	cmp r0, #-1
	beq done
	add r4, r4, r0
	b fread_lp
	add sp, r11, #4

done:	mov r0, r5
	bl fclose
	mov r0, r4
	pop {r4, r5, r11, pc}
