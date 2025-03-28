.global main
.section .data

x: .double 10.3

.text
main:
	ldr r0, =x
	vldr d0, [r0]
	vsqrt.f64 d0,d0
	mov pc, lr
