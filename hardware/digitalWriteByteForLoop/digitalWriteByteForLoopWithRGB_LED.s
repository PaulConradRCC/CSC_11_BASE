
.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1

.equ PIN0, 0	// wipi pin 0 - bcm 17
.equ PIN1, 1	// wipi pin 1 - bcm 18
.equ PIN2, 2	// wipi pin 2 - bcm 27
.equ PIN3, 3	// wipi pin 3 - bcm 22
.equ PIN4, 4	// wipi pin 4 - bcm 23
.equ PIN5, 5	// wipi pin 5 - bcm 24
.equ PIN6, 6	// wipi pin 6 - bcm 25
.equ PIN7, 7	// wipi pin 7 - bcm 4

.equ RGB_RED, 27 // wipi pin 27 for byte value 255
.equ RGB_GRN, 28 // for byte values odd
.equ RGB_BLU, 29 // for byte values even

.equ PAUSE, 100 // pause 100/1000 second = 0.1 seconds

.global main
.text
main:
	push {lr}
	bl wiringPiSetup

	mov r0, #PIN0
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #PIN1
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #PIN2
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #PIN3
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #PIN4
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #PIN5
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #PIN6
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #PIN7
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #RGB_RED
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #RGB_GRN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #RGB_BLU
	mov r1, #OUTPUT
	bl pinMode

whl:
	mov r4, #0
for_lp:
	cmp r4, #256
	beq for_lp_end
	mov r0, r4
	bl digitalWriteByte

	// light the rgb led as appropriate
	cmp r4, #255
	bne not_at_end

	mov r0, #RGB_GRN
	mov r1, #LOW
	bl digitalWrite

	mov r0, #RGB_BLU
	mov r1, #LOW
	bl digitalWrite

	mov r0, #RGB_RED
	mov r1, #HIGH
	bl digitalWrite

	b continue

not_at_end:
	and r5, r4, #1
	cmp r5, #0
	bne handle_odd

	mov r0, #RGB_GRN
	mov r1, #LOW
	bl digitalWrite

	mov r0, #RGB_RED
	mov r1, #LOW
	bl digitalWrite

	mov r0, #RGB_BLU
	mov r1, #HIGH
	bl digitalWrite

	b continue

handle_odd:
	mov r0, #RGB_BLU
	mov r1, #LOW
	bl digitalWrite

	mov r0, #RGB_RED
	mov r1, #LOW
	bl digitalWrite

	mov r0, #RGB_GRN
	mov r1, #HIGH
	bl digitalWrite

continue:
	ldr r0, =msg
	mov r1, r4
	bl printf
	//ldr r0, =delay_sec
	//ldr r0, [r0]
	ldr r0, =#PAUSE
	bl delay
	add r4, #1
	bal for_lp
for_lp_end:
	bal whl
	pop {pc}

msg:	.asciz	"Displaying %d in binary on breadboard...\n"
delay_sec:	.word PAUSE
