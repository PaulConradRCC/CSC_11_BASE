.global main

.align 4
.text
main:
	push {r11,lr}
	mov r1, #-1
	push {r1}
	sub sp, sp, #100 // ************
	add r11, sp, #0

	push {r1}
	// our code here
	// initialize array like:
	// for(int i=0;i<25;i++) a[i]=i;
	mov r0, #0
fill_loop:
	str r0, [r11, +r0, lsl #2]
	add r0, #1
	cmp r0, #25
	ble fill_loop

	pop {r1}

	add sp, r11, #100 // ************

	pop {r1}
	pop {r11, pc}
