//#include <cstdio>

.global main

.section .rodata
out_msg: .asciz "r1=%d, r2=%d, r3=%d, r4=%d\n"

//int main()
.align 4
.text
main:
//{
//	int r1=3, r2=5, r3=8, r4;
	mov r1, #3
	mov r2, #5
	mov r3, #8

//	r4 = r1++ + ++r2 + --r3;
	add r2, #1
	sub r3, #1

	add r4, r1, r2
	add r4, r4, r3

	add r1, #1

//	printf("r1=%d, r2=%d, r3=%d, r4=%d\n",r1,r2,r3,r4);
	push {lr}
	ldr r0, =out_msg
	push {r4}
	bl printf
	pop {r4}
	mov r0, #0
	pop {pc}
//	return 0;
//}
