//#include <cstdio>
//#include <fcntl.h>
.global main

.section .rodata
out:	.asciz	"%d\n"

main:
//int main()
//{
	push {lr}
//	printf("%d\n",O_WRONLY);
	ldr r0, =out
	mov r1, #O_WRONLY
	bl printf
	
//	return 0;
	mov r0, #0
//}
	pop {pc}
