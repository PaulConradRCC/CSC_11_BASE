.global main

.align 8
.section .rodata	// constant data goes here
prompt:		.asciz	"Enter an integer value: "
scan_str: 	.asciz	"%d"
msg1: 		.asciz	"%d is an even number!\n"
msg2: 		.asciz	"%d is an odd number!\n"

.align 8
.section .data	// non constant data goes here
value:	.word	0

.align 8
.section .text	// program instruction code goes here
adr_prompt:	.dword	prompt
adr_scan_str:	.dword	scan_str
adr_msg1:	.dword	msg1
adr_msg2:	.dword	msg2
adr_value:	.dword	value

main:
	stp fp, lr, [sp, -16]!	 //{

	// prompt for an integer value
	// printf(prompt);
	ldr x0, adr_prompt
	bl printf

	// read in from the keyboard the integer value
	// scanf(scan_str, &value);
	ldr x0, adr_scan_str
	ldr x1, adr_value
	bl scanf

	// load value into register r1
	ldr x1, adr_value
	ldr x1, [x1]

	// do a logical AND 1 against value, if 0, value is even, else value is odd 
	// if ( (r1 & 1)==0 )
if_x1_and_1_eq_0:
	and x0, x1, #1
	cmp x0, #0
	bne else_x1_and_1_ne_0
	//{
	//	printf(msg1, value);
	//}
	// code for the "true" part
	ldr x0, adr_msg1
	bl printf
	b end_if_x1_and_1_eq_0
	// else
else_x1_and_1_ne_0:
	//{
	//	printf(msg2, value);
	ldr x0, adr_msg2
	bl printf
	//} // end if/else block
end_if_x1_and_1_eq_0:

	// return 0;
	mov w0, #0
	//}
	ldp fp, lr, [sp], 16
	ret
