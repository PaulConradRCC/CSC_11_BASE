.global main

.align 8
.text

main:
	mov x4, #9
	mov x5, #9

	cmp x4, x5     // the c** in this example is NE for not equal.
	bne x4_ne_x5
	//subeq r6, r4, r5  /////
	//subeq r7, r5, r4  ///// execute when r4 == r5
	//muleq r8, r4, r4  /////
	sub x6, x4, x5
	sub x7, x5, x4
	mul x8, x4, x4
	b end_x4_ne_x5
x4_ne_x5:
	//addne r6, r4, r5  /////
	//subne r7, r5, r4  ///// execute when r4 != r5
	//addne r8, r4, r4  /////
	add x6, x4, x5
	sub x7, x5, x4
	add x8, x4, x4
end_x4_ne_x5:
	// what are the values of R6, R7, R8?
	mov w0, #0
	ret
