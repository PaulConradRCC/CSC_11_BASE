# Makefile
all: or

or: or.o
	gcc -g -o $@ $+

or.o: or.s
	as -g -o $@ $<

gdb:
	gdb ./or

clean:
	rm -rf or *.o
