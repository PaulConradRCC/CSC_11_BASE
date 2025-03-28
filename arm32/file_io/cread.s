	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"cread.cpp"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"O_RDONLY=%d, O_WRONLY=%d, O_RDWR=%d\015\012\000"
	.align	2
.LC1:
	.ascii	"filename\000"
	.align	2
.LC2:
	.ascii	"Error: can't read file\000"
	.align	2
.LC3:
	.ascii	"%d\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	.fnstart
.LFB2:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #32
	sub	sp, sp, #32
	sub	r3, fp, #32
	mov	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	mov	r3, #2
	mov	r2, #1
	mov	r1, #0
	ldr	r0, .L7
	bl	printf
	mov	r1, #0
	ldr	r0, .L7+4
	bl	open
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmn	r3, #1
	bne	.L2
	ldr	r0, .L7+8
	bl	puts
	mov	r3, #1
	b	.L6
.L2:
	sub	r3, fp, #32
	mov	r2, #20
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	read
	ldr	r0, [fp, #-12]
	bl	close
	mov	r3, #0
	str	r3, [fp, #-8]
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	bgt	.L4
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-28]
	mov	r1, r3
	ldr	r0, .L7+12
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L5
.L4:
	mov	r3, #0
.L6:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.fnend
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
