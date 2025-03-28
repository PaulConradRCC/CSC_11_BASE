.fpu neon

.section .data
.align 4
x: .float 0.0, 0.0, 0.0, 0.0
y: .float 0.0, 0.0, 0.0, 0.0

.section .rodata
.align 4
scan_fmt: .asciz "%f %f %f %f"
prompt: .asciz "Enter four floating point values (seperated by space): "

stride1_out: .asciz "Strides of 1: %f, %f, %f, %f\n"
stride2_out: .asciz "Strides of 2: %f, %f, %f, %f\n"

.section .text
.align 4
.global main
main:
	push {lr}
	ldr r0, =prompt
	bl printf

	ldr r0, =scan_fmt
	ldr r1, =x
	add r2, r1, #4
	add r3, r1, #8
	add r4, r1, #12
	push {r4}	// aapcs states fourth pointer must be on stack
	bl scanf
	add sp, #4	// set sp back to what it was before push {r4}

//////////////////////////////////////////////////////////////////////
	ldr r5, =x
	ldr r6, =y
	vld1.32 {q0}, [r5]
	vst1.32 {q0}, [r6]

	add fp, sp, #24
	sub sp, sp, #28
	ldr r0, =stride1_out
	mov r1, r6
	vldr s0, [r1]
	vcvt.f64.f32  d5, s0    // convert first value to double
        vmov r2, r3, d5       // pass in r2/r3

	vldr s0, [r1, #4]
	vcvt.f64.f32 d6, s0    // convert second value to double
	vstr d6, [sp]

	vldr s0, [r1, #8]
	vcvt.f64.f32 d6, s0
	vstr d6, [sp, #8]

	vldr s0, [r1, #12]
	vcvt.f64.f32 d6, s0
	vstr d6, [sp, #16]
	bl printf
	add sp, #28
//////////////////////////////////////////////////////////////////

	ldr r5, =x
	ldr r6, =y
	vld1.32 {q0}, [r5]
	vst2.32 {q0}, [r6]

	add fp, sp, #24
	sub sp, sp, #28
	ldr r0, =stride2_out
	mov r1, r6
	vldr s0, [r1]
	vcvt.f64.f32  d5, s0    // convert first value to double
        vmov r2, r3, d5       // pass in r2/r3

	vldr s0, [r1, #4]
	vcvt.f64.f32 d6, s0    // convert second value to double
	vstr d6, [sp]

	vldr s0, [r1, #8]
	vcvt.f64.f32 d6, s0
	vstr d6, [sp, #8]

	vldr s0, [r1, #12]
	vcvt.f64.f32 d6, s0
	vstr d6, [sp, #16]
	bl printf
	add sp, #28
//////////////////////////////////////////////////////////////////

	pop {pc}
