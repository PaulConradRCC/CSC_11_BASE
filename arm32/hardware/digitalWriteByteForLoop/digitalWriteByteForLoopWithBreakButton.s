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

.equ PIN29, 29	// wipi pin 29 - bcm 21

.equ PAUSE, 5000 // pause 5000/1000 second = 5 second

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
	ldr r0, =delay_sec
	ldr r0, [r0]
	mov r1, #PIN29
	bl pc_delay_function
	//mov r0, #PAUSE
	//bl delay
	cmp r0, #HIGH
	beq breakout
	add r4, #1
	bal for_lp
for_lp_end:
	bal whl
breakout:
	mov r0, #0
	bl digitaWriteByte

	pop {pc}

pc_delay_function:
        push {r4,r5,r6,lr}      // save r4, r5, and r6 since they are used by function
        mov r5, r0              // r5 holds copy of delay parameter passed by caller
        mov r6, r1              // r6 holds copy of wiringPi pin # passed by caller
        bl clock                // call clock function
        mov r4, r0              // r4 holds starting clock ticks since program started

delay_loop:
        mov r0, r6              // load the wiringPi pin # into r0
        bl digitalRead          // read the state of the pin and push button
        cmp r0, #1              // if return value from digitalRead==1, button was pressed
        beq exit_button_press   // exit if button press detected

        bl clock                // call clock again for current clock ticks
        sub r1, r0, r4          // r1 holds the elapsed clock ticks (current [r0]-start [r4])
        mov r1, r1, lsr #10     // divide r1 by 1024, r1 will hold # of clock ticks in 1024ths/sec
        cmp r1, r5              // compare r1 and r5 (r5 holds our delay in 1024ths/sec)
        blt delay_loop          // if r1 less than r5, loop again

exit_no_button_press:
        mov r0, #0              // return 0 if no button press and delay loop is completed

exit_button_press:              // if we branch with the beq inst. above, r0 will already have value of 1
        push {r4,r5,r6,pc}      // restore r4, r5, r6, and exit function

msg:	.asciz	"Displaying %d in binary on breadboard...\n"
delay_sec:	.word PAUSE
