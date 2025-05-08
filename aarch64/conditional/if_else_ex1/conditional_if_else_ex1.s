.global main

.align 8
.text

main:
	mov x0, #6
	mov x1, #5
	mov x2, #8

	cmp x0, x1    		// the cc* in this example is GT for greater than in true part
	//addgt r3, r1, r2
	//suble r4, r2, r1
	ble x0_le_x1		// LE is the inverse condition of GT
	add x3, x1, x2
	b end_x0_le_x1
x0_le_x1:
	sub x4, x2, x1
end_x0_le_x1:
	mov w0, #0
	ret
