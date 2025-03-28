.data 
prompt: .asciz "Enter a single precision value: "
scan_pat: .asciz "%f"
output: .asciz "Value entered was %f; (y=%f, z=%f, w=%f); sum of all the values is: %f\n"

.align 2
x: .float 0.0
y: .float 2.35
z: .float -9.8765432
w: .float 0.01

.text 
.align 2
.global main
main:
	push {fp,lr}
	ldr r0, =prompt
	bl printf

	ldr r0, =scan_pat
	ldr r1, =x
	bl scanf

	ldr r0, =output
	ldr r2, =x
	vldr s0, [r2]
	vcvt.f64.f32 d5, s0
	vmov.f64 d6, d5
	vmov r2, r3, d5
	ldr r1, =y
	vldr s0, [r1]
	vcvt.f64.f32 d5, s0
	vadd.f64 d6, d5
	sub sp, #32
	vstr d5, [sp]
	ldr r1, =z
	vldr s0, [r1]
	vcvt.f64.f32 d5, s0
	vadd.f64 d6, d5
	vstr d5, [sp, #8]
	ldr r1, =w
	vldr s0, [r1]
	vcvt.f64.f32 d5, s0
	vadd.f64 d6, d5
	vstr d5, [sp, #16]
	vstr d6, [sp, #24]
	bl printf
	add sp, #32

	mov r0, #0
	pop {fp,pc}
