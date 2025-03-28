.fpu neon

.section .data
.align 8
x: .word 0, 0, 0, 0, 0, 0, 0, 0
y: .word 0, 0, 0, 0, 0, 0, 0, 0

.section .rodata
.align 8
scan_fmt: .asciz "%d %d %d %d %d %d %d %d"
prompt: .asciz "Enter eight integer values (seperated by space): "

stride1_out: .asciz "Strides of 1: %d, %d, %d, %d, %d, %d, %d, %d\n"
stride2_out: .asciz "Strides of 1: %d, %d, %d, %d, %d, %d, %d, %d\n"
stride4_out: .asciz "Strides of 1: %d, %d, %d, %d, %d, %d, %d, %d\n"

.section .text
.align 8
.global main
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
	vld1.32 {q0,q1}, [r5]
	vst1.32 {q0,q1}, [r6]

	ldr r0, =stride1_out
	ldr r1, [r6]
	ldr r2, [r6, #4]
	ldr r3, [r6, #8]
	ldr r4, [r6, #28]
	push {r4}	// aapcs states fourth pointer must be on stack
	ldr r4, [r6, #24]
	push {r4}
	ldr r4, [r6, #20]
	push {r4}
	ldr r4, [r6, #16]
	push {r4}
	ldr r4, [r6, #12]
	push {r4}
	bl printf
	add sp, #20

//////////////////////////////////////////////////////////////////

	ldr r5, =x
	ldr r6, =y
	vld1.32 {q0,q1}, [r5]
	vst2.32 {q0,q1}, [r6]

	ldr r0, =stride1_out
	ldr r1, [r6]
	ldr r2, [r6, #4]
	ldr r3, [r6, #8]
	ldr r4, [r6, #28]
	push {r4}	// aapcs states fourth pointer must be on stack
	ldr r4, [r6, #24]
	push {r4}
	ldr r4, [r6, #20]
	push {r4}
	ldr r4, [r6, #16]
	push {r4}
	ldr r4, [r6, #12]
	push {r4}
	bl printf
	add sp, #20

//////////////////////////////////////////////////////////////////

	ldr r5, =x
	ldr r6, =y
	vld1.32 {q0,q1}, [r5]
	vst4.32 {q0,q1}, [r6]

	ldr r0, =stride1_out
	ldr r1, [r6]
	ldr r2, [r6, #4]
	ldr r3, [r6, #8]
	ldr r4, [r6, #28]
	push {r4}	// aapcs states fourth pointer must be on stack
	ldr r4, [r6, #24]
	push {r4}
	ldr r4, [r6, #20]
	push {r4}
	ldr r4, [r6, #16]
	push {r4}
	ldr r4, [r6, #12]
	push {r4}
	bl printf
	add sp, #20
	
	pop {pc}
