# Makefile
all: swap_function

swap_function: swap_function.o
	gcc -g -o $@ $+

swap_function.o: swap_function.s
	as -g -o $@ $<

clean:
	rm -rf swap_function *.o
