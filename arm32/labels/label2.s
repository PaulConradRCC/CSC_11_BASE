.global function1
.global label
.text
function1:
	push {lr}
label:
	ldr r0, =msg
	bl printf
	pop {pc}

msg: .asciz "Hello from label2.s ...\n"
