.fpu neon

.section .data
.align 4
x: .float 0.0, 0.0, 0.0, 0.0
y: .float 0.0, 0.0, 0.0, 0.0
r: .float 0.0, 0.0, 0.0, 0.0

.section .rodata
.align 4
scan_fmt: .asciz "%f %f %f %f"
prompt1: .asciz "Enter first set of four floating point values (seperated by space): "
prompt2: .asciz "Enter second set of four floating point values (seperated by space): "

out_x: .asciz "  %12f, %12f, %12f, %12f\n"
out_y: .asciz "- %12f, %12f, %12f, %12f\n"
out_r: .asciz "  %12f, %12f, %12f, %12f\n"

.section .text
.align 4
.global main

// pass: r0=pointer to format string for outputing float with four float values
//		 r1=pointer to vector
output_vector4:
	push {lr}
	add r11, sp, #0
	sub sp, sp, #28
	and sp, sp, #-8			// force stack pointer address to be multiple of 8
	
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
	add sp, r11, #0
	pop {pc}

//////////////////////////////////////////////////////////////////////

main:
	push {lr}
	ldr r0, =prompt1
	bl printf

	ldr r0, =scan_fmt
	ldr r1, =x
	add r2, r1, #4
	add r3, r1, #8
	add r4, r1, #12
	push {r4}	// aapcs states fourth pointer must be on stack
	bl scanf
	add sp, #4	// set sp back to what it was before push {r4}
	
	ldr r0, =prompt2
	bl printf

	ldr r0, =scan_fmt
	ldr r1, =y
	add r2, r1, #4
	add r3, r1, #8
	add r4, r1, #12
	push {r4}	// aapcs states fourth pointer must be on stack
	bl scanf
	add sp, #4	// set sp back to what it was before push {r4}

	ldr r0, =out_x
	ldr r1, =x
	bl output_vector4
	
	ldr r0, =out_y
	ldr r1, =y
	bl output_vector4
	
//////////////////////////////////////////////////////////////////////

	ldr r5, =x
	ldr r6, =r
	
	vld1.32 {q0,q1}, [r5]	// Q0=x, Q1=y
	vsub.f32 q0,q0,q1		// Q0 = Q0 + Q1
	vst1.32 {q0}, [r6]
	
	ldr r0, =out_r
	mov r1, r6
	bl output_vector4

//////////////////////////////////////////////////////////////////

	pop {pc}
