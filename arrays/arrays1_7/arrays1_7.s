// non updating indexing mode with: [Rsource1, +Rsource2, LSL #immediate]
// this is indexing by Rsource1+(Rsource2 << #immediate)
// this is similar to arrays1_3.s and its variants, except different register usage and short int array

.text
.balign 4
.global main
main:
	push {lr}

	// let's populate our array a of 100 bytes (50 hwords - 2 bytes per hword - hword is half word [16 bits] )
	ldr r4, =a 	// r4 points to beginning of array - think of this in C++ as a[0]
	mov r5, #0
a_loop: cmp r5, #50 	// 50 hwords filled?
	beq a_done 	// if equal, we're done
	mov r6, r5, LSL #1
	strh r5, [r4,+r6] // store content of R5 at [r4+(r5 << 1)]
	add r5, #1	// increment R2 by 1
	bal a_loop	// jump back up to start of loop
a_done:
	// let's output all of the elements of the array with a function named
	// output_array(int a[], int size)
	// R0 = pointer to start of array, R1=size or # of elements in the array
	mov r0, r4	// R0 contains base address of arraym remember R4 is a pointer to the base address of array
	mov r1, #50	// R1 contains number of elements in the array
	bl output_array
	pop {pc}

output_array:
	// r4 will hold copy of base address found in r0
	// r5 will hold copy of number of elements found in r1
	// r6 is used as a loop counter variable register
	// r7 used ask calculated offset as ARM doesn't let us scale with LSL when using STRH or LDRH
	push {r4,r5,r6,r7,lr}
	mov r4, r0
	mov r5, r1
	mov r6, #0	// R6 contains starting index for output
oa_loop:cmp r6, r5	// Is R6 equal to the number of elements to output?
	beq oa_done	// If so, we're done!
	mov r7, r6, lsl #1
	ldrh r2, [r4,+r7] // R2 contains a[R4+(R6 << 1)]
	mov r1, r6	// output our index as well
	ldr r0, =output_str // R0 contains pointer to our output string
	bl printf
	add r6, #1	// increment our index by 1
	bal oa_loop	// jump back up to oa_loop for next element
oa_done:
	pop {r4,r5,r6,r7,pc}

.data
.balign 4

c: .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1

a: .skip 100 // array of 100 bytes (this just reserves us 100 bytes of space, no initialization done

b: .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1

// data label for output_array function
output_str: .asciz "a[%d]=%d\n"

