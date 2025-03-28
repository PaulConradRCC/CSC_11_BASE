        .syntax unified         @ modern syntax

@ Constants for assembler
        .data
        .align  4
format:
        .asciz  "%f + %f = %f\n"
.align 4
x:
        .float  1.23456789
.align 4
y:
        .float  4.56789012
.align 4
formatAddr:
        .word   format

@ The program
        .text
        .align  4
        .global main
        .type   main, %function
main:
        stmfd   sp!, {r4, r5, r6, fp, lr}
        add     fp, sp, 16
	//push {lr}
        sub     sp, sp, #20  @ room to pass args

	ldr r1, =x
        vldr    s0, [r1]           @ load x into fp reg
	ldr r1, =y
        vldr    s1, [r1]           @ load y into fp reg
        vadd.f32 s2, s1, s0     @ fp add
        
        ldr     r0, =format  @ pointer to format string
        vcvt.f64.f32  d5, s0    @ convert x to double
        vmov   r2, r3, d5       @ pass x in r2/r3
        vcvt.f64.f32  d6, s1    @ convert y to double
        vstr    d6, [sp]	@ pass y on stack
        vcvt.f64.f32  d7, s2    @ convert z to double
        vstr    d7, [sp, #8]    @ pass z on stack
        bl      printf

        mov     r0, 0
        add     sp, sp, #20   @ deallocate arguments
        ldmfd   sp!, {r4, r5, r6, fp, lr}  @ restore caller's info
	//pop {lr}
        bx      lr              @ return
