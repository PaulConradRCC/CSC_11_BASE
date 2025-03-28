.global main

.text
main:
mov R0, #101
mov R1, #1
and R4, R0, R1
orr R5, R0, R1
eor R6, R0, R1
halt:
	mov pc, lr
