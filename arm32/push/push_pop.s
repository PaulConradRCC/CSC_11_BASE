.global main

.text
main:
	push {r4, r6, r8, lr}

	pop {r4, r6, r8, lr}
	bx lr
