.global main

.align 4
.section .rodata
prompt: .asciz "Enter your 32 bit signed integer and number of bits to shift: "
scan_s: .asciz "%d %d"  // should it be "%d %u"?

out_m1: .asciz "%d LSL #%d = %d (hex: 0x%08X)\n"
out_m2: .asciz "%d LSR #%d = %d (hex: 0x%08X)\n"
out_m3: .asciz "%d ASR #%d = %d (hex: 0x%08X)\n"
out_m4: .asciz "%d ROR #%d = %d (hex: 0x%08X)\n"
out_m5: .asciz "%d ROL #%d = %d (hex: 0x%08X)\n"

.align 4
.section .data
value:      .word 0
bits_shift: .word 0

.align 4
.text
main:
	push {lr} // save the link register

	// display the prompt to user
	ldr r0, =prompt
	bl printf

	// get the 32 bit signed integer and bits_shift from user
	ldr r0, =scan_s
	ldr r1, =value
	ldr r2, =bits_shift
	bl scanf_s

	// let's put the value of value variable in r4
	// and the value of bits_shift in r5
	ldr r0, =value
	ldr r4, [r0]
	ldr r0, =bits_shift
	ldr r5, [r0]

	// demonstrate the shifts
	// lsl
	mov r3, r4, lsl r5
	// lsl r3, r4, r5  // alternative to mov r3, r4, lsl r5
	mov r1, r4	   // make a copy of r4's content in r1
	mov r2, r5	   // make a copy of r5's content in r2
	ldr r0, =out_m1
	push {r3}	   // after fourth parameter, additional params go on stk
	bl printf
	pop {r3}

	// lsr
	mov r3, r4, lsr r5
	// lsr r3, r4, r5  // alternative to mov r3, r4, lsr r5
	mov r1, r4	   // make a copy of r4's content in r1
	mov r2, r5	   // make a copy of r5's content in r2
	ldr r0, =out_m2
	push {r3}	   // after fourth parameter, additional params go on stk
	bl printf
	pop {r3}

	// asr
	mov r3, r4, asr r5
	// asr r3, r4, r5  // alternative to mov r3, r4, asr r5
	mov r1, r4	   // make a copy of r4's content in r1
	mov r2, r5	   // make a copy of r5's content in r2
	ldr r0, =out_m3
	push {r3}	   // after fourth parameter, additional params go on stk
	bl printf
	pop {r3}

	// ror
	mov r3, r4, ror r5
	// ror r3, r4, r5  // alternative to mov r3, r4, ror r5
	mov r1, r4	   // make a copy of r4's content in r1
	mov r2, r5	   // make a copy of r5's content in r2
	ldr r0, =out_m4
	push {r3}	   // after fourth parameter, additional params go on stk
	bl printf
	pop {r3}


	pop {pc} // exit when all done
