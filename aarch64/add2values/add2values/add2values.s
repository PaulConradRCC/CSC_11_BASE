
.global main

.align 8
.section .rodata
prompt_msg:	.asciz	"Enter a value for x and y: "
scan_str:	.asciz	"%u %u"
result_msg:	.asciz	"%u + %u = %u\n"

.align 8
.section .data
x:	.word	0
y:	.word	0

.align 8
.text

adr_prompt_msg:	.dword	prompt_msg
adr_scan_str:	.dword	scan_str
adr_result_msg:	.dword	result_msg
adr_x:			.dword	x
adr_y:			.dword	y

main:	

	stp x29, x30, [sp, -16]!

	// our code here
	// output our prompt
	ldr x0, adr_prompt_msg
	bl printf

	// get the input from user
	ldr x0, adr_scan_str
	ldr x1, adr_x
	ldr x2, adr_y
	bl scanf

	// load the data in x label into r4, and
	// data in y label into r5.
	ldr x18, adr_x
	ldr x19, adr_y
	ldr x4, [x18]	// x4 holds value of x
	ldr x5, [x19]	// x5 holds value of y

	// let's add x+y (essentially r4+r5) and store in r3
	adds x3, x4, x5

	// output the results
	ldr x0, adr_result_msg
	mov x1, x4	// r1 = r4, r1 holds value of x
	mov x2, x5	// r2 = r5, r2 holds value of y
	// YAGNI! mov r3, r6	// r3 = r6, r3 holds the value in r6, which is r4+r5
	bl printf

	mov w0, #0
	ldp x29, x30, [sp], 16
	ret
