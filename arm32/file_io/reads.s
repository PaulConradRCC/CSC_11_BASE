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
	.file	"reads.cpp"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB6:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #32
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	add	r3, r3, #4
	ldr	r3, [r3]
	mov	r0, r3
	mov	r1, #0
	bl	open
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmn	r3, #1
	bne	.L2
	mov	r0, #1
	bl	exit
.L2:
	b	.L3
.L4:
	ldr	r3, [fp, #-8]
	sub	r2, fp, #24
	mov	r0, #1
	mov	r1, r2
	mov	r2, r3
	bl	write
	mov	r3, r0
	str	r3, [fp, #-8]
.L3:
	sub	r3, fp, #24
	ldr	r0, [fp, #-12]
	mov	r1, r3
	mov	r2, #10
	bl	read
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L4
	ldr	r0, [fp, #-12]
	bl	close
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
