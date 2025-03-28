// https://en.wikipedia.org/wiki/Endianness - about endianness

.global main
.data

vstart: .word 0x12345678

.text
.align 2

main:
  push {lr}

  ldr      r1, =vstart
  ldr      r0, [r1]                  @ load word to r0
  and      r2, r0, #0xff000000       @ load the top 2 bytes to r2
  and      r3, r0, #0x00ff0000       @ load the next 2 bytes to r3
  and      r4, r0, #0x0000ff00       @ load the next 2 bytes to r4
  and      r5, r0, #0x000000ff       @ load the bottom 2 bytes to r5
  mov      r0, r2, lsr #24           @ shift r2 bytes to bottom and store to r0
  orr      r0, r3, lsr #8            @ or the remaining shifted data
  orr      r0, r4, lsl #8
  orr      r0, r5, lsl #24
stop:

  mov r0, #0
  pop {pc}
