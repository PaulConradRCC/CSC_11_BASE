// test driver program for div_mod_func.s utility functions for division and modulus
// how to compile: g++ div_test.s div_mod_func.s -o div_test

.global main
.text
.align 2

main:
	push {lr}

	mov r4, #16 // a = 16
	mov r5, #11 // b = 11

	mov r0, r4
	mov r1, r5
	bl div_mod // r0 = a % b => 5, and r1 = a / b = 1

	push {r0, r1}
	ldr r0, =div_mod_result1
	mov r1, r4
	mov r2, r5
	bl printf
	pop {r0, r1}

	mov r2, r1
	mov r1, r0
	ldr r0, =div_mod_result2
	bl printf

	pop {pc}

.data
.align 2
div_mod_result1: .asciz "Result of div_mod(%d, %d) is: "
div_mod_result2: .asciz " mod=%d, div=%d\n"

