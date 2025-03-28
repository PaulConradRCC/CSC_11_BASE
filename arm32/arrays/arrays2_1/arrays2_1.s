// simple example of a two dimensional array
.global main

.section .text
.balign 4
main:
	push {lr}

	mov r4, #0	// r4 = row index
_2_1_row_lp:
	cmp r4, #3		// a is a 3x5 matrix
	beq _2_1_row_lp_done	// if row index == 3 done

	mov r5, #0	// r5 = col index
_2_1_col_lp:
	cmp r5, #5
	beq _2_1_col_lp_done
	ldr r0, =output
	mov r6, #20
	mul r6, r4, r6	// row offset = row * 20
	mov r7, #4
	mul r7, r5, r7  // col offset = col * 4
	add r6, r6, r7  // row offset + col offset = total offset
	ldr r1, =a
	add r1, r6
	ldr r1, [r1]
	bl printf
	add r5, #1
	bal _2_1_col_lp
_2_1_col_lp_done:
	ldr r0, =newlin
	bl printf

	add r4, #1
	bal _2_1_row_lp
_2_1_row_lp_done:
	pop {pc}

/////////////////////////////////////////////////////////////////////////////
.section .data
.balign 4

a: 	.word 1,2,3,4,5
	.word 11,12,13,14,15
	.word 21,22,23,24,25

.section .rodata
.balign 4

output: .asciz "%3d, "
newlin: .asciz "\b\b \n"
