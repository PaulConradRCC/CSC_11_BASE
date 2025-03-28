	.global main
	.extern printf

.balign 4
.data

message: .asciz "The gcd of %d and %d is %d\n"

value1: .word 1543416
value2: .word 144

.balign 4
.text
main:	push {lr}	// store return address on stack
	ldr r0, =value1 // store address of value1 in r0
	ldr r0, [r0]	// store content of value1 in r0
	ldr r1, =value2 // store address of value2 in r1
	ldr r1, [r1]	// store content of value2 in r1

gcd:	cmp r0, r1	// if r0 > r1
	subgt r0, r0, r1 // r0 = r0 - r1
	sublt r1, r1, r0 //  else: r1 = r1 - r0
	bne gcd		// loop back to gcd if r0 != r1 (from cmp inst)

	push {r0}	// push onto stack our gcd since r0 is usede by printf
	ldr r0, =message // r0 contains pointer to format string
	ldr r1, =value1 // get address of value1
	ldr r1, [r1]	// get content of value1
	ldr r2, =value2 // get address of value2
	ldr r2, [r2]	// get content of value2
	pop {r3}	// r3 contain the gcd
	bl printf	// output message
	pop {pc}	// exit program


