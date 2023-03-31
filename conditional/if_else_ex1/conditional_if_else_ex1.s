.global main

.align 4
.text

main:
	mov r0, #3
	mov r1, #5
	mov r2, #5

	cmp r0, r1    // the cc* in this example is GT for greater than in true part
	addgt r3, r1, r2
	suble r4, r2, r1 // le is the inverse cc* of the true part

	mov pc, lr // make program counter the current lr content to exit program
