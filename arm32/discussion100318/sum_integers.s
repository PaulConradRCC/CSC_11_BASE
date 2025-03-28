.global main
//#include <cstdio>
//using namespace std;

.section .rodata
//const int MIN = 1;
MIN:	.word	1
//const int MAX = 65535;
MAX:	.word	65535

prompt1: .asciz	"Enter an integer and I'll add all integers\n"
prompt2: .asciz "from 1 to your entered integer (between %d and %d) "

scan_str: .asciz "%d"

out_of_range_msg:	.asciz "Out of range, try again!!!!\n"

result_msg: .asciz	"Sum of integers from 1 to %d is %d\n"

.data
value:	.word	0

.text
//int main()
main:
	//{
	push {lr}
	//int value;
	//int r2;		// in assembly use r2 for the sum

	//do
	//{
	ldr r5, =MIN
	ldr r5, [r5]
	ldr r6, =MAX
	ldr r6, [r6]

do_while_r4_lt_r5_or_r4_gt_r6:
		//printf(prompt1);
	ldr r0, =prompt1
	bl printf

		//printf(prompt2,MIN,MAX);
	ldr r0, =prompt2
	mov r1, r5
	mov r2, r6
	bl printf

		//scanf(scan_str,&value);
	ldr r0, =scan_str
	ldr r1, =value
	mov r4, r1
	bl scanf

	ldr r4, [r4] // get the value from scanf

	//	if ( value < MIN || value > MAX )
if_r4_lt_r5:
	cmp r4, r5
	bge end_if_r4_lt_r5

	//	{
	//		printf(out_of_range_msg);
output_err:
	ldr r0, =out_of_range_msg
	bl printf
	//	}
	b do_while_r4_lt_r5_or_r4_gt_r6 // while( value<MIN || value>MAX)
end_if_r4_lt_r5:

if_r4_gt_r6:
	cmp r4, r6
	//ble end_if_r4_gt_r6
	bgt output_err
	//b output_err

	//ldr r0, =out_of_range_msg
	//bl printf
	//b do_while_r4_lt_r5_or_r4_gt_r6
end_if_r4_gt_r6:

	//}
	//while( value < MIN || value > MAX );

	//int r1=1;	// use register r1 as counter
	//int r0;

	//r0=value;
	ldr r0, =value
	ldr r0, [r0]

	//r2=0;
	mov r2, #0

	//while(r1 <= r0 )
while_r1_lte_r0:
	cmp r1, r0
	bgt end_while_r1_lte_r0
	//{
	add r2, r2, r1
		//r2=r2+r1;
	add r1, #1
		//r1++;
	b while_r1_lte_r0
	//}
end_while_r1_lte_r0:

	//printf(result_msg,r1,r2);
	mov r1, r0
	ldr r0, =result_msg
	bl printf

	//return 0;
	mov r0, #0

	//}
	pop {pc}
