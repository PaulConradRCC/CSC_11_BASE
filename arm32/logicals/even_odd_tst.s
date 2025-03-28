// test the TST instruction to determine if a value is even or odd.... 
.global main
.align 4
.data

prompt:	.asciz	"Enter an integer and I'll let you know if it's even or odd: "
scan_s:	.asciz	"%d"

x:	.word	0

even_m: .asciz "The number %d is even!\n"
odd_m:	.asciz "The number %d is odd!\n"

.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	// assembly program here
	ldr r0, =prompt
	bl printf

	ldr r0, =scan_s
	ldr r1, =x
	bl scanf

	// do the test
	ldr r1, =x
	ldr r1, [r1]
	tst r1, #1

	bne output_odd

	// output the even result
	ldr r0, =even_m
	bl printf
	b continue
output_odd:
	ldr r0, =odd_m
	bl printf
continue:
	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

