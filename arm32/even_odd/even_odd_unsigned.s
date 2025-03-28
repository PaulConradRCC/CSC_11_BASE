//#include <cstdio>
.global main

.align 4
.section .rodata
prompt:	   .asciz "Enter a 32 bit unsigned integer: "
scan_str:  .asciz "%u"
//debug_msg: .asciz "DEBUG: number=%d, %d & 1 = %d\n"
even_msg:  .asciz "%u is even!\n"
odd_msg:   .asciz "%u is odd!\n"

.align 4
.data
number:    .word  0

.align 4
.text
main:	// int main()
	push {lr} //{
	// done on line 14 // int number;

	// printf("Enter a 32 bit unsigned integer: ");
	ldr r0, =prompt
	bl printf

	// scanf("%u", &number);
	ldr r0, =scan_str
	ldr r1, =number
	bl scanf

	ldr r4, =number
	ldr r4, [r4]

	and r5, r4, #1	// do bitwise AND 1 on r4, r5 holds result

	// printf("DEBUG: number=%d, %d & 1 = %d\n",number,number,number & 1);
	//ldr r0, =debug_msg
	//mov r1, r4
	//mov r2, r4
	//mov r3, r5
	//bl printf

	//if ( (number & 1) == 0 )
	cmp r5, #0
	ldreq r0, =even_msg
	ldrne r0, =odd_msg
	mov r1, r4
	bl printf

	// printf("%u is even!\n",number);
	// else
	// printf("%u is odd!\n",number);

	//return 0;
	mov r0, #0
	pop {pc} // }
