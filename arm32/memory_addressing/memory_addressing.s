.data
.balign 4

myString: .asciz "myValue=%d\n"

myValue: .word 12345

.text
.balign 4
.global main

main:
    push {lr}
    ldr r0, =myString
    ldr r1, =myValue
    ldr r1,[r1]
    bl printf
    mov r0, #7
    pop {pc}
