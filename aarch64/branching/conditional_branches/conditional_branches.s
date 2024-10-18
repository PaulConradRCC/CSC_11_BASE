// during conversion from ARM32 to ARM64 (aarch64), discovered we cannot do conditional
// branch with links such as bleq my_fun that is seen in ARM32, it is commented out and
// for ARM64.
// There are significant differences between ARM32 and ARM64 to get this
// program to work in ARM64.
// 1. There is no conditional execution like ARM32's moveq or ldreq in ARM64
// 2. The MRS and MSR do not use CPSR like in ARM32, but ARM64, we have to do
//    the CPSR flag encodings, in this program, we look at NZCV being saved and
//    restored in the function called: my_fun
.global main

.align 8
.section .text
adr_my_fun:		.dword my_fun
adr_my_other_fun:	.dword my_other_fun

main:
	stp fp, lr, [sp, -16]!

	mov x0, #2 // initialize r0 with some number, say 0
	cmp x0, #2
	beq x0_eq_2
	// code for when x0 != 2
	ldr x2, adr_my_other_fun
	b end_x0_eq_2	// jump over x0_eq_2 code block
x0_eq_2:
	ldr x2, adr_my_fun
	// note: do not need b end_x0_eq_2 instruction here because code execution will 
	// fall through the label
end_x0_eq_2:
	// bleq my_fun <- does not work in ARM64
	// blne my_other_fun <- does not work in ARM64
	blr x2		// branch with link to address in x2 register

	mov w0, #0
	ldp fp, lr, [sp], 16
	ret

my_fun:
	mrs x2, nzcv // cpsr is not in ARM64
	add x0, x0, #1
	cmp x0, #0
	msr nzcv, x2 // cpsr is not in ARM64
	ret

my_other_fun:
	mov x1, x0, lsr #1	// x1 = x0 logical shr #1
	mov x1, x1, lsl #1
	sub x0, x0, x1
	ret
