.data
.align 4
prompt: .asciz "Enter a single precision floating point value: "
.align 4
scan_pat: .asciz "%f"
.align 4
output: .asciz "You entered %f\n"

.align 4
x: .float 0.0

.text
.global main
main: 
	push {lr}
	ldr r0, =prompt
	bl printf

	ldr r0, =scan_pat
	ldr r1, =x
	bl scanf

	ldr r0, =output
	ldr r1, =x
	vldr s15, [r1]
	vcvt.f64.f32 d5, s15
	vmov r2, r3, d5
	bl printf

	mov r0, #0
	pop {pc}
