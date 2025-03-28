.global main
.text

main:
	push {lr}	// save lr for exiting main function

	ldr r0, =hello_msg	// register r0 contains ptr to format string named hello_msg
	bl printf		// print out our format string named hello_msg

	ldr r0, =fmt_strng	// register r0 contains ptr to format string named fmt_strng
	ldr r12, =x		// register r12 in this program used as pointer to variables, points to x
	ldr r1, [r12]		// store content of address pointed by r12 into r1 (value of x)
	ldr r12, =y		// r12 points to y
	ldr r2, [r12]		// store value of y in r2
	ldr r12, =z		// r12 points to z
	ldr r3, [r12]		// store value of z in r3
	ldr r12, =c		// r12 poitns to c
	ldr r4, [r12]		// store value of c in r4
	push {r4}		// push r4 (a) onto stack for printf
	ldr r12, =b             // r12 points to b
        ldr r4, [r12]           // store value of b in r4
	push {r4}		// push r4 (b) onto stack for printf
        ldr r12, =a             // r12 points to a
        ldr r4, [r12]           // store value of a in r4
	push {r4}		// push r4 (c) onto stack for printf
	bl printf
	add sp, #12		// move stack pointer up 12 bytes, back to where lr is?
	
	mov r0, #0
	pop {pc}

.data

// variable / constant // literal labels
hello_msg: .asciz "Hello everyone!\n"
fmt_strng: .asciz "x=%d, y=%d, z=%d, a=%d, b=%d, c=%d\n"

x: .word 1
y: .word 3
z: .word 5
a: .word 42
b: .word 35
c: .word 21
