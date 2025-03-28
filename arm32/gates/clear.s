.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1

.equ XPIN, 24
.equ YPIN, 25

.data

message: .asciz "Pins 24 and 25 cleared\n"

.text 
.global main
main:
	push {lr}

	bl wiringPiSetup // setup wiringPi

	mov r0, #XPIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #YPIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #XPIN
	mov r1, #LOW
	bl digitalWrite

	mov r0, #YPIN
	mov r1, #LOW
	bl digitalWrite

	ldr r0, =message
	bl printf

	pop {pc}
