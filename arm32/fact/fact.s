.global main
.text
main: 	push {lr}
	mov r0, #8
	bl fact

	mov r1, r0
	ldr r0, =out_msg
	bl printf

	mov r0, #0
	pop {pc}

fact:	push {lr}
	cmp r0, #0
	beq done
	push {r0}
	sub r0, #1
	bl fact
	pop {r1}
	mul r0,r1
	pop {pc}
done:	mov r0, #1
	pop {pc}

.data
out_msg: .asciz "result=%d\n"
