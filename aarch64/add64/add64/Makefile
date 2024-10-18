# Makefile
all: add64

add64: add64.o
	gcc -g -o $@ $+

add64.o: add64.s
	as -g -o $@ $<

clean:
	rm -rf add64 *.o
