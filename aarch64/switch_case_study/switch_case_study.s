.global main

.align 8
.section .rodata
prompt:         	.asciz  "Enter values for r0, r1, and r2 (separate each value with a space): "
scan_str:       	.asciz  "%d %d %d"
case_0_msg:     	.asciz  "The value of r0 is zero!\n"
case_1_msg:     	.asciz  "The value of r0 is one!\n"
case_2_msg:     	.asciz  "The value of r0 is two!\n"
case_3_msg:     	.asciz  "The value of r0 is three!\n"
case_4_msg:     	.asciz  "The value of r0 is four!\n"
case_5_6_7_8_msg:       .asciz  "The value of r0 is five, or six, or seven, or eight...\n"
case_9_10_11_msg:       .asciz  "The value of r0 is nine, or ten, or eleven...\n"
default_msg:    	.asciz  "This is the default output when r0 != { 0,1,2,3,4,5,6,7,8,9,10,11 }\n"


.align 8
.section .data
r0_label:       .word   0
r1_label:       .word   0
r2_label:       .word   0

//int main(int argc, char** argv) {

.align 8
.text
main:   stp fp, lr, [sp, -16]!
        // int r0, r1, r2;

        // pointers for r0_label, r1_label, and r2_label (registers r4, r5, r6 respectively)
        ldr x18, =r0_label
        ldr x19, =r1_label
        ldr x20, =r2_label

        // printf(prompt);
        ldr x0, =prompt
        bl printf

        // scanf(scan_str, &r0, &r1, &r2);
        ldr x0, =scan_str
        mov x1, x18              // x1 has copy of r0_label pointer
        mov x2, x19              // x2 has copy of r1_label pointer
        mov x3, x20              // x3 has copy of r2_label pointer
        bl scanf

        ldr w21, [x18]

        // switch(x21)   note: we changed r0 to x21 since x0 is used for string literal addresses
        // {
        //case 0:
case_0:
        cmp w21, #0
        bne case_1

        // printf(case_0_msg);
        ldr x0, =case_0_msg
        bl printf

        b end_switch    //break;

        //case 1:
case_1:
        cmp w21, #1
        bne case_2

        // printf(case_1_msg);
        ldr x0, =case_1_msg
        bl printf

        b end_switch    //break;

        //case 2:
case_2:
        cmp w21, #2
        bne case_3

        // printf(case_2_msg);
        ldr x0, =case_2_msg
        bl printf

        b case_3_code
        //case 3:
case_3:
        cmp w21, #3
        bne case_4
case_3_code:
        // printf(case_3_msg);
        ldr x0, =case_3_msg
        bl printf

        //      add pc, #12     // add 12 to program counter, will this then point to instruction on line 95?
        b case_4_code
        //case 4:
case_4:
        cmp w21, #4
        bne case_5_6_7_8
case_4_code:
        // printf(case_4_msg);
        ldr x0, =case_4_msg
        bl printf

        b end_switch    //break;

case_5_6_7_8:
	cmp w21, #5
	beq case_5_6_7_8_code
	cmp w21, #6
	beq case_5_6_7_8_code
	cmp w21, #7
	beq case_5_6_7_8_code
	cmp w21, #8
	bne case_9_10_11

case_5_6_7_8_code:
	ldr x0, =case_5_6_7_8_msg
	bl printf

        b case_9_10_11_code

case_9_10_11:
	cmp w21, #9
	beq case_9_10_11_code
	cmp w21, #10
	beq case_9_10_11_code
	cmp w21, #11
	bne default_case
case_9_10_11_code:

	ldr x0, =case_9_10_11_msg
	bl printf
	b end_switch

        //default:
default_case:
        // printf(default_msg);
        ldr x0, =default_msg
        bl printf
    //}
end_switch:

    //return 0;

        mov w0, #0

        ldp fp, lr, [sp], 16
	ret
//}
