# Makefile
all: first

first: first.o
	gcc -g -o $@ $+

first.o: first.s
	as -g -o $@ $<

clean:
	rm -rf first *.o
