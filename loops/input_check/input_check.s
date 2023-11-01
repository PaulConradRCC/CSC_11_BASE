/*
demonstrate:

int value;

while(true)
{
	printf("Enter an integer between 1 and 5: ");
	scanf("%d", &value);

	if (value < 1 || value > 5)
		printf("ERROR - Value not in range...\n");
	else break;
}
....
*/
.global main

.align 4
.section .rodata
prompt: .asciz "Enter an integer between 1 and 5: "
scan_s: .asciz "%d"
err_mg: .asciz "ERROR - Value not in range...\n"

.align 4
.section .data
value:  .word 0

.align 4
.text
main:
	push {lr}
while_true:
	ldr r0, =prompt
	bl printf

	ldr r0, =scan_s
	ldr r1, =value
	bl scanf
bp_label:		// label for breakpoint in gdb so scanf properly halts.

	ldr r0, =value
	ldr r0, [r0]

	cmp r0, #1
	blt err_out
	cmp r0, #5
	ble end_while_loop
err_out:
	ldr r0, =err_mg
	bl printf
//kb_flush:
//	bl getchar
//	cmp r0, #13
//	bne kb_flush
	b while_true
end_while_loop:
	pop {pc}
