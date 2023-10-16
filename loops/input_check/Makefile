# Makefile
all: input_check

input_check: input_check.o
	gcc -g -o $@ $+

input_check.o: input_check.s
	as -g -o $@ $<

clean:
	rm -rf input_check *.o
