.global main

.align 4
.section .data
// arr3d has 2 pages, 3 rows and 4 columns
//
// int arr3d[2][3][4] = { { { 1,2,3,4 },
//			    { 11,12,13,14 },
//			    { 21,22,23,24 } },
//
//			  { { 100,200,300,400 },
//			    { 101,201,301,401 },
//			    { 102,202,302,402 } } };

arr3d:	.word	1,2,3,4		// page 0
	.word	11,12,13,14
	.word	21,22,23,24

	.word	100,200,300,400 // page 1
	.word	101,201,301,401
	.word	102,202,303,402

page_ms: .asciz "Page #%d\n"
num_ms:  .asciz "%d "
new_line:.asciz "\n"

.align 4
.text
main:
	push {lr}
	ldr r4, =arr3d
	mov r5, #0 // r5 holds page # we are on
page_loop:
	ldr r0, =page_ms
	mov r1, r5
	bl printf
	mov r6, #0 // r6 holds row # we are on
row_loop:
	mov r7, #0 // r7 holds col # we are on
col_loop:
	mov r8, r5, lsl #3
	add r8, r5, lsl #2
	add r8, r6, lsl #2
	add r8, r7
	mov r8, r8, lsl #2
	ldr r1, [r4, r8]
	ldr r0, =num_ms
	bl printf
	add r7, #1
	cmp r7, #4
	blt col_loop
	ldr r0, =new_line
	bl printf
	add r6, #1
	cmp r6, #3
	blt row_loop
	add r5, #1
	cmp r5, #2
	blt page_loop
	pop {pc}
