.global main

.align 4
.text
main:
	push {lr}

	mov r0, #0 // initialize r0 with some number, say 0
	cmp r0, #0
	bleq my_fun
	blne my_other_fun

	mov r0, #2
	pop {pc}

my_fun:
	mrs r2, cpsr
	add r0, r0, #1
	cmp r0, #0
	msr cpsr, r2
	mov pc, lr

my_other_fun:
	mov r1, r0, lsr #1	// r1 = r0 logical shr #1
	mov r1, r1, lsl #1
	sub r0, r0, r1
	mov pc, lr
