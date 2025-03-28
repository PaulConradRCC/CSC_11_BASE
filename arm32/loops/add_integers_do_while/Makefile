# Makefile
all: add_integers_do_while

add_integers_do_while: add_integers_do_while.o
	gcc -g -o $@ $+

add_integers_do_while.o: add_integers_do_while.s
	as -g -o $@ $<

clean:
	rm -rf add_integers_do_while *.o
