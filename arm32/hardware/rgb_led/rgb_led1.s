// to compile: g++ rgb_led.s -lwiringPi -g -o rgb_led

.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1
.equ RED_PIN, 23	// wiringPi 23
.equ GRN_PIN, 24	// wiringPi 24
.equ BLU_PIN, 25	// wiringPi 25

.equ STP_PIN, 29	// wiringPi 29 - STOP PIN
//.equ PAUSE_S, 1		// pause in seconds

.section .rodata
out_s: .asciz "%d, r4=%d, r5=%d\n"

.text
.global main
main:
//int main()
	push {lr} //{
	bl wiringPiSetup // wiringPiSetup(); // initialize the wiringPi library

	mov r0, #STP_PIN
	bl setPinInput

	mov r0, #RED_PIN
	bl setPinOutput

	mov r0, #GRN_PIN
	bl setPinOutput

	mov r0, #BLU_PIN
	bl setPinOutput
lp:
	//mov r0, #BLU_PIN	// pin going off
	//mov r1, #RED_PIN	// pin going on
	//mov r2, #PAUSE_S
	//bl action

	mov r0, #RED_PIN
	bl pinOn

	mov r0, #GRN_PIN
	bl pinOff

	mov r0, #BLU_PIN
	bl pinOff

	bl readStopButton
	cmp r0, #1
	beq end_lp

	ldr r0, =#20000 //delay(20000); // delay for 20000 milliseconds or 20 seconds
	bl delay

	bl readStopButton
	cmp r0, #1
	beq end_lp

	mov r0, #RED_PIN
	bl pinOff

	mov r0, #GRN_PIN
	bl pinOn

	//mov r0, #RED_PIN
	//mov r1, #GRN_PIN
	//mov r2, #PAUSE_S
	//bl action

	ldr r0, =#20000 //delay(20000); // delay for 20000 milliseconds or 20 seconds
	bl delay

	bl readStopButton
	cmp r0, #1
	beq end_lp

	//mov r0, #GRN_PIN
	//mov r1, #BLU_PIN
	//mov r2, #PAUSE_S
	//bl action

	mov r0, #GRN_PIN
	bl pinOff

	mov r0, #BLU_PIN
	mov r1, #HIGH
	bl digitalWrite

	ldr r0, =#20000 //delay(20000); // delay for 20000 milliseconds or 20 seconds
	bl delay

	bl readStopButton
	cmp r0, #1
	beq end_lp

	mov r0, #BLU_PIN //
	bl pinOff //
	bal lp
end_lp:
	mov r0, #RED_PIN
	bl pinOff

	mov r0, #GRN_PIN
	bl pinOff

	mov r0, #BLU_PIN
	bl pinOff

	mov r0, #0//return 0;
	pop {pc}//}

setPinInput:
	push {lr}
	mov r1, #INPUT
	bl pinMode
	pop {pc}

setPinOutput:
	push {lr}
	mov r1, #OUTPUT
	bl pinMode
	pop {pc}

pinOn:
	push {lr}
	mov r1, #HIGH
	bl digitalWrite
	pop {pc}

pinOff:
	push {lr}
	mov r1, #LOW
	bl digitalWrite
	pop {pc}

readStopButton:
	push {lr}
	mov r0, #STP_PIN
	bl digitalRead
	pop {pc}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

action: // r0 holds pin to turn off, r1 holds pin to turn on
	// r2 holds the number of seconds to delay
	// return value: r0=0, no user interation; r0=1 user pressed stop button
	push {r4,r5,lr}

	mov r4, r1
	mov r5, r2

	bl pinOff
	mov r0, r4
	bl pinOn

	mov r0, #0
	bl time
	mov r4, r0
do_whl:
	bl readStopButton
	cmp r0, #HIGH
	beq action_done
	mov r0, #0
	bl time

	sub r0, r0, r4

	//push {r0}
	//mov r1, r0
	//mov r2, r4
	//mov r3, r5
	//ldr r0, =out_s
	//bl printf
	//pop {r0}
	cmp r0, r5
	blt do_whl
	mov r0, #0
action_done:
	pop {r4,r5,pc}
