# Makefile
all: divide_with_while_loop2

divide_with_while_loop2: divide_with_while_loop2.o
	gcc -g -o $@ $+

divide_with_while_loop2.o: divide_with_while_loop2.s
	as -g -o $@ $<

gdb:
	gdb ./divide_with_while_loop2

clean:
	rm -rf divide_with_while_loop2 *.o
