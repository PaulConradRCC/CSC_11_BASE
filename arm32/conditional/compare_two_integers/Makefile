# Makefile
all: compare_two_integers

compare_two_integers: compare_two_integers.o
	gcc -g -o $@ $+

compare_two_integers.o: compare_two_integers.s
	as -g -o $@ $<

clean:
	rm -rf compare_two_integers *.o
