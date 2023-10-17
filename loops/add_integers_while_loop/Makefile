# Makefile
all: add_integers_while_loop

add_integers_while_loop: add_integers_while_loop.o
	gcc -g -o $@ $+

add_integers_while_loop.o: add_integers_while_loop.s
	as -g -o $@ $<

clean:
	rm -rf add_integers_while_loop *.o
