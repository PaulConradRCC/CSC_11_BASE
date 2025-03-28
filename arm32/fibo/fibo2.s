// to see the result, which is the return value in main,
// type: echo $? on the command line after program execution.

.global fibo
.global main

.text
main:
	push {lr}
	mov r0, #11
	bl fibo
	pop {pc}

fibo:
	push {lr}
	cmp r0, #2
	// ldrlt pc, [sp], #4	// pop {pc} if less than
	poplt {pc}
	sub r0, #1
	push {r0}
	bl fibo
	pop {r1}
	push {r0}
	sub r0, r1, #1
	bl fibo
	pop {r1}
	add r0, r0, r1
	pop {pc}
