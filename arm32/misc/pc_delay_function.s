/*

pc_delay_function

input:  r0: the delay in terms of 1024th of a second
	r1: the wiringPi pin number for the associated push button

output:	r0: returns 0 if the user does not press button within delay timeframe
	r0: returns 1 if the user pushes button for the delay timeframe has elasped

description: this function allows for a program to have a delay in terms of 1024th of a
             second (passed in r0) and will break out of the delay loop if the user
             presses the associated push button before the delay loop completes, as this
	     can be better than the delay function with the wiringPi library.
	     This is very useful for scenarios where the program must delay AND have a
	     user push button be responsive. This function assumes the number of clock
	     ticks per second in the C function, clock, is 1000000 (this is very common
	     and can be check with a simple C program displaying the value of the
	     CLOCKS_PER_SEC macro).

*/
pc_delay_function:
	push {r4,r5,r6,lr}	// save r4, r5, and r6 since they are used by function
	mov r5, r0		// r5 holds copy of delay parameter passed by caller
	mov r6, r1		// r6 holds copy of wiringPi pin # passed by caller

	bl clock		// call clock function
	mov r4, r0		// r4 holds starting clock ticks since program started

delay_loop:
	mov r0, r6		// load the wiringPi pin # into r0
	bl digitalRead		// read the state of the pin and push button
	cmp r0, #1		// if return value from digitalRead==1, button was pressed
	beq exit_button_press   // exit if button press detected

	bl clock		// call clock again for current clock ticks
	sub r1, r0, r4		// r1 holds the elapsed clock ticks (current [r0]-start [r4])
	mov r1, r1, lsr #10	// divide r1 by 1024, r1 will hold # of clock ticks in 1024ths/sec
	cmp r1, r5		// compare r1 and r5 (r5 holds our delay in 1024ths/sec)
	blt delay_loop		// if r1 less than r5, loop again

exit_no_button_press:
	mov r0, #0		// return 0 if no button press and delay loop is completed

exit_button_press:		// if we branch with the beq inst. above, r0 will already have value of 1
	push {r4,r5,r6,pc}	// restore r4, r5, r6, and exit function
