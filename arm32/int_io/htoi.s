//
// htoi.asm - convert hexadecimal ascii string to 32-bit signed integer
//
// call with:
//
// r0 = pointer to ascii string in the form: [white space][hex digits]
//
// returns:
//
// r0 = 32-bit integer result
// r1 = address+1 of terminator character
//
// note: does not check for overflow and terminates on first 
// invalid character encountered

.global htoi
.text
htoi:
	push {lr} 	// save lr for return
	mov r1, r0	// r1 = ptr to string
	mov r0, #0	// r0 = total

	mov r2, #0	// r2 = byte to read in, zero upper 24 bits to be safe

htoi1:	ldrb r2, [r1]
	add r1,#1	// point r1 to next byte
	cmp r2, #32	// is it blank?
	beq htoi1	// if yes, ignore and read in next byte
	cmp r2, #9	// is it tab?
	beq htoi1	// if yes, ignore and read in next byte

htoi2:	cmp r2, #48	// is it 0?
	blt htoi4	// if less than, jump to htoi4
	cmp r2, #57	// is it 9?
	ble htoi3	// if less than/equal, jump to htoi3
	orr r2, #0x20	// fold char to lowercase
	cmp r2, #102	// is it larger than 'f'?
	bgt htoi4	// if yes, jump to htoi4
	cmp r2, #97	// is it less than 'a'?
	blt htoi4	// if yes, jump to htoi4
	add r2, #9	// add 9 to ascii code of 'a' through 'f' in r2

htoi3:	mov r0, r0, lsl #4 // r0 = r0 << 4
	and r2, #0x0F	// want just lower 4 bits of hexadecimal nibble
	orr r0, r2

	ldrb r2, [r1]	// read next byte
	add r1, #1	// point r1 to next byte

	bal htoi2

htoi4:	pop {pc}	// pop lr into pc to exit
