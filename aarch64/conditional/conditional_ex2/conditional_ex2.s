.global main

.align 8
.text
main:
	mov x4, #9
	mov x5, #3

	cmp x4, x5     		// comparing x4 (in ARM32 was R4) and x5 (was R5 in ARM32)
	//addne r6, r4, r5	// if R4 != R5, R6 = R4 + R5
	//subne r7, r5, r4	// if R4 != R5, R7 = R5 - R4
	//addne r8, r4, r4	// if R4 != R5, R8 = R4 + R4
	beq end_x4_ne_x5
	add x6, x4, x5
	sub x7, x5, x4
	add x8, x4, x4
end_x4_ne_x5:
	// what are the values of x6, x7, x8?
	mov w0, #0
	ret

/*

r4 = 9;
r5 = 3;

if ( r4 != r5 )
{
	r6 = r4 + r5;
	r7 = r5 - r4;
	r8 = r4 + r4;
}

*/
