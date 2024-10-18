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
.section .rodata
prompt:			.asciz 	"Enter two integers (if same, my_fun will execute, otherwise my_other_fun will execute): "
scan_str:		.asciz	"%d %d"
my_fun_msg:		.asciz	"Inside my_fun function\n"
my_other_fun_msg:	.asciz	"Inside my_other_fun function\n"

.align 8
.section .data
value1:			.word 0
value2:			.word 0

.align 8
.section .text
adr_my_fun:		.dword my_fun
adr_my_other_fun:	.dword my_other_fun
adr_prompt:		.dword prompt
adr_scan_str:		.dword scan_str
adr_my_fun_msg:		.dword my_fun_msg
adr_my_other_fun_msg:	.dword my_other_fun_msg
adr_value1:		.dword value1
adr_value2:		.dword value2

main:
	stp fp, lr, [sp, -16]!
	ldr x18, adr_value1
	ldr x19, adr_value2

	ldr x0, adr_prompt
	bl printf

	ldr x0, adr_scan_str
	mov x1, x18
	mov x2, x19
	bl scanf

	ldr w0, [x18] // load w0 with first integer
	ldr w1, [x19] // load w1 with second integer
	cmp w0, w1
	beq w0_eq_w1
	// code for when w0 != w1
	ldr x2, adr_my_other_fun
	b end_w0_eq_w1	// jump over w0_eq_w1 code block
w0_eq_w1:
	ldr x2, adr_my_fun
	// note: do not need b end_w0_eq_w1 instruction here because code execution will 
	// fall through the label
end_w0_eq_w1:
	// bleq my_fun <- does not work in ARM64
	// blne my_other_fun <- does not work in ARM64
	blr x2		// branch with link to address in x2 register

	mov w0, #0
	ldp fp, lr, [sp], 16
	ret

my_fun:
	stp fp, lr, [sp, -16]!
	mrs x20, nzcv // cpsr is not in ARM64
	ldr x0, adr_my_fun_msg
	bl printf
	add x0, x0, #1
	cmp x0, #0
	msr nzcv, x20 // cpsr is not in ARM64
	ldp fp, lr, [sp], 16
	ret

my_other_fun:
	stp fp, lr, [sp, -16]!
	ldr x0, adr_my_other_fun_msg
	bl printf
	mov x1, x0, lsr #1	// x1 = x0 logical shr #1
	mov x1, x1, lsl #1
	sub x0, x0, x1
	ldp fp, lr, [sp], 16
	ret
