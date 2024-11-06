# Makefile
all: shift_left2

shift_left2: shift_left2.o
	gcc -g -o $@ $+

shift_left2.o: shift_left2.s
	as -g -o $@ $<

gdb:
	gdb ./shift_left2

clean:
	rm -rf shift_left2 *.o
