.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1

.equ XPIN, 24
.equ YPIN, 25

.data

x: .word 0
y: .word 0

x_pmt: .asciz "Enter value for X (0 or 1): "
y_pmt: .asciz "Enter value for Y (0 or 1): "

pat: .asciz "%d"

.text 
.global main
main:
	push {lr}

p1:
	ldr r0, = x_pmt
	bl printf
	
	ldr r0, =pat
	ldr r1, =x
	bl scanf

	ldr r0, =x
	ldr r0, [r0]
	cmp r0, #LOW
	blt p1	// x less than zero branch
	cmp r0, #HIGH
	bgt p1 // xgreater than zero branch

p2:
	ldr r0, =y_pmt
	bl printf

	ldr r0, =pat
	ldr r1, =y
	bl scanf
	
	ldr r0, =y
	ldr r0, [r0]
	cmp r0, #LOW
	blt p2 // y less than zero branch
	cmp r0, #HIGH
	bgt p2 // y greater than zero branch

	bl wiringPiSetup // setup wiringPi

	mov r0, #XPIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #YPIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #XPIN
	ldr r1, =x
	ldr r1, [r1]
	bl digitalWrite

	mov r0, #YPIN
	ldr r1, =y
	ldr r1, [r1]
	bl digitalWrite

	pop {pc}
