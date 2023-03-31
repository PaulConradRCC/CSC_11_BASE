# Makefile
all: divide_with_while_loop

divide_with_while_loop: divide_with_while_loop.o
	gcc -g -o $@ $+

divide_with_while_loop.o: divide_with_while_loop.s
	as -g -o $@ $<

clean:
	rm -rf divide_with_while_loop *.o
