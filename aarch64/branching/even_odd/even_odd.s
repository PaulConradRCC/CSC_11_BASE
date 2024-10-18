.global main
.section .rodata	// constant data goes here

prompt:		.asciz	"Enter an integer value: "
scan_str: 	.asciz	"%d"
msg1: 		.asciz	"%d is an even number!\n"
msg2: 		.asciz	"%d is an odd number!\n"

.data	// non constant data goes here
value:	.word	0

.text	// program instruction code goes here

main:
	push {lr} //{

	// prompt for an integer value
	// printf(prompt);
	ldr r0, =prompt
	bl printf

	// read in from the keyboard the integer value
	// scanf(scan_str, &value);
	ldr r0, =scan_str
	ldr r1, =value
	bl scanf

	// load value into register r1
	ldr r1, =value
	ldr r1, [r1]

	// do a logical AND 1 against value, if 0, value is even, else value is odd 
	// if ( (r1 & 1)==0 )
if_r1_and_1_eq_0:
	and r0, r1, #1
	cmp r0, #0
	bne else_r1_and_1_ne_0
	//{
	//	printf(msg1, value);
	//}
	// code for the "true" part
	ldr r0, =msg1
	bl printf
	b end_if_r1_and_1_eq_0
	// else
else_r1_and_1_ne_0:
	//{
	//	printf(msg2, value);
	ldr r0, =msg2
	bl printf
	//} // end if/else block
end_if_r1_and_1_eq_0:

	// return 0;
	mov r0, #0
	//}
	pop {pc}
