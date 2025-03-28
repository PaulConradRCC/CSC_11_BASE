# Makefile
all: test_get_integer

test_get_integer: test_get_integer.c get_integer.o
	gcc -g -o $@ $+

get_integer.o: get_integer.s
	as -g -o $@ $<

clean:
	rm -rf test_get_integer *.o
