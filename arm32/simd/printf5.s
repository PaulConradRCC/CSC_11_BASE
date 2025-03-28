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
	.file	"printf5.cpp"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%f, %f, %f, %f, %f, %f, %f, %f\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB0:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #88
	sub	sp, sp, #88
	ldr	r3, .L3
	str	r3, [fp, #-8]	@ float
	ldr	r3, .L3+4
	str	r3, [fp, #-12]	@ float
	ldr	r3, .L3+8
	str	r3, [fp, #-16]	@ float
	ldr	r3, .L3+12
	str	r3, [fp, #-20]	@ float
	ldr	r3, .L3+16
	str	r3, [fp, #-24]	@ float
	ldr	r3, .L3+20
	str	r3, [fp, #-28]	@ float
	ldr	r3, .L3+24
	str	r3, [fp, #-32]	@ float
	ldr	r3, .L3+28
	str	r3, [fp, #-36]	@ float
	flds	s15, [fp, #-8]
	fcvtds	d0, s15
	flds	s15, [fp, #-12]
	fcvtds	d1, s15
	flds	s15, [fp, #-16]
	fcvtds	d2, s15
	flds	s15, [fp, #-20]
	fcvtds	d3, s15
	flds	s15, [fp, #-24]
	fcvtds	d4, s15
	flds	s15, [fp, #-28]
	fcvtds	d5, s15
	flds	s15, [fp, #-32]
	fcvtds	d6, s15
	flds	s15, [fp, #-36]
	fcvtds	d7, s15
	fstd	d1, [sp]
	fstd	d2, [sp, #8]
	fstd	d3, [sp, #16]
	fstd	d4, [sp, #24]
	fstd	d5, [sp, #32]
	fstd	d6, [sp, #40]
	fstd	d7, [sp, #48]
	ldr	r0, .L3+32
	fmrrd	r2, r3, d0
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	1066192077
	.word	1074580685
	.word	1079194419
	.word	1082969293
	.word	1085276160
	.word	1087583027
	.word	1089889894
	.word	1091357901
	.word	.LC0
	.fnend
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
