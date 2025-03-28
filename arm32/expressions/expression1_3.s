.global main
.global _start
.data

greeting: .ascii "Welcome to Expression1_3: I will evaluate the expression (a+b)*(b-c) with\n"
greeting2: .ascii "the values for a, b, and c that you enter at the keyboard.\n\n\0"

prompt_a: .asciz "Enter an integer value for A: "
prompt_b: .asciz "Enter an integer value for B: "
prompt_c: .asciz "Enter an integer value for C: "

output: .asciz "The result for (%d + %d) * (%d - %d) is %d\n"

scan_pattern: .asciz "%d"

a: .word 0	// label for a
b: .word 0	// label for b
c: .word 0	// label for c
r: .word 0	// label for r (result)

.text
_start:
main:
	//push {lr}		// save return address for when we are done
	
	ldr r0, =greeting	// output our greeting
	bl printf

	ldr r0, =prompt_a	// output prompt for A
	bl printf

	ldr r0, =scan_pattern	// scan keyboard for integer for B
	ldr r1, =a
	bl scanf
b1:
	ldr r0, =prompt_b       // output prompt for B
        bl printf

        ldr r0, =scan_pattern   // scan keyboard for integer for B
        ldr r1, =b
        bl scanf
b2:
	ldr r0, =prompt_c       // output prompt for C
        bl printf

        ldr r0, =scan_pattern   // scan keyboard for integer for C
        ldr r1, =c
        bl scanf
b3:
	// computation now
	// this code is not very efficient, can you make it more efficient?
	ldr r0, =a
        ldr r0, [r0]

	ldr r1, =b
        ldr r1, [r1]

	adds r0,r1 	// r0 contains a, r1 contains b: perform (a+b), note: r1 remains unchanged
	
	ldr r2, =c	// load in value for c into r2, r1 still contains b, so we don't need to reload it
	ldr r2, [r2]

	subs r1, r2	// r1 contains b, r2 contains c: perform (b-c)

	muls r0,r1	// r0 contains result of (a+b), and r1 contains results of (b-c)

	// store the result in r
	ldr r1, =r
	str r0, [r1]

	// output the results
	ldr r0, =output		
	ldr r1, =a
	ldr r1, [r1]
	ldr r2, =b
	ldr r2, [r2]
	ldr r3, =b
	ldr r3, [r3]
	ldr r4, =r
	ldr r4, [r4]
	push {r4}
	ldr r4, =c
	ldr r4, [r4]
	push {r4}
	bl printf
	add sp, #8

	mov r0, #0		// return error code 0 to OS, signaling all good!
	//pop {pc}		// get return address and put in progam counter
	mov r7, #1
	swi 0
