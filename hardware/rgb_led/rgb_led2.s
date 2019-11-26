// to compile: g++ rgb_led.s -lwiringPi -g -o rgb_led

.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1
.equ RED_PIN, 23	// wiringPi 23
.equ GRN_PIN, 24	// wiringPi 24
.equ BLU_PIN, 25	// wiringPi 25

.equ FWD_PIN, 29	// wiringPi 29 - FORWARD PIN
.equ REV_PIN, 28	// wiringPi 28 - REVERSE PIN

.equ RED_ST, 0
.equ GRN_ST, 1
.equ BLU_ST, 2

.text
.global main
main:
//int main()
	push {lr} //{
	bl wiringPiSetup // wiringPiSetup(); // initialize the wiringPi library
	bl my_setup

	mov r4, #RED_ST	// R4 holds our current state, start in RED
	mov r0, #RED_PIN
	bl pinOn
lp:
	bl readForwardButton
	cmp r0, #HIGH
	bne lp_next

	cmp r4, #RED_ST
	moveq r0, #RED_PIN	// pin going off
	moveq r1, #GRN_PIN	// pin going on
	bleq action
	moveq r4, #GRN_ST

	cmp r4, #GRN_ST
	moveq r0, #GRN_PIN	// pin going off
	moveq r1, #BLU_PIN	// pin going on
	bleq action
	moveq r4, #BLU_ST

	cmp r4, #BLU_ST
	moveq r0, #BLU_PIN	// pin going off
	moveq r1, #RED_PIN	// pin going on
	bleq action
	moveq r4, #RED_ST

	bal lp
lp_next:
	bl readReverseButton
	cmp r0, #HIGH
	bne lp

	cmp r4, #RED_ST
	moveq r0, #RED_PIN	// pin going off
	moveq r1, #BLU_PIN	// pin going on
	bleq action
	moveq r4, #BLU_ST

	cmp r4, #BLU_ST
	moveq r0, #BLU_PIN	// pin going off
	moveq r1, #GRN_PIN	// pin going on
	bleq action
	moveq r4, #GRN_ST

	cmp r4, #GRN_ST
	moveq r0, #GRN_PIN	// pin going off
	moveq r1, #RED_PIN	// pin going on
	bleq action
	moveq r4, #RED_ST

	bal lp

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

readForwardButton:
	push {lr}
	mov r0, #FWD_PIN
	bl digitalRead
	pop {pc}

readReverseButton:
	push {lr}
	mov r0, #REV_PIN
	bl digitalRead
	pop {pc}

action: // r0 holds pin to turn off, r1 holds pin to turn on
	push {r5,lr}
	mrs r5, cpsr
	push {r1}
	bl pinOff
	pop {r0}
	bl pinOn
	msr cpsr, r5
	pop {r5,pc}

my_setup:
	push {lr}

	mov r0, #FWD_PIN
	bl setPinInput

	mov r0, #REV_PIN
	bl setPinInput

	mov r0, #RED_PIN
	bl setPinOutput

	mov r0, #GRN_PIN
	bl setPinOutput

	mov r0, #BLU_PIN
	bl setPinOutput

	// clear all output pins
	mov r0, #RED_PIN
	bl pinOff

	mov r0, #GRN_PIN
	bl pinOff

	mov r0, #BLU_PIN
	bl pinOff

	pop {pc}
