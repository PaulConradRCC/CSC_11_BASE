# Makefile
all: add3

add3: add3.o
	gcc -g -o $@ $+

add3.o: add3.s
	as -g -o $@ $<

gdb:
	gdb ./add3

clean:
	rm -rf add3 *.o
