# Makefile
all: eor

eor: eor.o
	gcc -g -o $@ $+

eor.o: eor.s
	as -g -o $@ $<

gdb:
	gdb ./eor

clean:
	rm -rf eor *.o
