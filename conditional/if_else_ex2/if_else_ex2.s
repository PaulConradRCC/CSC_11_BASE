.global main

.align 4
.text

main:
	mov r4, #9
	mov r5, #9

	cmp r4, r5     // the c** in this example is NE for not equal.

	addne r6, r4, r5  /////
	subne r7, r5, r4  ///// execute when r4 != r5
	addne r8, r4, r4  /////

	subeq r6, r4, r5  /////
	subeq r7, r5, r4  ///// execute when r4 == r5
	muleq r8, r4, r4  /////

	// what are the values of R6, R7, R8?

	mov pc, lr // make program counter the current lr content to exit program
