.global main

.align 4
.section .rodata
prompt: .asciz "Enter your 32 bit signed integer and number of bits to shift: "
scan_s: .asciz "%d %d"  // should it be "%d %u"?

out_m1: .asciz "%d (0x%08X) LSL #%d = %d (0x%08X)\n"
out_m2: .asciz "%d (0x%08X) LSR #%d = %d (0x%08X)\n"
out_m3: .asciz "%d (0x%08X) ASR #%d = %d (0x%08X)\n"
out_m4: .asciz "%d (0x%08X) ROR #%d = %d (0x%08X)\n"
out_m5: .asciz "%d (0x%08X) ROL #%d = %d (0x%08X)\n"

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
	bl scanf

	// let's put the value of value variable in r4
	// and the value of bits_shift in r5
	ldr r0, =value
	ldr r4, [r0]
	ldr r0, =bits_shift
	ldr r5, [r0]

	// demonstrate the shifts
	// lsl
	mov r0, r4, lsl r5
	// lsl r0, r4, r5  // alternative to mov r0, r4, lsl r5
	mov r1, r4	   // make a copy of r4's content in r1
	mov r2, r4	   // make a copy of r4's content in r2
	mov r3, r5	   // make a copy of r5's content in r3
	push {r0}	   // push r0 on stack for the fourth format specifier
	push {r0}	   // push r0 on stack for the fifth format specifer
	ldr r0, =out_m1
	bl printf
	add sp, #8	   // we pushed 2 32 bit values on the stack, this
			   // add inst will put the SP back to where it was
			   // before the two pushes.

	// lsr
	mov r0, r4, lsr r5
	// lsr r0, r4, r5  // alternative to mov r0, r4, lsr r5
	mov r1, r4	   // make a copy of r4's content in r1
	mov r2, r4	   // make a copy of r4's content in r2
	mov r3, r5	   // make a copy of r5's content in r3
	push {r0}	   // push r0 on stack for the fourth format specifier
	push {r0}	   // push r0 on stack for the fifth format specifer
	ldr r0, =out_m2
	bl printf
	add sp, #8	   // we pushed 2 32 bit values on the stack, this
			   // add inst will put the SP back to where it was
			   // before the two pushes.

	// asr
	mov r0, r4, asr r5
	// asr r0, r4, r5  // alternative to mov r0, r4, asr r5
	mov r1, r4	   // make a copy of r4's content in r1
	mov r2, r4	   // make a copy of r4's content in r2
	mov r3, r5	   // make a copy of r5's content in r3
	push {r0}	   // push r0 on stack for the fourth format specifier
	push {r0}	   // push r0 on stack for the fifth format specifer
	ldr r0, =out_m3
	bl printf
	add sp, #8	   // we pushed 2 32 bit values on the stack, this
			   // add inst will put the SP back to where it was
			   // before the two pushes.

	// ror
	mov r0, r4, ror r5
	// ror r0, r4, r5  // alternative to mov r0, r4, ror r5
	mov r1, r4	   // make a copy of r4's content in r1
	mov r2, r4	   // make a copy of r4's content in r2
	mov r3, r5	   // make a copy of r5's content in r3
	push {r0}	   // push r0 on stack for the fourth format specifier
	push {r0}	   // push r0 on stack for the fifth format specifer
	ldr r0, =out_m4
	bl printf
	add sp, #8	   // we pushed 2 32 bit values on the stack, this
			   // add inst will put the SP back to where it was
			   // before the two pushes.

	// "rol" - rotate left, no such inst, but we can mimic with proper ror
	rsb r0, r5, #32	   // r0 holds # of bits to ror
	mov r0, r4, ror r0
	// ror r0, r4, r5  // alternative to mov r0, r4, ror r5
	mov r1, r4	   // make a copy of r4's content in r1
	mov r2, r4	   // make a copy of r4's content in r2
	mov r3, r5	   // make a copy of r5's content in r3
	push {r0}	   // push r0 on stack for the fourth format specifier
	push {r0}	   // push r0 on stack for the fifth format specifer
	ldr r0, =out_m5
	bl printf
	add sp, #8	   // we pushed 2 32 bit values on the stack, this
			   // add inst will put the SP back to where it was
			   // before the two pushes.

	pop {pc} // exit when all done
