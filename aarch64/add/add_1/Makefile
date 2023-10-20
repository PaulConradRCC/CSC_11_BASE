# Makefile
all: add_1

add_1: add_1.o
	gcc -g -o $@ $+

add_1.o: add_1.s
	as -g -o $@ $<

clean:
	rm -rf add_1 *.o
