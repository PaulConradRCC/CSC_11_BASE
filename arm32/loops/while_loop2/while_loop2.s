/*
demonstrate:

while ( r1 <= 10 && r2 <= 5)
{
	...
	r1++;
	r2++;
}

*/
.global main

.align 4
.text
main:
	mov r1, #0
	mov r2, r1

while_lp1:
	cmp r1, #10	// compare r1 and 10
	cmple r2, #5	// compare r2 and 5 if prev. compare less than/equal
	bgt end_while_lp1 // branch to end if r1 > 10 or r2 > 5

	add r1, #1
	add r2, #1
	b while_lp1
end_while_lp1:
	mov pc, lr
