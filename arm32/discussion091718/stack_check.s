.global main

main:

	mov r0, #123
	mov r1, #-123
	mov r2, #89

	push {r0}
	push {r1}
	push {r2}

	pop {r2}
	pop {r1}
	pop {r0}

	mov pc, lr
