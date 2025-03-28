# Makefile
all: eor

eor: eor.o
	gcc -g -o $@ $+

eor.o: eor.s
	as -g -o $@ $<

clean:
	rm -rf eor *.o

