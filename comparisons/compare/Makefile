# Makefile
all: compare

compare: compare.o
	gcc -g -o $@ $+

compare.o: compare.s
	as -g -o $@ $<

clean:
	rm -rf compare *.o
