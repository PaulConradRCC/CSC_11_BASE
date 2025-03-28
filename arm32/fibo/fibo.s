.global fibo
fibo:
	push {lr}
	cmp r0, #2
	blt fibo_done
	sub r1, r0, #1
	sub r2, r0, #2
	mov r0, r1
	push {r2}
	bl fibo
next1:	pop {r2}
	push {r0}
	mov r0, r2
	bl fibo
next2:	pop {r1}
	add r0, r0, r1
	pop {pc}
fibo_done:
	pop {pc}
