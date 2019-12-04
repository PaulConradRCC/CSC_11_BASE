.fpu neon // needed for q-register work

.global main
.align 8
.section .rodata
prompt1: .asciz "Enter first set of four floating point values (seperate with space): "
prompt2: .asciz "Enter second set of four floating point values (seperate with space): "
scan_st: .asciz "%f %f %f %f"
output:  .asciz "The product of the set is: %6.2f, %6.2f, %6.2f, %6.2f\n"

.align 8
.section .data
a: .float 0.0, 0.0, 0.0, 0.0
b: .float 0.0, 0.0, 0.0, 0.0
c: .float 0.0, 0.0, 0.0, 0.0

.align 8
.text
main:
	push {lr}

	// first prompt
	ldr r0, =prompt1
	bl printf

	// get first set of four floats
	ldr r0, =scan_st
	ldr r1, =a
	add r2, r1, #4
	add r3, r1, #8
	add r4, r1, #12
	push {r4}
	bl scanf
	pop {r4}

	// second prompt
	ldr r0, =prompt2
	bl printf

	// get second set of four floats
	ldr r0, =scan_st
	ldr r1, =b
	add r2, r1, #4
	add r3, r1, #8
	add r4, r1, #12
	push {r4}
	bl scanf
	pop {r4}

	// let's load in the two sets of four float values into the q-registers
	ldr r0, =a
	vld1.32 {q0,q1}, [r0]
	vmul.f32 q2,q0,q1
	ldr r0, =c
	vst1.32 {q2}, [r0]

	// align stack pointer to 8 byte boundary to make printf happy with floats
	push {r11}
	mov r11, sp
	sub sp, #24	// allocate space for 3 64-bit doubles on local frame
	and sp, #-8	// ensure sp is a multiple of 8 with a bit-wise and masking

	// output the results
	ldr r0, =output
	vcvt.f64.f32 d0, s8	// put 64-bit conversion of s8 into d0
	vmov r2, r3, d0		// r2 holds bits [0:31] of d0, r3 holds bits [31:63] of d0

	vcvt.f64.f32 d0, s9	// put 64-bit conversion of s9 into d0
	vstr d0, [sp]

	vcvt.f64.f32 d0, s10	// put 64-bit conversion of s10 into d0
	vstr d0, [sp,#8]

	vcvt.f64.f32 d0, s11	// put 64-bit conversion of s11 into d0
	vstr d0, [sp,#16]
	bl printf

	// all done, set sp back to original spot before 8 byte boundary adjustments
	mov sp, r11
	pop {r11}

	pop {pc}
