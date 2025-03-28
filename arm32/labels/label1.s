.global main
//.global label
.text
main:
	push {lr}
label:
	bl function1

	mov r0, #0
	pop {pc}
