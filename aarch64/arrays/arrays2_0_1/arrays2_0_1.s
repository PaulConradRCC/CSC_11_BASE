.global main
.balign 4
.section .data

a: 	.word 1,-2,3
	.word -4,5,-6
	.word 7,-8,9

output:	.asciz "a[%d][%d] = %d\n"

.section .text
.balign 4
main:
	push {lr}

	ldr r4, =a		// r4 holds base address of a
	mov r5, #0		// r5 = row index

for_row_index:
	mov r6, #0		// r6 = column index
	cmp r5, #3
	beq for_row_index_done
for_col_index:
	mov r0, r5, lsl #3	// r0 = r5 * 8
	add r0, r5, lsl #2	// r0 = r0 + r5 * 4 ( r0=r5 * 12 )
	add r0, r6, lsl #2	// r0 = r0 + r6 * 4 ( r0=r5 * 12 + r6 * 4 )
	//add r0, r4		// r0 = r0 + base_address_of_a

	ldr r3, [r0, r4]	// r3 = *(r0+r4)
	mov r2, r6
	mov r1, r5
	ldr r0, =output
	bl printf

	add r6, #1		// column index++
	cmp r6, #3
	bne for_col_index
for_col_index_done:
	add r5, #1		// row index++
	bal for_row_index
for_row_index_done:

	pop {pc}
