/* -- eor.s -- */
.global main // main is our entry point to program and must be global

.align 8
.section .rodata
message:        .asciz  "%d EOR %d is %d\n"

.align 8
.text
main:
        stp fp, lr, [sp, -16]!   // push address of caller on stack
        mov x18, #123      // load the value 123 into x18 register
        mov x19, #345      // load the value 345 into x19 register
        eor x20, x18, x19  // bitwise eor x18 and x19, store result in x20
        eor x21, x20, x18  // bitwise eor x20 and x14, store result in x21 (same value as x19)
        eor x22, x20, x19  // bitwise eor x20 and x19, store result in x22 (same value as x18)
        mov x24, #-1
        eor x23, x22, x24 // x23 = x22 eor -1???
        ldr x0, adr_message
        mov x1, x18
        mov x2, x19
        mov x3, x20
        bl printf

        ldr x0, adr_message
        mov x1, x20
        mov x2, x19
        mov x3, x21
        bl printf

        ldr x0, adr_message
        mov x1, x20
        mov x2, x21
        mov x3, x22
        bl printf

        ldp fp, lr, [sp], 16        // return from main - several different ways we can exit from program
	ret

adr_message:	.dword	message
