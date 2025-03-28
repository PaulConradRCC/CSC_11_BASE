.global main

.align 4
.section .rodata
filename: .asciz "filename"
file_er1: .asciz "Could not open the file.\n"
file_er2: .asciz "Could not read any data from file.\n"

.align 4
.section .bss
my_array: .skip 20

.align 4
.text
main:
	push {lr}
	ldr r0, =filename
	mov r1, #0
	bl open

	cmp r0, #-1
	bne .LB1
	ldr r0, =file_er1
	bl printf
	mov r0, #1
	bal .LB_DONE
.LB1:
	mov r4, r0	// r4 holds the file handle (aka file descriptor)
	ldr r1, =my_array
	mov r2, #20
	bl read
	cmp r0, #0
	bne .LB2
	ldr r0, =file_er2
	bl printf
	mov r0, #2
	bal .LB_DONE
.LB2:
	mov r0, r4
	bl close
.LB_DONE:
	pop {pc}
