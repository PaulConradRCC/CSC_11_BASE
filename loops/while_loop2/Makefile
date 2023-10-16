# Makefile
all: while_loop2

while_loop2: while_loop2.o
	gcc -g -o $@ $+

while_loop2.o: while_loop2.s
	as -g -o $@ $<

clean:
	rm -rf while_loop2 *.o
