# Makefile
all: compare2

compare2: compare2.o
	gcc -g -o $@ $+

compare2.o: compare2.s
	as -g -o $@ $<

clean:
	rm -rf compare2 *.o
