.global main

main:
	push {lr}

	ldr r1, =0xC0000002
	movs r2, r1, rrx

	pop {pc}
