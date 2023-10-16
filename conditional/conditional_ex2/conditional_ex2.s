.global main

.align 4
.text

main:
	mov r4, #9
	mov r5, #3

	cmp r4, r5     		// comparing R4 and R5
	addne r6, r4, r5	// if R4 != R5, R6 = R4 + R5
	subne r7, r5, r4	// if R4 != R5, R7 = R5 - R4
	addne r8, r4, r4	// if R4 != R5, R8 = R4 + R4

	// what are the values of R6, R7, R8?

	mov pc, lr // make program counter the current lr content to exit program

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
