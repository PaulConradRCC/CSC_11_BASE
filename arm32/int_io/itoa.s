//
// itoa.asm - convert 32-bit signed integer to ascii string in base 10
//
// call with:
//
// r0 = 32-bit integer
// r1 = pointer to buffer to receive string (programmer is responsible
//      for making sure there is enough space to store the string)
//
// returns:
//
// r0 = length of string
//

.global itoa
.text

itoa:
	push {lr} 	// save lr
	mov r1, r0	// r1 = ptr to string
	mov r0, #0	// r0 = total

	mov r2, #0	// r2 = sign flag (0=pos, -1=neg)
	mov r3, #0	// r3 = byte to read in, zero upper 24 bits to be safe

atoi1:	ldrb r3, [r1]
	add r1,#1	// point r1 to next byte
	cmp r3, #32	// is it blank?
	beq atoi1	// if yes, ignore and read in next byte
	cmp r3, #9	// is it tab?
	beq atoi1	// if yes, ignore and read in next byte

	cmp r3, #43	// is it + symbol?
	beq atoi2	// if yes, continue to atoi2
	cmp r3, #45	// is it - symbol?
	bne atoi3	// if no, continue to atoi3
	sub r2, #1	// set r2 to -1 for negative

atoi2:	ldrb r3, [r1]	// read next byte
	add r1, #1	// point r1 to next byte

atoi3:	cmp r3, #48	// is it 0?
	blt atoi4	// if less than, jump to atoi4
	cmp r3, #57	// is it 9?
	bgt atoi4	// if greater than, jump to atoi4

	and r3, #0x0F   // mask out all bits except lowest four bits

	mov r4, r0, lsl #3 // r4 = r0 << 3 (r4 = r0 * 8)
	mov r5, r0, lsl #1 // r5 = r0 << 1 (r5 = r0 * 2)
	add r0, r4, r5	// r0 = r4 + r5
	add r0, r0, r3	// r0 = r0 + r3
	bal atoi2

atoi4:	cmp r2, #0	// is r2==0?
	beq atoi5	// if yes, our number was positive, we're done
	rsb r0, r0, #0 // r0 = 0 - r0

atoi5:	pop {r4,r5,pc}	// pop off org r4 and r5, and pop lr into pc to exit
