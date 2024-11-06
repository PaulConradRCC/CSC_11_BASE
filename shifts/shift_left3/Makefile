# Makefile
all: shift_left3

shift_left3: shift_left3.o
	gcc -g -o $@ $+

shift_left3.o: shift_left3.s
	as -g -o $@ $<

gdb:
	gdb ./shift_left3

clean:
	rm -rf shift_left3 *.o
