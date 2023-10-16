.global main

.align 4
.text

main:
	mov r0, #9 // move into r0, the integer literal 9
	cmp r0, #10 // compare r0 and integer literal 10, does test: r0-10 == 0?
	moveq r1, #1 // if r0 is equal to 10, then move into r1 the value 1
	movne r1, #2 // if r0 is not equal to 10, then move into r1, the value 2

	mov pc, lr // make program counter the current lr content to exit program
