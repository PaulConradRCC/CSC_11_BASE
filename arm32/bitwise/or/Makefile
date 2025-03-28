# Makefile
all: or

or: or.o
	gcc -g -o $@ $+

or.o: or.s
	as -g -o $@ $<

clean:
	rm -rf or *.o

