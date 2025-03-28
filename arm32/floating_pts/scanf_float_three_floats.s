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
	.file	"scanf_float_three_floats.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%f + %f = %f\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB0:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #24
	sub	sp, sp, #24
	ldr	r3, .L3
	str	r3, [fp, #-8]	@ float
	ldr	r3, .L3+4
	str	r3, [fp, #-12]	@ float
	flds	s15, [fp, #-8]
	fcvtds	d5, s15
	flds	s15, [fp, #-12]
	fcvtds	d6, s15
	flds	s14, [fp, #-8]
	flds	s15, [fp, #-12]
	fadds	s15, s14, s15
	fcvtds	d7, s15
	fstd	d6, [sp]
	fstd	d7, [sp, #8]
	ldr	r0, .L3+8
	fmrrd	r2, r3, d5
stp:
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	1078984704
	.word	1087729828
	.word	.LC0
	.fnend
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
