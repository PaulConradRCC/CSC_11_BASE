# Makefile
all: and

and: and.o
	gcc -g -o $@ $+

and.o: and.s
	as -g -o $@ $<

gdb:
	gdb ./and

clean:
	rm -rf and *.o
