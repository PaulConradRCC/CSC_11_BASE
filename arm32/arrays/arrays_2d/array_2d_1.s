.global main

.align 4
.section .rodata
new_line: .asciz "\n"
num_msg:  .asciz "%3d "

.align 4
.section .data
arr2d:	  .word 1,2,3
	  .word 4,8,12
	  .word 6,14,18
	  .word 10,20,30
	  .word 25,50,75

.align 4
.text
main:	push {lr}
	ldr r4, =arr2d
	mov r5, #0
row_loop:
	mov r6, #0
col_loop:
	mov r0, r5, lsl #3 // r0 = r5 * 8
	add r0, r5, lsl #2 // r0 = r0 + r5 * 4 (r0 is r5 * 12)
	add r0, r6, lsl #2 // r0 = r0 + r6 * 4 (r0 is r5*12 + r6*4)
	ldr r1, [r4, r0]
	ldr r0, =num_msg
	bl printf
	add r6, #1
	cmp r6, #3
	blt col_loop
	ldr r0, =new_line
	bl printf
	add r5, #1
	cmp r5, #5
	blt row_loop

	pop {pc}

