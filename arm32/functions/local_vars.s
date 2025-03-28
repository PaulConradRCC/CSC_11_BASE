// an example function with local variables
.global my_fun
.global main

.align 4
.text
my_fun:
	push {r11,lr}
	sub r11, sp, #4
	sub sp, r11, #4
	str r0, [r11] // *(r11) = r0;

	push {r1}
	pop {r1}

	add sp, r11, #4
	pop {r11,pc}

main:
	push {lr}
	ldr r0, =0x12345678
	ldr r1, =0xABCDEF01
	bl my_fun
	pop {pc}
