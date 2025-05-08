.global main

.align 4
.section .rodata
prompt:			.asciz	"Enter values for r0, r1, and r2 (separate each value with a space): "
scan_str:		.asciz	"%d %d %d"
case_0_msg:		.asciz	"The value of r0 is zero!\n"
case_1_msg:		.asciz	"The value of r0 is one!\n"
case_2_msg:		.asciz	"The value of r0 is two!\n"
case_3_msg:		.asciz	"The value of r0 is three!\n"
case_4_msg:		.asciz	"The value of r0 is four!\n"
case_5_6_7_8_msg: 	.asciz  "The value of r0 is five, or six, or seven, or eight...\n"
case_9_10_11_msg:	.asciz  "The value of r0 is nine, or ten, or eleven...\n"
default_msg:	.asciz	"This is the default output when r0 != { 0,1,2,3,4,5,6,7,8,9,10,11 }\n"

.align 4
.section .data
r0_label:	.word	0
r1_label:	.word	0
r2_label:	.word	0

//int main(int argc, char** argv) {

.align 4
.text
main:	push {lr}
    	// int r0, r1, r2;

	// pointers for r0_label, r1_label, and r2_label (registers r4, r5, r6 respectively)
	ldr r4, =r0_label
	ldr r5, =r1_label
	ldr r6, =r2_label

    	// printf(prompt);
	ldr r0, =prompt
	bl printf

	// scanf(scan_str, &r0, &r1, &r2);
	ldr r0, =scan_str
	mov r1, r4		// r1 has copy of r0_label pointer
	mov r2, r5		// r2 has copy of r1_label pointer
	mov r3, r6		// r3 has copy of r2_label pointer
	bl scanf

	ldr r7, [r4]

	// switch(r7)	note: we changed r0 to r7 since r0 is used for string literal addresses
    	// {
        //case 0:
case_0:
	cmp r7, #0
	bne case_1

	// printf(case_0_msg);
	ldr r0, =case_0_msg
	bl printf

        b end_switch	//break;

        //case 1:
case_1:
	cmp r7, #1
	bne case_2

        // printf(case_1_msg);
	ldr r0, =case_1_msg
	bl printf

        b end_switch	//break;

        //case 2:
case_2:
	cmp r7, #2
	bne case_3

        // printf(case_2_msg);
	ldr r0, =case_2_msg
	bl printf

	b case_3_code
        //case 3:
case_3:
	cmp r7, #3
	bne case_4
case_3_code:
        // printf(case_3_msg);
	ldr r0, =case_3_msg
	bl printf

	//	add pc, #12	// add 12 to program counter, will this then point to instruction on line 95?
	b case_4_code
        //case 4:
case_4:
	cmp r7, #4
	bne case_5_6_7_8
case_4_code:
        // printf(case_4_msg);
	ldr r0, =case_4_msg
	bl printf

        b end_switch	//break;

case_5_6_7_8:
	cmp r7, #5
	beq case_5_6_7_8_code
	cmp r7, #6
	beq case_5_6_7_8_code
	cmp r7, #7
	beq case_5_6_7_8_code
	cmp r7, #8
	bne case_9_10_11
case_5_6_7_8_code:

	ldr r0, =case_5_6_7_8_msg
	bl printf
	b case_9_10_11_code

case_9_10_11:
	cmp r7, #9
	beq case_9_10_11_code
	cmp r7, #10
	beq case_9_10_11_code
	cmp r7, #11
	bne default_case
case_9_10_11_code:

	ldr r0, =case_9_10_11_msg
	bl printf
	b end_switch

        //default:
default_case:
        // printf(default_msg);
	ldr r0, =default_msg
	bl printf
    //}
end_switch:

    //return 0;

	mov r0, #0

	pop {pc}
//}
