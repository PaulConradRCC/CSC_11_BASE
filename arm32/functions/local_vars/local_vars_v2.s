// an example function with local variables, with bug fix that wasn't a fix and made it buggier!
.global my_fun
.global main

.align 4
.text
my_fun:
	push {R11,LR}		// save R11 and LR
	mov R11, SP		// R11 is frame pointer ( same value as SP )
	sub SP, R11, #4		// SP = R11 - 4; R11 has 1 local variable of 4 bytes
	str R0, [R11] 		// *(r11) = r0;

	push {R1}
	pop {R1}

	mov SP, R11		// SP = R11, deallocate 1 local variable space
	pop {R11,PC}		// restore R11 and LR (storing LR content in PC)

main:
	push {lr}		// save contents of LR
	ldr r11, =0xAAAAAAAA
	ldr r0, =0x12345678	// R0 has the value of 0x12345678 (dec: 305419896)
	ldr r1, =0xABCDEF01	// R1 has the value of 0xABCDEF01 (dec: 2882400001)
	bl my_fun		// call our function named my_fun

	mov r0, #0		// return 0 to OS
	pop {pc}		// pop off old LR value and place in PC
