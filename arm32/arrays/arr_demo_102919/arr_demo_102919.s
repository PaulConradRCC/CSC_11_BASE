// use echo $? to output in terminal our array sum as it is
// the return value of our main...

.global main
.align 4
.data
a: .word -10, 20, -40, 80, -100, 200

.align 4
.text
main:
	mov r0, #0
	ldr r1, =a
	mov r2, #0
sum_loop:
	ldr r3, [r1, +r2, lsl #2]
	add r0, r3
	add r2, #1
	cmp r2, #5
	ble sum_loop
	mov pc, lr
