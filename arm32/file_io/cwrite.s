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
	.file	"cwrite.cpp"
	.section	.rodata
	.align	2
.LC1:
	.ascii	"./filename\000"
	.align	2
.LC2:
	.ascii	"Error: can't create file\000"
	.align	2
.LC0:
	.word	1
	.word	3
	.word	5
	.word	7
	.word	9
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB2:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #24
	sub	sp, sp, #24
	ldr	r3, .L5
	sub	ip, fp, #28
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	str	r3, [ip]
	ldr	r0, .L5+4
	ldr	r1, .L5+8
	ldr	r2, .L5+12
	bl	open
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmn	r3, #1
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L2
	ldr	r0, .L5+16
	bl	puts
	mov	r3, #1
	b	.L4
.L2:
	sub	r3, fp, #28
	ldr	r0, [fp, #-8]
	mov	r1, r3
	mov	r2, #20
	bl	write
	ldr	r0, [fp, #-8]
	bl	close
	mov	r3, #0
.L4:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L6:
	.align	2
.L5:
	.word	.LC0
	.word	.LC1
	.word	577
	.word	1604
	.word	.LC2
	.fnend
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
