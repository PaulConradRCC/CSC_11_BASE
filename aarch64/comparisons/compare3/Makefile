# Makefile
all: compare3

compare3: compare3.o
	gcc -g -o $@ $+

compare3.o: compare3.s
	as -g -o $@ $<

gdb:
	gdb ./compare3

clean:
	rm -rf compare3 *.o
