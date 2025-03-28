// bare bones source file 
.global main

.align 4
.section .rodata
// all constant data goes here

.align 4
.section .bss
// all uninitialized data goes here

.align 4
.data
// all non-constant, initialized data goes here

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	mov r0, #5 // our "case"
	cmp r0, #1
	bge do_switch
	cmp r0, #4
	ble do_switch
	mov r0, #5	// "case #5" is default case
do_switch:
	sub r2, r0, #1
	ldr r1, =jmp_tab
	ldr r3, [r1, r2, lsl#2 ]
	bx r3

	// assembly program here
case1:  mov r1, #1
	b switch_done

case2:  mov r1, #2
	b switch_done

case3:  mov r1, #3
	b switch_done

case4:  mov r1, #5
	b switch_done

def_case: mov r1, #6

switch_done:
	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

jmp_tab:	.word case1
		.word case2
		.word case3
		.word case4
		.word def_case
