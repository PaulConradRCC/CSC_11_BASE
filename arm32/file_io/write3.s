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
	.file	"write3.cpp"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"C:\\program.txt\000"
	.align	2
.LC1:
	.ascii	"wb\000"
	.align	2
.LC2:
	.ascii	"Error!\000"
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
	ldr	r0, .L6
	ldr	r1, .L6+4
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L2
	ldr	r0, .L6+8
	bl	printf
	mov	r0, #1
	bl	exit
.L2:
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L3
.L4:
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, #1
	str	r3, [fp, #-16]
	sub	r3, fp, #24
	mov	r0, r3
	mov	r1, #12
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L4
	ldr	r0, [fp, #-12]
	bl	fclose
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L7:
	.align	2
.L6:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.fnend
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
