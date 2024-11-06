.section .text
.global rol
rol:
	rsb r1, r1, #32         // r1 = 32 - r1
        mov r0, r0, ror r1      // r0 = r0 >> r1??? will this be allowed?
        mov pc, lr
