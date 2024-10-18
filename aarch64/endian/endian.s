// https://en.wikipedia.org/wiki/Endianness - about endianness
.global main
.align 8
.section .data
vstart: .word 0x12345678

.section .text
.align 8
adr_vstart:	.dword	vstart
main:
  	ldr x1, adr_vstart
  	ldr w0, [x1]                  // load word to w0
  	and w2, w0, #0xff000000       // load the top 2 bytes to w2
  	and w3, w0, #0x00ff0000       // load the next 2 bytes to w3
  	and w4, w0, #0x0000ff00       // load the next 2 bytes to w4
  	and w5, w0, #0x000000ff       // load the bottom 2 bytes to w5
  	mov w0, w2, lsr #24           // shift w2 bytes to bottom and store to w0
	lsr w6, w3, #8
  	orr w0, w0, w6            // or the remaining shifted data
  	lsl w6, w4, #8
	orr w0, w0, w6
  	lsl w6, w5, #24
	orr w0, w0, w6
stop:
	mov w0, #0
	ret
