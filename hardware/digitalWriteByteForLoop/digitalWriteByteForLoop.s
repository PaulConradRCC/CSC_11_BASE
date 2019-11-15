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

.equ PAUSE, 250 // pause 250/1000 second = 1/4 second

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
whl:
	mov r4, #0
for_lp:
	cmp r4, #256
	beq for_lp_end
	mov r0, r4
	bl digitalWriteByte
	ldr r0, =msg
	mov r1, r4
	bl printf
	//ldr r0, =delay_sec
	//ldr r0, [r0]
	mov r0, #PAUSE
	bl delay
	add r4, #1
	bal for_lp
for_lp_end:
	bal whl
	pop {pc}

msg:	.asciz	"Displaying %d in binary on breadboard...\n"
delay_sec:	.word PAUSE
