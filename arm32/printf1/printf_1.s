.global main
//.global _start
.text
//_start:
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
	ldr r12, =a		// r12 poitns to a
	ldr r4, [r12]		// store value of a in r4
	ldr r12, =b             // r12 points to b
        ldr r5, [r12]           // store value of b in r5
        ldr r12, =c             // r12 poitns to c
        ldr r6, [r12]           // store value of c in r6
	bl printf

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
