.global main

.align 4
.data
//// int x_value, y_value, z_value;
x_value:	.word	0
y_value:	.word	0
z_value:	.word	0

.align 4
.section .rodata

prompt:		.asciz	"Enter the values for x, y, and z (separate values with a space): "
output_str:	.asciz	"X: %d, Y: %d, Z: %d\n"
scan3integers:	.asciz	"%d %d %d"

.align 4
.text
main:
	push {lr}		// save lr to stack since it has address to shutdown code after main is done

	ldr r4, =x_value	// r4 is pointer to label x_value
	ldr r5, =y_value	// r5 is pointer to label y_value
	ldr r6, =z_value	// r6 is pointer to label z_value

	//// prompt user to enter values for x, y, and z with values separated by a space
	//// cout << "Enter the values for x, y, and z (separate values with a space): ";

	ldr r0, =prompt		// load in r0, the address of prompt
	bl printf		// call printf to display prompt

	//// cin >> x_value >> y_value >> z_value;

	ldr r0, =scan3integers	// load in r0, the format string for reading 3 integers
	mov r1, r4		// copy into r1, the address in r4 ( pointer to x_value )
	mov r2, r5		// copy into r2, the address in r5 ( pointer to y_value )
	mov r3, r6		// copy into r3, the address in r6 ( pointer to z_value )
	bl scanf		// call scanf and read in 3 integer values
stop_scanf:
	//// output the value
	//// cout << "X: " << x_value << ", Y: " << y_value << ", Z: " << z_value << endl;

	ldr r0, =output_str	// load in r0, the address of our output format string
	ldr r1, [r4]		// load in r1, the data at address stored in r4 ( r1 = *(r4); )
	ldr r2, [r5]		// load in r2, the data at address stored in r5 ( r2 = *(r5); )
	ldr r3, [r6]		// load in r3, the data at address stored in r6 ( r3 = *(r6); )
	bl printf		// output the values of x_value, y_value, and z_value to screen

	//// return 0;
	mov r0, #0		// place 0 in r0 for return value

	pop {pc}		// place original lr value on top of stack into register pc for proper exit
