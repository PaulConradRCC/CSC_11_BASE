.global main

.section .rodata
prompt_msg:	.asciz	"Enter a value for x and y: "
scan_str:	.asciz	"%u %u"
result_msg:	.asciz	"%u + %u = %u\n"

.data
x:	.word	0
y:	.word	0

.text
main:	push {lr}

	// our code here
	// output our prompt
	ldr r0, =prompt_msg
	bl printf

	// get the input from user
	ldr r0, =scan_str
	ldr r1, =x
	ldr r2, =y
	bl scanf

	// load the data in x label into r4, and
	// data in y label into r5.
	ldr r0, =x
	ldr r1, =y
	ldr r4, [r0]	// r4 holds value of x
	ldr r5, [r1]	// r5 holds value of y

	// let's compare x (r4) and y (r5)
	cmp r4, r5

	// let's add x+y (essentially r4+r5) and store in r3
	adds r3, r4, r5

	// output the results
	ldr r0, =result_msg
	mov r1, r4	// r1 = r4, r1 holds value of x
	mov r2, r5	// r2 = r5, r2 holds value of y
	// YAGNI! mov r3, r6	// r3 = r6, r3 holds the value in r6, which is r4+r5
	bl printf

	mov r0, #0
	pop {pc}
