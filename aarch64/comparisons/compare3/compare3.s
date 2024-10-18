// similar to compare2.s but with 64 bit integers (dword)
.global main

.align 8
.section .rodata
prompt:			.asciz "Enter two 64 bit integers: "
scan_str:		.asciz	"%ld %ld"
output_msg:		.asciz "%ld > %ld is "
true_msg:		.asciz "true\n"
false_msg:		.asciz "false\n"

.align 8
.section .data
val1:			.dword	0
val2:			.dword	0

.align 8
.section .text
adr_prompt:		.dword	prompt
adr_scan_str:		.dword	scan_str
adr_output_msg:		.dword	output_msg
adr_true_msg:		.dword	true_msg
adr_false_msg:		.dword	false_msg
adr_val1:		.dword	val1
adr_val2:		.dword	val2

main:
	stp fp, lr, [sp, -16]!
	// assembly program here
	ldr x18, adr_val1
	ldr x19, adr_val2

	// prompt user for two 32 bit integers
	ldr x0, adr_prompt
	bl printf

	// read in the two 32 bit integers from the keyboard via scanf
	ldr x0, adr_scan_str
	ldr x1, adr_val1
	ldr x2, adr_val2
	bl scanf

	// load from memory, the values for val1 and val2,
	// storing the values in r4 and r5, respectively
	ldr x20, [x18]	// note: using x register for 64 bits in these next two instructions since
	ldr x21, [x19]  // val1 and val2 are .dword (64 bits)

	ldr x0, adr_output_msg
	mov x1, x20
	mov x2, x21
	bl printf

	cmp x20, x21 // use debugger see what happens to CPSR...
	ble x20_le_x21
	ldr x0, adr_true_msg
	b end_x20_le_x21
x20_le_x21:
	ldr x0, adr_false_msg
end_x20_le_x21:
	// ldrgt r0, adr_true_msg	// if r4 > r5, then r0 = &true_msg
	// ldrle r0, adr_false_msg	// if r4 <= r5, then r0 = &false_msg
	bl printf

	mov w0, #0 // return code for your program (must be 8 bits)
	ldp fp, lr, [sp], 16
	ret
