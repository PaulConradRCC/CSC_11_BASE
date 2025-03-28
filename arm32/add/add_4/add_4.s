// bare bones source file
.global main

.align 4
.section .rodata
prompt:		.asciz "Enter two unsigned 32 bit integers: "
scan_str:	.asciz	"%u %u"
format_string:	.asciz "%u + %u = %u\n"
format_str2:	.asciz "%u - %u = %u\n"
format_str3:	.asciz "%u * %u = %u\n"
format_str4:	.asciz "%u * %u = "
format_str4_2:	.asciz "%llu (umull)\n"

.align 4
.section .data
val1:		.word	0
val2:		.word	0

.align 4
.text
main:
	push {lr}	// save lr (return address from main) on stack for end of main
	// assembly program here
	// prompt user for two 32 bit integers
	ldr r0, =prompt
	bl printf

	// read in the two 32 bit integers from the keyboard via scanf
	ldr r0, =scan_str
	ldr r1, =val1
	ldr r2, =val2
	bl scanf

	// load from memory, the values for val1 and val2,
	// storing the values in r4 and r5, respectively
	ldr r0, =val1
	ldr r1, =val2
	ldr r4, [r0]
	ldr r5, [r1]

	adds r6, r4, r5	// r6 = r4 + r5, s=update cpsr
	subs r7, r4, r5  // r7 = r4 - r5, s=update cpsr
	muls r8, r4, r5  // r8 = r4 * r5, s=update cpsr
	umull r9, r10, r4, r5 // r9 = r4 * r5 (31:0), r10 = r4 * r5 (63:32)

	ldr r0, =format_string	// r0 = &format_string
	mov r1, r4	// r1 = r4
	mov r2, r5	// r2 = r5
	mov r3, r6	// r3 = r6
	bl printf	// call printf with bl (branch with link)

	ldr r0, =format_str2	// r0 = &format_str2
	mov r1, r4	// r1 = r4
	mov r2, r5	// r2 = r5
	mov r3, r7	// r3 = r7
	bl printf	// call printf with bl (branch with link)

	ldr r0, =format_str3	// r0 = &format_str3
	mov r1, r4	// r1 = r4
	mov r2, r5	// r2 = r5
	mov r3, r8	// r3 = r8
	bl printf	// call printf with bl (branch with link)

	ldr r0, =format_str4	// r0 = &format_str4
	mov r1, r4	// r1 = r4
	mov r2, r5	// r2 = r5
	bl printf

	ldr r0, =format_str4_2
	mov r1, r9
	mov r2, r10	// r3 = r9
	bl printf	// call printf with bl (branch with link)

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}
	//mov pc, lr

