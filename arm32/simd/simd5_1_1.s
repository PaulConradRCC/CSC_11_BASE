.fpu neon

.section .data
.align 8
x: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
y: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0

.section .rodata
.align 8
scan_fmt: .asciz "%f %f %f %f %f %f %f %f"
prompt: .asciz "Enter eight float values (seperated by space): "

stride1_out: .asciz "Strides of 1: %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf\n"
stride2_out: .asciz "Strides of 2: %f, %f, %f, %f, %f, %f, %f, %f\n"
stride4_out: .asciz "Strides of 4: %f, %f, %f, %f, %f, %f, %f, %f\n"

.section .text
.align 8
.global main

.align 8
main:
	push {lr}
	ldr r0, =prompt
	bl printf

	ldr r0, =scan_fmt
	ldr r1, =x
	add r2, r1, #4
	add r3, r1, #8
	add r4, r1, #28
	push {r4}	// aapcs states fourth pointer must be on stack
	add r4, #-4
	push {r4}
	add r4, #-4
	push {r4}
	add r4, #-4
	push {r4}
	add r4, #-4
	push {r4}
	bl scanf
	add sp, #20	// set sp back to what it was before push {r4}'s

//////////////////////////////////////////////////////////////////////
	ldr r5, =x
	ldr r6, =y
	vld1.f32 {q0,q1}, [r5]
	vst1.f32 {q0,q1}, [r6]

	add r11, sp, #4
	sub sp, sp, #57
	and sp, sp, #-8
	flds s15, [r6, #0]
	fcvtds d0, s15
	flds s15, [r6, #4]
	fcvtds d1, s15
	flds s15, [r6, #8]
	fcvtds d2, s15
	flds s15, [r6, #12]
	fcvtds d3, s15
	flds s15, [r6, #16]
	fcvtds d4, s15
	flds s15, [r6, #20]
	fcvtds d5, s15
	flds s15, [r6, #24]
	fcvtds d6, s15
	flds s15, [r6, #28]
	fcvtds d7, s15
	fmrrd r2, r3, d0
	ldr r0, =stride1_out
	fstd d1, [sp, #0]
	fstd d2, [sp, #8]
	fstd d3, [sp, #16]
	fstd d4, [sp, #24]
	fstd d5, [sp, #32]
	fstd d6, [sp, #40]
	fstd d7, [sp, #48]
	bl printf
	sub sp, r11, #4

//////////////////////////////////////////////////////////////////

	ldr r5, =x
	ldr r6, =y
	vld1.f32 {q0,q1}, [r5]
	vst2.f32 {q0,q1}, [r6]

	add r11, sp, #4
	sub sp, sp, #60
	flds s15, [r6, #0]
	fcvtds d0, s15
	flds s15, [r6, #4]
	fcvtds d1, s15
	flds s15, [r6, #8]
	fcvtds d2, s15
	flds s15, [r6, #12]
	fcvtds d3, s15
	flds s15, [r6, #16]
	fcvtds d4, s15
	flds s15, [r6, #20]
	fcvtds d5, s15
	flds s15, [r6, #24]
	fcvtds d6, s15
	flds s15, [r6, #28]
	fcvtds d7, s15
	fmrrd r2, r3, d0
	ldr r0, =stride2_out
	fstd d1, [sp, #0]
	fstd d2, [sp, #8]
	fstd d3, [sp, #16]
	fstd d4, [sp, #24]
	fstd d5, [sp, #32]
	fstd d6, [sp, #40]
	fstd d7, [sp, #48]
	bl printf
	sub sp, r11, #4

//////////////////////////////////////////////////////////////////

	ldr r5, =x
	ldr r6, =y
	vld1.f32 {q0,q1}, [r5]
	vst4.f32 {q0,q1}, [r6]

	add r11, sp, #4
	sub sp, sp, #56
	and sp, sp, #-16
	flds s15, [r6, #0]
	fcvtds d0, s15
	flds s15, [r6, #4]
	fcvtds d1, s15
	flds s15, [r6, #8]
	fcvtds d2, s15
	flds s15, [r6, #12]
	fcvtds d3, s15
	flds s15, [r6, #16]
	fcvtds d4, s15
	flds s15, [r6, #20]
	fcvtds d5, s15
	flds s15, [r6, #24]
	fcvtds d6, s15
	flds s15, [r6, #28]
	fcvtds d7, s15
	fmrrd r2, r3, d0
	ldr r0, =stride4_out
	fstd d1, [sp, #0]
	fstd d2, [sp, #8]
	fstd d3, [sp, #16]
	fstd d4, [sp, #24]
	fstd d5, [sp, #32]
	fstd d6, [sp, #40]
	fstd d7, [sp, #48]
	bl printf
	sub sp, r11, #4

//////////////////////////////////////////////////////////////////

	pop {pc}
