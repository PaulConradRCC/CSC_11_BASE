# Makefile
all: compare

compare: compare.o
	gcc -g -o $@ $+

compare.o: compare.s
	as -g -o $@ $<

gdb:
	gdb ./compare

clean:
	rm -rf compare *.o
