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
// note: the above commented code was for ARM32, this source file will have the ARM32 assembly code
// converted to ARM64, not converting the C code to ARM64, not needed
.global main

.align 8
.section .rodata	// read only data section
prompt:		.asciz	"Enter two integers, value 1 and value 2 (separate values with a space): "
scan_str:	.asciz	"%d %d"
message_1:	.asciz	"Value 1 is greater than value 2...\n"
message_2:	.asciz  "Value 1 is less than or equal to value 2...\n"

.align 8
.section .data			// non read only data goes here
value1:		.word	0	// R4_label renamed to value1, this is to avoid any confusion post conversion.
value2:		.word	0	// R5_label renamed to value2, this is to avoid any confusion post conversion.

.align 8
.section .text

adr_prompt:	.dword	prompt
adr_scan_str:	.dword	scan_str
adr_message_1:	.dword	message_1
adr_message_2:	.dword	message_2
adr_value1:	.dword	value1
adr_value2:	.dword	value2

main:
	stp fp, lr, [sp, -16]!

	ldr x0, adr_prompt		// x0 has address of prompt string
	bl printf			// print the prompt

	ldr x18, adr_value1		// x18 has address of value1
	ldr x19, adr_value2		// x19 has address of value2

	ldr x0, adr_scan_str
	mov x1, x18			// make a copy of x18 content in x1
	mov x2, x19			// make a copy of x19 content in x2
	bl scanf			// call scanf and get the two integer values

	ldr w0, [x18]			// w0 = *(x18);
	ldr w1, [x19]			// w1 = *(x19);

	// compare r4 and r5 (aka compare value 1 and value 2)
	cmp w0, w1
	// conditional execution from ARM32 commented out as it will not work with ARM64
	//ldrgt r0, adr_message_1 		// if r4 > r5, load into r0, address of message_1
	//ldrle r0, adr_message_2		// if r4 <= r5, load into r0, address of message_2
	// code below is a way to do the commented code above in ARM64
	ble w0_le_w1
	// this sectoion is for greater than
	ldr x0, adr_message_1
	b end_w0_le_w1
w0_le_w1:
	ldr x0, adr_message_2
end_w0_le_w1:
	bl printf

	mov w0, #0
	ldp fp, lr, [sp], 16
	ret
