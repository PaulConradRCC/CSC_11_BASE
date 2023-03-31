// Manual conversion of C/C++ to Assembly
// 1. Create our .sections ( .rodata, .data, and .text - should follow .align 4 for now )
// 2. Include our .global main at beginning
// 3. Take main function and convert it to a label
// 4. Convert { in main to: push {lr} and convert } in main to: pop {pc}
// 5. Take all string literals, convert them to labels and store in .section .rodata
// 6. Convert all printf function calls to the Assembly equivalent found on our Canvas page
// 7. Convert all program variables to labels, and use the appropriate assembler directive
//    for the variable data type (non constant variables, so go into .section .data):
//	1. unsigned int, int 		= .word [32 bit integer]
//	2. unsigned short, short 	= .short [16 bit integer]
//	3. unsigned char, char		= .byte [8 bit integer]

.global main

.align 4
.section .rodata
name_str:	.asciz	"Name:  Paul J. Conrad\n"
course_str:	.asciz	"Course: CIS/CSC 11 - Assembly Language\n"
meeting_str:	.asciz	"Meeting: Tue/Thurs 6:00PM In Person / Online\n"

prompt1:	.asciz	"Enter first integer value: "
prompt2:	.asciz	"Enter second integer value: "

scanf_str:	.asciz	"%d"

output_str:	.asciz	"%d + %d = %d\n"

.align 4
.section .data
value1:		.word	0
value2:		.word	0
sum:		.word	0

.align 4
.text

//*** (don't need in asm) #include <cstdio>
//*** (don't need in asm) using namespace std;

main:  // step 3, convert to label: int main()
	push {lr}	// {
	// printf("Name:  Paul J. Conrad\n");
	ldr r0, =name_str
	bl printf

	// printf("Course: CIS/CSC 11 - Assembly Language\n");
	ldr r0, =course_str
	bl printf

	// printf("Meeting: Tue/Thurs 6:00PM In Person / Online\n");
	ldr r0, =meeting_str
	bl printf

	// some variables
	/// int value1, value2, sum;
	/// see step #7 in our instructions at top of code

	// prompt user for value1 and value2
	/// printf("Enter first integer value: ");
	ldr r0, =prompt1
	bl printf

	/// scanf("%d", &value1);
	ldr r0, =scanf_str
	ldr r1, =value1
	bl scanf

	/// printf("Enter second integer value: ");
	ldr r0, =prompt2
	bl printf

	/// scanf("%d", &value2);
	ldr r0, =scanf_str
	ldr r1, =value2
	bl scanf

	// add value1 and value2, storing result in sum
	/// sum = value1 + value2;
	ldr r0, =value1			// R0 = &value1;
	ldr r0, [r0]			// R0 = *R0;  [ ] is dereferencing address

	ldr r1, =value2			// R1 = &value2;
	ldr r1, [r1]			// R1 = *R1;

	add r2, r0, r1			// R2 = R0 + R1;

	ldr r0, =sum			// R0 = &sum;
	str r2, [r0]			// *R0 = R2;

	// output the result
	/// printf("%d + %d = %d\n", value1, value2, sum);
	ldr r0, =output_str
	ldr r1, =value1
	ldr r1, [r1]
	ldr r2, =value2
	ldr r2, [r2]
	ldr r3, =sum
	ldr r3, [r3]
	bl printf

	//return 0;
	mov r0, #0

	pop {pc}	//}
