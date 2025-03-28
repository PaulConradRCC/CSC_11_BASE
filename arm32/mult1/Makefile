# Makefile
all: mult1

mult1: mult1.o
	gcc -o $@ $+

mult1.o: mult1.s
	as -o $@ $<

clean:
	rm -rf mult1 *.o
