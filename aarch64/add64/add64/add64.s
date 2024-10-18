.global main
.data

x: .word 0x0, 0x0
y: .word 0x0, 0x0
r: .word 0x0, 0x0

.text
main:
	push {lr}

	ldr r6, =x	// r6 contains the address of x, this is like &x in c/c++
	ldr r7, =y	// r7 contains the address of y, this is like &y in c/c++
	ldr r8, =r	// r8 contains the address of r, this is like &r in c/c++

	// load in the lower 32 bit parts
	ldr r0, [r6]	// dereference address in r6 to get data, like *(&x) in c/c++
	ldr r1, [r6, #4]// dereference address in (r6+4) to get data, in c/c++ *(&x+4)

	ldr r2, [r7]	// deref address in r7
	ldr r3, [r7, #4]// deref address in r7+4

	// do the addition
	adds r5, r1, r3
	adcs r4, r0, r2

	// store the results
	str r4, [r8]	// *(r8) = r4;
	str r5, [r8, #4]// *(r8+4) = r5;

	pop {pc}

