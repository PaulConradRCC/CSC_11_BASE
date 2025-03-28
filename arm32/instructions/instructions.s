// instructions.s - purpose of this program is to investigate some
// of the ARM instructions to learn about decoding instructions.

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
main: 	//push {lr} // save link register, this is one of many ways this can be done

	mov r0, #1
	mov r1, #2
	mov r2, #3
	mov r3, #4
	mov r4, #5

	// assembly program here
	add r0, r1, r2 // r0 = r1+r2
	add r5, r4, r3 // r5 = r4+r3
	add r0, #5 // r0 = r0 + 5

	add r0, r1, #0x700

	and r0, r1, r2 // r0 = r1 AND r2
	and r5, r4, r3 // r5 = r4 AND r3
	and r0, #5 // r0 = r0 AND 5

	// movs
	mov r0, #0xFF
	mov r1, r0, LSL#3
	mov r2, r1, LSL#5
	mov r3, r1, LSR#4
	mov r3, r1, ASR#4
	mov r3, r1, ROR#4

	eors r7, r7, #1792

	// exit the program

	mov r0, #0 // return code for your program (must be 8 bits)
	//pop {pc}
	mov pc, lr

