.data
prompt: .asciz "Enter a single precision floating point value: "
scan_pat: .asciz "%f"
output: .asciz "You entered %f\n"
.balign 4
x: .float -1.5

.text
.global main
main: 
	push {lr}
	ldr r0, =prompt
	bl printf

	ldr r0, =scan_pat
	ldr r1, =x
	bl scanf

	ldr r0, =output
	ldr r1, =x
	flds s15, [r1]
	fcvtds d7, s15
	vmov r1, r2, d7	
	bl printf

	mov r0, #0
	pop {pc}
