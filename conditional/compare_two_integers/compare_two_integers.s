/*
int main() ///// 1. done, got our .global and our label named main
{	   ///// 2. convert { to push {lr} and } to pop {pc}
	   ///// 3. take all string literals and put them in .section .rodata
	   ///// 4. convert all non constant variables to labels in .section .data
	   ///// 5. code all of the program code in .text section
	   ///// 6. convert return 0; to mov R0, #0

        int R4, R5;

        // prompt
        printf("Enter two integers, value 1 and value 2 (separate values with a space): ");
        scanf("%d %d", &R4, &R5);

	char *R0;

        if ( R4 > R5 )
                R0 = "Value 1 is greater than value 2...\n";
        else
                R0 = "Value 1 is less than or equal to value 2...\n";

	printf(R0);

        return 0;
}
*/
.global main

.align 4
.section .rodata	// read only data section
prompt:		.asciz	"Enter two integers, value 1 and value 2 (separate values with a space): "
scan_str:	.asciz	"%d %d"
message_1:	.asciz	"Value 1 is greater than value 2...\n"
message_2:	.asciz  "Value 1 is less than or equal to value 2...\n"

.align 4
.section .data		// non read only data goes here
R4_label:	.word	0
R5_label:	.word	0

.align 4
.text

main:
	push {lr}

	ldr r0, =prompt	// R0 has address of prompt string
	bl printf	// print the prompt

	ldr r4, =R4_label	// R4 has address of R4_label
	ldr r5, =R5_label	// R5 has address of R5_label

	ldr r0, =scan_str
	mov r1, r4		// make a copy of r4 content in r1
	mov r2, r5		// make a copy of r5 content in r2
	bl scanf		// call scanf and get the two integer values

	ldr r4, [r4]		// r4 = *(r4);
	ldr r5, [r5]		// r5 = *(r5);

	// compare r4 and r5 (aka compare value 1 and value 2)
	cmp r4, r5
	ldrgt r0, =message_1	// if r4 > r5, load into r0, address of message_1
	ldrle r0, =message_2	// if r4 <= r5, load into r0, address of message_2
	bl printf

	mov r0, #0
	pop {pc}
