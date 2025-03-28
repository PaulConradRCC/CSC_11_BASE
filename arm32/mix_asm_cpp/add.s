@ add.s

@ declare add_asm as a global function so we can call it
.global	add_asm
.global add_asm2
.global add_arr

.section .text
@ here is the definition of add_asm
dbg: .asciz "...Inside function: add_asm...\n"

add_asm:
	push {r0,r1,lr}
	ldr r0, =dbg
	bl printf
	pop {r0,r1,lr}
	add r0, r0, r1      @ add r0 and r1 (first two args) and place result in r0
	mov pc, lr          @ return back to the caller

add_asm2:
	add r0, r0, r1
	add r0, r0, r2
	mov pc, lr

add_arr:
	push {r4}			// preserve r4 since we use it in our function
	mov r4, r0			// copy pointer to array (in r0) to r4
	mov r0, #0			// r0 = sum, initialized to 0
	mov r2, r0			// r2 = counter, initialized to 0
._w:	cmp r2, r1			// test: compare r2 and r1 (r1 = # of words in array)
	beq ._w_end			// branch if equal to ._w_end (end of our while loop)
	ldr r3, [r4, +r2, lsl #2]	// r3 = *(r4+r2*4)
	add r0, r0, r3			// r0 = r0 + r3
	add r2, #1			// r2++
	b ._w				// branch back to start of while loop for next test
._w_end:
	pop {r4}			// restore original value in r4
	mov pc, lr			// exit function (r0 is the return value, holding sum)
