	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"test.c"
	.text
	.align	2
	.global	_Z9ccnt_readv
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	_Z9ccnt_readv, %function
_Z9ccnt_readv:
	.fnstart
.LFB30:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax divided
@ 10 "test.c" 1
	mrc p15, 0, r0, c9, c13, 0
@ 0 "" 2
	.arm
	.syntax unified
	bx	lr
	.cantunwind
	.fnend
	.size	_Z9ccnt_readv, .-_Z9ccnt_readv
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	.fnstart
.LFB31:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.syntax divided
@ 10 "test.c" 1
	mrc p15, 0, r3, c9, c13, 0
@ 0 "" 2
@ 10 "test.c" 1
	mrc p15, 0, r1, c9, c13, 0
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, .L5
	sub	r1, r1, r3
	bl	printf
	.syntax divided
@ 10 "test.c" 1
	mrc p15, 0, r2, c9, c13, 0
@ 0 "" 2
@ 10 "test.c" 1
	mrc p15, 0, r1, c9, c13, 0
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, .L5+4
	sub	r1, r1, r2
	ldr	r0, .L5+8
	umull	r3, r1, r3, r1
	lsr	r1, r1, #6
	bl	printf
	bl	rand
	mov	r4, r0
	bl	rand
	mov	r6, r0
	bl	rand
	mov	r2, r6
	mov	r1, r4
	mov	r3, r0
	mov	r5, r0
	ldr	r0, .L5+12
	bl	printf
	.syntax divided
@ 10 "test.c" 1
	mrc p15, 0, r7, c9, c13, 0
@ 0 "" 2
	.arm
	.syntax unified
	add	r2, r4, r6
	add	r2, r2, r5
	.syntax divided
@ 10 "test.c" 1
	mrc p15, 0, r4, c9, c13, 0
@ 0 "" 2
	.arm
	.syntax unified
	add	r3, r2, #1
	ldr	r1, .L5+16
	rsb	r0, r3, r3, lsl #3
	add	r1, r2, r1
	rsb	r3, r3, r0, lsl #4
	ldr	r0, .L5+20
	add	r3, r3, r3, lsl #3
	add	r1, r3, r1
	bl	printf
	sub	r1, r4, r7
	ldr	r0, .L5+24
	bl	printf
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L6:
	.align	2
.L5:
	.word	.LC0
	.word	274877907
	.word	.LC1
	.word	.LC2
	.word	498501
	.word	.LC3
	.word	.LC4
	.fnend
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ccnt_read() call took %u clock cycles\012\000"
	.space	1
.LC1:
	.ascii	"loop overhead is %u clock cycles\012\000"
	.space	2
.LC2:
	.ascii	"%d%d%d\012\000"
.LC3:
	.ascii	"%d\012\000"
.LC4:
	.ascii	"Clocks for x=y+z statement: %u\012\000"
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
