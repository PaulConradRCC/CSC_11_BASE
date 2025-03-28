	.text
	.global main
main:
	mov r0, #1
	ldr r1, =output
	ldr r2, =output_sz
	ldr r2, [r2]
	mov r7, #4
	svc 0
	mov r7, #1
	svc 0

.data

output: .ascii "Hello World!\n\nHow is everyone today?\n\n"
output_sz: .word output_sz - output

.end
