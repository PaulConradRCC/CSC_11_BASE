.global main

.align 8
.section .data
x: .word 0x12345678, 0xabcdef01
y: .word 0x87654321, 0x01fedcba
r: .word 0x0, 0x0

.align 8
.text
adr_x:	.dword	x
adr_y:	.dword	y
adr_r:	.dword	r

main:
	stp x29, x30, [sp, -16]!

	ldr x6, adr_x	// x6 contains the address of x, this is like &x in c/c++
	ldr x7, adr_y	// x7 contains the address of y, this is like &y in c/c++
	ldr x8, adr_r	// x8 contains the address of r, this is like &r in c/c++

	// load in the lower 32 bit parts
	ldr w0, [x6]	// dereference address in r6 to get data, like *(&x) in c/c++
	ldr w1, [x6, #4]// dereference address in (r6+4) to get data, in c/c++ *(&x+4)

	ldr w2, [x7]	// deref address in r7
	ldr w3, [x7, #4]// deref address in r7+4

	// do the addition
	adds w5, w1, w3
	adcs w4, w0, w2

	// store the results
	str w4, [x8]	// *(r8) = r4;
	str w5, [x8, #4]// *(r8+4) = r5;

	mov w0, #0
	ldp x29, x30, [sp], 16
	ret

