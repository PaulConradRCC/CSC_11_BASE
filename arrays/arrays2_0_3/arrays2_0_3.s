.global main
.balign 4
.section .data

a: 	.word 0,0,0
	.word 0,0,0
	.word 0,0,0

prompt: .asciz "Enter value for a[%d][%d]: "
scan_pt: .asciz "%d"

output:	.asciz "a[%d][%d] = %d\n"

.section .text
.balign 4
main:
	push {lr}

	ldr r4, =a		// r4 holds base address of a
	mov r5, #0		// r5 = row index
	mov r1, #0		// r1 holds the sum of the matrix

for_row_index:
	mov r6, #0		// r6 = column index
	cmp r5, #3
	beq for_row_index_done
for_col_index:

	// prompt user for a[row_index][column_index] value
	ldr r0, =prompt
	mov r1, r5
	mov r2, r6
	bl printf

	mov r0, r5, lsl #3	// r0 = r5 * 8
	add r0, r5, lsl #2	// r0 = r0 + r5 * 4 ( r0=r5 * 12 )
	add r0, r6, lsl #2	// r0 = r0 + r6 * 4 ( r0=r5 * 12 + r6 * 4 )
	add r0, r4		// r0 = r0 + base_address_of_a

	// read in value from keyboard with scanf
	mov r1, r0
	ldr r0, =scan_pt
	bl scanf

	add r6, #1		// column index++
	cmp r6, #3
	bne for_col_index
for_col_index_done:
	add r5, #1		// row index++
	bal for_row_index
for_row_index_done:

//////////////////////////////////////////////////////////////////////////

        mov r5, #0              // r5 = row index
        mov r1, #0              // r1 holds the sum of the matrix

for_row_index2:
        mov r6, #0              // r6 = column index
        cmp r5, #3
        beq for_row_index_done2
for_col_index2:

        mov r0, r5, lsl #3      // r0 = r5 * 8
        add r0, r5, lsl #2      // r0 = r0 + r5 * 4 ( r0=r5 * 12 )
        add r0, r6, lsl #2      // r0 = r0 + r6 * 4 ( r0=r5 * 12 + r6 * 4 )
        add r0, r4              // r0 = r0 + base_address_of_a

	ldr r3, [r0]
	mov r2, r6
	mov r1, r5
	ldr r0, =output
	bl printf

        add r6, #1              // column index++
        cmp r6, #3
        bne for_col_index2
for_col_index_done2:
        add r5, #1              // row index++
        bal for_row_index2
for_row_index_done2:

	pop {pc}
