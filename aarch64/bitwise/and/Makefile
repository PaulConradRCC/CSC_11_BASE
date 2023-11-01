# Makefile
all: and

and: and.o
	gcc -g -o $@ $+

and.o: and.s
	as -g -o $@ $<

clean:
	rm -rf and *.o

