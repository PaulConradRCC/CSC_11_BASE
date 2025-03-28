.equ LOW, 0
.equ HIGH, 1
.equ INPUT, 0
.equ OUTPUT, 1

.equ PIN, 29 // wiringPi pin to use
.equ PAUSE, 750 // 750ms

.data
out_msg: .asciz "%d\n"

//int main()
.text
.global main
main:
	push {lr} 
	bl wiringPiSetup 
	//pinMode(1, OUTPUT);
	mov r0, #PIN
	mov r1, #INPUT
	bl pinMode
do_whl_loop:
		//int r = digitalRead(1);
	//ldr r0, =PAUSE
	//bl delay

	mov r0, #PIN
	bl digitalRead

	//printf("%d\n", r);
	mov r1, r0
	ldr r0, =out_msg
	bl printf
	bal do_whl_loop

	mov r0, #0
	pop {pc}
	//}
	//return 0;
//}
