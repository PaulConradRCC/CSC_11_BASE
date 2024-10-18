//#include <cstdio>
.global main

.align 8
.section .rodata
prompt:	   .asciz "Enter a 32 bit signed integer: "
scan_str:  .asciz "%d"
debug_msg: .asciz "DEBUG: number=%d, %d & 1 = %d\n"
even_msg:  .asciz "%d is even!\n"
odd_msg:   .asciz "%d is odd!\n"

.align 8
.section .data
number:    .word  0

.align 8
.section .text
adr_prompt:	.dword	prompt
adr_scan_str:	.dword	scan_str
adr_debug_msg:	.dword	debug_msg
adr_even_msg:	.dword	even_msg
adr_odd_msg:	.dword	odd_msg
adr_number:	.dword	number

main:	// int main()
	stp fp, lr, [sp, -16]!	 //{
	// done on line 14 // int number;
	ldr x18, adr_number

	// printf("Enter a 32 bit signed integer: ");
	ldr x0, adr_prompt
	bl printf

	// scanf("%d", &number);
	ldr x0, adr_scan_str
	mov x1, x18
	bl scanf

	ldr w19, [x18]

	and w20, w19, #1	// do bitwise AND 1 on w19, x20 holds result

	// printf("DEBUG: number=%d, %d & 1 = %d\n",number,number,number & 1);
	ldr x0, adr_debug_msg
	mov x1, x19
	mov x2, x19
	mov x3, x20
	bl printf

	//if ( (number & 1) == 0 )
	cmp w20, #0
	bne w20_ne_0
	ldr x0, adr_even_msg
	b end_w20_ne_0
w20_ne_0:
	ldr x0, adr_odd_msg
	//ldreq r0, =even_msg
	//bleq printf
	//ldrne r0, =odd_msg
	//blne printf
end_w20_ne_0:
	mov x1, x19
	bl printf

	// printf("%d is even!\n",number);
	// else
	// printf("%d is odd!\n",number);

	//return 0;
	mov w0, #0
	ldp fp, lr, [sp], 16
	ret // }
