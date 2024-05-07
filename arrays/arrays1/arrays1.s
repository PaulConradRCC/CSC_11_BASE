// this one has an addressing bug
.text
.balign 4
.global main
main:
	push {lr}

	// let's populate our array a of 100 bytes (25 words - 4 bytes to a word)
	ldr r1, =a 	// r1 points to beginning of array - think of this in C++ as a[0]
	mov r2, #0
a_loop: cmp r2, #25 	// 25 words filled?
	beq a_done 	// if equal, we're done
	str r2, [r1]	// store content of R2 at [r1]
	add r2, #1	// increment R2 by 1
	add r1, r2, LSL #2 // get next element's address by: R1=R1+(R2*4)
	bal a_loop	// jump back up to start of loop
a_done:
	// let's output all of the elements of the array with a function named
	// output_array(int a[], int size)
	// R0 = pointer to start of array, R1=size or # of elements in the array
	ldr r0, =a	// R0 contains base address of array
	mov r1, #25	// R1 contains number of elements in the array
	bl output_array
	pop {pc}

output_array:
	push {r4,lr}
	mov r4, #0	// R4 contains starting index for output
oa_loop:cmp r4, r1	// Is R4 equal to the number of elements to output?
	beq oa_done	// If so, we're done!
	push {r0-r3}	// Save our current state of registers R0-R3 since printf won't
	ldr r2, [r0]	// R1 contains a[R0]
	mov r1, r4	// output our index as well
	ldr r0, =output_str // R0 contains pointer to our output string
	bl printf
	pop {r0-r3}	// Restore state of registers R0-R3 after printf call
	add r4, #1	// increment our index by 1
	add r0, r4, LSL #2 // next address is R0=R0+(R4*4)
	bal oa_loop	// jump back up to oa_loop for next element
oa_done:
	pop {r4,pc}

.data
.balign 4

b0: .word -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

a: .skip 100 // array of 100 bytes (this just reserves us 100 bytes of space, no initialization done

b: .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
   .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1

// data label for output_array function
output_str: .asciz "a[%d]=%d\n"

