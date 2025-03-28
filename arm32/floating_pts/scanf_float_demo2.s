.data
output: .asciz "%f + %f = %f\n"
.balign 8
x: .float 3.25
y: .float 6.67

.text
.global main
main: 
	push {lr}

	sub sp, #16
	ldr r1, =x
	flds s0, [r1]
	ldr r1, =y
	flds s1, [r1]
	fadds s0, s0, s1

	ldr r0, =output
	fcvtds d7, s0
	fcvtds d6, s1
	fstd d6, [sp]
	fstd d7, [sp,#8]

	ldr r1, =x
	flds s15, [r1]
	fcvtds d7, s15
	vmov r1, r2, d7
	bl printf
	add sp, #16

	mov r0, #0
	pop {pc}
