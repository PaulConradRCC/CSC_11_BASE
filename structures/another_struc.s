/* -- another_struc.s -- */
.global main // main is our entry point to program and must be global

.align 4
.section .data
/*
struct another_struc
{
	char f0;
	short int f1;
	int f2;
	long f3;
};
*/

some_var: .byte 123	// char f0;
	  .hword 345	// short int f1;
	  .word 456	// int f2;
	  .long 789	// long f3;

.align 4
.text
main:
	push {lr}   // push address of caller on stack

	ldr  r0, =some_var
	ldrb r1, [r0]
	ldrh r2, [r0, #1]
	ldr  r3, [r0, #3]
	ldr  r4, [r0, #7]
	ldr  r5, [r0, #11]

	pop {pc}	// return from main - several different ways we can exit from program



