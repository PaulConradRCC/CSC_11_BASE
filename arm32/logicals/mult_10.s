// this program demonstrates multiplication with arithmetic shift lefts
// instead of the mul instruction

.global main

.align 4
.section .rodata
// all constant data goes here
hello_msg:	.ascii	"Welcome to mult_10, we will multiply a value entered\n"
		.asciz	"at the keyboard by 10 without using the mul instruction!\n\n"

prompt:		.asciz	"Enter an integer value: "

scan_str:	.asciz	"%d"

result_msg:	.asciz	"10(%d) = %d\n"

.align 4
.data
// all non-constant, initialized data goes here
x:	.word	0

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	// assembly program here
	// output hello message
	ldr r0, =hello_msg
	bl printf

	// prompt for integer value
	ldr r0, =prompt
	bl printf

	ldr r0, =scan_str
	ldr r1, =x
	bl scanf

	// load the input integer value into r0
	ldr r1, =x
	ldr r1, [r1]

	// do the maths
	mov r0, r1, asl #3
	//mov r2, r1, asl #1
	add r2, r0, r1, asl #1

	// output the result
	ldr r0, =result_msg
	bl printf

	// exit
	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

