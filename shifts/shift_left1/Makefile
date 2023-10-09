# Makefile
all: shift_left1

shift_left1: shift_left1.o
	gcc -g -o $@ $+

shift_left1.o: shift_left1.s
	as -g -o $@ $<

clean:
	rm -rf shift_left1 *.o
