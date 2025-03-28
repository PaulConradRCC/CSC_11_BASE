.global main

.data
out_str: .asciz "r1=%d, r2=%d, r3=%d\n"

.align 4
.text
main:
	push {lr}
	// demonstrates: z = x++ + ++y
	// with mapping of r1=x, r2=y, and r3=z
	mov r1, #5
	mov r2, #6
	add r2, #1 // pre-increment r2 ("y") by 1
	add r3, r1, r2 // r3 = r1 + r2
	add r1, #1 // post-increment r1 ("x") by 1

	ldr r0, =out_str
	bl printf

	pop {pc}
