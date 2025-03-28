// utility division functions
.global div_mod
.global divide
.global mod

.func div_mod
	// div_mod - divide and modulus of ( a % b and a / b )
	// input: 	R0: a
	//	  	R1: b
	// returns:	R0: a % b
	//		R1: a / b
div_mod:
	push {lr}
	mov r3, r1
	mov r1, #0
	mov r2, #1

	//Shift the denominator left until greater than numerator, then shift back
_shift_left:
        //R3<<=1; //Denominator shift left
	mov r3, r3, asl #1
        //R2<<=1; //Division shift left
	mov r2, r2, asl #1
	//if(R0>R3)goto _shift_left;//Shift Left until Decrement/Division Greater than Numerator
 	cmp r0, r3 // compare r0 to r3
	bgt _shift_left // branch if greater than to _shift_left label
	//R3>>=1; //Shift Denominator right
	mov r3, r3, asr #1
	//R2>>=1; //Shift Division right
 	mov r2, r2, asr #1
	//Loop and keep subtracting off the shifted Denominator
_subtract:
	//if(R0<R3)goto _output;
	cmp r0, r3 // compare r0 to r3
	blt _div_mod_done // branch if less than to _div_mod_done
        //R1+=R2; //Increment division by the increment
	adds r1, r2
        //R0-=R3; //Subtract shifted Denominator with remainder of Numerator
	subs r0, r3
        //Shift right until denominator is less than numerator
_shift_right:
        //if(R2==1) goto _subtract;
	cmp r2, #1 // compare r2 to #1
	beq _subtract // branch if equal to _subtract
        //if(R3<=R0)goto _subtract;
	cmp r3, r0 // compare r3 to r0
	ble _subtract // branch if less than or equal to _subtract
        //R2>>=1; //Shift Increment left
	mov r2, r2, asr #1
        //R3>>=1; //Shift Denominator left
	mov r3, r3, asr #1
        //goto _shift_right; //Shift Denominator until less than Numerator
	bal _shift_right
	//goto _subtract; //Keep Looping until the division is complete
	bal _subtract
	// return the results
_div_mod_done:
	// R0 = a % b, R1 = a / b
	pop {pc}
.endfunc


.func divide
	// divide - divides two unsigned integers (simply calls div_mod and places respective return value in R0)
	// input:	R0: a
	//		R1: b
	// returns:	R0: a / b 
divide:
	push {lr}
	bl div_mod
	mov r0, r1 // divide returns a / b
	pop {pc}
.endfunc

.func mod
	// mod - gets the modulus of two unsigned integers (simply calls div_mod - this function may not be needed since div_mod already
	// returns R0 as a %b, but is provided anyways for completeness)
	// input:	R0: a
	//		R1: b
	// returns:	R0: a % b
mod:
	push {lr}
	bl div_mod
	pop {pc}
.endfunc
