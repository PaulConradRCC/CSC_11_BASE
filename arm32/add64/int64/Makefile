# Makefile
all: int64

int64: int64.o
	gcc -g -o $@ $+

int64.o: int64.s
	as -g -o $@ $<

clean:
	rm -rf int64 *.o
