	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"printf.cpp"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Hello everyone!\000"
	.align	2
.LC1:
	.ascii	"x=%d, y=%d, z=%d, a=%d, b=%d, c=%d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB0:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	.save {lr}
	.pad #44
	sub	sp, sp, #44
	ldr	r0, .L3
	bl	puts
	mov	r3, #1
	str	r3, [sp, #36]
	mov	r3, #3
	str	r3, [sp, #32]
	mov	r3, #5
	str	r3, [sp, #28]
	mov	r3, #42
	str	r3, [sp, #24]
	mov	r3, #35
	str	r3, [sp, #20]
	mov	r3, #21
	str	r3, [sp, #16]
	ldr	r3, [sp, #24]
	str	r3, [sp]
	ldr	r3, [sp, #20]
	str	r3, [sp, #4]
	ldr	r3, [sp, #16]
	str	r3, [sp, #8]
	ldr	r0, .L3+4
	ldr	r1, [sp, #36]
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #28]
	bl	printf
	mov	r3, #0
	mov	r0, r3
	add	sp, sp, #44
	@ sp needed
	ldr	pc, [sp], #4
.L4:
	.align	2
.L3:
	.word	.LC0
	.word	.LC1
	.fnend
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
